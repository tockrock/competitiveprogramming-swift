// https://atcoder.jp/contests/abc230/tasks/abc230_c
// 2021-12-05 08:36:07

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            5 3 2
            1 5 1 5
            """,
        expected: """
            ...#.
            #.#..
            .#...
            #.#..
            ...#.
            """)),
    ("2", Example(
        input: """
            5 3 3
            4 5 2 5
            """,
        expected: """
            #.#.
            ...#
            """)),
    ("3", Example(
        input: """
            1000000000000000000 999999999999999999 999999999999999999
            999999999999999998 1000000000000000000 999999999999999998 1000000000000000000
            """,
        expected: """
            #.#
            .#.
            #.#
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
    
    let (N, A, B) = readThreeInts()
    let input = readInts()
    let P = input[0]
    let Q = input[1]
    let R = input[2]
    let S = input[3]
    
    let line1 = Range(max(1-A, 1-B)...min(N-A, N-B))
    let line2 = Range(max(1-A, B-N)...min(N-A, B-1))
        
    for i in P...Q {
        var line = [String].init(repeating: ".", count: S-R+1)
        let k = i-A
        if line1.contains(k) && Range(R...S).contains(B+k) {
            line[B+k-R] = "#"
        }
        if line2.contains(k) && Range(R...S).contains(B-k) {
            line[B-k-R] = "#"
        }
        print(line.reduce("", {$0 + $1}))
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

