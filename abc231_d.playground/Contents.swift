// https://atcoder.jp/contests/abc231/tasks/abc231_d
// 2021-12-11 21:39:47

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            4 2
            1 3
            2 3
            """,
        expected: """
            Yes
            """)),
    ("2", Example(
        input: """
            4 3
            1 4
            2 4
            3 4
            """,
        expected: """
            No
            """)),
    ("3", Example(
        input: """
            4 3
            1 4
            2 4
            1 2
            """,
        expected: """
            No
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
    
    var graph = [[Int]](repeating: [Int](), count: n+1)
    
    for _ in 0..<m {
        let (a, b) = readTwoInts()
        graph[a].append(b)
        graph[b].append(a)
    }
    
    var doable = true
    
    var grouped = [Bool](repeating: false, count: n+1)
    overall: for i in 1...n where graph[i].count > 0 {
        guard !grouped[i] else {
            continue
        }
        
        guard graph[i].count < 3 else {
            doable = false
            break
        }
        
        guard graph[i].count == 1 else {
            continue
        }
        
        grouped[i] = true
        var u = graph[i][0]
        
        while true {
            grouped[u] = true
            
            let friends = graph[u]
            
            if friends.count == 1 {
                break
            }
            
            let newMember = friends.filter { grouped[$0] == false }
            
            if newMember.isEmpty {
                doable = false
                break overall
            }
            
            u = newMember[0]
        }
    }
    
    for i in 1...n where graph[i].count > 0 && grouped[i] == false {
        doable = false
        break
    }

    print(doable ? "Yes" : "No")
    
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
