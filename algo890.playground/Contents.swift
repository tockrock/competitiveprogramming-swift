// https://algo-method.com/tasks/890
// 2022-04-29 10:37:29

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
            3
            0
            2
            4
            """,
        expected: """
            1
            5
            3
            """)),
    ("2", Example(
        input: """
            6
            ((()))
            2
            4
            0
            """,
        expected: """
            1
            5
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

    let N = Int(readLine()!)!
    let S = readLine()!
    var ans = [Int](repeating: -1, count: N)
    var stack = [Int]()
    
    for (i, char) in S.enumerated() {
        if char == "(" {
            stack.append(i)
        } else {
            let last = stack.removeLast()
            ans[last] = i
            ans[i] = last
        }
    }
    
    let Q = Int(readLine()!)!
    
    for _ in 0..<Q {
        let k = Int(readLine()!)!
        print(ans[k])
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
