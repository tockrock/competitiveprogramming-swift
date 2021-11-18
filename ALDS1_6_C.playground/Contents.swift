// Book: ALDS1_6_C: Quick Sort
// 2021-11-19 08:05:42

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            6
            D 3
            H 2
            D 1
            S 3
            D 2
            C 1
            """,
        expected: """
            Not stable
            D 1
            C 1
            D 2
            H 2
            D 3
            S 3
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
    
    func partition(A: inout [(String, Int)], p: Int, r: Int) -> Int {
        var i = p - 1
        for j in p..<r {
            if A[j].1 <= A[r].1 {
                i += 1
                let temp = A[i]
                A[i] = A[j]
                A[j] = temp
            }
        }
        i += 1
        let temp = A[i]
        A[i] = A[r]
        A[r] = temp
        return i
    }
    
    func quickSort(A: inout [(String, Int)], p: Int, r: Int) {
        if p < r {
            let q = partition(A: &A, p: p, r: r)
            quickSort(A: &A, p: p, r: q-1)
            quickSort(A: &A, p: q+1, r: r)
        }
    }
    
    let n = readInt()
    var A = [(String, Int)]()
    for _ in 0..<n {
        let input = readStrings()
        A.append((input[0], Int(input[1])!))
    }
    
    quickSort(A: &A, p: 0, r: n-1)
    
    print("foo")
    for pair in A {
        print("\(pair.0) \(pair.1)")
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
