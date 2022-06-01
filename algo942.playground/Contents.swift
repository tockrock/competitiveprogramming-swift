// https://algo-method.com/tasks/942
// 2022-06-02 08:01:51

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            4 2 3
            1 0
            2 0
            1 1
            """,
        expected: """
            2
            """)),
    ("2", Example(
        input: """
            100001 100001 1
            50000 50000
            """,
        expected: """
            1
            """)),
    ("3", Example(
        input: """
            5 5 8
            0 2
            1 4
            3 3
            3 0
            2 0
            0 3
            3 1
            2 2
            """,
        expected: """
            3
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
    
    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }

    struct Position: Hashable {
        let r: Int
        let c: Int
    }
    
    let hwn = readInts()
    let h = hwn[0], w = hwn[1], n = hwn[2]
    
    var positions = Set<Position>()
    
    var count = 0
    for _ in 0..<n {
        let xy = readInts()
        let x = xy[0], y = xy[1]
        
        for (r, c) in [(x, y), (h-x-1,w-y-1)] {
            let pos = Position(r: r, c: c)
            if !positions.insert(pos).inserted {
                count += 1
            }
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
