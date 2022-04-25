// https://algo-method.com/tasks/885
// 2022-04-25 10:07:25

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            """,
        expected: """
            C
            X
            Y
            Z
            """)),
]

// =================================
// Extensions
// Remember to paste these as well!!
// =================================

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
    
    let inputs = [
        "0 A",
        "0 B",
        "0 C",
        "1",
        "0 X",
        "0 Y",
        "0 Z",
        "1",
    ]
    
    enum Commmand: Int {
        case enqueue, dequeue
    }
    
    var queue = ArraySlice<String>()
    
    for input in inputs {
        let i = input.split(separator: " ").map { String($0) }
        switch Commmand(rawValue: Int(i[0])!)! {
        case .enqueue:
            queue.append(i[1])
        case .dequeue:
            queue.popFirst()
        }
    }
    
    for q in queue {
        print(q)
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

