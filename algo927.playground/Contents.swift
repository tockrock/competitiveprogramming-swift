// https://algo-method.com/tasks/927
// 2022-05-25 07:41:21

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            7
            0 15 walking
            0 12 lunch
            1
            0 15 shopping
            0 10 work
            1
            1
            """,
        expected: """
            lunch
            work
            walking
            """)),
    ("2", Example(
        input: """
            12
            0 5 abc
            0 5 stu
            0 5 def
            0 5 ghi
            0 5 jkl
            0 5 mno
            0 3 xyz
            1
            1
            1
            1
            1
            """,
        expected: """
            xyz
            abc
            stu
            def
            ghi
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
        
    var heap = Heap<Task>()
    let Q = Int(readLine()!)!
    
    for _ in 0..<Q {
        let queue = readLine()!.split(separator: " ")
        let rawCommand = Int(String(queue[0]))!
        switch Command(rawValue: rawCommand)! {
        case .insert:
            let deadline = Int(String(queue[1]))!
            let taskName = String(queue[2])
            let task = Task(deadline: deadline, task: taskName)
            heap.insert(element: task)
        case .pop:
            print(heap.pop()?.task ?? "-1")
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

struct Task: Comparable {
    private let insertionCounter: UInt64 = getCounter
    let deadline: Int
    let task: String
    
    private static var counter: UInt64 = 0
    
    private static var getCounter: UInt64 {
        defer { counter += 1 }
        return counter
    }
    
    static func < (lhs: Task, rhs: Task) -> Bool {
        guard lhs.deadline != rhs.deadline else {
            return lhs.insertionCounter < rhs.insertionCounter
        }
        return lhs.deadline < rhs.deadline
    }
}

enum Command: Int {
    case insert, pop
}

struct Heap<T: Comparable> {
    private(set) var data = [T]()

    mutating func insert(element: T) {
        data.append(element)
        swim(index: data.endIndex - 1)
    }
    
    mutating func pop() -> T? {
        guard !data.isEmpty else { return nil }
        data.swapAt(0, data.endIndex - 1)
        defer { sink(index: 0) }
        return data.popLast()
    }
    
    private func order(lhs: T, rhs: T) -> Bool {
        return lhs < rhs
    }
    
    mutating private func swim(index: Int) {
        guard index > 0 else { return }
        let parentIndex = (index - 1) / 2
        guard !order(lhs: data[parentIndex], rhs: data[index]) else { return }
        data.swapAt(parentIndex, index)
        swim(index: parentIndex)
    }
    
    mutating private func sink(index: Int) {
        var replaceIndex = index
        for offset in 1...2 {
            let childIndex = index * 2 + offset
            guard childIndex < data.count else { break }
            guard !order(lhs: data[replaceIndex], rhs: data[childIndex]) else { continue }
            replaceIndex = childIndex
        }
        guard replaceIndex > index else { return }
        data.swapAt(replaceIndex, index)
        sink(index: replaceIndex)
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

