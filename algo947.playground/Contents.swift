// https://algo-method.com/tasks/947
// 2022-06-08 09:02:23

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            3
            3 1 4
            4
            1
            0 1
            0 5
            1
            """,
        expected: """
            8
            11
            """)),
    ("2", Example(
        input: """
            5
            7 7 3 6 6
            4
            0 11
            0 6
            0 8
            1
            """,
        expected: """
            49
            """)),
    ("3", Example(
        input: """
            4
            314 159 265 358
            7
            0 1000000000
            0 1000000000
            1
            0 1000000000
            0 1000000000
            0 1000000000
            1
            """,
        expected: """
            2000001096
            5000001096
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================

    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }

    enum Command: Int { case push, sum }
    
    readLine() // n
    let As = readInts()
    
    var stack = spanQuery(As)
    
    let q = Int(readLine()!)!
    for _ in 0..<q {
        let query = readInts()
        switch Command(rawValue: query[0])! {
        case .push:
            stack.push(v: query[1])
        case .sum:
            print(stack.sum)
        }
    }
    
    // ===============
    // actual code end
    // ===============
}

// =================================
// Extensions
// Remember to paste these as well!!
// =================================

struct spanQuery {
    struct ValueCount {
        let v: Int
        let k: Int
    }
    
    var data = [ValueCount]()
    var sum = 0
    
    init(_ arr: [Int]) {
        arr.forEach {
            data.append(ValueCount(v: $0, k: 1))
            sum += $0
        }
    }
    
    mutating func push(v: Int) {
        var k = 1

        while let last = data.last, last.v > v {
            data.removeLast()
            k += last.k
            sum -= last.v * last.k
        }
        
        data.append(ValueCount(v: v, k: k))
        sum += v * k
    }
}

// ====================
// Extensions Ends Here
// ====================

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

func myDebugPrint (_ s: Any... ) { Swift.print(s.map {"\($0)"}.joined(separator: " ")) }
