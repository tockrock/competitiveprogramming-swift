// https://algo-method.com/tasks/833
// 2022-03-17 20:34:39

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            12
            """,
        expected: """
            8
            """)),
    ("2", Example(
        input: """
            1
            """,
        expected: """
            1
            """)),
    ("3", Example(
        input: """
            2
            """,
        expected: """
            2
            """)),
    ("4", Example(
        input: """
            1996
            """,
        expected: """
            1944
            """)),
    ("5", Example(
        input: """
            3000
            """,
        expected: """
            1904
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
    
    // Implementation using ArraySlice
    
    let N = Int(readLine()!)!
    
    var arr = ArraySlice(1...N)
    while arr.count > 1 {
        arr.popFirst()
        arr.append(arr.popFirst()!)
    }
    print(arr.last!)

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

