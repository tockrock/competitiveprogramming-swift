// https://atcoder.jp/contests/abs/tasks/abc081_b
// 2021-10-28

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            3
            8 12 40
            """,
        expected: """
            2
            """)),
    ("2", Example(
        input: """
            4
            5 6 8 10
            """,
        expected: """
            0
            """)),
    ("3", Example(
        input: """
            6
            382253568 723152896 37802240 379425024 404894720 471526144
            """,
        expected: """
            8
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // actual code goes here
    func readInts() -> [Double] { readLine()!.split(separator: " ").map{Double($0)!} }
    func readInt() -> Double { Double(readLine()!)! }
    
    let _ = readInt()
    let originalArray = readInts()

    var success = 0
    var multiplier = 2.0
    

    while !originalArray
            .map({$0.truncatingRemainder(dividingBy: multiplier)})
            .map({$0 == 0.0})
            .contains(false) {
        success += 1
        multiplier *= 2
    }
    
    print(success)

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
            while !outputLines .isEmpty && !expectedLines.isEmpty {
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
