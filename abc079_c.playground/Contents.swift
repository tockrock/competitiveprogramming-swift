// https://atcoder.jp/contests/abc079/tasks/abc079_c
// 2021-11-10 09:22:21

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            1222
            """,
        expected: """
            1+2+2+2=7
            """)),
    ("2", Example(
        input: """
            0290
            """,
        expected: """
            0-2+9+0=7
            """)),
    ("3", Example(
        input: """
            3242
            """,
        expected: """
            3+2+4-2=7
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    func myDebugPrint (_ s: Any... ) { if DEBUG { Swift.print(s.map({"\($0)"}).joined(separator: " ")) } }
    func readString () -> String { readLine()! }
    func readSubsequence () -> [String.SubSequence] { readString().split(separator: " ")}
    func readCharStrings () -> [String] {readString().map({String($0)})}
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
    
    
    // Ugly but should work...
    func finalResult(_ formula: String) {
        print(formula + "=7")
    }
    
    func plusMinus(rest input: [Int], target: Int, current: String) -> Bool {
        let n = input[0]
        
        if input.count == 1 {
            if target - n == 0 {
                finalResult(current + "+\(n)")
                return true
            }
            if target + n == 0 {
                finalResult(current + "-\(n)")
                return true
            }
            return false
        }
        
        if plusMinus(rest: Array(input[1...]), target: target-n, current: current + "+\(n)") {
            return true
        }
        if plusMinus(rest: Array(input[1...]), target: target+n, current: current + "-\(n)") {
            return true
        }
            
        return false
    }
    
    let input = readCharStrings().map({Int($0)!})
    
    let a = input[0]
    
    
    plusMinus(rest: Array(input[1...]), target: 7-a, current: "\(a)")
    
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
