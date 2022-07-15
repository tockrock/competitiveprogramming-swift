// https://algo-method.com/tasks/948
// 2022-06-10 11:03:42

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            6
            ())(()
            3 1 4 1 5 9
            """,
        expected: """
            2
            """)),
    ("2", Example(
        input: """
            6
            )))(((
            17 20 36 19 5 44
            """,
        expected: """
            86
            """)),
    ("3", Example(
        input: """
            3
            ()(
            8 3 46
            """,
        expected: """
            -1
            """)),
    ("4", Example(
        input: """
            6
            ()(())
            3 1 4 1 5 9
            """,
        expected: """
            0
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================

    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }

    func solve() -> Int {
        let n = Int(readLine()!)!
        guard n % 2 == 0 else { return -1 }
        let S = Array(readLine()!)
        let Cs = readInts()
        
        var dp = [[Int]](repeating: [Int](repeating: Int.max / 2, count: n + 2), count: n + 1)
        
        dp[0][0] = 0
        
        for i in 0..<n {
            for j in 0..<n {
                if S[i] == "(" {
                    dp[i+1][j+1] = min(dp[i+1][j+1], dp[i][j])
                    if j > 0 {
                        dp[i+1][j-1] = min(dp[i+1][j-1], dp[i][j] + Cs[i])
                    }
                } else {
                    if j > 0 {
                        dp[i+1][j-1] = min(dp[i+1][j-1], dp[i][j])
                    }
                    dp[i+1][j+1] = min(dp[i+1][j+1], dp[i][j] + Cs[i])
                }
            }
            debugPrint(dp[i])
        }
        
        return dp[n][0]
    }
    
    print(solve())
    
    // ===============
    // actual code end
    // ===============
}

// =================================
// Extensions
// Remember to paste these as well!!
// =================================



// ====================
// Extensions Ends Here
// ====================

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

func myDebugPrint (_ s: Any... ) { Swift.print(s.map {"\($0)"}.joined(separator: " ")) }
