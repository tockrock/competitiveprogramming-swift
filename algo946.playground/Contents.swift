// https://algo-method.com/tasks/946
// 2022-06-07 10:41:15

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            3
            3 1 4
            5
            0 3 2
            0 4 3
            1 4
            1 5
            1 2
            """,
        expected: """
            15
            Error
            7
            """)),
    ("2", Example(
        input: """
            5
            19 0 42 169 389
            7
            1 3
            0 198344926 34802
            0 30067915 69027
            1 100000
            0 0 2678
            1 20493
            1 905
            """,
        expected: """
            600
            8218835361703
            Error
            0
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================

    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }
    
    enum Command: Int {
        case push, pop
    }
    
    readLine()
    let As = readInts()
    var stack = totalStack()
    stack.push(As)
    
    let Q = Int(readLine()!)!
    
    for _ in 0..<Q {
        let query = readInts()
        switch Command(rawValue: query[0])! {
        case .push:
            let v = query[1], k = query[2]
            stack.push(v: v, k: k)
        case .pop:
            let k = query[1]
            print(stack.pop(k: k) ?? "Error")
        }
    }
    
    // ===============
    // actual code end
    // ===============
}

// =================================
// Extensions
// Remember to paste these as well!!
// =================================

struct totalStack {
    private var stack = [(v: Int, k: Int)]()
    private var stackTotal = 0

    mutating func push(_ vs: [Int]) {
        for v in vs {
            push(v: v, k: 1)
        }
    }
    
    mutating func push(v: Int, k: Int) {
        stack.append((v, k))
        stackTotal += k
    }
    
    mutating func pop(k: Int) -> Int? {
        guard k <= stackTotal else { return nil }
        var remaining = k
        var sum = 0
        while remaining > 0, var last = stack.popLast() {
            let remove = min(last.k, remaining)
            sum += remove * last.v
            remaining -= remove
            if last.k > remove {
                last.k -= remove
                stack.append(last)
            }
        }
        stackTotal -= k
        return sum
    }
}

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
