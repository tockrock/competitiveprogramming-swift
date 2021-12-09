// Book: ALDS1_11_B: Depth First Search
// https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_11_B&lang=jp
// 2021-12-09 08:43:41

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
            1 1 2
            2 1 4
            3 0
            4 1 3
            """,
        expected: """
            1 1 8
            2 2 7
            3 4 5
            4 3 6
            """)),
    ("2", Example(
        input: """
            6
            1 2 2 3
            2 2 3 4
            3 1 5
            4 1 6
            5 1 6
            6 0
            """,
        expected: """
            1 1 12
            2 2 11
            3 3 8
            4 9 10
            5 4 7
            6 5 6
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
        for j in input[2...] {
            graph[i][j-1] = 1
        }
    }
    
    var ts = 1
    struct searchResult {
        var startTime: Int
        var endTime: Int? = nil
    }
    
    var searchResults = [Int:searchResult]()
    
    func depthFirstSearch(i: Int) {
        if searchResults[i] == nil {
            searchResults[i] = searchResult(startTime: ts)
            ts += 1
        }
                
        guard searchResults[i]!.endTime == nil else {
            return
        }
        
        for j in 0..<n {
            guard graph[i-1][j] == 1 else {
                continue
            }
            depthFirstSearch(i: j+1)
        }
        
        searchResults[i]?.endTime = ts
        ts += 1
    }
    
    depthFirstSearch(i: 1)
    
    for sr in searchResults.sorted(by: { $0.key < $1.key }) {
        print(sr.key, sr.value.startTime, sr.value.endTime!)
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
