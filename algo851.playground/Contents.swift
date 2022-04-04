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

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
            
    struct FloorMap {
        private var left: [Int]
        private var right: [Int]
        private var instructions: [Character]
        
        init(initialMap rawFloors: String) {
            instructions = Array(rawFloors)
            left = []
            right = []
            (-1..<instructions.count-1).forEach { left.append($0) }
            (1..<instructions.count+1).forEach { right.append($0) }
        }
        
        private mutating func remove(i: Int) {
            right[left[i]] = right[i]
            left[right[i]] = left[i]
        }
        
        mutating func walk(from start: Int) -> Int {
            var duration = 0
            var position = start
            var walkingRight = true
            
            while 0 < position && position < instructions.count - 1 {
                remove(i: position)

                switch instructions[position] {
                case "<":
                    walkingRight = false
                case ">":
                    walkingRight = true
                default:
                    break
                }

                if walkingRight {
                    duration += right[position] - position
                    position = right[position]
                } else {
                    duration += position - left[position]
                    position = left[position]
                }
            }
            
            return duration
        }
        
    }
    
    let input = readLine()!.split(separator: " ")
    
    var floorMap = FloorMap(initialMap: readLine()!)
    
    print(floorMap.walk(from: Int(input[1])!))
    
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

