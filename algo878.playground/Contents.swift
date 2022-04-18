// https://algo-method.com/tasks/878
// 2022-04-17 09:49:24

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            5
            0 algo
            0 aruru
            2 aruru
            1 algo
            2 algo
            """,
        expected: """
            Yes
            No
            """)),
    ("2", Example(
        input: """
            7
            2 abc
            0 abc
            0 dd
            2 abc
            0 xyz
            1 dd
            2 stu
            """,
        expected: """
            No
            Yes
            No
            """)),
]

// =================================
// Extensions
// Remember to paste these as well!!
// =================================

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================

    enum Command: Int {
        case insert
        case delete
        case find
    }
    
    let mod = 1000003
    let asciiZero = Int(Character("a").asciiValue!) - 1
    let base = 27

    func h(_ str: String) -> Int {
        var result = 0
        var digit = 1
        for char in str.reversed() {
            let charValue = Int(char.asciiValue!) - asciiZero
            result += charValue * digit
            digit *= base
        }
        return result % mod
    }
    
    var T = [[String]](repeating: [], count: mod)
    
    let Q = Int(readLine()!)!
    
    for _ in 0..<Q {
        let query = readLine()!.split(separator: " ").map {String($0)}
        let rawCommand = Int(query[0])!
        let x = query[1]
        switch Command(rawValue: rawCommand)! {
        case .insert:
            T[h(x)].append(x)
        case .delete:
            let xIndex = T[h(x)].firstIndex(of: x)!
            T[h(x)].remove(at: xIndex)
        case .find:
            let result = T[h(x)].contains(x)
            print(result ? "Yes" : "No")
        }
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

func myDebugPrint (_ s: Any... ) { Swift.print(s.map {"\($0)"}.joined(separator: " ")) }
