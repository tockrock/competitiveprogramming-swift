// https://algo-method.com/tasks/845
// 2022-03-29 09:35:02

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            6
            0 red
            1
            1
            0 orange
            0 blue
            1
            """,
        expected: """
            red
            Error
            blue
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
        case pushHead = "0"
        case popHead = "1"
    }

    class Node {
        let name: String
        var next: Node?
        
        init(name: String, next: Node? = nil) {
            self.name = name
            self.next = next
        }
    }
    
    let head = Node(name: "head")
    
    let Q = Int(readLine()!)!
    
    for _ in 0..<Q {
        let query = readStrings()
        switch Command(rawValue: query[0])! {
        case .pushHead:
            let newNode = Node(name: query[1], next: head.next)
            head.next = newNode
        case .popHead:
            guard let pop = head.next else {
                print("Error")
                continue
            }
            print(pop.name)
            head.next = pop.next
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

