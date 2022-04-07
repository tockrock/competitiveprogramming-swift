// https://algo-method.com/tasks/858
// 2022-04-07 14:41:25

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
            4
            0 9
            2 1
            1 1
            2 1
            """,
        expected: """
            2
            0
            """)),
    ("2", Example(
        input: """
            6
            5 5 3 3 100 3
            6
            0 100
            2 7
            1 9
            1 3
            2 100
            2 3
            """,
        expected: """
            0
            2
            0
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
    
    enum Command: String {
        case insert = "0"
        case delete = "1"
        case count = "2"
    }
    
    let aMax = 100_000
    var bucket = [Int](repeating: 0, count: aMax + 1)
    
    let _ = readLine()
    
    for a in readLine()!.split(separator: " ") {
        bucket[Int(String(a))!] += 1
    }
    
    let Q = Int(readLine()!)!
    
    for _ in 0..<Q {
        let query = readLine()!.split(separator: " ")
        let v = Int(String(query[1]))!
        switch Command(rawValue: String(query[0]))! {
        case .insert:
            bucket[v] += 1
        case .delete:
            bucket[v] = 0
        case .count:
            print(bucket[v])
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

