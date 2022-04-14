// https://algo-method.com/tasks/865
// 2022-04-14 09:28:19

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
            3
            3
            1
            7
            """,
        expected: """
            2
            6
            0
            """)),
    ("2", Example(
        input: """
            5
            51 13 26 91 102
            5
            13
            2
            17
            2
            3
            """,
        expected: """
            3
            2
            2
            2
            2
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
    
    // let mod = 1000000007
    // let mod = 998244353
    
    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }

    let _ = readLine()
    let As = readInts()
    let largestA = As.max()!
    let maxA = 500_000
    var counterA = [Int](repeating: 0, count: maxA + 1)
    
    for A in As {
        counterA[A] += 1
    }

    var ans = [Int?](repeating: nil, count: maxA + 1)
    
    let Q = Int(readLine()!)!
    for _ in 0..<Q {
        let x = Int(readLine()!)!
        defer { print(ans[x]!) }
        
        guard ans[x] == nil else { continue }
        
        var count = 0
        for i in stride(from: 0, through: largestA, by: x) {
            count += counterA[i]
        }
        ans[x] = count
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

