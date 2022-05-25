// https://algo-method.com/tasks/930
// 2022-05-26 08:12:05

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            4 5
            .##.#
            ##...
            ..#..
            .....
            3
            1 2
            0 0
            3 4
            """,
        expected: """
            3
            2
            0
            """)),
    ("2", Example(
        input: """
            6 1
            #
            .
            .
            #
            .
            #
            2
            1 0
            4 0
            """,
        expected: """
            1
            2
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
    
    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }

    let hw = readInts()
    let h = hw[0], w = hw[1]
    
    var bombGrid = [[Int]]()
    
    for _ in 0..<h {
        let line = Array(readLine()!).map { $0 == "#" ? 1 : 0 }
        bombGrid.append(line)
    }
    
    var adjacentBoms = [[Int?]](repeating: [Int?](repeating: nil, count: w), count: h)
    let q = Int(readLine()!)!
    for _ in 0..<q {
        let xy = readInts()
        let x = xy[0], y = xy[1]
        
        if let count = adjacentBoms[x][y] {
            print(count)
            continue
        }
        
        var count = 0
        if 0 < x   { count += bombGrid[x-1][y] }
        if x < h-1 { count += bombGrid[x+1][y] }
        if 0 < y   { count += bombGrid[x][y-1] }
        if y < w-1 { count += bombGrid[x][y+1] }
        
        adjacentBoms[x][y] = count
        print(count)
    }
    
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
