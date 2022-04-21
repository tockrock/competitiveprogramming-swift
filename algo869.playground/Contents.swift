// https://algo-method.com/tasks/869
// 2022-04-21 08:47:51

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            3
            algo goal method
            """,
        expected: """
            0.33333333333
            """)),
    ("2", Example(
        input: """
            4
            abc def ghi jkl
            """,
        expected: """
            0.0000000000000
            """)),
    ("3", Example(
        input: """
            5
            algo algo algo algo algo
            """,
        expected: """
            1.0000000000000
            """)),
    ("4", Example(
        input: """
            10
            algo live silent goal algo listen method algo evil live
            """,
        expected: """
            0.2222222222222
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
        
    func combination(n: Int, r: Int) -> Int {
        let smaller = min(n-r, r)
        guard smaller >= 0 else { return 0 }
        guard smaller > 0 else { return 1 }
        let start = n - smaller + 1
        return (start...n).reduce(1, *) / (1...smaller).reduce(1, *)
    }
    
    let N = Int(readLine()!)!
    let Ss = readLine()!.split(separator: " ").map { String($0.sorted()) }
    
    var anagramPattern = [String: Int]()
    
    for S in Ss {
        anagramPattern[S, default: 0] += 1
    }
    var possibility = 0
    for (_, n) in anagramPattern where n > 1 {
        possibility += combination(n: n, r: 2)
    }
    
    print(Double(possibility) / Double(combination(n: N, r: 2)))
    
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
