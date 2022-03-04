// D - Sequence Query
// https://atcoder.jp/contests/abc241/tasks/abc241_d
// 実行制限時間: 2.0 sec
import Foundation

func main() {
    // =====================
    // actual code goes here
    // =====================
    
    
    enum Commands: Int {
        case add = 1
        case smaller = 2
        case bigger = 3
    }
    
    struct Query {
        let command: Commands
        let value: Int
        let count: Int
        
        init(rawQuery: [Int]) {
            command = Commands(rawValue: rawQuery[0])!
            value = rawQuery[1]
            count = rawQuery.count > 2 ? rawQuery[2] : 0
        }
    }

    let Q = readInt()
    var queries = [Query]()
    for _ in 0..<Q {
        queries.append(Query(rawQuery: readInts()))
    }
    
    var values = [Int]()
    
    for q in queries where q.command == .add {
        values.append(q.value)
    }
    
    values.sort()
    
    var linkedList = LinkedList<Int>()
    
    linkedList.append(contestOf: values)
    
    var answer = [Int]()
    
    for q in queries.reversed() {
        switch q.command {
        case .add:
            let index = linkedList.getIndex { index in values[index] <= q.value  }

            linkedList.removeElement(index: index!)
        case .smaller:
            var index = linkedList.getIndex(where: { index in values[index] <= q.value })
            
            for _ in 0..<q.count - 1 where index != nil {
                index = linkedList.getPreviousIndexOf(index: index!)
            }
            if let index = index {
                answer.append(linkedList.getElement(index: index).value)
            } else {
                answer.append(-1)
            }
        case .bigger:
            var index = linkedList.getIndex(where: { index in values[index] >= q.value }, reversed: true)

            for _ in 0..<q.count - 1 where index != nil {
                index = linkedList.getNextIndexOf(index: index!)
            }
            if let index = index {
                answer.append(linkedList.getElement(index: index).value)
            } else {
                answer.append(-1)
            }
        }
    }
        
    for ans in answer.reversed() {
        print(ans)
    }

    // ===============
    // actual code end
    // ===============
}

main()

func binarySearch(start: Int, end: Int, where predicate: (Int) -> Bool ) -> Int {
    var l = start
    var r = end
    
    while abs(l-r) > 1 {
        let mid = (l + r) / 2
        if predicate(mid) {
            l = mid
        } else {
            r = mid
        }
    }
    return l
}

// First Version for generic linked list

struct LinkedList<T>{
    var list = [LinkedElement<T>]()
    var count = 0
    
    struct LinkedElement<T> {
        let index: Int
        let value: T
        var previous: Int? = nil
        var next: Int? = nil
        var active: Bool = true
    }
    
    mutating func append(_ value: T) {
        var newElement = LinkedElement(index: count, value: value)
        defer {
            list.append(newElement)
            count += 1
        }
        guard count > 0 else { return }
        
        newElement.previous = count - 1
        list[count-1].next = count
    }
    mutating func append(contestOf elements: [T]) {
        elements.forEach { append($0) }
    }
    
    mutating func getPreviousIndexOf(index: Int) -> Int? {
        guard let previousIndex = list[index].previous else { return nil }
        let previous = list[previousIndex]
        guard !previous.active else { return previousIndex }
        
        let actual = getPreviousIndexOf(index: previous.index)
        list[index].previous = actual
        return actual
    }
    mutating func getNextIndexOf(index: Int) -> Int? {
        guard let nextIndex = list[index].next else { return nil }
        let next = list[nextIndex]
        guard !next.active else { return nextIndex }
        
        let actual = getNextIndexOf(index: next.index)
        list[index].next = actual
        return actual
    }
    func getElement(index: Int) -> LinkedElement<T> {
        return list[index]
    }
    mutating func removeElement(index: Int) {
        let element = list[index]
        list[index].active = false
        if let previous = element.previous {
            list[previous].next = element.next
        }
        if let next = element.next {
            list[next].previous = element.previous
        }
    }
    
    mutating func getIndex(where predicate: (Int) -> Bool, reversed: Bool = false) -> Int? {
        let start = !reversed ? -1 : count
        let end = !reversed ? count : -1
        
        let index = binarySearch(start: start, end: end, where: predicate)
        guard index != start else { return nil }
        let element = list[index]
        guard !element.active else { return index }
        
        return !reversed ? getPreviousIndexOf(index: index) : getNextIndexOf(index: index)
    }
    
    mutating func getStart() -> Int? {
        guard list.isEmpty == false else { return nil }
        let startIndex = list.startIndex
        guard !list[startIndex].active else { return startIndex }
        
        return getNextIndexOf(index: startIndex)
    }
}

func readString () -> String { readLine()! }
func readChars () -> [Character] { Array(readString()) }
func readSubsequence () -> [String.SubSequence] { readString().split(separator: " ")}
func readStrings () -> [String] { readSubsequence().map({String($0)}) }
func readInt() -> Int { Int(readString())! }
func readInts() -> [Int] { readSubsequence().map{Int(String($0))!} } // TODO: remove the String conversion once AtCoder is updated to 5.5

// =========
// Operators
// =========

infix operator /-: MultiplicationPrecedence // FloorDiv

/// FloorDiv
/// - Returns: Division result floored towards negative infinity
func /- (lhs: Int, rhs: Int) -> Int {
    if rhs < 0 { return -lhs /- -rhs }
    return lhs >= 0 ? lhs / rhs : (lhs - rhs + 1) / rhs }

// ==========
// Extentions
// ==========

extension Bool {
    /// Returns String "Yes" or "No"  depending on the bool value
    var yN: String { self ? "Yes" : "No" } }

extension Array {
    func tupled() -> (Element, Element) { (self[0], self[1]) }
    func tupled() -> (Element, Element, Element) { (self[0], self[1], self[2]) }
    func tupled() -> (Element, Element, Element, Element) { (self[0], self[1],
                                                             self[2], self[3]) }
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

// ===============
// Data Structures
// ===============

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

// =========
// Functions
// =========

/// Power of Ints
/// - Parameters:
///   - base: Base number to be powered
///   - index: The exponent
/// - Returns: Int of the exponential number. `nil` if the result is beyond Int.
func pow(_ base: Int, _ index: Int) -> Int? {
    let result = pow(Double(base), Double(index))
    guard result <= Double(Int.max) && result >= Double(Int.min) else { return nil }
    return Int(result) }

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
