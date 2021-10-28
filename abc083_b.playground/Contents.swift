// https://atcoder.jp/contests/abs/tasks/abc083_b
// 2021-10-28

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            20 2 5
            """,
        expected: """
            84
            """)),
    ("2", Example(
        input: """
            10 1 2
            """,
        expected: """
            13
            """)),
    ("2", Example(
        input: """
            100 4 16
            """,
        expected: """
            4554
            """)),]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // actual code goes here
    func readInts() -> [Int] { readLine()!.split(separator: " ").map{Int($0)!} }
    func readInt() -> Int { Int(readLine()!)! }
    
    let inputs = readInts()
    
    var count = 0
    for i in 0...inputs[0] {
        let sum = String(i).map({Int(String($0))!}).reduce(0, +)
        if inputs[1] <= sum && sum <= inputs[2] {
            count += i
        }
    }
    print(count)
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
            while !outputLines .isEmpty && !expectedLines.isEmpty {
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

