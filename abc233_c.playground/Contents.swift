// https://atcoder.jp/contests/abc233/tasks/abc233_c
// 2021-12-25 21:20:52

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            2 40
            3 1 8 4
            2 10 5
            """,
        expected: """
            2
            """)),
    ("2", Example(
        input: """
            3 200
            3 10 10 10
            3 10 10 10
            5 2 2 2 2 2
            """,
        expected: """
            45
            """)),
    ("3", Example(
        input: """
            3 1000000000000000000
            2 1000000000 1000000000
            2 1000000000 1000000000
            2 1000000000 1000000000
            """,
        expected: """
            0
            """)),
    ("2-1", Example(
        input: """
            4 200
            3 10 10 10
            3 10 10 10
            5 2 2 2 2 2
            6 1 1 1 1 1 2
            """,
        expected: """
            225
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
    
    let (n, x) = readTwoInts()
    var L = [[Int]]()
    for _ in 0..<n {
        let line = readInts()
        L.append(Array(line[1...]))
    }
    
    var dp = [[Int: Int]](repeating: [Int : Int](), count: n)
    
    func solveLine(i: Int, remain: Int) -> Int {
        var ans = 0
        for j in L[i] {
            ans += solveCell(i: i, numb: j, remain: remain)
        }
        return ans
    }
    
    func solveCell(i: Int, numb: Int, remain: Int) -> Int {
        if let prev = dp[i][numb] {
            return prev
        }
        guard remain % numb == 0 else {
            dp[i][numb] = 0
            return 0
        }
        let next = remain / numb
        
        if i == n - 1 {
            if next == 1 {
                dp[i][numb] = 1
                return 1
            }
            dp[i][numb] = 0
            return 0
        }
        
        let solution = solveLine(i: i+1, remain: next)
        dp[i][numb] = solution
        return solution
        
    }
    
    print(solveLine(i: 0, remain: x))
    
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
