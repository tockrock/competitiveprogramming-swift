// https://atcoder.jp/contests/abc238/tasks/abc238_c
// 2022-02-05 21:22:13

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            16
            """,
        expected: """
            73
            """)),
    ("2", Example(
        input: """
            238
            """,
        expected: """
            13870
            """)),
    ("3", Example(
        input: """
            999999999999999999
            """,
        expected: """
            762062362
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // these needs to be in run() to get the overwritten readLine()
    func readString () -> String { readLine()! }
    func readSubsequence () -> [String.SubSequence] { readString().split(separator: " ")}
    func readChars () -> [Character] {readString().map({$0})}
    func readStrings () -> [String] { readSubsequence().map({String($0)}) }
    func readInt() -> Int { Int(readString())! }
    func readInts() -> [Int] { readSubsequence().map{Int($0)!} }
    func readTwoInts() -> (Int, Int) {
        let ints = readInts()
        return (ints[0], ints[1])
    }
    func readThreeInts() -> (Int, Int, Int) {
        let ints = readInts()
        return (ints[0], ints[1], ints[2])
    }
    
    // =====================
    // actual code goes here
    // =====================
    
    print("foo")
    
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
        print: { outputLines.append($0.joinedAsString(separator: " ")) }
    )
}

for example in examples {
    main(label: example.0, example: example.1)
}

func myDebugPrint (_ s: Any... ) { if DEBUG { Swift.print(s.joinedAsString(separator: " ")) } }
func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return gcd(b, a%b)
}
func pf(_ numb: Int) -> [(prime: Int, count: Int)] {
    var n = numb, i = 2, primeList = [(Int, Int)]()
    while i * i <= numb && i <= n {
        var count = 0
        while n % i == 0 { n /= i; count += 1 }
        if count > 0 { primeList.append((i, count)) }
        i += 1
    }
    if n != 1 { primeList.append((n, 1)) }
    return primeList
}
// reference https://ioritsutsui.com/permutation-full-enumeration/
func permutation<T>(_ args: [T]) -> [[T]] {
    guard args.count > 1 else { return [args] }
    func rotate(_ arr: [T]) -> [T] { return arr.dropFirst() + [arr.first!] }
    
    var rotatedValue = args
    var result = [[T]]()
    for _ in 0..<args.count {
        let head = rotatedValue.first!
        let tails = Array(rotatedValue.dropFirst())
        for arr in permutation(tails) {
            result.append([head] + arr)
        }
        rotatedValue = rotate(rotatedValue)
    }
    return result
}
// based on: https://atcoder.jp/contests/abc235/submissions/28562251
struct Queue<T> {
    private var data = [T](), pos=0
    var isEmpty:Bool{ data.count==pos }
    var front:T?{isEmpty ? nil : data[pos]}
    mutating func push(_ t:T) { data.append(t) }
    mutating func push(_ ts:[T]) { data.append(contentsOf: ts) }
    mutating func pop()->T?{
        if isEmpty { return nil }
        pos += 1; return data[pos-1] }}

// based on: https://github.com/davecom/SwiftPriorityQueue/blob/7b4aa89d9740779f6123929c3e9e7e6b86b83671/Sources/SwiftPriorityQueue/SwiftPriorityQueue.swift
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
        let first = heap.removeLast()
        sink(0); return first } }
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

// Based on: https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=DSL_1_A&lang=jp
struct DisjointSet {
    private var rank: [Int]; private var p: [Int]
    init(_ size: Int) {
        rank = [Int](); p = [Int]()
        for x in 0..<size { p.append(x); rank.append(0) }}
    mutating func same(_ x: Int, _ y: Int) -> Bool { return findSet(x) == findSet(y) }
    mutating func unite(_ x: Int, _ y: Int) { link(x, y) }
    private mutating func findSet(_ x: Int) -> Int {
        if x != p[x] { p[x] = findSet(p[x]) }
        return p[x] }
    private mutating func link(_ x: Int, _ y: Int) {
        let a = findSet(x), b = findSet(y)
        if rank[a] > rank[b] { p[b] = a
        } else {
            p[a] = b
            if rank[a] == rank[b] { rank[b] += 1 } }}}

extension Array {
    /// Returns a new string by concatenating the elements of the sequence,
    /// adding the given separator between each element.
    ///
    /// The following example shows how an array of Ints can be joined to a
    /// single, comma-separated string:
    ///
    ///     let numbers = [1, 4, 2, 6]
    ///     let list = numbers.joinedAsString(separator: ", ")
    ///     print(list)
    ///     // Prints "1, 4, 2, 6"
    ///
    /// - Parameter separator: A string to insert between each of the elements
    ///   in this sequence. The default separator is an empty string.
    /// - Returns:  A single, concatenated string.
    func joinedAsString(separator: String = "") -> String {
        self.map {"\($0)"}.joined(separator: separator) } }
