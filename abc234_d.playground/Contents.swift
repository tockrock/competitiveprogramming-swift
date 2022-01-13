// https://atcoder.jp/contests/abc234/tasks/abc234_d
// 2022-01-08 21:22:04

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            3 2
            1 2 3
            """,
        expected: """
            1
            2
            """)),
    ("2", Example(
        input: """
            11 5
            3 7 2 5 11 6 1 9 8 10 4
            """,
        expected: """
            2
            3
            3
            5
            6
            7
            7
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
    
    // referenced: https://atcoder.jp/contests/abc234/submissions/28401212
    
    let (_, k) = readTwoInts()
    let p = readInts()
    
    var queue = PriorityQueue<Int>(orderBy: <)
    p[..<k].forEach { queue.push($0) }
    
    print(queue.heap[0])
    for e in p[k...] {
        if e > queue.heap[0] {
            queue.pop()
            queue.push(e)
        }
        print(queue.heap[0])
        
    }
    
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

// referenced: https://atcoder.jp/contests/abc234/submissions/28401212
struct PriorityQueue<E> {
    var heap:[E]=[];let order:(E,E)->Bool
    var isEmpty:Bool{heap.isEmpty};var count:Int{heap.count}
    init(_ es:[E]=[], orderBy order:@escaping (E,E)->Bool) {
        self.order = order;push(contentsOf:es)}
    mutating func push(_ e:E) {
        var pos=count;heap.append(e)
        while pos>0{
            let parent = (pos - 1) / 2
            if !order(heap[parent], heap[pos]) {heap.swapAt(pos,parent)}
            pos = parent}}
    mutating func push(contentsOf es:[E]) {
        es.forEach {push($0)}}
    @discardableResult mutating func pop() -> E? {
        if count<2 {return heap.popLast()}
        heap.swapAt(0, count-1)
        let result = heap.popLast();var pos=0
        while pos*2+1<count {
            var next=pos*2+1
            if next+1<count && order(heap[next+1],heap[next]) {
                next+=1}
            guard !order(heap[pos],heap[next]) else {break}
            heap.swapAt(pos, next);pos=next}
        return result}
}
