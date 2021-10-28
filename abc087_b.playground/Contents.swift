// https://atcoder.jp/contests/abs/tasks/abc087_b
// 2021-10-28

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            2
            2
            2
            100
            """,
        expected: """
            2
            """)),
    ("original", Example(
        input: """
            3
            10
            6
            1350
            """,
        expected: """
            6
            """)),
    ("2", Example(
        input: """
            5
            1
            0
            150
            """,
        expected: """
            0
            """)),
    ("3", Example(
        input: """
            30
            40
            50
            6000
            """,
        expected: """
            213
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // actual code goes here
    func readInts() -> [Int] { readLine()!.split(separator: " ").map{Int($0)!} }
    func readInt() -> Int { Int(readLine()!)! }
    
    let givenFiveHundreds = readInt()
    let givenHundreds = readInt()
    let givenFifties = readInt()
    let target = readInt()
    
    var count = 0
    
    for i in 0...givenFiveHundreds {
        for j in 0...givenHundreds {
            for k in 0...givenFifties {
                if target == i * 500 + j * 100 + k * 50 {
                    count += 1
                }
            }
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

