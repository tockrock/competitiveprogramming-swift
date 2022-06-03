// https://algo-method.com/tasks/944
// 2022-06-04 07:49:42

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            4 1
            6 7 5 3
            """,
        expected: """
            17
            """)),
    ("2", Example(
        input: """
            15 10
            3 1 4 1 5 9 2 6 5 3 5 8 9 7 9
            """,
        expected: """
            40
            """)),
    ("3", Example(
        input: """
            2 35
            1000 714
            """,
        expected: """
            0
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
    
    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }
    
    let nk = readInts()
    let k = nk[1]
    let As = readInts()
    
    var pq = PriorityQueue(As, smallerFirst: false)
    
    for _ in 0..<k {
        guard let largest = pq.pop() else { break }
        pq.push(largest / 2)
    }
    
    print(pq.reduce(0, +))
    
    // ===============
    // actual code end
    // ===============
}

// =================================
// Extensions
// Remember to paste these as well!!
// =================================

struct PriorityQueue<T> {
    var heap = [T](); let order: (T, T) -> Bool
    init(_ startingValues: ArraySlice<T> = [], order: @escaping (T, T) -> Bool) {
        self.order = order; push(startingValues) }
    init(_ startingValues: [T], order: @escaping (T, T) -> Bool) {
        self.init(startingValues[...], order: order)}
    var count: Int { heap.count }; var isEmpty: Bool { heap.isEmpty }
    private mutating func sink(_ index: Int) {
        var index = index
        while 2 * index + 1 < count {
            var j = 2 * index + 1
            if j < (count - 1) && order(heap[j+1], heap[j]) { j += 1 }
            guard order(heap[j], heap[index] ) else { break }
            heap.swapAt(j, index); index = j } }
    private mutating func swim(_ index: Int) {
        var index = index
        while index > 0 && order(heap[index], heap[(index - 1) / 2]) {
            heap.swapAt(index, (index - 1) / 2)
            index = (index - 1) / 2 } }
    mutating func push(_ element: T) { heap.append(element); swim(count - 1) }
    mutating func push(_ elements: ArraySlice<T>) { elements.forEach { push($0) } }
    mutating func push(_ elements: [T]) { push(elements[...]) }
    mutating func pop() -> T? {
        guard !isEmpty else { return nil }
        heap.swapAt(0, count - 1)
        defer { sink(0) }
        return heap.removeLast() } }
extension PriorityQueue where T: Comparable {
    init(_ startingValues: ArraySlice<T> = [], smallerFirst: Bool = true) {
        self.init(startingValues, order: smallerFirst ? {$0 < $1} : {$0 > $1}) }
    init(_ startingValues: [T], smallerFirst: Bool = true) {
        self.init(startingValues[...], smallerFirst: smallerFirst)} }
extension PriorityQueue: IteratorProtocol {
    mutating func next() -> T? { return pop() }}
extension PriorityQueue: Sequence {
    func makeIterator() -> PriorityQueue<T> { return self }}
extension PriorityQueue: Collection {
    var startIndex: Int { return heap.startIndex }
    var endIndex: Int { return heap.endIndex }
    subscript(i: Int) -> T { return heap[i] }
    func index(after i: Int) -> Int { return heap.index(after: i) }}
extension PriorityQueue: CustomStringConvertible, CustomDebugStringConvertible {
    var description: String { return heap.description }
    var debugDescription: String { return heap.debugDescription }}

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
