// https://algo-method.com/tasks/844
// 2022-03-28 09:10:01

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            8
            0 green
            0 orange
            0 red
            1 2
            1 4
            0 blue
            0 yellow
            1 4
            """,
        expected: """
            red orange
            red orange green
            yellow blue red orange
            """)),
]

// =================================
// Extentions
// Remember to paste these as well!!
// =================================

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
    
    func readStrings() -> [String] { readLine()!.split(separator: " ").map({String($0)}) }

    enum Command: String {
        case insert = "0"
        case output = "1"
    }
    
    class Node {
        let name: String
        var next: Node?
        
        init(name: String, next: Node?) {
            self.name = name
            self.next = next
        }
    }
    
    var head: Node? = nil
        
    let Q = Int(readLine()!)!
    
    for _ in 0..<Q {
        let query = readStrings()
        
        switch Command(rawValue: query[0])! {
        case .insert:
            head = Node(name: query[1], next: head)
        case .output:
            var names = [String]()
            defer { print(names.joined(separator: " ")) }
            var nextNode = head
            for _ in 0..<Int(query[1])! {
                guard let current = nextNode else { break }
                names.append(current.name)
                nextNode = current.next
            }
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
