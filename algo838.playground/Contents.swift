// https://algo-method.com/tasks/838
// 2022-03-22 21:56:46

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            3 4
            0 2 1
            1 1
            0 0 1
            1 1
            """,
        expected: """
            2
            0 2
            """)),
    ("2", Example(
        input: """
            4 5
            0 1 2
            0 2 3
            1 1
            0 1 2
            1 2
            """,
        expected: """
            No
            1
            """)),
]

// =================================
// Extentions
// Remember to paste these as well!!
// =================================

extension Array {
    func tupled() -> (Element, Element) { (self[0], self[1]) }
}

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
    
    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }
    
    enum Command: Int {
        case follow, getFollowers
    }
    
    let (N, Q) = readInts().tupled()
    
    var userFollowers = [Set<Int>](repeating: [], count: N)
    
    for _ in 0..<Q {
        let query = readInts()
        switch Command(rawValue: query[0])! {
        case .follow:
            userFollowers[query[2]].insert(query[1])
        case .getFollowers:
            let followers = userFollowers[query[1]]
            if followers.isEmpty {
                print("No")
            } else {
                print(followers.sorted().map {"\($0)"}.joined(separator: " "))
            }
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
