// https://atcoder.jp/contests/abs/tasks/practice_1

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            1
            2 3
            test
            """,
        expected: """
            6 test
            """)),
    ("2", Example(
        input: """
            72
            128 256
            myonmyon
            """,
        expected: """
            456 myonmyon
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // actual code goes here
    func readInts() -> [Int] { readLine()!.split(separator: " ").map{Int($0)!} }
    func readInt() -> Int { Int(readLine()!)! }
    
    var sum = 0
    sum += readInt()
    sum += readInts().reduce(0, +)
    print(sum, readLine()!)
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
