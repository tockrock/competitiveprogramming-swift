// https://algo-method.com/tasks/841
// 2022-03-25 22:00:07

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
            1 1 4
            """,
        expected: """
            3
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

// =================================
// Extentions
// Remember to paste these as well!!
// =================================

extension Array {
    func tupled() -> (Element, Element) { (self[0], self[1]) }
    func tupled() -> (Element, Element, Element) { (self[0], self[1], self[2]) }
}

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
    
    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }
    
    enum Command: Int {
        case push, get
    }

    let (H, W) = readInts().tupled()
    
    var graph = [[Bool]]()
    
    for _ in 0..<H {
        let line = readLine()!
        graph.append(line.map {$0 == "#"})
    }
    
    let range: [(dH: Int, dW: Int, check: (Int, Int) -> Bool)] = [
        ( 0,  0, {_, _ in true}),
        (-1,  0, {h, _ in 0 <= h}),
        ( 0, -1, {_, w in 0 <= w}),
        ( 1,  0, {h, _ in h < H}),
        ( 0,  1, {_, w in w < W})
    ]
    
    func getRange(p: Int, q: Int) ->  [(h: Int, w: Int)] {
        var result: [(Int, Int)] = []

        for (dH, dW, check) in range {
            let h = p + dH, w = q + dW
            if check(h, w) {
                result.append((h, w))
            }
        }
        return result
    }
    
    let Q = Int(readLine()!)!

    for _ in 0..<Q {
        let (rawValue, p, q) = readInts().tupled()
        let range = getRange(p: p, q: q)
        switch Command(rawValue: rawValue)! {
        case .push:
            for (h, w) in range {
                graph[h][w].toggle()
            }
        case .get:
            var ans = 0
            for (h, w) in range {
                if graph[h][w] {
                    ans += 1
                }
            }
            print(ans)
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

