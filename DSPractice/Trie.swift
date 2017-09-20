import Foundation

class TrieNode<Element: Hashable>: CustomStringConvertible {
    private var value: Element?
    var children: [Element: TrieNode] = [:]
    var isTerminating = false

    init(value: Element? = nil/*, parent: TrieNode? = nil*/) {
        self.value = value
    }
    
    func add(child: Element) {
        guard children[child] == nil else { return }
        children[child] = TrieNode(value: child)
    }
    
    // MARK: - CustomStringConvertible
    var description: String {
        return "\(children.description) - \(isTerminating)"
    }
}


class Trie: CustomStringConvertible {
    fileprivate let root: TrieNode<Character>
    
    init() {
        root = TrieNode<Character>()
    }

    func insert(word: String) {
        guard !word.isEmpty else { return }
        
        var currentNode = root
        let characters = Array(word.lowercased().characters)
        
        for character in characters {
            if let child = currentNode.children[character] {
                currentNode = child
            } else {
                currentNode.add(child: character)
                currentNode = currentNode.children[character]!
            }
        }
        currentNode.isTerminating = true
    }

    func contains(word: String) -> Bool {
        guard !word.isEmpty else { return false }
        var currentNode = root
        
        let characters = Array(word.lowercased().characters)

        for character in characters {
            if let child = currentNode.children[character] {
               currentNode = child
            } else {
                return false
            }
        }
        return currentNode.isTerminating
    }

    // MARK: - CustomStringConvertible
    var description: String {
        let topDivider = "---Trie---\n"
        let bottomDivider = "\n-----------\n"
        
        return topDivider + root.description + bottomDivider
    }
}
