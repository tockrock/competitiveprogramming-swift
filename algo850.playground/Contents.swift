// https://algo-method.com/tasks/850
// 2022-04-02 17:06:43

import Foundation

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
            8
            """)),
    ("2", Example(
        input: """
            1
            """,
        expected: """
            1
            """)),
    ("3", Example(
        input: """
            2
            """,
        expected: """
            2
            """)),
    ("4", Example(
        input: """
            1996
            """,
        expected: """
            1944
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
    
    // let mod = 1000000007
    // let mod = 998244353
    
    struct LoopedLink {
        private struct Node {
            var prev: Int
            var next: Int
        }
        
        private var loop: [Node]
        
        init(N: Int) {
            loop = [Node]()
            for i in 0..<N {
                loop.append(Node(prev: i-1, next: i+1))
            }
            loop[0].prev = N-1
            loop[N-1].next = 0
        }
        
        func next(_ i: Int) -> Int {
            return loop[i].next
        }
        
        mutating func disconnect(_ i: Int) -> Int {
            let next = loop[i].next
            let prev = loop[i].prev
            loop[prev].next = next
            loop[next].prev = prev
            return next
        }
    }
    
    let N = Int(readLine()!)!
    var loopedLink = LoopedLink(N: N)
    
    var next = 0
    
    while loopedLink.next(next) != next {
        next = loopedLink.disconnect(next)
        next = loopedLink.next(next)
    }
    
    print(next + 1)
    
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

