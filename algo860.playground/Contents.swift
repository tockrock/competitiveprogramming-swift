// https://algo-method.com/tasks/860
// 2022-04-06 14:11:03

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
            """,
        expected: """
            1
            """)),
    ("2", Example(
        input: """
            7
            5 5 5 3 3 3 7
            """,
        expected: """
            3
            """)),
    ("3", Example(
        input: """
            1
            10
            """,
        expected: """
            10
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
    
    let _ = readLine()
    let As = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    var ans = -1
    var max = Int.min
    var counter = [Int](repeating: 0, count: 5 * 10_000 + 1)
    
    for a in As {
        counter[a] += 1
        let count = counter[a]
        guard count >= max else { continue }
        guard count > max || a < ans else { continue }
        
        ans = a
        max = count
    }
    
    print(ans)

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

