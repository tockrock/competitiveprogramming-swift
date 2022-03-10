// https://algo-method.com/tasks/819
// 2022-03-10 11:32:17

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            2 3
            0 2
            """,
        expected: """
            2
            """)),
    ("2", Example(
        input: """
            3 2
            5 5
            """,
        expected: """
            0
            """)),
    ("3", Example(
        input: """
            10 10
            0 0 0 0 0 0 0 0 0 0
            """,
        expected: """
            92378
            """)),
    ("2-1", Example(
        input: """
            2 11
            5 5
            """,
        expected: """
            2
            """)),
    ("2-2", Example(
        input: """
            2 10
            5 5
            """,
        expected: """
            1
            """)),
    ("2-3", Example(
        input: """
            3 16
            5 5 5
            """,
        expected: """
            3
            """)),
    ("2-4", Example(
        input: """
            3 15
            5 5 5
            """,
        expected: """
            1
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
    
    func readInts() -> [Int] {
        return readLine()!.split(separator: " ").map { Int(String($0))! }
    }
    func combination(n: Int, r: Int) -> Int {
        let smaller = min(n-r, r)
        guard smaller >= 0 else { return 0 }
        guard smaller > 0 else { return 1 }
        let larger = n - smaller
        return (larger+1...n).reduce(1, *) / (1...smaller).reduce(1, *)
    }

    func solve() -> Int {
        let input = readInts()
        let N = input[0], M = input[1]
        let Xs = readInts()
        
        let total = Xs.reduce(0, +)
        let O = M - total

        return combination(n: N+O-1, r: O)
    }
    
    print(solve())
    
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
