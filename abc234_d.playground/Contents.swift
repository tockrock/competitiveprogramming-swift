// https://atcoder.jp/contests/abc234/tasks/abc234_d
// 2022-01-08 21:22:04

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            3 2
            1 2 3
            """,
        expected: """
            1
            2
            """)),
    ("2", Example(
        input: """
            11 5
            3 7 2 5 11 6 1 9 8 10 4
            """,
        expected: """
            2
            3
            3
            5
            6
            7
            7
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
    
    // referenced: https://atcoder.jp/contests/abc234/submissions/28399788
    
    let (n, k) = readTwoInts()
    let p = readInts()
    
    var list = [Bool](repeating: false, count: n + 1)
    p[0..<k].forEach{ list[$0] = true }
    
    var x = p[0..<k].min()!
    print(x)
    
    for i in k..<n {
        // bigger number is added and the k-th number will change
        if x < p[i] {
            list[p[i]] = true
            
            // find the next number that's available
            repeat {
                x += 1
            } while !list[x]
        }
        
        print(x)
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
