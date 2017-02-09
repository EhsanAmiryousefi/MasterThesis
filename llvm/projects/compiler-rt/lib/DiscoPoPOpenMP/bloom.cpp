//
//  bloom.cpp
//  bloom
//
//  Created by Arya Mazaheri.
//  Copyright (c) 2014, Arya Mazaheri. All rights reserved.
//

#include "bloom.h"
#include <iostream>

size_t BloomFilter::m(double fp, size_t capacity)
{
    auto ln2 = std::log(2);
    return std::ceil(-(capacity * std::log(fp) / ln2 / ln2));
}

size_t BloomFilter::k(size_t cells, size_t capacity)
{
    auto frac = static_cast<double>(cells) / static_cast<double>(capacity);
    return std::ceil(frac * std::log(2));
}

BloomFilter::BloomFilter(size_t cells) : bits_(cells) {}

BloomFilter::BloomFilter(double fp, size_t capacity)
{
    bf_m = m(fp, capacity);
    bf_k = k(bf_m, capacity);
    bits_.resize(bf_m);
}

void BloomFilter::add(int64_t const& key)
{
    auto digests = hash(key);
//    assert(bits_.size() % digests.size() == 0 && "Assert nakanj");
    for (auto d : digests)
        bits_.set(d % bits_.size());
}

bool BloomFilter::lookup(int64_t const& key) const
{
    auto digests = hash(key);
//    assert(bits_.size() % digests.size() == 0);
    for (auto d : digests)
        if (! bits_[d % bits_.size()])
            return false;
    
    return true;
}

void BloomFilter::clear()
{
    bits_.reset();
}

size_t BloomFilter::size()
{
    return bits_.size();
}

std::vector<digest> BloomFilter::hash(int64_t const& key) const
{
    std::vector<digest> d(bf_k);
    size_t i;
    uint64_t checksum[2];
    
    MurmurHash3_x64_128(&key, sizeof(key), SALT_CONSTANT, checksum);
    
    for (i = 0; i < bf_k; i++) {
        d[i] = (checksum[0] + i * checksum[1]) % bits_.size();
    }
    return d;
}