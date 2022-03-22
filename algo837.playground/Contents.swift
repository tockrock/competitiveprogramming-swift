// https://algo-method.com/tasks/837
// 2022-03-22 10:14:08

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            1 red
            3 gold silver yellow
            """,
        expected: """
            0
            """)),
    ("2", Example(
        input: """
            3 red
            3 blue red green
            2 blue red
            3 green yellow red
            """,
        expected: """
            3
            """)),
    ("3", Example(
        input: """
            3 red
            3 blue red green
            2 blue red
            3 green yellow red
            """,
        expected: """
            3
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

    func readStrings() -> [String] { readLine()!.split(separator: " ").map({String($0)}) }
    
    let (N, T) = readStrings().tupled()
    
    var ans = 0
    for _ in 0..<Int(N)! {
        let student = readStrings()
        if student.contains(T) {
            ans += 1
        }
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
