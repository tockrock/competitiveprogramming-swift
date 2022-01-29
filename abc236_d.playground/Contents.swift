// https://atcoder.jp/contests/abc236/tasks/abc236_d
// 2022-01-23 21:14:39

import Foundation
import Darwin
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            2
            4 0 1
            5 3
            2
            """,
        expected: """
            6
            """)),
    ("2", Example(
        input: """
            1
            5
            """,
        expected: """
            5
            """)),
    ("3", Example(
        input: """
            3
            4 0 1 0 0
            5 3 0 0
            2 0 0
            0 0
            0
            """,
        expected: """
            6
            """)),
    ("3", Example(
        input: """
            5
            900606388 317329110 665451442 1045743214 260775845 726039763 57365372 741277060 944347467
            369646735 642395945 599952146 86221147 523579390 591944369 911198494 695097136
            138172503 571268336 111747377 595746631 934427285 840101927 757856472
            655483844 580613112 445614713 607825444 252585196 725229185
            827291247 105489451 58628521 1032791417 152042357
            919691140 703307785 100772330 370415195
            666350287 691977663 987658020
            1039679956 218233643
            70938785
            """,
        expected: """
            1073289207
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
    
    let n = readInt()
    var A = [[Int]]()
    A.append([0])
    let comb = Array(1...2*n)
    
    for i in 1..<2*n {
        A.append([Int](repeating: 0, count: i+1) + readInts())
    }
    
    func findHappynessFor(_ comb: [Int], _ decided: [Int]) -> Int {
        if comb.isEmpty {
            var ans = 0
            for i in 0..<decided.count/2 {
                ans ^= A[decided[2*i]][decided[2*i + 1]]
            }
            return ans
        }
        var largest = 0
        let smallest_element = comb[0]
        let count = comb.count
        for i in 1..<count {
            var remains = comb
            remains.remove(at: i)
            remains.remove(at: 0)
            let ans = findHappynessFor(remains, decided + [smallest_element, comb[i]])
            largest = max(largest, ans)
        }
        return largest
    }
    
    print(findHappynessFor(comb, []))
    
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

func myDebugPrint (_ s: Any... ) { if DEBUG { Swift.print(s.map({"\($0)"}).joined(separator: " ")) } }
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
struct PriorityQueue<T: Comparable> {
    var heap = [T](); let order: (T, T) -> Bool
    init(_ startingValues: ArraySlice<T> = [], order: @escaping (T, T) -> Bool) {
        self.order = order; push(startingValues) }
    init(_ startingValues: ArraySlice<T> = [], smallerFirst: Bool = true) {
        self.init(startingValues, order: smallerFirst ? {$0 < $1} : {$0 > $1}) }
    init(_ startingValues: [T], order: @escaping (T, T) -> Bool) {
        self.init(startingValues[...], order: order)}
    init(_ startingValues: [T], smallerFirst: Bool = true) {
        self.init(startingValues[...], smallerFirst: smallerFirst)}
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

//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift Algorithms open source project
//
// Copyright (c) 2020-2021 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

/// A collection wrapper that generates combinations of a base collection.
public struct CombinationsSequence<Base: Collection> {
    /// The collection to iterate over for combinations.
    @usableFromInline
    internal let base: Base
    
    @usableFromInline
    internal let baseCount: Int
    
    /// The range of accepted sizes of combinations.
    ///
    /// - Note: This may be `nil` if the attempted range entirely exceeds the
    /// upper bounds of the size of the `base` collection.
    @usableFromInline
    internal let kRange: Range<Int>?
    
    /// Initializes a `CombinationsSequence` for all combinations of `base` of
    /// size `k`.
    ///
    /// - Parameters:
    ///   - base: The collection to iterate over for combinations.
    ///   - k: The expected size of each combination.
    @inlinable
    internal init(_ base: Base, k: Int) {
        self.init(base, kRange: k...k)
    }
    
    /// Initializes a `CombinationsSequence` for all combinations of `base` of
    /// sizes within a given range.
    ///
    /// - Parameters:
    ///   - base: The collection to iterate over for combinations.
    ///   - kRange: The range of accepted sizes of combinations.
    @inlinable
    internal init<R: RangeExpression>(
        _ base: Base, kRange: R
    ) where R.Bound == Int {
        let range = kRange.relative(to: 0 ..< .max)
        self.base = base
        let baseCount = base.count
        self.baseCount = baseCount
        let upperBound = baseCount + 1
        self.kRange = range.lowerBound < upperBound
        ? range.clamped(to: 0 ..< upperBound)
        : nil
    }
    
    /// The total number of combinations.
    @inlinable
    public var count: Int {
        guard let k = self.kRange else { return 0 }
        let n = baseCount
        if k == 0 ..< (n + 1) {
            return 1 << n
        }
        
        func binomial(n: Int, k: Int) -> Int {
            switch k {
            case n, 0: return 1
            case n...: return 0
            case (n / 2 + 1)...: return binomial(n: n, k: n - k)
            default: return n * binomial(n: n - 1, k: k - 1) / k
            }
        }
        
        return k.map {
            binomial(n: n, k: $0)
        }.reduce(0, +)
    }
}

extension CombinationsSequence: Sequence {
    /// The iterator for a `CombinationsSequence` instance.
    public struct Iterator: IteratorProtocol {
        @usableFromInline
        internal let base: Base
        
        /// The current range of accepted sizes of combinations.
        ///
        /// - Note: The range is contracted until empty while iterating over
        /// combinations of different sizes. When the range is empty, iteration is
        /// finished.
        @usableFromInline
        internal var kRange: Range<Int>
        
        /// Whether or not iteration is finished (`kRange` is empty)
        @inlinable
        internal var isFinished: Bool {
            return kRange.isEmpty
        }
        
        @usableFromInline
        internal var indexes: [Base.Index]
        
        @inlinable
        internal init(_ combinations: CombinationsSequence) {
            self.base = combinations.base
            self.kRange = combinations.kRange ?? 0..<0
            self.indexes = Array(combinations.base.indices.prefix(kRange.lowerBound))
        }
        
        /// Advances the current indices to the next set of combinations. If
        /// `indexes.count == 3` and `base.count == 5`, the indices advance like
        /// this:
        ///
        ///     [0, 1, 2]
        ///     [0, 1, 3]
        ///     [0, 1, 4] *
        ///     // * `base.endIndex` reached in `indexes.last`
        ///     // Advance penultimate index and propagate that change
        ///     [0, 2, 3]
        ///     [0, 2, 4] *
        ///     [0, 3, 4] *
        ///     [1, 2, 3]
        ///     [1, 2, 4] *
        ///     [1, 3, 4] *
        ///     [2, 3, 4] *
        ///     // Can't advance without needing to go past `base.endIndex`,
        ///     // so the iteration is finished.
        @inlinable
        internal mutating func advance() {
            /// Advances `kRange` by incrementing its `lowerBound` until the range is
            /// empty, when iteration is finished.
            func advanceKRange() {
                if kRange.lowerBound < kRange.upperBound {
                    let advancedLowerBound = kRange.lowerBound + 1
                    kRange = advancedLowerBound ..< kRange.upperBound
                    indexes.removeAll(keepingCapacity: true)
                    indexes.append(contentsOf: base.indices.prefix(kRange.lowerBound))
                }
            }
            
            guard !indexes.isEmpty else {
                // Initial state for combinations of 0 elements is an empty array with
                // `finished == false`. Even though no indexes are involved, advancing
                // from that state means we are finished with iterating.
                advanceKRange()
                return
            }
            
            let i = indexes.count - 1
            base.formIndex(after: &indexes[i])
            if indexes[i] != base.endIndex { return }
            
            var j = i
            while indexes[i] == base.endIndex {
                j -= 1
                guard j >= 0 else {
                    // Finished iterating over combinations of this size.
                    advanceKRange()
                    return
                }
                
                base.formIndex(after: &indexes[j])
                for k in indexes.indices[(j + 1)...] {
                    indexes[k] = base.index(after: indexes[k - 1])
                    if indexes[k] == base.endIndex {
                        break
                    }
                }
            }
        }
        
        @inlinable
        public mutating func next() -> [Base.Element]? {
            guard !isFinished else { return nil }
            defer { advance() }
            return indexes.map { i in base[i] }
        }
    }
    
    @inlinable
    public func makeIterator() -> Iterator {
        Iterator(self)
    }
}

extension CombinationsSequence: LazySequenceProtocol
where Base: LazySequenceProtocol {}

//===----------------------------------------------------------------------===//
// combinations(ofCount:)
//===----------------------------------------------------------------------===//

extension Collection {
    /// Returns a collection of combinations of this collection's elements, with
    /// each combination having the specified number of elements.
    ///
    /// This example prints the different combinations of 1 and 2 from an array of
    /// four colors:
    ///
    ///     let colors = ["fuchsia", "cyan", "mauve", "magenta"]
    ///     for combo in colors.combinations(ofCount: 1...2) {
    ///         print(combo.joined(separator: ", "))
    ///     }
    ///     // fuchsia
    ///     // cyan
    ///     // mauve
    ///     // magenta
    ///     // fuchsia, cyan
    ///     // fuchsia, mauve
    ///     // fuchsia, magenta
    ///     // cyan, mauve
    ///     // cyan, magenta
    ///     // mauve, magenta
    ///
    /// The returned collection presents combinations in a consistent order, where
    /// the indices in each combination are in ascending lexicographical order.
    /// That is, in the example above, the combinations in order are the elements
    /// at `[0]`, `[1]`, `[2]`, `[3]`, `[0, 1]`, `[0, 2]`, `[0, 3]`, `[1, 2]`,
    /// `[1, 3]`, and finally `[2, 3]`.
    ///
    /// This example prints _all_ the combinations (including an empty array and
    /// the original collection) from an array of numbers:
    ///
    ///     let numbers = [10, 20, 30, 40]
    ///     for combo in numbers.combinations(ofCount: 0...) {
    ///         print(combo)
    ///     }
    ///     // []
    ///     // [10]
    ///     // [20]
    ///     // [30]
    ///     // [40]
    ///     // [10, 20]
    ///     // [10, 30]
    ///     // [10, 40]
    ///     // [20, 30]
    ///     // [20, 40]
    ///     // [30, 40]
    ///     // [10, 20, 30]
    ///     // [10, 20, 40]
    ///     // [10, 30, 40]
    ///     // [20, 30, 40]
    ///     // [10, 20, 30, 40]
    ///
    /// If `kRange` is `0...0`, the resulting sequence has exactly one element, an
    /// empty array. The given range is limited to `0...base.count`. If the
    /// limited range is empty, the resulting sequence has no elements.
    ///
    /// - Parameter kRange: The range of numbers of elements to include in each
    ///   combination.
    ///
    /// - Complexity: O(1) for random-access base collections. O(*n*) where *n*
    ///   is the number of elements in the base collection, since
    ///   `CombinationsSequence` accesses the `count` of the base collection.
    @inlinable
    public func combinations<R: RangeExpression>(
        ofCount kRange: R
    ) -> CombinationsSequence<Self> where R.Bound == Int {
        CombinationsSequence(self, kRange: kRange)
    }
    
    /// Returns a collection of combinations of this collection's elements, with
    /// each combination having the specified number of elements.
    ///
    /// This example prints the different combinations of three from an array of
    /// four colors:
    ///
    ///     let colors = ["fuchsia", "cyan", "mauve", "magenta"]
    ///     for combo in colors.combinations(ofCount: 3) {
    ///         print(combo.joined(separator: ", "))
    ///     }
    ///     // fuchsia, cyan, mauve
    ///     // fuchsia, cyan, magenta
    ///     // fuchsia, mauve, magenta
    ///     // cyan, mauve, magenta
    ///
    /// The returned collection presents combinations in a consistent order, where
    /// the indices in each combination are in ascending lexicographical order.
    /// That is, in the example above, the combinations in order are the elements
    /// at `[0, 1, 2]`, `[0, 1, 3]`, `[0, 2, 3]`, and finally `[1, 2, 3]`.
    ///
    /// If `k` is zero, the resulting sequence has exactly one element, an empty
    /// array. If `k` is greater than the number of elements in this sequence,
    /// the resulting sequence has no elements.
    ///
    /// - Parameter k: The number of elements to include in each combination.
    ///
    /// - Complexity: O(1) for random-access base collections. O(*n*) where *n*
    /// is the number of elements in the base collection, since
    /// `CombinationsSequence` accesses the `count` of the base collection.
    @inlinable
    public func combinations(ofCount k: Int) -> CombinationsSequence<Self> {
        precondition(k >= 0, "Can't have combinations with a negative number of elements.")
        return CombinationsSequence(self, k: k)
    }
}
