// https://atcoder.jp/contests/abc202/tasks/abc202_d
// 2021-10-30 09:26:47

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            2 2 4
            """,
        expected: """
            baab
            """)),
    ("2", Example(
        input: """
            30 30 118264581564861424
            """,
        expected: """
            bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // actual code goes here
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
    func createIntTable(x: Int, y: Int) -> [[Int]] {
        [[Int]](repeating: [Int](repeating: 0, count: x), count: y)
    }
    var (A, B, K) = readThreeInts()
    
    var dp = createIntTable(x: A+1, y: B+1)
    for j in 1...B {
        dp[0][j] = 1
    }
    for i in 1...A {
        dp[i][0] = 1
    }
    
    for i in 1...A {
        for j in 1...B {
            dp[i][j] = dp[i-1][j] + dp[i][j-1]
        }
    }
    
    Swift.print(dp)
    var result = [Character]()
    
    
    while A > 0 && B > 0 {
        let aCount = dp[A-1][B]
//        Swift.print("A = \(A), B = \(B), K = \(K), aCount = \(aCount)")
        if K <= aCount {
            result.append("a")
            A -= 1
        } else {
            result.append("b")
            B -= 1
            K -= aCount
            
        }
    }
    if A > 0 {
        result += [Character](repeating: "a", count: A)
    }
    if B > 0 {
        result += [Character](repeating: "b", count: B)
    }
    
    
    print(String(result))
    
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
