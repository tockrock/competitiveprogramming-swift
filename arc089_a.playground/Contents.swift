// https://atcoder.jp/contests/abs/tasks/arc089_a
// 2021-10-28 17:21:31

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            2
            3 1 2
            6 1 1
            """,
        expected: """
            Yes
            """)),
    ("2", Example(
        input: """
            1
            2 100 100
            """,
        expected: """
            No
            """)),
    ("3", Example(
        input: """
            2
            5 1 1
            100 1 1
            """,
        expected: """
            No
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // actual code goes here
    func readSubsequence () -> [String.SubSequence] { readLine()!.split(separator: " ")}
    func readStrings () -> [String] { readSubsequence().map({String($0)}) }
    func readInts() -> [Int] { readSubsequence().map{Int($0)!} }
    func readInt() -> Int { Int(readLine()!)! }
    func readTuples() -> (t: Int, x: Int, y: Int) {
        let ints = readLine()!.split(separator: " ").map({Int($0)!})
        return (t: ints[0], x: ints[1], y: ints[2])
    }
    
    func sequence() -> Bool {
        let N = readInt()
        var points: [(t: Int, x: Int, y: Int, dT: Int, dD: Int)] = []
        
        var previousTime = 0
        var previousX = 0
        var previousY = 0
        for _ in 0..<N {
            let point = readTuples()
            let travelTime = point.t - previousTime
            let travelDistance = abs(point.x - previousX) + abs(point.y - previousY)
            previousTime = point.t
            previousX = point.x
            previousY = point.y
            points.append((t: point.t, x: point.x, y: point.y, dT: travelTime, dD: travelDistance))
        }
        
        let check = points.map {
            ($0.t.isMultiple(of: 2) == ($0.x + $0.y).isMultiple(of: 2)) &&
            ($0.dT >= $0.dD)
        }
        if check.contains(false) {
            return false
        }
        
        return true
    }
    
    sequence() ? print("Yes") : print("No")
    
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
