// https://atcoder.jp/contests/arc067/tasks/arc067_a
// 2021-11-17 10:36:40

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
            """,
        expected: """
            4
            """)),
    ("2", Example(
        input: """
            6
            """,
        expected: """
            30
            """)),
    ("3", Example(
        input: """
            1000
            """,
        expected: """
            972926972
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
    func gcd(_ a: Int, _ b: Int) -> Int {
        if b == 0 { return a }
        return gcd(b, a%b)
    }
    
    // =====================
    // actual code goes here
    // =====================
    
    let n = readInt()
    let d = 1_000_000_000 + 7
    
    func factorList(_ numb: Int) -> [(Int, Int)] {
        
        var n = numb
        var factors = [(Int, Int)]()
        
        var i = 2
        while i * i <= numb && i <= n {
            var count = 0
            while n % i == 0 {
                n /= i
                count += 1
            }
            if count > 0 {
                factors.append((i, count))
            }
            i += 1
        }
        
        if n != 1 {
            factors.append((n, 1))
        }
        
        return factors
    }
    
    var primeDict = [Int: Int]()
    
    for i in Range(1...n) {
        for (j, count) in factorList(i) {
            primeDict[j, default: 0] += count
        }
    }
    
    var total = 1

    for prime in primeDict {
        total *= prime.value + 1
        total %= d
    }
    
    print(total)
    
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
