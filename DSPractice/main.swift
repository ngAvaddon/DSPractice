//
//  main.swift
//  DSPractice
//
//  Created by PALASH, OLEKSANDR [AG-Contractor/1000] on 9/18/17.
//  Copyright © 2017 PALASH, OLEKSANDR [AG-Contractor/1000]. All rights reserved.
//

import Foundation

// MARK: - Stack
/*
var stack = Stack<String>()
stack.push(element: "Test1")
stack.push(element: "Test2")
stack.push(element: "Test3")
stack.push(element: "Test4")
print(stack.peek())
print(stack)

print(stack.isEmpty)
let element = stack.pop()
print(element)
print(stack.peek())
print(stack)
print(stack.count)
*/

// MARK: - Queue
/*
var queue = Queue<Int>()
var element = queue.deque()

queue.enque(element: 1)
queue.enque(element: 2)
queue.enque(element: 3)

print(queue)
element = queue.deque()
print(element)
print(queue)
*/

// MARK: - Tree
/*
var root = Node(value: "Test")
var node1 = Node(value: "Test 1")
root.add(child: node1)

var node2 = Node(value: "Test 2")
root.add(child: node2)

var node3 = Node(value: "Test 3")
node1.add(child: node3)

var node4 = Node(value: "Test 4")
node1.add(child: node4)

print(root)

var node = root.search(value: "Test 4")
print(node)

node = root.searchBFS(value: "Test 4")
print(node)
*/

// MARK: - HashTable
/*
var hashTable = HashTable<String, String>(capacity: 5)
print(hashTable)

hashTable["firstName"] = "Steve"   // insert
print(hashTable)
let x = hashTable["firstName"]     // lookup
print(x)
hashTable["firstName"] = "Tim"     // update
print(hashTable)
hashTable["firstName"] = nil       // delete
print(hashTable)

*/

/*
let trie = Trie()
trie.insert(word: "cute")
print(trie)
trie.insert(word: "cut")
print(trie)
trie.insert(word: "cutoff")
print(trie)
//trie.remove(word: "cute")
print(trie.contains(word: "cut"))
print(trie.contains(word: "cute"))
print(trie.contains(word: "not cut"))
*/

/*
let array = [1,2,3,4,5,6,7,8,9]
let elementIndex = array.binarySearch(element: 5, range: 0..<array.count)
print(elementIndex)
*/

/*
let array = Array([1,2,3,4,5,6,7,8,9].reversed())
let result = array.quickSort()
print(result)
*/

/*
let array = Array([1,2,3,4,5,6,7,8,9].reversed())
let result = array.mergeSortTopDown()
print(result)
*/

/*
let array = Array([1,2,3,4,5,6,7,8,9].reversed())
let result = array.mergeSortBottomUp()
print(result)
*/

let array = Array([1,2,3,4,5,6,7,8,9].reversed())
let result = array.bubbleSort()
print(result)



