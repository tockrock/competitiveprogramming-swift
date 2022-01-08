// https://atcoder.jp/contests/abc232/tasks/abc232_c
// 2021-12-19 21:53:13

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            4 4
            1 2
            1 3
            1 4
            3 4
            1 3
            1 4
            2 3
            3 4
            """,
        expected: """
            Yes
            """)),
    ("2", Example(
        input: """
            5 6
            1 2
            1 3
            1 4
            3 4
            3 5
            4 5
            1 2
            1 3
            1 4
            1 5
            3 5
            4 5
            """,
        expected: """
            No
            """)),
    ("3", Example(
        input: """
            8 0
            """,
        expected: """
            Yes
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
    
    // reference: https://atcoder.jp/contests/abc232/editorial/3143
    let (n, m) = readTwoInts()
    var toy1 = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    for _ in 0..<m {
        let(a, b) = readTwoInts()
        toy1[a-1][b-1] = true
        toy1[b-1][a-1] = true
    }
    myDebugPrint(toy1)
    
    var toy2 = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    for _ in 0..<m {
        let (c, d) = readTwoInts()
        toy2[c-1][d-1] = true
        toy2[d-1][c-1] = true
    }
    myDebugPrint(toy2)
    
    var ans = false

    overall: for list in permutation(Array(0..<n)) {
        for i in 0..<n {
            for j in 0..<n{
                if toy1[i][j] != toy2[list[i]][list[j]] {
                    continue overall
                }
            }
        }
        ans = true
        break
    }
    
    print(ans ? "Yes" : "No")
    
    
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
// reference https://ioritsutsui.com/permutation-full-enumeration/
func permutation<T>(_ args: [T]) -> [[T]] {
    guard args.count > 1 else { return [args] }
    func rotate(_ arr: [T]) -> [T] { return arr.dropFirst() + [arr.first!] }
    
    var rotatedValue = args
    var result = [[T]]()
    for _ in 0..<args.count {
        let head = rotatedValue.first!
        let tails = Array(rotatedValue.dropFirst())
        for arr in permutation(tails) {
            result.append([head] + arr)
        }
        rotatedValue = rotate(rotatedValue)
    }
    return result
}