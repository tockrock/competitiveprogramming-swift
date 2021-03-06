// https://algo-method.com/tasks/961
// 2022-06-18 08:00:06

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            5 4
            3 4
            1 2
            4 0
            2 4
            """,
        expected: """
            Yes
            """)),
    ("2", Example(
        input: """
            3 3
            0 1
            1 2
            2 0
            """,
        expected: """
            No
            """)),
    ("3", Example(
        input: """
            9 9
            5 3
            7 1
            5 4
            8 7
            6 3
            5 2
            3 0
            1 8
            0 4
            6 2
            """,
        expected: """
            No
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================

    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }

    let nm = readInts()
    let n = nm[0], m = nm[1]

    var graph = [[Int]](repeating: [], count: n)
    
    for _ in 0..<m {
        let ab = readInts()
        let a = ab[0], b = ab[1]
        graph[a].append(b)
        graph[b].append(a)
    }
    
    var colorMap = [Bool?](repeating: nil, count: n)

    func colorCheck(_ i: Int, expected: Bool) -> Bool {
        switch colorMap[i] {
        case .some(true):
            return expected == true
        case .some(false):
            return expected == false
        case .none:
            break
        }
        
        colorMap[i] = expected
        for next in graph[i] {
            guard colorCheck(next, expected: !expected) else {
                return false
            }
        }
        return true
    }
    
    var answer = true
    
    for i in 0..<n where colorMap[i] == nil {
        guard colorCheck(i, expected: true) else {
            answer = false
            break
        }
    }
    
    print(answer ? "Yes" : "No")
        
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
