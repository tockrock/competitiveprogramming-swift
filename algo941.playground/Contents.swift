// https://algo-method.com/tasks/941
// 2022-06-05 08:35:46

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            5 6
            ....#.
            .##.#.
            #.#..#
            .#..#.
            ..#.##
            4
            0 1 2
            0 4 4
            1 2 3
            1 2 0
            """,
        expected: """
            4
            2
            """)),
    ("2", Example(
        input: """
            3 2
            ..
            ..
            ..
            5
            1 1 0
            0 0 1
            0 1 1
            0 2 1
            1 1 0
            """,
        expected: """
            0
            4
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================

    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }

    // Create graph
    let hw = readInts()
    let h = hw[0], w = hw[1]
    
    var graph = [[Bool]](repeating: [Bool](repeating: false, count: w), count: h)
    var row = [Int](repeating: 0, count: h)
    var column = [Int](repeating: 0, count: w)

    for r in 0..<h {
        let line = Array(readLine()!)
        for (c, char) in line.enumerated() where char == "#" {
            graph[r][c] = true
            row[r] += 1
            column[c] += 1
        }
    }
    
    // Process query
    
    enum Command: Int {
        case push, getNum
    }
    
    let q = Int(readLine()!)!
    
    for _ in 0..<q {
        let query = readInts()
        let command = query[0], p = query[1], q = query[2]
        
        switch Command(rawValue: command)! {
        case .push:
            for (dr, dc) in [(0, 0), (-1, 0), (1, 0), (0, -1), (0, 1)] {
                let r = p + dr, c = q + dc
                guard 0 <= r && r < h else { continue }
                guard 0 <= c && c < w else { continue }
                
                graph[r][c].toggle()
                
                let adjust = graph[r][c] ? 1 : -1
                row[r] += adjust
                column[c] += adjust
            }
        case .getNum:
            let adjust = graph[p][q] ? -1 : 0
            print(row[p] + column[q] + adjust)
        }
    }
    
    // ===============
    // actual code end
    // ===============
    
    func debugGraph() {
        for row in graph {
            debugPrint(row.map({$0 ? "#" : "."}).joined(separator: " "))
        }
    }
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

