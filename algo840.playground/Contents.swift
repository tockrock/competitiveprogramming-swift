// https://algo-method.com/tasks/840
// 2022-03-23 22:07:09

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
            1 2
            """,
        expected: """
            5
            """)),
    ("2", Example(
        input: """
            3 3
            ##.
            ##.
            ...
            2 2
            """,
        expected: """
            0
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

    let (H, _) = readInts().tupled()
    var grid = [[Character]]()
    
    for _ in 0..<H {
        grid.append(Array(readLine()!))
    }
    
    let (p, q) = readInts().tupled()
    
    var ans = 0
    for w in grid[p] where w == "#" {
        ans += 1
    }
    for h in 0..<H where grid[h][q] == "#" {
        ans += 1
    }
    ans -= grid[p][q] == "#" ? 1 : 0
    print(ans)
    
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

