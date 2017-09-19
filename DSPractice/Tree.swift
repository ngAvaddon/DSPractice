import Foundation

class Node<Element>: CustomStringConvertible where Element: Equatable {
    private var value: Element
    private var children: [Node<Element>]
//    weak var parent: Node?

    init(value: Element) {
        self.value = value
        self.children = []
//        self.parent = nil
    }
    
    func add(child: Node<Element>) {
        self.children.append(child)
    }
    
    // MARK: - CustomStringConvertible
    var description: String {
        var s = "\(value)"
        if !children.isEmpty {
            s += " {" + children.map { $0.description }.joined(separator: ", ") + "}"
        }
        return s
    }

    // MARK: - Search -
    // MARK: Depth-First-Search
    func search(value: Element) -> Node? {
        if value == self.value {
            return self
        } else {
            print("\(self.value) != \(value)")
        }
        
        for child in children {
            if let found = child.search(value: value) {
                return found
            }
        }
        return nil
    }

    // MARK: Breath-First-Search
    func searchBFS(value: Element) -> Node? {
        var queue = Queue<Node>()
        queue.enque(element: self)
        
        
        while !queue.isEmpty {
            if let head = queue.deque() {
                if head.value == value {
                    return head
                } else {
                    print("\(head.value) != \(value)")
                }
             
                for child in head.children {
                    queue.enque(element: child)
                }
            }
        }

        return nil
    }

}

