// https://algo-method.com/tasks/821
// 2022-03-12 08:59:30

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            2 2
            """,
        expected: """
            6
            """)),
    ("2", Example(
        input: """
            10 10
            """,
        expected: """
            184756
            """)),
]

// =================================
// Extentions
// Remember to paste these as well!!
// =================================

extension Array {
    func tupled() -> (Element, Element) { (self[0], self[1]) }
    func tupled() -> (Element, Element, Element) { (self[0], self[1], self[2]) }
    func tupled() -> (Element, Element, Element, Element) {
        (self[0], self[1], self[2], self[3]) }
}

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
    
    func readInts() -> [Int] {
        return readLine()!.split(separator: " ").map { Int(String($0))! }
    }
    
    func combination(n: Int, r: Int) -> Int {
        let smaller = min(n-r, r)
        guard smaller >= 0 else { return 0 }
        guard smaller > 0 else { return 1 }
        let start = n - smaller + 1
        return (start...n).reduce(1, *) / (1...smaller).reduce(1, *)
    }
    
    let (N, M) = readInts().tupled()
    
    print(combination(n: N+M, r: M))
    
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
