// https://atcoder.jp/contests/abc229/tasks/abc229_d
// 2021-11-27 21:30:38

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            XX...X.X.X.
            2
            """,
        expected: """
            5
            """)),
    ("2", Example(
        input: """
            XXXX
            200000
            """,
        expected: """
            4
            """)),
    ("3", Example(
        input: """
            XX...XXX
            2
            """,
        expected: """
            5
            """)),
    ("4", Example(
        input: """
            ........
            0
            """,
        expected: """
            0
            """)),
    ("5", Example(
        input: """
            ........
            2
            """,
        expected: """
            2
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
    
    let S = readChars()
    let K = readInt()
    
    let length = S.count
    var longest = 0
    
    var i = 0

    while i < length && i + longest <= length + K{
        if S[i] == "." {
            i += 1
            continue
        }
        var rest = K
        
        var j = i
        
        while j < length {
            if S[j] == "." {
                rest -= 1
                if rest < 0 {
                    rest = 0
                    break
                }
            }
            j += 1
        }

        longest = max(longest, j - i + rest)
        myDebugPrint(i, j, rest, S[i..<j], longest)

        i += 1
    }
    longest = max(longest, K)
    
    print(min(length, longest))
    
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
