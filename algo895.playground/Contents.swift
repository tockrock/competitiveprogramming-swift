// https://algo-method.com/tasks/895
// 2022-05-07 07:35:33

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            12
            0 4
            10 11
            1 3
            4 6
            0 1
            4 5
            0 10
            1 2
            6 9
            4 7
            6 8
            3
            6
            11
            8
            """,
        expected: """
            5 6 7
            11
            8 9
            """)),
    ("2", Example(
        input: """
            6
            2 1
            0 5
            3 4
            5 3
            4 2
            4
            3
            1
            4
            1
            """,
        expected: """
            3
            1
            4
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

    func readInt() -> Int { Int(readLine()!)! }
    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }
    
    let N = readInt()
    var childrenOf = [[Int]](repeating: [], count: N)
    var parentOf = [Int](repeating: -1, count: N)
    
    for _ in 0..<N - 1 {
        let ab = readInts()
        let a = ab[0], b = ab[1]
        childrenOf[a].append(b)
        parentOf[b] = a
    }
    
    var answer = [Int: String]()
    let Q = readInt()
    for _ in 0..<Q {
        let v = readInt()
        let p = parentOf[v]
        
        defer { print(answer[p]!) }
        
        guard answer[p] == nil else { continue }
        
        answer[p] = childrenOf[p]
            .sorted()
            .map { String($0) }
            .joined(separator: " ")
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

