// https://algo-method.com/tasks/905
// 2022-05-09 08:35:16

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
            0 1 3 4 5 2 6
            """)),
    ("2", Example(
        input: """
            10
            0 1 2 3 4 1 2 3 4
            """,
        expected: """
            0 1 2 3 4 5 9 8 7 6
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
    
    var tree = [[Int]](repeating: [], count: N)
    
    for i in 0..<N-1 {
        let A = As[i]
        tree[A].append(i+1)
    }
        
    var ans = [String]()
    func preorder(i: Int) {
        ans.append(String(i))
        for child in tree[i] {
            preorder(i: child)
        }
    }
    preorder(i: 0)
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
