// https://algo-method.com/tasks/863
// 2022-04-11 10:12:11

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            5
            3 1 4 1 5
            5
            0 9
            2
            1 1 5
            1 5 3
            2
            """,
        expected: """
            23
            25
            """)),
    ("2", Example(
        input: """
            4
            1 10 100 1000
            8
            1 1 10
            2
            0 10000
            1 1000 10
            2
            1 10 100
            1 100 10000
            2
            """,
        expected: """
            1120
            10130
            50000
            """)),
]

// =================================
// Extensions
// Remember to paste these as well!!
// =================================

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
    
    // let mod = 1000000007
    // let mod = 998244353
    
    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }
    
    enum Command: Int {
        case insert, change, sum
    }
    
    let maxNumb = 100_000
    var bucket = [Int](repeating: 0, count: maxNumb + 1)
    
    var sum = 0
    
    readLine()
    
    let As = readInts()
    
    for A in As {
        bucket[A] += 1
        sum += A
    }
    
    let Q = Int(readLine()!)!
    
    for _ in 0..<Q {
        let query = readInts()
        switch Command(rawValue: query[0])! {
        case .insert:
            let v = query[1]
            bucket[v] += 1
            sum += v
        case .change:
            let x = query[1], y = query[2]
            let count = bucket[x]
            sum += (y-x) * count
            bucket[y] += count
            bucket[x] = 0
        case .sum:
            print(sum)
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

func myDebugPrint (_ s: Any... ) { Swift.print(s.map {"\($0)"}.joined(separator: " ")) }

