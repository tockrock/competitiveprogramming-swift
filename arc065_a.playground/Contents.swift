// https://atcoder.jp/contests/abs/tasks/arc065_a
// 2021-10-28 15:50:26

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            erasedream
            """,
        expected: """
            YES
            """)),
    ("2", Example(
        input: """
            dreameraser
            """,
        expected: """
            YES
            """)),
    ("3", Example(
        input: """
            dreamerer
            """,
        expected: """
            NO
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // actual code goes here
    func readSubsequence () -> [String.SubSequence] { readLine()!.split(separator: " ")}
    func readStrings () -> [String] { readSubsequence().map({String($0)}) }
    func readInts() -> [Int] { readSubsequence().map{Int($0)!} }
    func readInt() -> Int { Int(readLine()!)! }
    
    let input = readLine()!
    
    var working = input
    
    func remove_term(_ checkingString: String) -> String {
        for term in ["eraser", "erase", "dreamer", "dream"] {
            if checkingString.hasSuffix(term) {
                return String(checkingString.dropLast(term.count))
            }
        }
        return checkingString
    }
    
    while working.count > 0 {
        let temp = working
        working = remove_term(working)
        if working.count < 1 {
            print("YES")
        }
        if temp == working {
            working = ""
            print("NO")
        }
    }
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

