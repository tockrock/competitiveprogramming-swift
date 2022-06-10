// https://algo-method.com/tasks/949
// 2022-06-10 10:00:48

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            8 12
            0 1
            0 4
            1 3
            1 7
            2 0
            2 4
            3 2
            3 6
            5 3
            5 4
            6 5
            6 7
            """,
        expected: """
            Looped
            0 1 2 3
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================

    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }

    let nm = readInts()
    let n = nm[0], m = nm[1]
    
    var graph = [[Int]](repeating: [], count: n)
    
    for _ in 0..<m {
        let line = readInts()
        graph[line[0]].append(line[1])
    }
    for i in 0..<n {
        graph[i].sort()
    }

    var arrivedCount = [Int](repeating: 0, count: n)
    
    var looped = false

    func rec(_ v: Int) {
        guard !looped else { return }
        guard arrivedCount[v] < 2 else {
            looped = true
            return
        }
        
        arrivedCount[v] += 1
        for v2 in graph[v] {
            rec(v2)
        }
    }
    
    rec(0)
    
    print(looped ? "Looped" : "Not Looped")
    print(arrivedCount.enumerated().filter({ (key, value) in
        value > 0
    }).map({$0.offset.description}).joined(separator: " "))
    
    // ===============
    // actual code end
    // ===============
}

// =================================
// Extensions
// Remember to paste these as well!!
// =================================



// ====================
// Extensions Ends Here
// ====================

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
