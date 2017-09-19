import Foundation

struct Queue<Element>: CustomStringConvertible {
    private var array = [Element]()
    var isEmpty: Bool { return array.isEmpty }

    mutating func enque(element: Element) {
        array.append(element)
    }
    
    mutating func deque() -> Element? {
        guard let _ = array.first else { return nil }

        return array.remove(at: 0)
    }
    
    func peek() -> Element? {
        return array.first
    }
    
    // MARK: - CustomStringConvertible
    var description: String {
        let topDivider = "---Queue---\n"
        let bottomDivider = "\n-----------\n"
        
        let elements = array.map{"\($0)"}.joined(separator: "\n")
        return topDivider + elements + bottomDivider
    }
}
