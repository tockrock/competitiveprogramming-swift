// Book: ALDS1_12_A: Minimum Spanning Tree
// https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_12_A&lang=jp
// 2021-12-11 08:06:33

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
            -1 2 3 1 -1
            2 -1 -1 4 -1
            3 -1 -1 1 1
            1 4 1 -1 3
            -1 -1 1 3 -1
            """,
        expected: """
            5
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
    var graph = [[Int]]()
    for _ in 0..<n {
        graph.append(readInts().map({ $0 < 0 ? Int.max : $0}))
    }
    
    
    func prim() -> Int {
        var color = [Bool](repeating: false, count: n)
        var d = [Int](repeating: Int.max, count: n)
        
        d[0] = 0
        var u = -1
        var mincost = 0
        
        while true {
            // determine the cheapest point that's connectable
            mincost = Int.max
            for i in 0..<n {
                guard color[i] == false else {
                    continue
                }
                guard d[i] < mincost else {
                    continue
                }
                mincost = d[i]
                u = i
            }
            
            // no new point to process!
            guard mincost != Int.max else {
                break
            }

            color[u] = true
            
            // Find if the new point would reduce the cost to another undecided point
            for v in 0..<n {
                guard color[v] == false else {
                    continue
                }
                guard graph[u][v] < d[v] else {
                    continue
                }
                
                d[v] = graph[u][v]
            }
        }
        return d.reduce(0, +)
    }
    
    print(prim())
    
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
