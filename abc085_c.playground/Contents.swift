// https://atcoder.jp/contests/abs/tasks/abc085_c
// 2021-10-28 14:25:55

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            9 45000
            """,
        expected: """
            4 0 5
            """)),
    ("2", Example(
        input: """
            20 196000
            """,
        expected: """
            -1 -1 -1
            """)),
    ("3", Example(
        input: """
            1000 1234000
            """,
        expected: """
            14 27 959
            """)),
    ("4", Example(
        input: """
            2000 20000000
            """,
        expected: """
            2000 0 0
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // actual code goes here
    func readSubsequence () -> [String.SubSequence] { readLine()!.split(separator: " ")}
    func readStrings () -> [String] { readSubsequence().map({String($0)}) }
    func readInts() -> [Int] { readSubsequence().map{Int($0)!} }
    func readInt() -> Int { Int(readLine()!)! }
    
    let input = readInts()
    func otoshidama(_ N: Int, _ Y: Int) -> (Int, Int, Int) {
        for oneMultiplier in (0...(Y/5)) {
            let oneCounter = (Y % 5 + oneMultiplier * 5)
            let afterOne = Y - oneCounter
            let minFive = afterOne % 10 / 5
            for fiveMultiplier in (0...(afterOne/10)) {
                let fiveCounter = minFive + fiveMultiplier * 2
                let afterFive = afterOne - ( afterOne % 10 + fiveMultiplier * 10 )
                let tenCounter = afterFive / 10
                
                if N == oneCounter + fiveCounter + tenCounter {
                    return (tenCounter, fiveCounter, oneCounter)
                }
            }
        }
        return (-1, -1, -1)
    }
    
    let (ten, five, one) = otoshidama(input[0], input[1]/1000)

    print(ten, five, one)
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

