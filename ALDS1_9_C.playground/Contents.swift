// Book: ALDS1_9_C: Priority Queue
// 2021-12-07 08:23:42

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            insert 8
            insert 2
            extract
            insert 10
            extract
            insert 11
            extract
            extract
            end
            """,
        expected: """
            8
            10
            11
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
    let MAX = 2000000
    var A = [Int](repeating: -1, count: MAX+1)
    var count = 0

    func maxHeapify(_ i: Int) {
        let l = 2 * i
        let r = 2 * i + 1
        
        var largest = i
        if l <= count && A[l] > A[i] {
            largest = l
        }
        if r <= count && A[r] > A[largest] {
            largest = r
        }
        
        if largest != i {
            let temp = A[i]
            A[i] = A[largest]
            A[largest] = temp
            maxHeapify(largest)
        }
    }
    
    func extract() -> Int {
        guard count > 0 else {
            return Int.min
        }
        let maxV = A[1]
        A[1] = A[count]
        count -= 1
        maxHeapify(1)
        return maxV
    }
    
    func increaseKey(index: Int, key: Int) {
        var i = index
        guard key >= A[i] else {
            return
        }
        A[i] = key
        while i > 1 && A[i/2] < A[i] {
            let temp = A[i/2]
            A[i/2] = A[i]
            A[i] = temp
            i = i / 2
        }
        
    }
    
    func insert(key: Int) {
        count += 1
        A[count] = Int.min
        increaseKey(index: count, key: key)
    }
    
    overall: while true {
        let input = readStrings()
        switch(input[0]) {
        case "end":
            break overall
        case "insert":
            insert(key: Int(input[1])!)
        default:
            print(extract())
        }
        
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
