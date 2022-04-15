// https://algo-method.com/tasks/866
// 2022-04-15 10:13:06

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            3
            abc bcde abc
            3
            abc
            bcde
            bcd
            """,
        expected: """
            2
            1
            0
            """)),
    ("2", Example(
        input: """
            5
            aaa aa zzzz a aaa
            4
            aa
            abba
            aaa
            aaa
            """,
        expected: """
            1
            0
            2
            2
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

    let asciiZero = Character("a").asciiValue! - 1
    let base = 27
    let maxHash = (0..<4).reduce(1, {previous, _ in previous * base})

    func hashAsInt(_ original: String) -> Int {
        var digit = 1
        var hashValue = 0
        for char in original.reversed() {
            let ascii = Int(char.asciiValue! - asciiZero)
            hashValue += ascii * digit
            digit *= base
        }
        return hashValue
    }
    
    let _ = readLine()
    var hashedMap = [Int](repeating: 0, count: maxHash)
    let Ss = readLine()!.split(separator: " ").map { String($0) }
    for S in Ss {
        hashedMap[hashAsInt(S)] += 1
    }
    
    let Q = Int(readLine()!)!
    for _ in 0..<Q {
        let T = readLine()!
        print(hashedMap[hashAsInt(T)])
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
