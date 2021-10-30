// https://atcoder.jp/contests/abc225/tasks/abc225_b
// 2021-10-30 21:05:13

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            5
            1 4
            2 4
            3 4
            4 5
            """,
        expected: """
            Yes
            """)),
    ("2", Example(
        input: """
            4
            2 4
            1 4
            2 3
            """,
        expected: """
            No
            """)),
    ("3", Example(
        input: """
            10
            9 10
            3 10
            4 10
            8 10
            1 10
            2 10
            7 10
            6 10
            5 10
            """,
        expected: """
            Yes
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // actual code goes here
    func readSubsequence () -> [String.SubSequence] { readLine()!.split(separator: " ")}
    func readStrings () -> [String] { readSubsequence().map({String($0)}) }
    func readInts() -> [Int] { readSubsequence().map{Int($0)!} }
    func readInt() -> Int { Int(readLine()!)! }
    func readTwoInts() -> (a: Int, b: Int) {
        let ints = readInts()
        return (a: ints[0], b: ints[1])
    }
    func readThreeInts() -> (a: Int, b: Int, c: Int) {
        let ints = readInts()
        return (a: ints[0], b: ints[1], c: ints[2])
    }
    
    let N = readInt()
    var total = [Int](repeating: 0, count: N)
    
    for _ in 0..<N-1 {
        let (a, b) = readTwoInts()
        total[a - 1] += 1
        total[b - 1] += 1
    }
    
    if Set(total) == Set([1,N-1]) {
        print("Yes")
    } else {
        print("No")
    }
    
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

