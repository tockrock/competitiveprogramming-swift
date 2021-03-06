// https://algo-method.com/tasks/868
// 2022-04-18 13:14:37

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            4
            algo method algo algo
            5
            0 algomethod
            0 method
            2 method
            1 algo
            2 algo
            """,
        expected: """
            2
            0
            """)),
    ("2", Example(
        input: """
            5
            abc pqr abc xyz aaa
            6
            2 lmn
            2 abc
            1 bbb
            0 abc
            1 xyz
            2 abc
            """,
        expected: """
            0
            2
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
    
    enum Command: Int {
        case insert, delete, count
    }
    
    let _ = readLine() // ignore N
    var dict = [String: Int]()

    readLine()!.split(separator: " ")
        .forEach { dict[String($0), default: 0] += 1 }
    
    let Q = Int(readLine()!)!
    
    for _ in 0..<Q {
        let query = readLine()!.split(separator: " ").map { String($0) }
        switch Command(rawValue: Int(query[0])!)! {
        case .insert:
            dict[query[1], default: 0] += 1
        case .delete:
            dict[query[1]] = 0
        case .count:
            print(dict[query[1]] ?? 0)
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

