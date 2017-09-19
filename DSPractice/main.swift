//
//  main.swift
//  DSPractice
//
//  Created by PALASH, OLEKSANDR [AG-Contractor/1000] on 9/18/17.
//  Copyright © 2017 PALASH, OLEKSANDR [AG-Contractor/1000]. All rights reserved.
//

import Foundation

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

var queue = Queue<Int>()
var element = queue.deque()

queue.enque(element: 1)
queue.enque(element: 2)
queue.enque(element: 3)

print(queue)
element = queue.deque()
print(element)
print(queue)
