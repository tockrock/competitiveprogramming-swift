// https://atcoder.jp/contests/abc065/tasks/abc065_b
// 2021-11-09 14:12:30

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            3
            3
            1
            2
            """,
        expected: """
            2
            """)),
    ("2", Example(
        input: """
            4
            3
            4
            1
            2
            """,
        expected: """
            -1
            """)),
    ("3", Example(
        input: """
            5
            3
            3
            4
            2
            4
            """,
        expected: """
            3
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    func myDebugPrint (_ s: Any... ) { if DEBUG { Swift.print(s.map({"\($0)"}).joined(separator: " ")) } }
    func readString () -> String { readLine()! }
    func readSubsequence () -> [String.SubSequence] { readString().split(separator: " ")}
    func readStrings () -> [String] { readSubsequence().map({String($0)}) }
    func readInts() -> [Int] { readSubsequence().map{Int($0)!} }
    func readInt() -> Int { Int(readString())! }
    func readTwoInts() -> (Int, Int) {
        let ints = readInts()
        return (ints[0], ints[1])
    }
    func readThreeInts() -> (Int, Int, Int) {
        let ints = readInts()
        return (ints[0], ints[1], ints[2])
    }
    // =====================
    // actual code goes here
    // =====================
    
    let n = readInt()
    var array = [Int]()
    for _ in 1...n {
        array.append(readInt())
    }
    myDebugPrint(array)
    
    var next = 1
    var count = 1
    while true {
        let next_temp = array[next - 1]
        if next_temp == 0 {
            print(-1)
            break
        }
        if next_temp == 2 {
            print(count)
            break
        }
        array[next - 1] = 0
        next = next_temp
        count += 1
        
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
