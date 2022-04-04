// https://algo-method.com/tasks/857
// 2022-04-05 07:29:15

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            5
            3 1 4 1 5
            3
            1
            2
            3
            """,
        expected: """
            2
            0
            1
            """)),
    ("2", Example(
        input: """
            6
            1000 123 123 1000 1000 456
            3
            81
            1000
            1000
            """,
        expected: """
            0
            3
            3
            """)),
]

// =================================
// Extensions
// Remember to paste these as well!!
// =================================

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
    
    func readInt() -> Int { Int(readLine()!)!  }
    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }
    
    let N = readInt()
    var As = readInts()
    As.sort()

    let Q = readInt()
    var xs = [Int]()
    for _ in 0..<Q {
        xs.append(readInt())
    }
    
    var ans = [Int: Int]()
    let xSorted = xs.sorted()
    
    var aPos = 0
    var xPos = 0
        
    while aPos < N && xPos < Q {
        let A = As[aPos], x = xSorted[xPos]
        
        guard A <= x else {
            xPos += 1
            continue
        }
        if A == x {
            ans[x, default: 0] += 1
        }
        aPos += 1
    }
    
    for x in xs {
        print(ans[x, default: 0])
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
