// https://algo-method.com/tasks/938
// 2022-06-01 07:15:58

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            3
            Cathy 1 - 2 Bob
            Alice 3 - 2 Bob
            """,
        expected: """
            Alice
            """)),
    ("2", Example(
        input: """
            5
            Bob 2 - 3 Edward
            Edward 5 - 1 Alice
            Cathy 1 - 4 Danny
            Danny 0 - 1 Bob
            """,
        expected: """
            Edward
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
    
    // let mod = 1000000007
    // let mod = 998244353
    
    let N = Int(readLine()!)!
    
    var remaining = [String: Bool]()
    
    for _ in 0..<N-1 {
        let input = readLine()!.split(separator: " ").map { String($0) }
        
        let s = input[0], a = Int(input[1])!, b = Int(input[3])!, t = input[4]
        let sWon = a > b
        let winner = sWon ? s : t
        let looser = sWon ? t : s
        
        remaining[looser] = false
        
        if remaining[winner] == nil {
            remaining[winner] = true
        }
        
    }
    
    print(remaining.first { (_, result) in result }!.key)
    
    // ===============
    // actual code end
    // ===============
}

// =================================
// Extensions
// Remember to paste these as well!!
// =================================



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
