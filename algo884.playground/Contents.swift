// https://algo-method.com/tasks/884
// 2022-04-26 08:06:46

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            3 6
            0 3
            0 1
            0 4
            1
            1
            0 1
            """,
        expected: """
            1
            -1
            4
            """)),
    ("2", Example(
        input: """
            5 8
            0 10
            0 20
            0 30
            0 40
            1
            1
            0 50
            1
            """,
        expected: """
            -1
            -1
            -1
            40
            50
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
    
    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }
    
    enum Command: Int {
        case push, pop
    }
    
    struct ArrayQueue {
        private var head: Int = 0
        private var tail: Int = 0
        
        private(set) var queue: [Int]
                
        init(_ n: Int) {
            queue = [Int](repeating: -1, count: n)
        }
        
        mutating func push(_ v: Int) {
            queue[tail] = v
            tail += 1
            tail %= queue.count
        }
        
        @discardableResult mutating func pop() -> Int {
            defer {
                queue[head] = -1
                head += 1
                head %= queue.count
            }
            
            return queue[head]
        }
    }
    
    let input = readInts()
    
    var arrayQueue = ArrayQueue(input[0])
    
    for _ in 0..<input[1] {
        let rawQueue = readInts()
        switch Command(rawValue: rawQueue[0])! {
        case .push:
            arrayQueue.push(rawQueue[1])
        case .pop:
            arrayQueue.pop()
        }
    }
    
    arrayQueue.queue.forEach { print($0) }
    
    
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
