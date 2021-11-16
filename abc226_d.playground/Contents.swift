// https://atcoder.jp/contests/abc226/tasks/abc226_d
// 2021-11-16 13:08:54

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            3
            1 2
            3 6
            7 4
            """,
        expected: """
            6
            """)),
    ("2", Example(
        input: """
            3
            1 2
            2 2
            4 2
            """,
        expected: """
            2
            """)),
    ("3", Example(
        input: """
            4
            0 0
            0 1000000000
            1000000000 0
            1000000000 1000000000
            """,
        expected: """
            8
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
    
    struct Point {
        let x: Int
        let y: Int
    }
    let n = readInt()
    var points = [Point]()
    for _ in 0..<n {
        let (x, y) = readTwoInts()
        points.append(Point(x: x, y: y))
    }
    
    func gcd(a: Int, b: Int) -> Int {
        if b == 0 { return a }
        return gcd(a: b, b: a%b)
    }
    
    func minimizedVector(v: Vector) -> Vector {
        let vx = v.vx
        let vy = v.vy
        
        let common = gcd(a: max(vx, vy), b: min(vx, vy))

        return Vector(vx: vx/common, vy: vy/common)
        
    }
    
    struct Vector: Hashable {
        let vx: Int
        let vy: Int
    }
    
    func getVector(i: Point, j: Point) -> Vector {
        let vx = j.x - i.x
        let vy = j.y - i.y
        
        if vx < 0 { return Vector(vx: -vx, vy: -vy)}
        if vx == 0 { return Vector(vx: 0, vy: abs(vy))}
        return Vector(vx: vx, vy: vy)
    }
    
    var vectors = Set<Vector>()
    
    for i in 0..<n-1 {
        for j in i+1..<n {
            let vector = getVector(i: points[i], j: points[j])
            vectors.insert(minimizedVector(v: vector))
        }
    }
    
    print(vectors.count * 2)
    
    
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
