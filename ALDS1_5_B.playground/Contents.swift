// Book: ALDS1_5_B: Merge Sort
// 2021-11-15 09:16:22

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
            8 5 9 2 6 3 7 1 10 4
            """,
        expected: """
            1 2 3 4 5 6 7 8 9 10
            34
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // this needs to be in run() to get the overwritten readLine()
    func myDebugPrint (_ s: Any... ) { if DEBUG { Swift.print(s.map({"\($0)"}).joined(separator: " ")) } }
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
    
    func merge(A: [Int], left: Int, mid: Int, right: Int) -> ([Int], Int) {
        var working = A
        let n1 = mid - left
        let n2 = right - mid
        var L = [Int]()
        var R = [Int]()
        
        for i in  0..<n1 {
            L.append(working[left + i])
        }
        L.append(Int.max)
        for i in 0..<n2 {
            R.append(working[mid + i])
        }
        R.append(Int.max)
        
        var i = 0
        var j = 0
        var count = 0
        
        for k in left..<right {
            if L[i] <= R[j] {
                working[k] = L[i]
                i += 1
            } else {
                working[k] = R[j]
                j += 1
            }
            count += 1
        }
        myDebugPrint(working, "L: \(left), \(right)")
        return (working, count)
    }
    
    func mergeSort(A: [Int], left: Int, right: Int) -> ([Int], Int) {
        var working = A
        var count = 0
        if left + 1 < right {
            let mid = (left + right) / 2
            let countL: Int
            let countR: Int
            let countM: Int
            (working, countL) = mergeSort(A: working, left: left, right: mid)
            (working, countR) = mergeSort(A: working, left: mid, right: right)
            (working, countM) = merge(A: working, left: left, mid: mid, right: right)
            count = countL + countR + countM
        }
        
        return (working, count)
    }
    
    let n = readInt()
    let A = readInts()
    
    let (working, count) = mergeSort(A: A, left: 0, right: n)
    
    print(working.reduce("", {$0 + "\($1) "}).dropLast())
    print(count)
    
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
