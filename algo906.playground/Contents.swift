// https://algo-method.com/tasks/906
// 2022-05-10 08:20:52

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            7
            0 0 1 1 4 2
            """,
        expected: """
            3 5 4 1 6 2 0
            """)),
    ("2", Example(
        input: """
            10
            0 1 2 3 4 1 2 3 4
            """,
        expected: """
            5 9 4 8 3 7 2 6 1 0
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

    let N = Int(readLine()!)!
    let As = readInts()
    
    var children = [[Int]](repeating: [], count: N)
    
    for (i, A) in As.enumerated() {
        children[A].append(i + 1)
    }
    
    var ans = [String]()
    func rec(v: Int) {
        for child in children[v] {
            rec(v: child)
        }
        ans.append(String(v))
    }
    
    rec(v: 0)
    
    print(ans.joined(separator: " "))
    
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
