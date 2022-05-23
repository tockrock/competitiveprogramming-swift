// https://algo-method.com/tasks/926
// 2022-05-24 07:40:33

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            6
            0 1
            0 2
            0 3
            1
            1
            1
            """,
        expected: """
            3
            2
            1
            """)),
    ("2", Example(
        input: """
            9
            0 314
            0 159
            1
            0 265
            0 35
            1
            1
            0 8979
            1
            """,
        expected: """
            314
            265
            159
            8979
            """)),
    ("3", Example(
        input: """
            7
            0 23
            0 23
            1
            1
            0 23
            0 23
            1
            """,
        expected: """
            23
            23
            23
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
    
    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }
    
    enum Command: Int {
        case insert, pop
    }
    var heap = Heap<Int>()
    let Q = Int(readLine()!)!
    
    for _ in 0..<Q {
        let query = readInts()
        switch Command(rawValue: query[0])! {
        case .insert:
            heap.insert(query[1])
        case .pop:
            print(heap.pop() ?? -1)
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

struct Heap<T: Comparable> {
    private(set) var data = [T]()
    
    mutating func insert(_ element: T) {
        data.append(element)
        swim(index: data.count - 1)
    }
    
    @discardableResult
    mutating func pop() -> T? {
        guard data.count > 0 else { return nil }
        data.swapAt(0, data.count - 1)
        defer { sink(index: 0) }
        return data.popLast()
    }
    
    func order(_ lhs: T, _ rhs: T) -> Bool {
        lhs >= rhs
    }
    
    private mutating func swim(index: Int) {
        guard index > 0 else { return }
        let parentIndex = (index - 1) / 2
        guard !order(data[parentIndex], data[index]) else { return }
        data.swapAt(parentIndex, index)
        swim(index: parentIndex)
    }
    
    private mutating func sink(index: Int)  {
        let childIndex = index * 2
        var sinkIndex = index
        for offset in 1...2 {
            let nextChildIndex = childIndex + offset
            guard nextChildIndex < data.count else { break }
            guard !order(data[sinkIndex], data[nextChildIndex]) else { continue }
            sinkIndex = nextChildIndex
        }
        guard sinkIndex > index else { return }
        data.swapAt(index, sinkIndex)
        sink(index: sinkIndex)
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
