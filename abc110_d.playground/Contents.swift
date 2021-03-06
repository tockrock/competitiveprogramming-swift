// https://atcoder.jp/contests/abc110/tasks/abc110_d
// 2021-11-17 14:48:32

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            2 6
            """,
        expected: """
            4
            """)),
    ("2", Example(
        input: """
            3 12
            """,
        expected: """
            18
            """)),
    ("3", Example(
        input: """
            100000 1000000000
            """,
        expected: """
            957870001
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // these needs to be in run() to get the overwritten readLine()
    func readString () -> String { readLine()! }
    func readSubsequence () -> [String.SubSequence] { readString().split(separator: " ")}
    func readChars () -> [Character] {readString().map({$0})}
    func readStrings () -> [String] { readSubsequence().map({String($0)}) }
    func readInt() -> Int { Int(readString())! }
    func readInts() -> [Int] { readSubsequence().map{Int($0)!} }
    func readTwoInts() -> (Int, Int) { let ints = readInts(); return (ints[0], ints[1]) }
    func readThreeInts() -> (Int, Int, Int) { let ints = readInts(); return (ints[0], ints[1], ints[2]) }
    
    // =====================
    // actual code goes here
    // =====================
    
    let (n, m) = readTwoInts()
    let mod = 1_000_000_007
    
    func comb(_ n: Int, _ r: Int) -> Int {
        let small = min(r, n-r)
        var divideBy = Array((1...small).reversed())
        var result = 1
        for i in Range(n-small+1...n) {
            result *= i
            var removeList = [Int]()
            for (i, d) in divideBy.enumerated() {
                if result % d == 0 {
                    result /= d
                    removeList.append(i)
                }
            }
            for i in removeList.reversed() {
                divideBy.remove(at: i)
            }
            result %= mod
            
        }
        
        return result
    }
        
    var total = 1
    
    for (_, count) in pf(m) {
        total *= comb(count+n-1, count)
        total %= mod
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

func myDebugPrint (_ s: Any... ) {
    if DEBUG { Swift.print(s.map({"\($0)"}).joined(separator: " ")) }
}
func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return gcd(b, a%b)
}
func pf(_ numb: Int) -> [(prime: Int, count: Int)] {
    var n = numb, i = 2, primeList = [(Int, Int)]()
    while i * i <= numb && i <= n {
        var count = 0
        while n % i == 0 { n /= i; count += 1 }
        if count > 0 { primeList.append((i, count)) }
        i += 1
    }
    if n != 1 { primeList.append((n, 1)) }
    return primeList
}
