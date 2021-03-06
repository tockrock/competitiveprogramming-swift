// https://atcoder.jp/contests/abc228/tasks/abc228_d
// 2021-11-20 21:35:06

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            4
            1 1048577
            1 1
            2 2097153
            2 3
            """,
        expected: """
            1048577
            -1
            """)),
//    ("2", Example(
//        input: """
//            """,
//        expected: """
//            """)),
//    ("3", Example(
//        input: """
//            """,
//        expected: """
//            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // these needs to be in run() to get the overwritten readLine()
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
    
    // =====================
    // actual code goes here
    // =====================
    
    // improvements from https://atcoder.jp/contests/abc228/submissions/27366365
    let q = readInt()
    let n = 1 << 20
    
    var A = [Int](repeating: -1, count: n)
    var next = [Int?](repeating: nil, count: n)
    
    func findNext(_ x: Int) -> Int {
        if let y = next[x] {
            let z = findNext(y) // recursively lookup the next index
            next[x] = z // updates the current index
            return z
        } else {
            return x
        }
    }
    
    for _ in 1...q {
        let (t, x) = readTwoInts()
        if t == 2 {
            print(A[x % n] )
            continue
        }
        
        let index = findNext(x % n)
        
        A[index] = x
        // Thought about looking up the value by findNext((index + 1) % n) but,
        // a: the cost of looking up is the same in the future
        // b: you might not need to lookup
        // c: value could be updated
        next[index] = (index + 1) % n
        
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

func myDebugPrint (_ s: Any... ) { if DEBUG { Swift.print(s.map({"\($0)"}).joined(separator: " ")) } }
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
