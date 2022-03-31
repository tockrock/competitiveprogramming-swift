// https://algo-method.com/tasks/847
// 2022-03-31 08:32:53

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            8
            0 red
            2
            3
            0 red
            1 blue
            0 orange
            2
            3
            """,
        expected: """
            red
            Error
            orange
            blue
            """)),
]

// =================================
// Extentions
// Remember to paste these as well!!
// =================================

struct DeQue<T> {
    private class Node<T> {
        let value: T
        var previous: Node?
        var next: Node?
        
        init(value: T, previous: Node? = nil, next: Node? = nil) {
            self.value = value
            self.previous = previous
            self.next = next
        }
    }
    
    private var head: Node<T>? = nil
    private var tail: Node<T>? = nil
    
    mutating func pushHead(_ value: T) {
        head = Node(value: value, next: head)
        
        if let next = head?.next {
            next.previous = head
        } else {
            tail = head
        }
    }
    
    mutating func pushTail(_ value: T) {
        tail = Node(value: value, previous: tail)
        
        if let previous = tail?.previous {
            previous.next = tail
        } else {
            head = tail
        }
    }
    
    mutating func popHead() -> T? {
        guard let oldHead = head else { return nil }
        
        if let newHead = oldHead.next {
            newHead.previous = nil
            head = newHead
        } else {
            head = nil
            tail = nil
        }
        
        return oldHead.value
    }
    
    mutating func popTail() -> T? {
        guard let oldTail = tail else { return nil }
        
        if let newTail = oldTail.previous {
            newTail.next = nil
            tail = newTail
        } else {
            head = nil
            tail = nil
        }
        return oldTail.value
    }
}

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
    
    func readStrings() -> [String] { readLine()!.split(separator: " ").map({String($0)}) }

    enum Command: String {
        case pushHead = "0"
        case pushTail = "1"
        case popHead = "2"
        case popTail = "3"
    }

    var deque = DeQue<String>()
    
    let Q = Int(readLine()!)!
    
    for _ in 0..<Q {
        let query = readStrings()
        switch Command(rawValue: query[0])! {
        case .pushHead:
            deque.pushHead(query[1])
        case .pushTail:
            deque.pushTail(query[1])
        case .popHead:
            print(deque.popHead() ?? "Error")
        case .popTail:
            print(deque.popTail() ?? "Error")
        }
    }
    
    // ===============
    // actual code end
    // ===============
}

func main(label: String, example: Example) {
    var inputLines = example.input.split(separator: "\n")
    var outputLines: [String] = []
    defer {
        var expectedLines = example.expected
            .split(separator: "\n")
            .map(String.init)
        let isSuccessful = expectedLines == outputLines
        print("== Test[\(label)] =========")
        print(isSuccessful ? "successful." : "failed.")
        // print(outputLines, expectedLines)
        if !isSuccessful {
            print("expected | actual")
            while !outputLines.isEmpty && !expectedLines.isEmpty {
                let o = outputLines.removeFirst()
                let e = expectedLines.removeFirst()
                print("\(o == e ? " " : "!") \(e) | \(o)")
            }
        }
        print("")
    }
    run(
        readLine: { String(inputLines.removeFirst()) },
        print: { outputLines.append($0.map {"\($0)"}.joined(separator: " ")) }
    )
}

for example in examples {
    main(label: example.0, example: example.1)
}

func myDebugPrint (_ s: Any... ) { Swift.print(s.map {"\($0)"}.joined(separator: " ")) }
