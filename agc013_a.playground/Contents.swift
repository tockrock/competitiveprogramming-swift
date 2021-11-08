// https://atcoder.jp/contests/agc013/tasks/agc013_a
// 2021-11-08 07:45:55

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            8
            1 1 1 2 3 2 2 1
            """,
        expected: """
            2
            """)),
    ("2", Example(
        input: """
            9
            1 2 1 2 1 2 1 2 1
            """,
        expected: """
            5
            """)),
    ("3", Example(
        input: """
            7
            1 2 3 2 1 999999999 1000000000
            """,
        expected: """
            3
            """)),
    ("4", Example(
        input: """
            1
            1000000000
            """,
        expected: """
            1
            """)),
    ("5", Example(
        input: """
            2
            2 2
            """,
        expected: """
            1
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
    
    enum Velocity {
        case increasing
        case decreasing
        case undecided
    }
    func sortedArrays() -> Int {
        let N = readInt()
        if N < 3 {
            return 1
        }
        let As = readInts()
        var count = 1

        // remove the same numbers repeating at the start
        var previous = As[0]
        var v = Velocity.undecided

        for i in (1..<N) {
            myDebugPrint(previous, As[i], v, count)
            if As[i] > previous {
                previous = As[i]
                switch(v) {
                case .increasing:
                    continue
                case .decreasing:
                    v = .undecided
                    count += 1
                case .undecided:
                    v = .increasing
                }
            }
            if As[i] < previous {
                previous = As[i]
                switch(v) {
                case .increasing:
                    v = .undecided
                    count += 1
                case .decreasing:
                    continue
                case .undecided:
                    v = .decreasing
                }
            }
        }
        return count
    }
    
    print(sortedArrays())
    
    
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

