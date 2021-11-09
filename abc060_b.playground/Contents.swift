// https://atcoder.jp/contests/abc060/tasks/abc060_b
// 2021-11-09 13:37:33

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            7 5 1
            """,
        expected: """
            YES
            """)),
    ("2", Example(
        input: """
            2 2 1
            """,
        expected: """
            NO
            """)),
    ("3", Example(
        input: """
            1 100 97
            """,
        expected: """
            YES
            """)),
    ("4", Example(
        input: """
            40 98 58
            """,
        expected: """
            YES
            """)),
    ("5", Example(
        input: """
            77 42 36
            """,
        expected: """
            NO
            """)),
    ("6", Example(
        input: """
            100 99 98
            """,
        expected: """
            YES
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
    
    let (a, b, c) = readThreeInts()
    
    var doable = false
    var i = 1
    var remain = c + 1
    while true {
        remain = a * i % b
        if remain == c {
            doable = true
            break
        }
        if remain == 0 {
            break
        }
        i += 1
        
    }
    
    print(doable ? "YES" : "NO")
    
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

