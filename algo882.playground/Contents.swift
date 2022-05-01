// https://algo-method.com/tasks/882
// 2022-05-02 08:43:43

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            7
            0 walking
            0 lunch
            1
            0 shopping
            0 work
            1
            1
            """,
        expected: """
            walking
            lunch
            shopping
            """)),
    ("2", Example(
        input: """
            3
            0 abc
            0 stu
            0 xyz
            """,
        expected: """
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
    
    enum Command: Int {
        case setTask, doTask
    }
    
    let Q = Int(readLine()!)!
    var queue = ArraySlice<String>()
    for _ in 0..<Q {
        let query = readLine()!.split(separator: " ").map { String($0) }
        switch Command(rawValue: Int(query[0])!)! {
        case .setTask:
            queue.append(query[1])
        case .doTask:
            print(queue.popFirst()!)
        }
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
