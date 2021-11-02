// https://atcoder.jp/contests/abc082/tasks/abc082_b
// 2021-11-03 08:31:21

import Foundation
import Darwin
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            yx
            axy
            """,
        expected: """
            Yes
            """)),
    ("2", Example(
        input: """
            ratcode
            atlas
            """,
        expected: """
            Yes
            """)),
    ("3", Example(
        input: """
            cd
            abc
            """,
        expected: """
            No
            """)),
    ("4", Example(
        input: """
            w
            ww
            """,
        expected: """
            Yes
            """)),
    ("", Example(
        input: """
            zzz
            zzz
            """,
        expected: """
            No
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
    func debugPrint (_ s: String ) { if DEBUG { Swift.print(s) } }
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
    
    let s = readLine()!
    let t = readLine()!
    
    let sSoreted = String(s.map({$0}).sorted(by: <))
    let tSorted = String(t.map({$0}).sorted(by: >))
    debugPrint(sSoreted)
    debugPrint(tSorted)
    
    print(sSoreted < tSorted ? "Yes" : "No")
    
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
