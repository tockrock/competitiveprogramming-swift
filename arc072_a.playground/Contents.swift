// https://atcoder.jp/contests/abc059/tasks/arc072_a
// 2021-11-08 10:20:28

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            4
            1 -3 1 0
            """,
        expected: """
            4
            """)),
    ("2", Example(
        input: """
            5
            3 -6 4 -5 7
            """,
        expected: """
            0
            """)),
    ("3", Example(
        input: """
            6
            -1 4 3 2 -5 4
            """,
        expected: """
            8
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
    
    let n = readInt()
    let As = readInts()
    
    func reverseOne(_ x: Int) -> Int {
        return x > 0 ? -1 : 1
    }
    
    func sequence(start: Int, array: [Int]) -> Int {
        var sum = start
        var count = 0
        for i in 1..<n {
            let target = reverseOne(sum)
            sum += As[i]
            if sum * target > 0 {
                continue
            }
            count += abs(sum - target)
            sum = target
        }
        return(count)
    }
    
    var start = As[0]
    var offset = 0
    
    if start == 0 {
        offset = 1
        start = 1
    }
    
    let altTarget = reverseOne(start)
    let altOffset = abs(As[0] - altTarget)
    print(min(sequence(start: start, array: As) + offset, sequence(start: altTarget, array: As) + altOffset))
    
    
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

