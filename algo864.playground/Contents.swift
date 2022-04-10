// https://algo-method.com/tasks/864
// 2022-04-09 20:50:06

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            3
            5 7 5
            """,
        expected: """
            0.3333333333
            """)),
    ("2", Example(
        input: """
            4
            1000 100 10 1
            """,
        expected: """
            0
            """)),
    ("3", Example(
        input: """
            5
            2 2 2 2 2
            """,
        expected: """
            1
            """)),
    ("4", Example(
        input: """
            10
            3 1 4 1 5 9 2 6 5 3
            """,
        expected: """
            0.0666666667
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
    
    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }
    
    let N = Int(readLine()!)!
    let As = readInts()
    
    let bucket = Dictionary(As.map{ ($0, 1) },
                            uniquingKeysWith: + )
    
    var possible = 0
    let total = combination(n: N, r: 2)
    
    for (_, r) in bucket where r > 1 {
        possible += combination(n: r, r: 2)
    }
    
    print(Double(possible) / Double(total))
    
    
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
