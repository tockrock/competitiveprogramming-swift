// Book: ALDS1_9_B: Maximum Heap
// https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_9_B&lang=jp
// 2021-12-04 08:40:18

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            10
            4 1 3 2 16 9 10 14 8 7
            """,
        expected: """
             16 14 10 8 7 9 3 2 4 1
            """)),
    ("2", Example(
        input: """
            12
            5 86 37 12 25 32 11 7 1 2 4 19
            """,
        expected: """
            foo
            """)),
    ("", Example(
        input: """
            """,
        expected: """
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
    
    let n = readInt()
    var A = [-1] + readInts()
    
    func left(_ i: Int) -> Int { return i * 2 }
    func right(_ i: Int) -> Int { return i * 2 + 1 }
    
    func maxHeapify(A: inout [Int], _ i: Int) {
        let l = left(i)
        let r = right(i)
        
        var largest = i
        
        if l <= n && A[l] > A[i] {
            largest = l
        }
        if r <= n && A[r] > A[largest] {
            largest = r
        }
        
        if largest != i {
            let temp = A[i]
            A[i] = A[largest]
            A[largest] = temp
            myDebugPrint(largest, A)
            maxHeapify(A: &A, largest)
        }
    }
    
    func buildMaxHeap(A: inout [Int] ) {
        for i in 1...n/2 {
            let next = n/2 - i + 1
            myDebugPrint(next)
            maxHeapify(A: &A, next)
        }
    }
    
    buildMaxHeap(A: &A)
    print(" " + Array(A[1...]).outputWithSpace())
    
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

// Only for the Book
extension Array {
    func outputWithSpace() -> String {
        return String(
            self.reduce("") {
                $0 + "\($1) "
            }.dropLast(1)
        )
    }
}
