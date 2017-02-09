//
//  bloom.h
//  bloom
//
//  Created by Arya Mazaheri
//  Copyright (c) 2014. Arya Mazaheri. All rights reserved.
//

#ifndef BLOOMFILTER_H
#define BLOOMFILTER_H

#include <cmath>
#include <assert.h>
#include "bitvector.h"
#include "murmur.h"

#define SALT_CONSTANT 0x97c29b3a

using namespace bf;

/// The hash digest type.
typedef size_t digest;

class BloomFilter
{
public:
    /// Computes the number of cells based on a false-positive rate and capacity.
    ///
    /// @param fp The desired false-positive rate
    ///
    /// @param capacity The maximum number of items.
    ///
    /// @return The number of cells to use that guarantee *fp* for *capacity*
    /// elements.
    static size_t m(double fp, size_t capacity);
    
    /// Computes @f$k^*@f$, the optimal number of hash functions for a given
    /// Bloom filter size (in terms of cells) and capacity.
    ///
    /// @param cells The number of cells in the Bloom filter (aka. *m*)
    ///
    /// @param capacity The maximum number of elements that can guarantee *fp*.
    ///
    /// @return The optimal number of hash functions for *cells* and *capacity*.
    static size_t k(size_t cells, size_t capacity);
    
    /// Constructs a basic Bloom filter.
    /// @param hasher The hasher to use.
    /// @param cells The number of cells in the bit vector.
    /// @param partition Whether to partition the bit vector per hash function.
    BloomFilter(size_t cells);
    
    /// Constructs a basic Bloom filter by given a desired false-positive
    /// probability and an expected number of elements. The implementation
    /// computes the optimal number of hash function and required space.
    ///
    /// @param fp The desired false-positive probability.
    ///
    /// @param capacity The desired false-positive probability.
    ///
    /// @param seed The initial seed used to construct the hash functions.
    ///
    /// @param double_hashing Flag indicating whether to use default or double
    /// hashing.
    ///
    /// @param partition Whether to partition the bit vector per hash function.
    BloomFilter(double fp, size_t capacity);
    
    void add(int64_t const& key);
    void add(char const* key);
    bool lookup(int64_t const& key) const;
    bool lookup(char const* key) const;
    void clear();
    size_t size();
    std::vector<digest> hash(int64_t const& key) const;
    std::vector<digest> hash(char const* key) const;
    
private:
    bitvector bits_;
    size_t bf_m; // optimal bit array size
    size_t bf_k; // optimal number of hash functions
};

#endif
