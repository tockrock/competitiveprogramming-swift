// https://atcoder.jp/contests/abc226/tasks/abc226_c
// 2021-11-16 12:35:05

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            3
            3 0
            5 1 1
            7 1 1
            """,
        expected: """
            10
            """)),
    ("2", Example(
        input: """
            5
            1000000000 0
            1000000000 0
            1000000000 0
            1000000000 0
            1000000000 4 1 2 3 4
            """,
        expected: """
            5000000000
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // this needs to be in run() to get the overwritten readLine()
    func myDebugPrint (_ s: Any... ) { if DEBUG { Swift.print(s.map({"\($0)"}).joined(separator: " ")) } }
    func readString () -> String { readLine()! }
    func readSubsequence () -> [String.SubSequence] { readString().split(separator: " ")}
    func readChars () -> [Character] {readString().map({$0})}
    func readStrings () -> [String] { readSubsequence().map({String($0)}) }
    func readInt() -> Int { Int(readString())! }
    func readInts() -> [Int] { readSubsequence().map{Int($0)!} }
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
    
    
    struct Move {
        let t: Int
        let k: Int
        let a: [Int]?
    }
    
    let n = readInt()
    var moves = [Move]()
    
    for _ in 0..<n {
        let m = readInts()
        moves.append(Move(t: m[0], k: m[1], a: m))
    }
    
    var required = Set<Int>()

    func getRequirements(m: Int, required: inout Set<Int>) {
        let move = moves[m-1]
        if move.k > 0 {
            for i in move.a![2...] {
                if !required.contains(i) {
                    getRequirements(m: i, required: &required)
                }
            }
        }
        required.insert(m)
    }
    
    getRequirements(m: n, required: &required)
        
    print(required.reduce(0, {$0 + moves[$1-1].t}))
    
    
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
        // print(outputLines, expectedLines)
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
