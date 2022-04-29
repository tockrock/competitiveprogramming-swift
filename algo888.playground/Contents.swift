// https://algo-method.com/tasks/888
// 2022-04-30 07:50:18

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
            Yes
            """)),
    ("2", Example(
        input: """
            3
            ()(
            """,
        expected: """
            No
            """)),
    ("3", Example(
        input: """
            6
            (((())
            """,
        expected: """
            No
            """)),
    ("4", Example(
        input: """
            2
            )(
            """,
        expected: """
            No
            """)),
    ("5", Example(
        input: """
            8
            ()()()()
            """,
        expected: """
            Yes
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

    let _ = readLine()
    let S = readLine()!
    
    var ans = true
    var stack = [Character]()
    for p in S {
        if p == "(" {
            stack.append(p)
            continue
        }
        
        guard stack.popLast() != nil else {
            ans = false
            break
        }
    }
    
    if !stack.isEmpty {
        ans = false
    }
    
    print(ans ? "Yes" : "No")
    
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
