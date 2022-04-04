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
    
    enum Direction: Character {
        case nutural = "."
        case left = "<"
        case right = ">"
    }
    
    struct FloorMap {
        private struct Floor {
            let direction: Direction
            var left: Int?
            var right: Int?
        }
        
        private var floorMap: [Floor]
        init(initialMap rawFloors: [Character]) {
            floorMap = [Floor]()
            floorMap.append(
                Floor(direction: Direction(rawValue: rawFloors.first!)!,
                      left: nil,
                      right: nil))
            
            for pos in 1..<rawFloors.count {
                floorMap.append(
                    Floor(direction: Direction(rawValue: rawFloors[pos])!,
                          left: pos - 1,
                          right: nil))
                floorMap[pos-1].right = pos
            }
        }
        
        private mutating func remove(i: Int) {
            if let left = floorMap[i].left {
                floorMap[left].right = floorMap[i].right
            }
            if let right = floorMap[i].right {
                floorMap[right].left = floorMap[i].left
            }
        }
        
        mutating func walk(from start: Int) -> Int {
            var duration = 0
            var current = start
            var walkingDirection: Direction = .right
            
            while 0 < current && current < floorMap.count - 1 {
                let currentFloor = floorMap[current]
                remove(i: current)
                
                if currentFloor.direction != .nutural {
                    walkingDirection = currentFloor.direction
                }
                
                switch walkingDirection {
                case .nutural:
                    fatalError()
                case .right:
                    duration += currentFloor.right! - current
                    current = currentFloor.right!
                case .left:
                    duration += current - currentFloor.left!
                    current = currentFloor.left!
                }
            }
            
            return duration
        }
        
    }
    
    let (_, K) = readInts().tupled()
    let initialMap = Array(readLine()!)
    
    var floorMap = FloorMap(initialMap: initialMap)
    
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

