// https://atcoder.jp/contests/abc093/tasks/arc094_a
// 2021-11-09 08:46:34

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            2 5 4
            """,
        expected: """
            2
            """)),
    ("2", Example(
        input: """
            2 6 3
            """,
        expected: """
            5
            """)),
    ("3", Example(
        input: """
            31 41 5
            """,
        expected: """
            23
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    func myDebugPrint (_ s: Any... ) { if DEBUG { Swift.print(s.map({"\($0)"}).joined(separator: " ")) } }
    func readString () -> String { readLine()! }
    func readSubsequence () -> [String.SubSequence] { readString().split(separator: " ")}
    func readStrings () -> [String] { readSubsequence().map({String($0)}) }
    func readInts() -> [Int] { readSubsequence().map{Int($0)!} }
    func readInt() -> Int { Int(readString())! }
    func readTwoInts() -> (Int, Int) {
        let ints = readInts()
        return (ints[0], ints[1])
    }
    func readThreeInts() -> (Int, Int, Int) {
        let ints = readInts()
        return (ints[0], ints[1], ints[2])
    }
    // =====================
    // actual code goes here
    // =====================
    
    var (a, b, c) = readThreeInts()
    var count = 0
    let aRemainder = a % 2
    let bRemainder = b % 2
    let cRemainder = c % 2
    
    if aRemainder == bRemainder && aRemainder != cRemainder {
        a += 1
        b += 1
        count += 1
    } else if aRemainder == cRemainder && aRemainder != bRemainder {
        a += 1
        c += 1
        count += 1
    } else if bRemainder == cRemainder && aRemainder != bRemainder {
        b += 1
        c += 1
        count += 1
    }
    myDebugPrint(a, b, c)
    
    let max = [a, b, c].max()!
    
    for i in [a, b, c] {
        count += (max - i) / 2
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
