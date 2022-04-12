// https://algo-method.com/tasks/859
// 2022-04-12 10:00:13

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            3
            1
            3
            5
            """,
        expected: """
            4
            0
            8
            """)),
    ("2", Example(
        input: """
            3
            5625
            9125
            10000
            """,
        expected: """
            20
            32
            20
            """)),
    ("3", Example(
        input: """
            1
            0
            """,
        expected: """
            1
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
    
    var isSquare = [Bool](repeating: false, count: 10_001)
    
    for i in 0...100 {
        isSquare[i*i] = true
    }
    
    let Q = Int(readLine()!)!
    
    for _ in 0..<Q {
        let P = Int(readLine()!)!
        
        var count = 0
        defer { print(count) }
        
        guard P != 0 else {
            count = 1
            continue
        }
        
        for x in 1...100 {
            guard P >= x * x else { break }
            
            let ySquare = P - x * x
            if isSquare[ySquare] {
                count += 4
            }
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
