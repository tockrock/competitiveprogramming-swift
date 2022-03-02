// D - Sequence Query
// https://atcoder.jp/contests/abc241/tasks/abc241_d
// 実行制限時間: 2.0 sec
import Foundation

func main() {
    // =====================
    // actual code goes here
    // =====================

    
    func binarySearch(l: Int, r: Int, where predicate: (Int) -> Bool) -> Int {
        var l = l
        var r = r
        while abs(l - r) > 1 {
            let mid = (l + r) / 2
            if predicate(mid) {
                l = mid
            } else {
                r = mid
            }
        }
        return l
    }

    let Q = readInt()
    var tempT = [Int]()
    var tempX = [Int]()
    var tempK = [Int]()
    
    for _ in 0..<Q {
        let input = readInts()
        let command = input[0]
        tempT.append(command)
        tempX.append(input[1])
        if command == 1 {
            tempK.append(0)
        } else {
            tempK.append(input[2])
        }
    }
    
    let T = tempT
    let X = tempX
    let K = tempK
    
    let orderIndices = (0..<Q).sorted { lhs, rhs in
        X[lhs] < X[rhs]
    }
    var lookupOrder = [Int](repeating: 0, count: Q)
    for i in 0..<Q {
        lookupOrder[orderIndices[i]] = i
    }
    
    var L = [Int?](repeating: nil, count: Q)
    var R = [Int?](repeating: nil, count: Q)
    
    var removedIndices = [Bool](repeating: false, count: Q)
    
    for i in 0..<Q {
        if i > 0 {
            L[i] = i - 1
        }
        if i + 1 < Q {
            R[i] = i + 1
        }
    }
        
    func removeOrderIndex(_ orderIndex: Int) {
        removedIndices[orderIndex] = true
        if let l = L[orderIndex] {
            R[l] = R[orderIndex]
        }
        if let r = R[orderIndex] {
            L[r] = L[orderIndex]
        }
    }
    
    for i in 0..<Q {
        if T[i] != 1 {
            removeOrderIndex(lookupOrder[i])
        }
    }
        
    func findLeft(_ index: Int?) -> Int? {
        guard let index = index else { return nil }
        guard removedIndices[index] else { return index }
        
        let result = findLeft(L[index])
        L[index] = result
        return result
    }
    
    func findRight(_ index: Int?) -> Int? {
        guard let index = index else { return nil }
        guard removedIndices[index] else { return index }
        
        let result = findRight(R[index])
        R[index] = result
        return result
    }
    
    var answer = [Int]()
    
    for i in (0..<Q).reversed() {
        switch T[i] {
        case 1:
            let order = lookupOrder[i]
            removeOrderIndex(order)
        case 2:
            var order: Int? = binarySearch(l: -1, r: Q) { order in
                X[orderIndices[order]] <= X[i]
            }
            if order == -1 { order = nil }
            order = findLeft(order)
            for _ in 0..<K[i] - 1 where order != nil {
                order = L[order!]
            }
            if let order = order {
                answer.append(X[orderIndices[order]])
            } else {
                answer.append(-1)
            }
        case 3:
            var order: Int? = binarySearch(l: Q, r: -1) { order in
                X[orderIndices[order]] >= X[i]
            }
            if order == Q {
                order = nil
            }
            order = findRight(order)
            for _ in 0..<K[i] - 1 where order != nil {
                order = R[order!]
            }
            if let order = order {
                answer.append(X[orderIndices[order]])
            } else {
                answer.append(-1)
            }
        default:
            fatalError()
        }
    }
    
    for i in answer.reversed() {
        print(i)
    }
    
    

    // ===============
    // actual code end
    // ===============
}

main()

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
