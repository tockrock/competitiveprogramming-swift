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

    struct Data {
        let value: Int
        let pos: Int
    }
    
    let n = Int(readLine()!)!
    let As = readInts()
    
    var lowerLeft = [Int](repeating: 0, count: n)
    var leftStack = [Data]()
    for (pos, a) in As.enumerated() {
        while a <= leftStack.last?.value ?? 0 {
            leftStack.popLast()
        }
        
        lowerLeft[pos] = leftStack.last?.pos ?? -1
        leftStack.append(Data(value: a, pos: pos))
    }
    
    var lowerRight = [Int](repeating: 0, count: n)
    var rightStack = [Data]()
    for (pos, a) in As.enumerated().reversed() {
        while a <= rightStack.last?.value ?? 0 {
            rightStack.popLast()
        }
        
        lowerRight[pos] = rightStack.last?.pos ?? n
        rightStack.append(Data(value: a, pos: pos))
    }
    
    var largest = Int.min
    for (pos, a) in As.enumerated() {
        let l = lowerLeft[pos], r = lowerRight[pos]
        
        largest = max(largest, a * (r - l - 1))
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
