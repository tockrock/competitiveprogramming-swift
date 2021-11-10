// https://atcoder.jp/contests/abc098/tasks/arc098_a
// 2021-11-09 15:05:03

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            5
            WEEWW
            """,
        expected: """
            1
            """)),
    ("2", Example(
        input: """
            12
            WEWEWEEEWWWE
            """,
        expected: """
            4
            """)),
    ("3", Example(
        input: """
            8
            WWWWWEEE
            """,
        expected: """
            3
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
    func readCharStrings () -> [String] {readString().map({String($0)})}

    // =====================
    // actual code goes here
    // =====================
    
    func attention() -> Int {
        let n = readInt()
        let s = readCharStrings()
        
        var w = [Int](repeating: 0, count: n)
        var e = [Int](repeating: 0, count: n)
        
        for i in 0..<n {
            if s[i] == "E" {
                e[i] = 1
            } else {
                w[i] = 1
            }
        }

        for i in 1..<n {
            w[i] += w[i-1]
            e[i] += e[i-1]
        }

        var ans = Int.max
        for i in 0..<n {
            var sum = 0
            if i > 0 {
                sum += w[i-1]
            }
            sum += e[n-1] - e[i]
            ans = min(ans, sum)
        }
        return ans
    }
    
    
    print(attention())
    
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
