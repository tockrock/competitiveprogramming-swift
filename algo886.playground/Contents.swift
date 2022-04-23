// https://algo-method.com/tasks/886
// 2022-04-24 08:18:54

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
            A
            B
            X
            Y
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

    enum Command: Int {
        case push, pop
    }
    
    let queue: [(c: Int, l: Character)] = [
        (0, "A"),
        (0, "B"),
        (0, "C"),
        (1, "e"),
        (0, "X"),
        (0, "Y"),
        (0, "Z"),
        (1, "e"),
    ]
    
    var stack = [Character]()
    
    for q in queue {
        switch Command(rawValue: q.c)! {
        case .push:
            stack.append(q.l)
        case .pop:
            stack.popLast()
        }
    }
    
    stack.forEach { print($0) }
    
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
