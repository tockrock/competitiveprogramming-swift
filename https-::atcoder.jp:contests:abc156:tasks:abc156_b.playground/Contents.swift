// https://atcoder.jp/contests/abc156/tasks/abc156_b
// 2021-11-04 13:18:03

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            11 2
            """,
        expected: """
            4
            """)),
    ("2", Example(
        input: """
            1010101 10
            """,
        expected: """
            7
            """)),
    ("3", Example(
        input: """
            314159265 3
            """,
        expected: """
            18
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    func debugPrint (_ s: Any... ) { if DEBUG { Swift.print(s.map({"\($0)"}).joined(separator: " ")) } }
    func readString () -> String { readLine()! }
    func readSubsequence () -> [String.SubSequence] { readString().split(separator: " ")}
    func readStrings () -> [String] { readSubsequence().map({String($0)}) }
    func readInts() -> [Int] { readSubsequence().map{Int($0)!} }
    func readInt() -> Int { Int(readString())! }
    func readTwoInts() -> (a: Int, b: Int) {
        let ints = readInts()
        return (a: ints[0], b: ints[1])
    }
    func readThreeInts() -> (a: Int, b: Int, c: Int) {
        let ints = readInts()
        return (a: ints[0], b: ints[1], c: ints[2])
    }
    // =====================
    // actual code goes here
    // =====================
    
    let (N, K) = readTwoInts()
    
    var count = 1
    var remaining = N
    while remaining > K {
        count += 1
        remaining = remaining / K
    }
    
    print(count)
    
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

