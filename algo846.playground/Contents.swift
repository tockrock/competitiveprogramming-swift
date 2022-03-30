// https://algo-method.com/tasks/846
// 2022-03-30 21:39:01

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
            orange
            """)),
    ("2", Example(
        input: """
            7
            0 green
            0 yellow
            0 black
            1
            1
            1
            1
            """,
        expected: """
            green
            yellow
            black
            Error
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
    
    // let mod = 1000000007
    // let mod = 998244353
    
    func readStrings() -> [String] { readLine()!.split(separator: " ").map({String($0)}) }

    enum Command: String {
        case pushHead = "0"
        case popTail = "1"
    }
    
    class Node {
        let name: String
        var previous: Node? = nil
        var next: Node? = nil
        let terminal: Bool
        
        init(name: String, terminal: Bool = false) {
            self.name = name
            self.terminal = terminal
        }
    }
    
    
    let head = Node(name: "head", terminal: true)
    let tail = Node(name: "tail", terminal: true)
    
    tail.previous = head
    head.next = tail
    
    let Q = Int(readLine()!)!

    for _ in 0..<Q {
        let query = readStrings()
        switch Command(rawValue: query[0])! {
        case .pushHead:
            let new = Node(name: query[1])
            new.next = head.next
            new.previous = head
            head.next!.previous = new
            head.next = new
        case .popTail:
            guard !tail.previous!.terminal else {
                print("Error")
                continue
            }
            let pop = tail.previous!
            print(pop.name)

            pop.previous!.next = pop.next
            pop.next!.previous = pop.previous

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

