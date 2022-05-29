// https://algo-method.com/tasks/940
// 2022-05-30 08:32:47

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            5 6
            3 1 4 1 5
            """,
        expected: """
            2
            """)),
    ("2", Example(
        input: """
            15 8
            1 1 2 3 4 4 4 5 5 6 7 7 8 9 10
            """,
        expected: """
            10
            """)),
    ("3", Example(
        input: """
            6 6
            5 1 4 1 5 5
            """,
        expected: """
            6
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================

    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }

    let nm = readInts()
    let m = nm[1]
    let As = readInts()
    
    var counter = [Int: Int]()
    for a in As {
        counter[a, default: 0] += 1
    }
    
    var result = 0
    for a in Set(As) {
        let pair = m - a
        
        guard let aCount = counter[a] else { continue }
        
        guard pair != a else {
            result += aCount * (aCount - 1) / 2
            continue
        }
        
        guard let pairCount = counter[pair] else { continue }
        
        result += aCount * pairCount

        counter[a] = nil
        counter[pair] = nil
    }
    
    print(result)
    
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
