#ifndef _PE_LOCKFREE_H_
#define _PE_LOCKFREE_H_

#include <algorithm>
#include <atomic>
#include <functional>
#include <unordered_map>
#include <unordered_set>
#include <vector>
#define CACHE_LINE_SIZE 64

using namespace std;

namespace __DpOMP {

template<typename T>
struct Node {
    Node() : value(nullptr), next(nullptr) {}
    Node(T* val) : value(val), next(nullptr) { }
    T* value;
    atomic<Node*> next;
    char pad[CACHE_LINE_SIZE - sizeof(T*)- sizeof(atomic<Node*>)];
};

/************************************* BEGIN: CONCURRENT QUEUE WITH ARRAY-BASED NODE *******************************************/

// Multiple Producers, Single Consumer concurrent Queue (MPSCQueue).
// Each node contains an array in order to allow multiple producers to run as concurrently as possible.
// Producers can write data at different indices of the array in parallel safely. Once the current buffer
// is full, we create an node wrapping the current buffer and append this node to the end of the queue. 
// Next, we allocate a new buffer for producers. 
static thread_local uint16_t myIndex=0;

template<typename T>
struct MPSCQueue {

    //static thread_local uint16_t myIndex;

private:

    typedef Node<T> NodeT;

    char pad0[CACHE_LINE_SIZE];

    // for single consumer
    NodeT* head;

    // padding to separate head and tail on different cache lines
    char pad1[CACHE_LINE_SIZE - sizeof(NodeT*)];

    // shared among multiple producers
    atomic<NodeT*> tail;

    // padding to separate tail and buffer on different cache lines
    char pad2[CACHE_LINE_SIZE - sizeof(atomic<NodeT*>)];

    // shared among multiple producers
    atomic<T*> buffer;

    // padding to separate buffer an nextFreeIndex on different cache lines
    char pad3[CACHE_LINE_SIZE - sizeof(atomic<T*>)];

    // next available index of current buffer, at which a thread can store data
    atomic<uint16_t> nextFreeIndex;

    // size of buffer = maximum number of elements which can be stored in buffer
    uint16_t bSize;

public:

    MPSCQueue() {}

    MPSCQueue(uint16_t bufferSize) {
        init(bufferSize);
    }

    ~MPSCQueue() {
        while( head != nullptr ) {
            NodeT* tmp = head;
            head = tmp->next;
            delete tmp;
        }
    }

    inline void init(uint16_t bufferSize) {
        bSize = bufferSize;
        head = tail = new NodeT();
        buffer = new T[bSize];
        nextFreeIndex = 0;
    }

    // It may happen that there is still a non-full buffer before the program exits.
    // Therefore, the main thread has to call this function in order to ensure that
    // the last data will be available for consumer.
    inline void pushBeforeExit() {
        if (nextFreeIndex > 0) {
            NodeT* newNode = new NodeT(buffer);
            tail.load()->next = newNode;
            tail = newNode;
            buffer = new T[bSize];
            nextFreeIndex = 0;
        }
    }

    inline void push(const T& item) {
        // try to acquire a free index in the buffer
        // if the buffer is not full (nextFreeIndex < size), take the current free index 
        // and increment it by 1 atomically (fetch_and_increment). Otherwise wait at "size".
        // NOTE: it can happen that multiple threads see that nextFreeIndex < size
        // and they also call fetch_and_increment. In this case, the acquired indices
        // may be greater than or equal to "size". That's why we need a do-while-loop 
        do {
            myIndex = nextFreeIndex < bSize ? nextFreeIndex++ : bSize;
        } while (myIndex >= bSize);

        buffer.load()[myIndex] = item;

        // if the buffer is full, then we create a new node wrapping the curent buffer
        // and append it to the end of the queue. After that, we allocate a new buffer
        // and reset the next free index.
        if (myIndex == bSize - 1) {
            NodeT* newNode = new NodeT(buffer);
            tail.load()->next = newNode;
            tail = newNode;
            buffer = new T[bSize];
            nextFreeIndex = 0;
        }
    }

    inline T* pop() {
        T* ret = nullptr;
        NodeT* oldHead = head;
        NodeT* newHead = head->next;
        if (newHead != nullptr) {
            ret = newHead->value;
            head = newHead;
            delete oldHead;
        }
        return ret;
    }

    inline const uint16_t bufferSize() {
        return bSize;
    }
};

//template<typename T>
//thread_local uint16_t MPSCQueue<T>::myIndex = 0;

/************************************* END: CONCURRENT QUEUE WITH ARRAY-BASED NODE *******************************************/

} // namespace

#endif

