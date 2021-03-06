// Book: ALDS1_4_C: Dictionary
// 2021-11-11 18:21:58

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            6
            insert AAA
            insert AAC
            find AAA
            find CCC
            insert CCC
            find CCC
            """,
        expected: """
            yes
            no
            yes
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
    
    func getChar(ch: Character) -> Int {
        switch(ch) {
        case "A":
            return 1
        case "C":
            return 2
        case "G":
            return 3
        case "T":
            return 4
        default:
            return 0
        }
    }
    
    func getKey(str: [Character]) -> Int {
        var sum = 0
        var p = 1
        for s in str {
            sum += p * (getChar(ch: s))
            p *= 5
        }
        return sum
        
    }
    
    func h1(key: Int) -> Int {
        return key % 1046527
    }
    func h2(key: Int) -> Int {
        return 1 + (key % (1046527 - 1))
    }
    
    func find(str: [Character]) -> Int {
        let key = getKey(str: str)
        var i = 0
        while true {
            let h = (h1(key: key) + i * h2(key: key)) % 1046527
            
            
        }
        
        return 0
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
