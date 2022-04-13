// https://algo-method.com/tasks/861
// 2022-04-13 09:50:46

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            2 10
            1 2
            """,
        expected: """
            Yes
            """)),
    ("2", Example(
        input: """
            2 9
            1 2
            """,
        expected: """
            No
            """)),
    ("3", Example(
        input: """
            5 51
            3 1 4 1 5
            """,
        expected: """
            Yes
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
    
    let input = readInts()
    
    let M = input[1]
    let A = Array(Set(readInts()))
    let ASquared = A.map {$0 * $0}
    
    let abMax = 2_000_000
    
    var isSumOfSquare = [Bool](repeating: false, count: abMax + 1)
    let aCount = A.count
    for a in 0..<aCount {
        for b in a..<aCount {
            isSumOfSquare[ASquared[a]+ASquared[b]] = true
        }
    }
    
    var ans = false
    
    for i in 0...M/2 {
        guard isSumOfSquare[i] && isSumOfSquare[M-i] else {
            continue
        }
        ans = true
        break
    }
    
    print(ans ? "Yes" : "No")

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
