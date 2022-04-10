// https://algo-method.com/tasks/864
// 2022-04-09 20:50:06

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            3
            5 7 5
            """,
        expected: """
            0.3333333333
            """)),
    ("2", Example(
        input: """
            4
            1000 100 10 1
            """,
        expected: """
            0
            """)),
    ("3", Example(
        input: """
            5
            2 2 2 2 2
            """,
        expected: """
            1
            """)),
    ("4", Example(
        input: """
            10
            3 1 4 1 5 9 2 6 5 3
            """,
        expected: """
            0.0666666667
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
    
    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }
    
    let N = Int(readLine()!)!
    
    var bucket = [Int](repeating: 0, count: 100_001)
    for a in readInts() {
        bucket[a] += 1
    }
    
    let possible = Double(bucket
        .reduce(0) { $0 + $1 * ($1 - 1) / 2 })
    let total = Double(N * (N - 1) / 2)
    
    print(possible / total)

    
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
