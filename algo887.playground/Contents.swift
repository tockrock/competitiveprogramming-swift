// https://algo-method.com/tasks/887
// 2022-04-28 08:21:38

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            6
            ()(())
            """,
        expected: """
            1
            """)),
    ("2", Example(
        input: """
            6
            ((()))
            """,
        expected: """
            5
            """)),
    ("3", Example(
        input: """
            6
            (())()
            """,
        expected: """
            3
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
    
    enum Parenthesis: Character {
        case open = "("
        case close = ")"
    }
    
    let _ = readLine()
    let Ss = readLine()!
    
    var depth = 0
    for (i, S) in Ss.enumerated() {
        switch Parenthesis(rawValue: S)! {
        case .open:
            depth += 1
        case .close:
            depth -= 1
        }
        
        guard depth > 0 else {
            print(i)
            break
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
