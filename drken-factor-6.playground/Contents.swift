// https://qiita.com/drken/items/a14e9af0ca2d857dad23#問題-4-素因数分解
// 2021-11-17 13:36:36

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            12
            """,
        expected: """
            4
            """)),
//    ("2", Example(
//        input: """
//            """,
//        expected: """
//            """)),
//    ("3", Example(
//        input: """
//            """,
//        expected: """
//            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // this needs to be in run() to get the overwritten readLine()
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
    func gcd(_ a: Int, _ b: Int) -> Int {
        if b == 0 { return a }
        return gcd(b, a%b)
    }
    
    // =====================
    // actual code goes here
    // =====================
    
    let n = readInt()
    func getFactorDict(_ numb: Int) -> [Int: Int] {
        var factorDict = [Int: Int]()
        
        var n = numb
        
        var i = 2
        
        while i*i <= numb && i <= n {
            var count = 0
            while n % i == 0 {
                n /= i
                count += 1
            }
            if count > 0 {
                factorDict[i] = count
            }
            i += 1
        }
        
        return factorDict
    }
    
    let factorDict = getFactorDict(n)

    myDebugPrint(factorDict)
    
    print(factorDict.reduce(n, {$0 * ($1.key - 1) / $1.key}))
    
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
