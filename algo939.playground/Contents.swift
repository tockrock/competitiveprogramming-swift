// https://algo-method.com/tasks/939
// 2022-05-31 07:44:43

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            5 3
            3 1 4 1 5
            """,
        expected: """
            3
            """)),
    ("2", Example(
        input: """
            10 11
            11 12 13 14 15 16 17 18 19 20
            """,
        expected: """
            0
            """)),
    ("3", Example(
        input: """
            8 4
            15 15 15 15 15 15 15 15
            """,
        expected: """
            28
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================

    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }
    
    let nm = readInts()
    let m = nm[1]
    
    let As = readInts()

    var counter = [Int](repeating: 0, count: m)
    for a in As {
        counter[a % m] += 1
    }

    var ans = 0
    
    for i in 0...m {
        ans += counter[i] * (counter[i] - 1) / 2
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
