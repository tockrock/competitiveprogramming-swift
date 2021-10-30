// https://atcoder.jp/contests/abc202/tasks/abc202_c
// 2021-10-30 08:51:29

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            3
            1 2 2
            3 1 2
            2 3 2
            """,
        expected: """
            4
            """)),
    ("2", Example(
        input: """
            4
            1 1 1 1
            1 1 1 1
            1 2 3 4
            """,
        expected: """
            16
            """)),
    ("3", Example(
        input: """
            3
            2 3 3
            1 3 3
            1 1 1
            """,
        expected: """
            0
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
    
    let _ = readInt()
    let As = readInts()
    let Bs = readInts()
    let Cs = readInts()
    
    var count = 0
    
    for i in 1...3 {
        let intCount = As.filter({$0 == i}).count
        if intCount < 1 {
            continue
        }
        
        for (k, b) in Bs.enumerated() {
            if i == b {
                count += Cs.filter({$0 == k + 1}).count * intCount
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

