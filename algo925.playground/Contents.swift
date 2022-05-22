// https://algo-method.com/tasks/925
// 2022-05-23 08:17:52

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            3
            1
            2
            3
            """,
        expected: """
            3 1 2
            """)),
    ("2", Example(
        input: """
            5
            681
            224
            193
            31089
            85
            """,
        expected: """
            31089 681 193 224 85
            """)),
    ("3", Example(
        input: """
            4
            23
            23
            23
            23
            """,
        expected: """
            23 23 23 23
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================

    let Q = Int(readLine()!)!
    var heap = Heap<Int>()
    
    for _ in 0..<Q {
        let v = Int(readLine()!)!
        heap.insert(v)
    }
    
    print(heap.data.map(\.description).joined(separator: " "))
    
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
    
    mutating func insert(_ n: T) {
        data.append(n)
        swim(data.count - 1)
    }
    
    private mutating func swim(_ index: Int) {
        guard index > 0 else { return }
        let parentIndex = (index - 1) / 2
        
        guard data[parentIndex] < data[index] else { return }
        data.swapAt(parentIndex, index)
        swim(parentIndex)
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
