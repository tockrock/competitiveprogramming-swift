// https://algo-method.com/tasks/842
// 2022-03-25 08:14:11

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
            3
            1 2
            0 0
            4 4
            """,
        expected: """
            5
            2
            6
            """)),
    ("2", Example(
        input: """
            3 3
            ##.
            ##.
            ...
            3
            0 2
            2 2
            1 1
            """,
        expected: """
            2
            0
            3
            """)),
]

// =================================
// Extentions
// Remember to paste these as well!!
// =================================

extension Array {
    func tupled() -> (Element, Element) { (self[0], self[1]) }
}

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
    
    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }

    let (H, W) = readInts().tupled()
    
    var charGraph = [[Character]]()
    
    for _ in 0..<H {
        charGraph.append(Array(readLine()!))
    }
    
    var rowCount = [Int?](repeating: nil, count: H)
    var columnCount = [Int?](repeating: nil, count: W)
    var intGraph = [[Int]](repeating: [Int](repeating: 0, count: W), count: H)
    
    func getRowCount(h: Int) -> Int {
        if let count = rowCount[h] {
            return count
        }
        
        var count = 0
        for w in 0..<W {
            let value = charGraph[h][w] == "#" ? 1 : 0
            intGraph[h][w] = value
            count += value
        }
        rowCount[h] = count
        return count
    }
    
    func getColumnCount(w: Int) -> Int {
        if let count = columnCount[w] {
            return count
        }
        
        var count = 0
        for h in 0..<H where charGraph[h][w] == "#" {
            count += 1
        }
        columnCount[w] = count
        return count
    }
    
    let Q = Int(readLine()!)!
    
    for _ in 0..<Q {
        let (p, q) = readInts().tupled()
        
        var count = 0
        count += getRowCount(h: p)
        count += getColumnCount(w: q)
        count -= intGraph[p][q]
        print(count)
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
