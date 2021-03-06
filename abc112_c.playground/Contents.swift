// https://atcoder.jp/contests/abc112/tasks/abc112_c
// 2021-11-07 08:31:48

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            5
            2 3 5
            2 1 5
            1 2 5
            3 2 5
            100 100 0
            """,
        expected: """
            2 2 6
            """)),
    ("2", Example(
        input: """
            2
            0 0 100
            1 1 98
            """,
        expected: """
            0 0 100
            """)),
    ("3", Example(
        input: """
            3
            99 1 191
            100 1 192
            99 0 192
            """,
        expected: """
            100 0 193
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    func myDebugPrint (_ s: Any... ) { if DEBUG { Swift.print(s.map({"\($0)"}).joined(separator: " ")) } }
    func readString () -> String { readLine()! }
    func readSubsequence () -> [String.SubSequence] { readString().split(separator: " ")}
    func readStrings () -> [String] { readSubsequence().map({String($0)}) }
    func readInts() -> [Int] { readSubsequence().map{Int($0)!} }
    func readInt() -> Int { Int(readString())! }
    func readTwoInts() -> (a: Int, b: Int) {
        let ints = readInts()
        return (a: ints[0], b: ints[1])
    }
    func readThreeInts() -> (Int, Int, Int) {
        let ints = readInts()
        return (a: ints[0], b: ints[1], c: ints[2])
    }
    // =====================
    // actual code goes here
    // =====================
    
    let N = readInt()
    var p = [(x: Int, y: Int, z: Int)]()
    
    for _ in 0..<N {
        p.append(readThreeInts())
    }
    
    p = p.sorted(by: {$0.z > $1.z})
    myDebugPrint(p)
    var cX, cY, cZ: Int
    cX = 0
    cY = 0
    cZ = 0
    
    // Go though all the points on the grid for checking
    overall: for i in 0...100 {
        next_point: for j in 0...100 {
            let possibleHeight = abs(i-p[0].x) + abs(j-p[0].y) + p[0].z
            
            // checks if the provided points support the current checking point
            for (x, y, z) in p[1...] {
                let fromCurrent = abs(i-x) + abs(j-y) + z
                if z == 0 {
                    if possibleHeight > fromCurrent {
                        myDebugPrint(possibleHeight, fromCurrent)
                        continue next_point
                    }
                } else if possibleHeight != fromCurrent{
                    continue next_point
                }
            }
            cX = i
            cY = j
            cZ = possibleHeight
            break overall
        }
    }
    
    print(cX, cY, cZ)
    
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
