// https://atcoder.jp/contests/abc047/tasks/abc047_b
// 2021-11-05 08:57:33

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            5 4 2
            2 1 1
            3 3 4
            """,
        expected: """
            9
            """)),
    ("2", Example(
        input: """
            5 4 3
            2 1 1
            3 3 4
            1 4 2
            """,
        expected: """
            0
            """)),
    ("3", Example(
        input: """
            10 10 5
            1 6 1
            4 1 3
            6 9 4
            9 4 2
            3 1 3
            """,
        expected: """
            64
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    func debugPrint (_ s: Any... ) { if DEBUG { Swift.print(s.map({"\($0)"}).joined(separator: " ")) } }
    func readString () -> String { readLine()! }
    func readSubsequence () -> [String.SubSequence] { readString().split(separator: " ")}
    func readStrings () -> [String] { readSubsequence().map({String($0)}) }
    func readInts() -> [Int] { readSubsequence().map{Int($0)!} }
    func readInt() -> Int { Int(readString())! }
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
    
    var xMin = 0, yMin = 0
    var xMax, yMax: Int
    let N: Int
    (xMax, yMax, N) = readThreeInts()
    
    for _ in 0..<N {
        let (x, y, a) = readThreeInts()
        switch(a) {
        case 1:
            xMin = max(xMin, x)
        case 2:
            xMax = min(xMax, x)
        case 3:
            yMin = max(yMin, y)
        case 4:
            yMax = min(yMax, y)
        default:
            print("something terrible happened")
        }
    }
    
    if xMax <= xMin || yMax <= yMin {
        print(0)
    } else {
        print((xMax - xMin) * (yMax - yMin))
    }
    
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
