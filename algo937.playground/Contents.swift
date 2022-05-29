// https://algo-method.com/tasks/937
// 2022-05-29 08:23:42

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            4 5
            ###.#
            .#...
            #.#.#
            .##..
            """,
        expected: """
            4
            """)),
    ("2", Example(
        input: """
            3 3
            ...
            ...
            ...
            """,
        expected: """
            4
            """)),
    ("3", Example(
        input: """
            6 2
            ##
            #.
            ..
            .#
            ##
            #.
            """,
        expected: """
            5
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
    
    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }
    
    let hw = readInts()
    let h = hw[0], w = hw[1]
    
    var blackStart = 0
    
    var shouldStartWithBlack = true
    for _ in 0..<h {
        let line = Array(readLine()!)
        var shouldBeBlack = shouldStartWithBlack
        for square in line {
            if (square == "#") != shouldBeBlack {
                blackStart += 1
            }
            shouldBeBlack.toggle()
        }
        shouldStartWithBlack.toggle()
    }
    
    print(min(blackStart, h * w - blackStart))
    
    // ===============
    // actual code end
    // ===============
}

// =================================
// Extensions
// Remember to paste these as well!!
// =================================



// ====================
// Extensions Ends Here
// ====================

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
