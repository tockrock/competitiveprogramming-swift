// https://atcoder.jp/contests/abc133/tasks/abc133_b
// 2021-11-04 09:40:07

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            3 2
            1 2
            5 5
            -2 8
            """,
        expected: """
            1
            """)),
    ("2", Example(
        input: """
            3 4
            -3 7 8 2
            -12 1 10 2
            -2 8 9 3
            """,
        expected: """
            2
            """)),
    ("3", Example(
        input: """
            5 1
            1
            2
            3
            4
            5
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
    
    let (N, D) = readTwoInts()
    var grid = [[Int]]()
    for _ in 0..<N {
        grid.append(readInts())
    }
    
    var count = 0
    
//    debugPrint(grid[0][1])
    
    for i1 in 0..<(N - 1) {
        for i2 in (i1+1)..<N {
            var sum = 0.0
            for j in 0..<D {
                let diff = abs(grid[i1][j] - grid[i2][j])
                sum += pow(Double(diff), 2.0)
            }
            let distance = sqrt(Double(sum))
            if distance == floor(distance) {
                count += 1
            }
        }
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
