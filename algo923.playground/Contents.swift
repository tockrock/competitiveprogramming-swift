// https://algo-method.com/tasks/923
// 2022-05-21 08:14:06

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            3
            6
            0 5
            1 5
            2 5
            0 8
            1 8
            2 8
            """,
        expected: """
            2
            11
            12
            3
            -1
            -1
            """)),
    ("2", Example(
        input: """
            20
            6
            0 0
            2 91
            1 36
            2 468970
            0 5538
            1 1973401
            """,
        expected: """
            -1
            184
            73
            937942
            2768
            -1
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
