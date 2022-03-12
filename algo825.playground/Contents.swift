// https://algo-method.com/tasks/825
// 2022-03-12 20:51:57

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            3
            0 2
            1 2 5
            0 2
            """,
        expected: """
            4
            5
            """)),
    ("2", Example(
        input: """
            3
            1 0 8
            1 0 6
            0 0
            """,
        expected: """
            6
            """)),
]

// =================================
// Extentions
// Remember to paste these as well!!
// =================================

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
    
    enum Query: Int {
        case output, write
    }
    
    func readInts() -> [Int] {
        return readLine()!.split(separator: " ").map { Int(String($0))! }
    }

    var arr = [3,1,4,1,5,9,2,6,5,3]
    
    let Q = Int(readLine()!)!
    
    for _ in 0..<Q {
        let input = readInts()
        let query = Query(rawValue: input[0])!
        let k = input[1]

        switch query {
        case .output:
            print(arr[k])
        case .write:
            let v = input[2]
            arr[k] = v
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
