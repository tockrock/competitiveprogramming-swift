// https://algo-method.com/tasks/826
// 2022-03-14 10:06:14

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            6 3
            3 1 4 1 5 9
            """,
        expected: """
            1
            4
            """)),
    ("2", Example(
        input: """
            9 0
            1 2 3 4 5 6 7 8 9
            """,
        expected: """
            1
            9
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
    
    let (N, k) = readInts().tupled()
    let A = readLine()!.split(separator: " ")
    
    print(A[k])
    print(A[N-k-1])
    
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
