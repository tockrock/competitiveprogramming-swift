// https://atcoder.jp/contests/abc057/tasks/abc057_c
// 2021-11-06 08:40:55

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            10000
            """,
        expected: """
            3
            """)),
    ("2", Example(
        input: """
            1000003
            """,
        expected: """
            7
            """)),
    ("3", Example(
        input: """
            9876543210
            """,
        expected: """
            6
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    func myDebugPrint (_ s: Any... ) { if DEBUG { Swift.print(s.map({"\($0)"}).joined(separator: " ")) } }
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
    
    
    var N = readInt()
    
    // get an Array of Factors

    func findFactor(_ base: Int, divisibleBy factor: Int) -> (remaining: Int, factors: [Int]) {
        var remaining = base
        var count = 0
        while true {
            if remaining % factor == 0 {
                remaining /= factor
                count += 1
            } else {
                break
            }
        }
        
        return (remaining, Array(repeatElement(factor, count: count)))
    }

    var factors = [[Int]]()
    let twos: [Int]
    (N, twos) = findFactor(N, divisibleBy: 2)
    
    factors.append(twos)
    
    for i in stride(from: 3, to: Int(sqrt(Double(N))), by: 2) {
        let factorArray: [Int]
        (N, factorArray) = findFactor(N, divisibleBy: i)
        if !factorArray.isEmpty { factors.append(factorArray) }
        if i > Int(sqrt(Double(N))) {
            break
        }
    }
    
    // try all combinations of factors and get the minimum result
    
    
    
    print(factors)

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

