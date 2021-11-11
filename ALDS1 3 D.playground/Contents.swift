// ALDS1_3_D: Areas on the Cross-Section Diagram
// 2021-11-11 09:31:34

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: #"""
            \\///\_/\/\\\\/_/\\///__\\\_\\/_\/_/\
            """#,
        expected: """
            35
            5 4 2 1 19 9
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
    
    let input = readChars()
    myDebugPrint(input)
    var stack = [Int]()
    var area = [(Int, Int)]()
    var sum = 0
    for i in 0..<input.count {
        let ch = input[i]
        if ch == "\\" {
            stack.append(i)
        } else if ch == "/" && stack.count > 0 {
            let j = stack.removeLast()
            var a = i - j
            sum += a
            while area.count > 0 && area.last!.0 > j {
                a += area.removeLast().1
            }
            area.append((j, a))
        }
    }
    
    var ans = [Int]()
    ans += area.map({$0.1})
    print(sum)
    print(ans.count, ans)
    
    
    print("foo")
    
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
