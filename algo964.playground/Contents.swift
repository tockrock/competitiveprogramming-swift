// https://algo-method.com/tasks/964
// 2022-06-25 09:05:03

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            8 12
            0 5
            1 3
            1 6
            2 5
            2 7
            3 0
            3 7
            4 1
            4 2
            4 6
            6 7
            7 0
            """,
        expected: """
            4 1 6 3 2 7 0 5
            """)),
    ("2", Example(
        input: """
            6 7
            4 2
            0 5
            1 4
            3 5
            3 1
            1 0
            0 2
            """,
        expected: """
            3 1 0 4 5 2
            """)),
    ("3", Example(
        input: """
            4 2
            3 2
            1 2
            """,
        expected: """
            3 1 2 0
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================

    // let mod = 1000000007
    // let mod = 998244353

    print("foo")
    
    // ===============
    // actual code end
    // ===============
}

// =================================
// Extensions
// Remember to paste these as well!!
// =================================



// ====================
// Extensions Ends Here
// ====================

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
