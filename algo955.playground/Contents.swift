// https://algo-method.com/tasks/955
// 2022-06-16 21:35:29

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            8 8
            ..#.....
            .###.##.
            .###..#.
            ####....
            .#..###.
            .....###
            ....##.#
            .....##.
            """,
        expected: """
            3
            """)),
    ("2", Example(
        input: """
            3 5
            #.#.#
            .###.
            #.#.#
            """,
        expected: """
            5
            """)),
    ("3", Example(
        input: """
            5 2
            ..
            ..
            ..
            ..
            ..
            """,
        expected: """
            0
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
    
    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }

    let hw = readInts()
    let h = hw[0], w = hw[1]
    
    var graph = [[Bool]]()
    for _ in 0..<h {
        var line = [Bool]()
        for char in readLine()! {
            line.append(char == "#")
        }
        graph.append(line)
    }
    
    func clear(_ i: Int, _ j: Int) {
        graph[i][j] = false
        
        for (di, dj) in [(0, 1), (0, -1), (1, 0), (-1, 0)] {
            let nextI = i + di
            let nextJ = j + dj
            guard 0 <= nextI && nextI < h else { continue }
            guard 0 <= nextJ && nextJ < w else { continue }
            guard graph[nextI][nextJ] else { continue }
            clear(nextI, nextJ)
        }
    }
    
    var count = 0
    for i in 0..<h {
        for j in 0..<w where graph[i][j] {
            count += 1
            clear(i, j)
        }
    }
    
    print(count)
    
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
