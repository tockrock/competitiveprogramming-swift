// https://algo-method.com/tasks/839
// 2022-04-08 22:19:21

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            4 6
            0 0 3
            0 2 3
            2 3
            1 2 3
            0 3 1
            2 3
            """,
        expected: """
            2
            1
            """)),
    ("2", Example(
        input: """
            5 7
            0 3 1
            0 1 2
            2 4
            0 2 1
            0 2 1
            1 2 4
            2 1
            """,
        expected: """
            0
            2
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
        case follow, unfollow, countFollowers
    }

    let input = readInts()
    
    var followers = [Set<Int>](repeating: [], count: input[0])
    
    for _ in 0..<input[1] {
        let query = readInts()
        switch Command(rawValue: query[0])! {
        case .follow:
            followers[query[2]].insert(query[1])
        case .unfollow:
            followers[query[2]].remove(query[1])
        case .countFollowers:
            print(followers[query[1]].count)
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
