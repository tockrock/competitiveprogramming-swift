// https://atcoder.jp/contests/abc096/tasks/abc096_c
// 2021-11-09 10:38:05

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            3 3
            .#.
            ###
            .#.
            """,
        expected: """
            Yes
            """)),
    ("2", Example(
        input: """
            5 5
            #.#.#
            .#.#.
            #.#.#
            .#.#.
            #.#.#
            """,
        expected: """
            No
            """)),
    ("3", Example(
        input: """
            11 11
            ...#####...
            .##.....##.
            #..##.##..#
            #..##.##..#
            #.........#
            #...###...#
            .#########.
            .#.#.#.#.#.
            ##.#.#.#.##
            ..##.#.##..
            .##..#..##.
            
            """,
        expected: """
            Yes
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
    
    for _ in 0..<H {
        s.append(readString().map({$0}))
    }
    
    var possible = "Yes"
    
    // find for any adjacent paintable cells
    overall: for h in 0..<H {
        for w in 0..<W {
            if s[h][w] == "#" {
                if h > 0 && s[h - 1][w] == "#" {
                    continue
                }
                if h < H-1 && s[h+1][w] == "#" {
                    continue
                }
                if w > 0 && s[h][w-1] == "#" {
                    continue
                }
                if w < W-1 && s[h][w+1] == "#" {
                    continue
                }
                
                // no adjacent paintable cell
                possible = "No"
                break overall
            }
        }
    }
    
    print(possible)
    
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

