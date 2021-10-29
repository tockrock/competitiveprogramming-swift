// https://atcoder.jp/contests/abc201/tasks/abc201_b
// 2021-10-29 10:43:28

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            3
            Everest 8849
            K2 8611
            Kangchenjunga 8586
            """,
        expected: """
            K2
            """)),
    ("2", Example(
        input: """
            4
            Kita 3193
            Aino 3189
            Fuji 3776
            Okuhotaka 3190
            """,
        expected: """
            Kita
            """)),
    ("3", Example(
        input: """
            4
            QCFium 2846
            chokudai 2992
            kyoprofriends 2432
            penguinman 2390
            """,
        expected: """
            QCFium
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // actual code goes here
    func readSubsequence () -> [String.SubSequence] { readLine()!.split(separator: " ")}
    func readStrings () -> [String] { readSubsequence().map({String($0)}) }
    func readInts() -> [Int] { readSubsequence().map{Int($0)!} }
    func readInt() -> Int { Int(readLine()!)! }
    func readTwoInts() -> (a: Int, b: Int) {
        let ints = readInts()
        return (a: ints[0], b: ints[1])
    }
    func readThreeInts() -> (a: Int, b: Int, c: Int) {
        let ints = readInts()
        return (a: ints[0], b: ints[1], c: ints[2])
    }
    
    struct Mountain {
        let name: String
        let hight: Int
    }
    
    let N = readInt()
    var mountains = [Mountain]()
    
    for _ in 0..<N {
        let entry = readStrings()
        let hight = Int(entry[1])!
        mountains.append(Mountain(name: entry[0], hight: hight))
    }
    
    mountains.sort(by: {$0.hight > $1.hight})
    
    print(mountains[1].name)
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

