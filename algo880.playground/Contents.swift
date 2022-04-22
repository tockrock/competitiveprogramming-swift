// https://algo-method.com/tasks/880
// 2022-04-23 07:46:18

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            2 10
            1 2
            """,
        expected: """
            Yes
            """)),
    ("2", Example(
        input: """
            2 9
            1 2
            """,
        expected: """
            No
            """)),
    ("3", Example(
        input: """
            2 1000000000000
            100000 700000
            """,
        expected: """
            Yes
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
    
    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }

    let input = readInts()
    let M = input[1]
    let As = Array(Set(readInts())).map {$0 * $0}
        
    var pair = Set<Int>()
    
    for first in 0..<As.count {
        for second in first..<As.count {
            pair.insert(As[first] + As[second])
        }
    }
    
    var ans = false

    for ab in pair where pair.contains(M - ab) {
        ans = true
        break
    }
    
    print(ans ? "Yes" : "No")
    
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
