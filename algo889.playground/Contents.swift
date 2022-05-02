// https://algo-method.com/tasks/889
// 2022-05-03 08:29:09

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
            1 7
            0 7
            0 10
            1 11
            1 14
            """,
        expected: """
            0
            2
            3
            """)),
    ("2", Example(
        input: """
            10
            7
            0 8
            0 12
            0 13
            0 17
            1 20
            1 23
            1 25
            """,
        expected: """
            1
            3
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
    
    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }
    
    enum Command: Int {
        case push, pop
    }

    var tasks = ArraySlice<Int>()
    let X = Int(readLine()!)!
    let Q = Int(readLine()!)!
    
    for _ in 0..<Q {
        let query = readInts()
        switch Command(rawValue: query[0])! {
        case .push:
            tasks.append(X + query[1])
        case .pop:
            while let first = tasks.first, first <= query[1] {
                tasks.popFirst()
            }
            print(tasks.startIndex)
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
