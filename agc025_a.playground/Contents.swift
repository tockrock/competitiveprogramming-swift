// https://atcoder.jp/contests/agc025/tasks/agc025_a
// 2021-11-04 11:58:46

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            15
            """,
        expected: """
            6
            """)),
    ("2", Example(
        input: """
            100000
            """,
        expected: """
            10
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    func debugPrint (_ s: Any... ) { if DEBUG { Swift.print(s.map({"\($0)"}).joined(separator: " ")) } }
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
    // =====================
    // actual code goes here
    // =====================
    
    // Trying to figure out the difference with submission below
    // https://atcoder.jp/contests/agc025/submissions/19307807
    let N = readInt()
    var smallest = Int.max
    
    for a in 1...N/2 {
        var sum = String(a).map({Int(String($0))!}).reduce(0, +)
        if smallest < sum {
            continue
        }
        let b = N - a
        sum += String(b).map({Int(String($0))!}).reduce(0, +)
        smallest = min(smallest, sum)
    }
    print(smallest)

    var wa = 9000000000000000000
    for i in 1...N-1 {
        if i<=N-i {
            let a = String(i).map({Int(String($0))!}).reduce(0,+)
            let b = String(N-i).map({Int(String($0))!}).reduce(0,+)
            wa = min(wa,a+b)
        }
    }
    debugPrint(smallest, wa)

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
