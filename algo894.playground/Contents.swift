// https://algo-method.com/tasks/894
// 2022-05-06 07:35:20

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            12
            0 1 1 0 4 4 4 6 6 0 10
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
            0 1 2 3 4
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
    let Ps = readInts()
    var childrenOf = [[Int]](repeating: [], count: N)
    
    for (subI, P) in Ps.enumerated() {
        let i = subI + 1
        childrenOf[P].append(i)
    }
    
    var answer = [Int: String]()
    
    let Q = readInt()
    
    for _ in 0..<Q {
        let v = readInt()
        let P = Ps[v-1]
        
        defer { print(answer[P]!) }
        
        guard answer[P] == nil else { continue }
        
        answer[P] = childrenOf[P]
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
