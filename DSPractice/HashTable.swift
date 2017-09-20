import Foundation

struct HashTable<Key: Hashable, Value>: CustomStringConvertible {
    private typealias Element = (key: Key, value: Value)
    private typealias Bucket = [Element]
    private var buckets: [Bucket]
    
    subscript(key: Key) -> Value? {
        get {
            return value(forKey: key)
        }
        set {
            update(value: newValue, forKey: key)
        }
    }
    
    var isEmpty: Bool {
        return buckets.isEmpty
    }

    var count: Int {
        return buckets.count
    }
    
    init(capacity: Int) {
        buckets = Array<Bucket>(repeating: [], count: capacity)
    }
    
    private func index(forKey key: Key) -> Int {
        return abs(key.hashValue) % buckets.count
    }

    private func value(forKey key: Key) -> Value? {
        let bucketIndex = index(forKey: key)
        let element = buckets[bucketIndex].filter({$0.key == key}).first
        return element?.value
    }
    
    private mutating func update(value: Value?, forKey key: Key) {
        let bucketIndex = index(forKey: key)
        
        for (index, element) in buckets[bucketIndex].enumerated() {
            if element.key == key {
                if let newValue = value {
                    buckets[bucketIndex][index].value = newValue
                } else {
                    buckets[bucketIndex].remove(at: index)
                }
                return
            }
        }

        //key not found
        if let newValue = value {
            buckets[bucketIndex].append((key: key, value: newValue))
        }
    }

    // MARK: - CustomStringConvertible
    
    var description: String {
        var text = "{"
        
        for bucket in buckets {
            let str = bucket.map({ "\($0.key) => \($0.value)"}).joined(separator: ",")
            if str.count != 0 {
                text += str + "\t"
            }
        }
        text += "}\n"
        
        return text
    }
}
