// Book: ALDS1_5_D: Number of Inversions
// 2021-11-19 09:32:57

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            5
            3 5 2 1 4
            """,
        expected: """
            6
            """)),
    ("2", Example(
        input: """
            6
            5 3 6 2 1 4
            """,
        expected: """
            10
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
    
    func bubbleSort(A: inout [Int]) -> Int {
        var count = 0
        for i in 0..<A.count {
            for j in Array(i+1..<A.count).reversed() {
                if A[j] < A[j-1] {
                    let temp = A[j]
                    A[j] = A[j-1]
                    A[j-1] = temp
                    count += 1
                }
            }
        }
        return count
    }
    func merge(A: inout [Int], n: Int, l: Int, mid: Int, r: Int) -> Int {
        var count = 0
        var L = [Int]()
        var R = [Int]()
        for i in l..<mid { L.append(A[i]) }
        for j in mid..<r { R.append(A[j]) }
        var lCount = mid-l
        for k in l..<r {
            if !L.isEmpty && (R.isEmpty || L.first! <= R.first!) {
                A[k] = L.removeFirst()
                lCount -= 1
            } else {
                A[k] = R.removeFirst()
                count += lCount
            }
        }
        return count
    }
    
    func mergeSort(A: inout [Int], n: Int, l: Int, r: Int) -> Int {
        guard l + 1 < r else { return 0 }
        let mid = (l + r) / 2
        let v1 = mergeSort(A: &A, n: n, l: l, r: mid)
        let v2 = mergeSort(A: &A, n: n, l: mid, r: r)
        let v3 = merge(A: &A, n: n, l: l, mid: mid, r: r)
        return v1 + v2 + v3
    }
    
    let n = readInt()
    var A = readInts()
    myDebugPrint(A)
    print(mergeSort(A: &A, n: n, l: 0, r: n))
    myDebugPrint(A)
    
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
