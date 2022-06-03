// https://algo-method.com/tasks/943
// 2022-06-03 08:27:54

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            4
            0 2
            2 3
            3 1
            1 2
            """,
        expected: """
            2
            """)),
    ("2", Example(
        input: """
            12
            6 8
            4 7
            1 3
            0 4
            6 9
            0 10
            4 6
            10 11
            4 5
            0 1
            1 2
            5 9
            """,
        expected: """
            3
            """)),
    ("3", Example(
        input: """
            9
            8 7
            3 6
            6 5
            8 1
            8 3
            6 2
            0 8
            8 4
            7 5
            """,
        expected: """
            4
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================

    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }
    
    let n = Int(readLine()!)!
    
    var parent = [Int?](repeating: nil, count: n)
    for _ in 0..<n-1 {
        let ab = readInts()
        let a = ab[0], b = ab[1]
        parent[b] = a
    }

    let uv = readInts()
    let u = uv[0], v = uv[1]
    
    var uDistances = [Int?](repeating: nil, count: n)
    
    var uNext: Int? = u
    var distance = 0
    while let current = uNext {
        uDistances[current] = distance
        uNext = parent[current]
        distance += 1
    }
    
    distance = 0
    var vNext: Int? = v
    while let current = vNext {
        if let previous = uDistances[current] {
            print(previous + distance)
            break
        }
        vNext = parent[current]
        distance += 1
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
