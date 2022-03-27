// https://algo-method.com/tasks/843
// 2022-03-26 22:34:35

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
            0 1 2
            0 4 4
            1
            """,
        expected: """
            9
            """)),
    ("2", Example(
        input: """
            3 2
            ..
            ..
            ..
            5
            1
            0 0 1
            0 1 1
            0 2 1
            1
            """,
        expected: """
            0
            4
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

    enum Command: Int {
        case push, getNum
    }
    
    let (H, W) = readInts().tupled()
    
    let maxRange: [(dH: Int, dW: Int, check: (Int, Int) -> Bool)] = [
        ( 0,  0, {_, _ in true }),
        (-1,  0, {h, _ in 0 <= h}),
        ( 0, -1, {_, w in 0 <= w}),
        ( 1,  0, {h, _ in h < H}),
        ( 0,  1, {_, w in w < W})
    ]
    
    func getRange(p: Int, q: Int) -> [(h: Int, w: Int)] {
        var range: [(Int, Int)] = []

        for (dH, dW, check) in maxRange {
            let h = p + dH, w = q + dW
            guard check(h, w) else { continue }
            range.append((h, w))
        }
        return range
    }
    
    var total = 0
    var graph = [[Bool]](repeating: [Bool](repeating: false, count: W), count: H)
    
    for h in 0..<H {
        let input = Array(readLine()!)
        for w in 0..<W where input[w] == "#" {
            total += 1
            graph[h][w] = true
        }
    }

    let Q = Int(readLine()!)!
    
    for _ in 0..<Q {
        let input = readInts()
        switch Command(rawValue: input[0])! {
        case .push:
            let p = input[1], q = input[2]
            for (h, w) in getRange(p: p, q: q) {
                graph[h][w].toggle()
                if graph[h][w] {
                    total += 1
                } else {
                    total -= 1
                }
            }
            
        case .getNum:
            print(total)
        }
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
