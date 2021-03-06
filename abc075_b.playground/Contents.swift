// https://atcoder.jp/contests/abc075/tasks/abc075_b
// 2021-11-09 09:57:56

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            3 5
            .....
            .#.#.
            .....
            """,
        expected: """
            11211
            1#2#1
            11211
            """)),
    ("2", Example(
        input: """
            3 5
            #####
            #####
            #####
            """,
        expected: """
            #####
            #####
            #####
            """)),
    ("3", Example(
        input: """
            6 6
            #####.
            #.#.##
            ####.#
            .#..#.
            #.##..
            #.#...
            """,
        expected: """
            #####3
            #8#7##
            ####5#
            4#65#2
            #5##21
            #4#310
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
    
    let (H, W) = readTwoInts()
    
    var s = [[Character]]()
    var c = Array.init(repeating: Array.init(repeating: 0, count: W), count: H)
    var a = Array.init(repeating: Array.init(repeating: "", count: W), count: H)
    for i in 0..<H {
        let hArray = readString().map({$0})
        for j in 0..<W {
            if hArray[j] == "#" {
                for h in max(0, i-1)..<min(H, i+2) {
                    for w in max(0, j-1)..<min(W, j+2 ) {
                        c[h][w] += 1
                    }
                }
            }
        }
        s.append(hArray)
        
    }
    
    
    
    for h in 0..<H {
        for w in 0..<W {
            a[h][w] = s[h][w] == "#" ? "#" : String(c[h][w])
        }
        print(a[h].joined(separator: ""))
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
