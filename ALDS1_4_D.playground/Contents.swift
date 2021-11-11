// Book: ALDS1_4_D: Allocation
// 2021-11-11 18:56:32

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            5 3
            8
            1
            7
            3
            9
            """,
        expected: """
            10
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    func myDebugPrint (_ s: Any... ) { if DEBUG { Swift.print(s.map({"\($0)"}).joined(separator: " ")) } }
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
    
    struct myConstant {
        static let maxLoad = 100_000 * 10_000
    }
    
    func loadable(packages w: [Int], truckCount k: Int, maxWeight p: Int) -> Bool {
        var i = 0
        for _ in 0..<k {
            var load = 0
            while w[i] + load <= p {
                load += w[i]
                i += 1
                if i == w.count {
                    return true
                }
            }
        }
        return false
    }
    
    func searchPerfectLoad() -> Int {
        
        let (n, k) = readTwoInts()
        var w = [Int]()
        for _ in 0..<n {
            w.append(readInt())
        }
        
        var left = 0
        var right = myConstant.maxLoad
        
        while right - left > 1 {
            let mid = (left + right) / 2
            if loadable(packages: w, truckCount: k, maxWeight: mid) {
                right = mid
            } else {
                left = mid
            }
        }
        return right
    }
    
    print(searchPerfectLoad())
    
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
