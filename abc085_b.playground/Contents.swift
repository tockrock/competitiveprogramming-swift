// https://atcoder.jp/contests/abs/tasks/abc085_b
// 2021-10-28 14:00:59

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            4
            10
            8
            8
            6
            """,
        expected: """
            3
            """)),
    ("2", Example(
        input: """
            3
            15
            15
            15
            """,
        expected: """
            1
            """)),
    ("3", Example(
        input: """
            7
            50
            30
            50
            100
            50
            80
            30
            """,
        expected: """
            4
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // actual code goes here
    func readSubsequence () -> [String.SubSequence] { readLine()!.split(separator: " ")}
    func readStrings () -> [String] { readSubsequence().map({String($0)}) }
    func readInts() -> [Int] { readSubsequence().map{Int($0)!} }
    func readInt() -> Int { Int(readLine()!)! }
    
    let N = readInt()
    var set = Set<Int>()
    for _ in 0..<N {
        set.insert(readInt())
    }
    
    print(set.count)

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

