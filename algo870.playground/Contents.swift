// https://algo-method.com/tasks/870
// 2022-04-16 15:45:23

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            3
            algo method olygt
            """,
        expected: """
            2
            """)),
    ("2", Example(
        input: """
            3
            algo method algomethod
            """,
        expected: """
            1
            """)),
    ("3", Example(
        input: """
            8
            aioeta cucjn gee kqym pannx pausx roput yhpa
            """,
        expected: """
            4
            """)),
]

// =================================
// Extensions
// Remember to paste these as well!!
// =================================

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // ====================
    
    let mod = 1000003
    let asciiZero = Int(Character("a").asciiValue!) - 1
    let base = 30
    
    func hashAsInt(_ str: String) -> Int {
        var digit = 1
        var result = 0
        for char in str.reversed() {
            let charInt = Int(char.asciiValue!) - asciiZero
            result += charInt * digit
            digit *= base
        }
        
        return result % mod
    }
    
    let _ = readLine()
    
    let Ss = readLine()!.split(separator: " ").map {String($0)}
    var hashMap = [Int](repeating: 0, count: mod + 1)

    var largest = Int.min
    for S in Ss {
        let hash = hashAsInt(S)
        hashMap[hash] += 1
        largest = max(largest, hashMap[hash])
    }
    
    print(largest)
    
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

func myDebugPrint (_ s: Any... ) { Swift.print(s.map {"\($0)"}.joined(separator: " ")) }

