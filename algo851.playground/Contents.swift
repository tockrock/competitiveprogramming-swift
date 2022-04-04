// https://algo-method.com/tasks/851
// 2022-04-04 08:20:47

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            6 2
            .<.><.
            """,
        expected: """
            6
            """)),
    ("2", Example(
        input: """
            10 4
            .>>>.<<<<.
            """,
        expected: """
            36
            """)),
    ("3", Example(
        input: """
            10 9
            .>>>.<<<<.
            """,
        expected: """
            0
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
        
    struct FloorMap {
        private struct Floor {
            var left: Int
            var right: Int
        }
        
        private var floorMap: [Floor]
        private var instructions: [Character]
        
        init(initialMap rawFloors: String) {
            instructions = Array(rawFloors)

            floorMap = [Floor]()
            
            for pos in 0..<instructions.count {
                floorMap.append( Floor(left: pos - 1, right: pos + 1))
            }
        }
        
        private mutating func remove(i: Int) {
            floorMap[floorMap[i].left].right = floorMap[i].right
            floorMap[floorMap[i].right].left = floorMap[i].left
        }
        
        mutating func walk(from start: Int) -> Int {
            var duration = 0
            var position = start
            var walkingRight = true
            
            while 0 < position && position < floorMap.count - 1 {
                let floor = floorMap[position]
                remove(i: position)

                if instructions[position] == "<" { walkingRight = false }
                if instructions[position] == ">" { walkingRight = true }

                if walkingRight {
                    duration += floor.right - position
                    position = floor.right
                } else {
                    duration += position - floor.left
                    position = floor.left
                }
            }
            
            return duration
        }
        
    }
    
    let (_, K) = readInts().tupled()
    
    var floorMap = FloorMap(initialMap: readLine()!)
    
    print(floorMap.walk(from: K))
    
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

