// Book: ALDS1_11_C: Breadth First Search
// https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_11_C&lang=jp
// 2021-12-09 09:50:00

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            4
            1 2 2 4
            2 1 4
            3 0
            4 1 3
            """,
        expected: """
            1 0
            2 1
            3 2
            4 1
            """)),
    ("2", Example(
        input: """
            7
            1 3 2 3 5
            2 3 1 3 4
            3 3 4 6 7
            4 2 3 7
            5 2 1 3
            6 2 3 7
            7 3 3 4 6
            """,
        expected: """
            1 0
            2 1
            3 1
            4 2
            5 1
            6 2
            7 2
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
    
    
    var graph = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    
    for i in 0..<n {
        let input = readInts()
        guard input[1] > 0 else {
            continue
        }
        for j in input[2...input[1]+1] {
            graph[i][j-1] = 1
        }
        
    }
    
    var distance: [Int?] = [0] + [Int?](repeating: nil, count: n-1)
    
    var queue = [0]
    
    while !queue.isEmpty || distance.contains(nil) {
        let v = queue[0]
        for i in 0..<n {
            guard graph[v][i] == 1 else { continue }
            guard distance[i] == nil else { continue }
            distance[i] = distance[v]! + 1
            queue.append(i)
        }
        queue.removeFirst()
    }
    
    for i in 0..<n {
        print(i+1, distance[i] ?? -1)
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

// Only for the Book
extension Array {
    func outputWithSpace() -> String {
        return String(
            self.reduce("") {
                $0 + "\($1) "
            }.dropLast(1)
        )
    }
}
