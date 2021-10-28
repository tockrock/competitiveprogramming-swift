// https://atcoder.jp/contests/abs/tasks/abc088_b
// 2021-10-28 13:32:34

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            2
            3 1
            """,
        expected: """
            2
            """)),
    ("2", Example(
        input: """
            3
            2 7 4
            """,
        expected: """
            5
            """)),
    ("3", Example(
        input: """
            4
            20 18 2 18
            """,
        expected: """
            18
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // actual code goes here
    func readSubsequence () -> [String.SubSequence] { readLine()!.split(separator: " ")}
    func readStrings () -> [String] { readSubsequence().map({String($0)}) }
    func readInts() -> [Int] { readSubsequence().map{Int($0)!} }
    func readInt() -> Int { Int(readLine()!)! }
    
    let _ = readInt()
    let a = readInts()
    
    let sorted = a.sorted(by: {$0 > $1}).enumerated()
    
    let alice = sorted.filter({ (i, _) in i.isMultiple(of: 2)}).reduce(0, {$0 + $1.1})
    let bob = sorted.filter({(i, _) in !i.isMultiple(of: 2)}).reduce(0, {$0 + $1.1})
    
    print(alice - bob)
    

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

