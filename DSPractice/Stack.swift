import Foundation

struct Stack<Element>: CustomStringConvertible {
    private var array = [Element]()
    
    var isEmpty: Bool { return array.isEmpty }
    var count: Int { return array.count }
    
    mutating func push(element: Element) {
        array.append(element)
    }
    
    mutating func pop() -> Element? {
        return array.popLast()
    }

    func peek() -> Element? {
        return array.last
    }
    
    // MARK: - CustomStringConvertible
    var description: String {
        let topDivider = "---Stack---\n"
        let bottomDivider = "\n-----------\n"
        
        let stackElements = array.map{"\($0)"}.reversed().joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}
