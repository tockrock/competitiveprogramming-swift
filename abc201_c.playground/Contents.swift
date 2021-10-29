// https://atcoder.jp/contests/abc201/tasks/abc201_c
// 2021-10-29 17:57:44

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            ooo???xxxx
            """,
        expected: """
            108
            """)),
    ("2", Example(
        input: """
            o?oo?oxoxo
            """,
        expected: """
            0
            """)),
    ("3", Example(
        input: """
            xxxxx?xxxo
            """,
        expected: """
            15
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // actual code goes here
    func readSubsequence () -> [String.SubSequence] { readLine()!.split(separator: " ")}
    func readStrings () -> [String] { readSubsequence().map({String($0)}) }
    func readInts() -> [Int] { readSubsequence().map{Int($0)!} }
    func readInt() -> Int { Int(readLine()!)! }
    func readTwoInts() -> (a: Int, b: Int) {
        let ints = readInts()
        return (a: ints[0], b: ints[1])
    }
    func readThreeInts() -> (a: Int, b: Int, c: Int) {
        let ints = readInts()
        return (a: ints[0], b: ints[1], c: ints[2])
    }
    
    let conditions = readLine()!.map({String($0)})
    var required = [String]()
    var prohibited = [String]()
    
    for (i, condition) in conditions.enumerated() {
        switch(condition) {
        case "o":
            required.append(String(i))
        case "x":
            prohibited.append(String(i))
        case "?":
            break
        default:
            print("error at \(i)")
        }
    }
    var count = 0
    var check = true
    
    for i in 0...9999 {
        let intString = String(format: "%04d", i)
        for r in required {
            if !intString.contains(r) {
                check = false
            }
        }
        for p in prohibited {
            if intString.contains(p) {
                check = false
            }
        }
        if check {
            count += 1
        }
        check = true
    }
    print(count)
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

