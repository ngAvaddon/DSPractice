import Foundation


extension Array where Iterator.Element == Int {
    
    // MARK: - Binary Search

    func binarySearch(element: Element, range: Range<Element>) -> Element? {
        if range.lowerBound >= range.upperBound {
            return nil
        } else {
            let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
            print(midIndex)
            
            if element < self[midIndex] {
                return binarySearch(element: element, range: range.lowerBound..<midIndex)
            } else if element > self[midIndex] {
                return binarySearch(element: element, range: midIndex..<range.upperBound)
            } else {
                return midIndex
            }
        }
    }
    
    // MARK: - Quick
    
    func quickSort() -> [Element] {
        guard count > 1 else { return self }

        print("-----")
        let pivot = self[count / 2]
        print(pivot)
        
        let smallerElements = filter{ $0 < pivot }
        let equalElements = filter{ $0 == pivot }
        let biggerElements = filter{ $0 > pivot }
        
        print(smallerElements)
        print(equalElements)
        print(biggerElements)

        return smallerElements.quickSort() + equalElements + biggerElements.quickSort()
    }
    
    // MARK: - Merge
    
    func mergeSortTopDown() -> [Element] {
        guard count > 1 else { return self }
        
        // Find the middle of the array
        let middleIndex = count / 2
        
        // Recursively sort the left and right parts of the array
        let left = Array(self[0..<middleIndex]).mergeSortTopDown()
        let right = Array(self[middleIndex..<count]).mergeSortTopDown()
        
        return merge(left: left, right: right)
    }

    // REALLY AWFUL SHIT! Take a look later
    func mergeSortBottomUp() -> [Element] {
        guard count > 1 else { return self }
        
        var result = Array(repeating: 0, count: count)
        
        while result.count < count {
            
            var index = 0
            while index < count {
                // The index where the smaller item will be placed in the "write" array after the comparison
                var resultIndex = index
                // The index of the current left item to the compare
                var leftIndex = index
                // The index of the current right item to compare
                var rightIndex = result.count + index
                
                // The max index of the left side in this pass
                let lMax = Swift.min(leftIndex + result.count, count)
                
                // The max index of the right side in this pass
                let rMax = Swift.min(rightIndex + result.count, count)

                while leftIndex < lMax && rightIndex < rMax {
                    if self[leftIndex] < self[rightIndex] {
                        // If the item we're comparing on the left is less than on the right,
                        // set the destination item to the left value
                        result[resultIndex] = self[leftIndex]
                        leftIndex += 1
                    } else {
                        // If the item we're comparing on the right is greater than or equal to
                        // the value on the left, set the destination item to the right value
                        result[resultIndex] = self[rightIndex]
                        rightIndex += 1
                    }
                    // Move on to the next element in the "write" array
                    resultIndex += 1
                }

                // Because we set the destination item to the correct value but didn't
                // move the value that was there to the spot the correct value came from,
                // we need to continue setting the rest of the "write" array to the values
                // from the "read" array to keep the state correct
                
                while leftIndex < lMax {
                    result[resultIndex] = self[leftIndex]
                    resultIndex += 1
                    leftIndex += 1
                }
                while rightIndex < rMax {
                    result[resultIndex] = self[rightIndex]
                    resultIndex += 1
                    rightIndex += 1
                }
                
                index += result.count * 2
            }
        }

        return result
    }
    
    private func merge(left: [Element], right: [Element]) -> [Element] {
        var leftIndex = 0
        var rightIndex = 0
        
        print("Merging \(left) and \(right)")
        
        var result = [Element]()

        while leftIndex < left.count && rightIndex < right.count {
            if left[leftIndex] < right[rightIndex] {
                result.append(left[leftIndex])
                print("\(left[leftIndex]) < \(right[rightIndex]): \(result)")
                leftIndex += 1
            } else if left[leftIndex] > right[rightIndex] {
                result.append(right[rightIndex])
                print("\(left[leftIndex]) > \(right[rightIndex]): \(result)")
                rightIndex += 1
            } else {
                result.append(left[leftIndex])
                result.append(right[rightIndex])
                print("\(left[leftIndex]) == \(right[rightIndex]): \(result)")
                leftIndex += 1
                rightIndex += 1
            }
        }

        let leftOvers = left[leftIndex..<left.count]
        result.append(contentsOf: leftOvers)
        print("\(leftOvers) >> \(result)")

        let rightOvers = right[rightIndex..<right.count]
        result.append(contentsOf: rightOvers)
        print("\(rightOvers) >> \(result)")

        return result
    }
    
    // MARK: - Bubble
    
    func bubbleSort() -> [Element] {
        var result = [Int]()
        result.append(contentsOf: self)
        var swaps = 0
        var sortedAboveIndex = result.count

        repeat {
            var swapIndex = 0
            for i in 1..<sortedAboveIndex {
                if result[i - 1] > result[i] {
                    result.swapAt(i, i - 1)
                    swapIndex = i
                    swaps += 1
                }
            }
            sortedAboveIndex = swapIndex
            print("swap \(swaps): \(result)")
        } while (sortedAboveIndex != 0)
        
        print("Array is sorted in \(swaps) swaps.")
        return result
    }
}
