// https://atcoder.jp/contests/abs/tasks/abc081_b
// 2021-10-28

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            3
            8 12 40
            """,
        expected: """
            2
            """)),
    ("2", Example(
        input: """
            4
            5 6 8 10
            """,
        expected: """
            0
            """)),
    ("3", Example(
        input: """
            6
            382253568 723152896 37802240 379425024 404894720 471526144
            """,
        expected: """
            8
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // actual code goes here
    func readInts() -> [Int] { readLine()!.split(separator: " ").map{Int($0)!} }
    
    let _ = readLine()
    let originalArray = readInts()
    
    func countTrailingZero(of binary: String) -> Int {
        let range = binary.lastIndex(of: "1")!...
        return binary[range].dropFirst().count
    }

    let numberOfTrailingZeros = originalArray.map({String($0, radix: 2)})
        .map({countTrailingZero(of: $0)})
    
    print(numberOfTrailingZeros.min()!)
    
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
