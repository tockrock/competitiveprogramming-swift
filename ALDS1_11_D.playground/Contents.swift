// Book: ALDS1_11_D: Connected Components
// https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_11_D&lang=jp
// 2021-12-10 13:49:59

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            10 9
            0 1
            0 2
            3 4
            5 7
            5 6
            6 7
            6 8
            7 8
            8 9
            3
            0 1
            5 9
            1 3
            """,
        expected: """
            yes
            yes
            no
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
    
    let (n, m) = readTwoInts()
    
    var graph = [[Int]](repeating: [Int](), count: n)
    
    for _ in 0..<m {
        let (s, t) = readTwoInts()
        graph[s].append(t)
        graph[t].append(s)
    }
        
    var groupID = [Int?](repeating: nil, count: n)
    
    func breathFirstSearch(start: Int, gID: Int) {
        var stack = graph[start]
        
        while !stack.isEmpty {
            let v = stack.removeFirst()
            guard groupID[v] == nil else {
                continue
            }
            groupID[v] = gID
            stack += graph[v]
        }
    }
    
    var currentGroupID = 0

    for i in 0..<n {
        guard groupID[i] == nil else {
            continue
        }
        
        breathFirstSearch(start: i, gID: currentGroupID)
        currentGroupID += 1
    }
    
    let q = readInt()
    for _ in 0..<q {
        let (s, t) = readTwoInts()
        print(groupID[s] == groupID[t] ? "yes" : "no")
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
