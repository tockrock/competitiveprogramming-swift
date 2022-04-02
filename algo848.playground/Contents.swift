// https://algo-method.com/tasks/848
// 2022-04-01 08:44:57

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            5 5
            0 3 4
            0 4 0
            1 4
            1 2
            0 1 4
            """,
        expected: """
            2
            """)),
]

// =================================
// Extensions
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

    struct ConnectedBlocks {
        private struct Block {
            var previous: Int?
            var next: Int?
        }
        
        private var blocks: [Block]
        
        init(_ N: Int) {
            blocks = [Block](repeating: Block(), count: N)
        }
        
        mutating func connect(p: Int, q: Int) {
            guard blocks[p].next == nil && blocks[q].previous == nil else {
                return
            }
            
            blocks[p].next = q
            blocks[q].previous = p
        }
        
        mutating func contract(r: Int) {
            if let p = blocks[r].previous {
                blocks[p].next = blocks[r].next
            }
            if let q = blocks[r].next {
                blocks[q].previous = blocks[r].previous
            }
            blocks[r].next = nil
            blocks[r].previous = nil
        }
        
        func connectionCount(with start: Int) -> Int {
            var count = 1
            
            var new = blocks[start].next
            while let next = new {
                count += 1
                new = blocks[next].next
                guard new == start else { return count }
            }
            
            new = blocks[start].previous
            while let previous = new {
                count += 1
                new = blocks[previous].previous
            }
            
            return count
        }
    }
    
    enum Command: Int {
        case connect
        case contract
    }
    
    let (N, Q) = readInts().tupled()
    
    var connectedBlocks = ConnectedBlocks(N)
    for _ in 0..<Q {
        let query = readInts()
        switch Command(rawValue: query[0])! {
        case .connect:
            connectedBlocks.connect(p: query[1], q: query[2])
        case .contract:
            connectedBlocks.contract(r: query[1])
        }
    }
    
    print(connectedBlocks.connectionCount(with: 0))
    
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

