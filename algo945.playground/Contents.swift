// https://algo-method.com/tasks/945
// 2022-06-06 07:52:13

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            6
            3 1 4 1 5 9
            """,
        expected: """
            10
            """)),
    ("2", Example(
        input: """
            5
            3 4 5 6 7
            """,
        expected: """
            16
            """)),
    ("3", Example(
        input: """
            9
            46 18 44 35 6 38 16 19 7
            """,
        expected: """
            72
            """)),
    ("4", Example(
        input: """
            4
            2 2 99 2
            """,
        expected: """
            99
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
    
    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }

    readLine()
    let As = readInts()
    let largestA = As.max()!
    
    var counter = [Int](repeating: 0, count: largestA + 1)
    var largest = Int.min
    
    for a in As {
        for i in 0...largestA {
            guard i <= a else {
                counter[i] = 0
                continue
            }
            
            counter[i] += 1
            largest = max(largest, i * counter[i])
        }
    }
    
    print(largest)
    
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
