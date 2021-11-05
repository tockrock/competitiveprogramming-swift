// https://atcoder.jp/contests/abc091/tasks/abc091_b
// 2021-11-05 09:22:30

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
            apple
            orange
            apple
            1
            grape
            """,
        expected: """
            2
            """)),
    ("2", Example(
        input: """
            3
            apple
            orange
            apple
            5
            apple
            apple
            apple
            apple
            apple
            """,
        expected: """
            1
            """)),
    ("3", Example(
        input: """
            1
            voldemort
            10
            voldemort
            voldemort
            voldemort
            voldemort
            voldemort
            voldemort
            voldemort
            voldemort
            voldemort
            voldemort
            """,
        expected: """
            0
            """)),
    ("4", Example(
        input: """
            6
            red
            red
            blue
            yellow
            yellow
            red
            5
            red
            red
            yellow
            green
            blue
            """,
        expected: """
            1
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    func debugPrint (_ s: Any... ) { if DEBUG { Swift.print(s.map({"\($0)"}).joined(separator: " ")) } }
    func readString () -> String { readLine()! }
    func readSubsequence () -> [String.SubSequence] { readString().split(separator: " ")}
    func readStrings () -> [String] { readSubsequence().map({String($0)}) }
    func readInts() -> [Int] { readSubsequence().map{Int($0)!} }
    func readInt() -> Int { Int(readString())! }
    func readTwoInts() -> (a: Int, b: Int) {
        let ints = readInts()
        return (a: ints[0], b: ints[1])
    }
    func readThreeInts() -> (a: Int, b: Int, c: Int) {
        let ints = readInts()
        return (a: ints[0], b: ints[1], c: ints[2])
    }
    // =====================
    // actual code goes here
    // =====================
        
    let N = readInt()
    var blueCards = [String]()
    for _ in 0..<N {
        blueCards.append(readString())
    }

    let M = readInt()
    var redCards = [String]()
    for _ in 0..<M {
        redCards.append((readString()))
    }
    
    var maxAmount = Int.min
    let terms = Set(blueCards + redCards)
    
    for term in terms {
        let amount = blueCards.filter({$0 == term}).count - redCards.filter({$0 == term}).count
        maxAmount = max(maxAmount, amount)
    }
    
    print(maxAmount > 0 ? maxAmount : 0)
    
    
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
