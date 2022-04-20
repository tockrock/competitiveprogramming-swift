// https://algo-method.com/tasks/871
// 2022-04-20 08:30:58

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            4 6
            0 3 0
            2 0
            0 3 2
            2 0
            1 3 0
            2 0
            """,
        expected: """
            0
            1
            2
            """)),
    ("2", Example(
        input: """
            5 7
            0 2 4
            0 3 2
            0 3 0
            1 3 2
            0 3 4
            0 3 2
            2 0
            """,
        expected: """
            1
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
    
    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }

    enum Command: Int {
        case follow, unfollow, countSameFollowers
    }
    
    let input = readInts()
    let N = input[0], Q = input[1]
    
    var followersOf = [Set<Int>](repeating: [], count: N)
    var followerSetCount = [Set<Int>: Int]()
    followerSetCount[[]] = N
    
    for _ in 0..<Q {
        let query = readInts()
        let rawCommandValue = query[0]
        switch Command(rawValue: rawCommandValue)! {
        case .follow:
            let x = query[1], y = query[2]
            guard !followersOf[y].contains(x) else { continue }
            followerSetCount[followersOf[y]]! -= 1
            followersOf[y].insert(x)
            followerSetCount[followersOf[y], default: 0] += 1
        case .unfollow:
            let x = query[1], y = query[2]
            guard followersOf[y].contains(x) else { continue }
            followerSetCount[followersOf[y]]! -= 1
            followersOf[y].remove(x)
            followerSetCount[followersOf[y], default: 0] += 1
        case .countSameFollowers:
            let z = query[1]
            print(followerSetCount[followersOf[z]]! - 1)
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
