// Book: ALDS1_5_C: Koch Curve
// 2021-11-13 08:46:02

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            1
            """,
        expected: """
            0.00000000 0.00000000
            33.33333333 0.00000000
            50.00000000 28.86751346
            66.66666667 0.00000000
            100.00000000 0.00000000
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // this needs to be in run() to get the overwritten readLine()
    func myDebugPrint (_ s: Any... ) { if DEBUG { Swift.print(s.map({"\($0)"}).joined(separator: " ")) } }
    func readString () -> String { readLine()! }
    func readSubsequence () -> [String.SubSequence] { readString().split(separator: " ")}
    func readChars () -> [Character] {readString().map({$0})}
    func readStrings () -> [String] { readSubsequence().map({String($0)}) }
    func readInt() -> Int { Int(readString())! }
    func readInts() -> [Int] { readSubsequence().map{Int($0)!} }
    func readTwoInts() -> (Int, Int) {
        let ints = readInts()
        return (ints[0], ints[1])
    }
    func readThreeInts() -> (Int, Int, Int) {
        let ints = readInts()
        return (ints[0], ints[1], ints[2])
    }
    // =====================
    // actual code goes here
    // =====================
    
    let n = readInt()
    
    var points: [(Double, Double)] = [(0, 0), (100, 0)]
    
    func koch(points given: [(x: Double, y: Double)]) -> [(Double, Double)]{
        var new = [given[0]]
        for i in 1..<given.count {
            let start = given[i-1]
            let end = given[i]
            let vector = (x: (end.x - start.x) / 3, y: (end.y - start.y) / 3)
            let first = (start.x + vector.x, start.y + vector.y)
            let second = (start.x + vector.x * 2, start.y + vector.y * 2)
            
            let pi = Double.pi
            
            let midX = vector.x * cos(pi / 3) - vector.y * sin(pi/3) + first.0
            let midY = vector.x * sin(pi / 3) + vector.y * cos(pi/3) + first.1
            
            new.append(first)
            new.append((midX, midY))
            new.append(second)
            new.append(end)
        }
        return new
    }
    
    for _ in 0..<n {
        points = koch(points: points)
    }
    
    // output formatter
    
    func outputPoint(point: (Double, Double)) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 8
        formatter.maximumFractionDigits = 8
        
        let outputX = formatter.string(from: point.0 as NSNumber)!
        let outputY = formatter.string(from: point.1 as NSNumber)!
        return "\(outputX) \(outputY)"
        
    }
    
    for point in points {
        print(outputPoint(point: point))
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

