// Book: ALDS1_12_B: Single Source Shortest Path I
// https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_12_B&lang=jp
// 2021-12-17 08:47:24

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            5
            0 3 2 3 3 1 1 2
            1 2 0 2 3 4
            2 3 0 3 3 1 4 1
            3 4 2 1 0 1 1 4 4 3
            4 2 2 1 3 3
            """,
        expected: """
            0 0
            1 2
            2 2
            3 1
            4 3
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
    
    enum State: String, CustomStringConvertible {
        case decided
        case connected
        case untouched
        
        var description: String {
            return self.rawValue
        }
    }
    
    let MAXDISTANCE = 100_000
        
    let n = readInt()
    
    var distance = [Int](repeating: Int.max, count: n)
    var states = [State](repeating: .untouched, count: n)
    
    var graph = [[Int]](repeating: [Int](repeating: MAXDISTANCE, count: n), count: n)
    
    for i in 0..<n {
        let input = readInts()
        assert(i == input[0])
        
        for j in 0..<input[1] {
            graph[i][input[j*2 + 2]] = input[j*2 + 3]
        }
    }
    
    func shortestPath(start: Int) {
        distance[start] = 0
        states[start] = .connected
        var current = start
        
        while true {
            var minCost = Int.max

            for i in 0..<n where states[i] == .connected {
                if distance[i] < minCost {
                    current = i
                    minCost = distance[current]
                }
            }
            
            guard minCost < Int.max else { break }
            
            states[current] = .decided
            
            for next in 0..<n where states[next] != .decided {
                let newDistance = distance[current] + graph[current][next]
                if newDistance < distance[next] {
                    distance[next] = newDistance
                    states[next] = .connected
                }
                
            }
        }
        
    }
    
    shortestPath(start: 0)
    
    for i in 0..<n {
        print(i, distance[i])
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

