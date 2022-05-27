// https://algo-method.com/tasks/936
// 2022-05-28 07:35:03

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            5
            1 2 3 1 2
            """,
        expected: """
            2
            """)),
    ("2", Example(
        input: """
            11
            5 5 6 3 5 2 5 1 12 5 2
            """,
        expected: """
            3
            """)),
    ("3", Example(
        input: """
            7
            100 101 110 111 1000000 100 100
            """,
        expected: """
            7
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================

    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }

    readLine()
    let As = readInts()
    
    var count = [Int: Int]()
    
    for A in As {
        count[A, default: 0] += 1
    }
    
    var ans = 0
    for (v, c) in count {
        if c < v {
            ans += c
        } else {
            ans += c - v
        }
    }
    
    print(ans)
    
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
