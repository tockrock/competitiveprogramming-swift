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
    
    func minimizedVector(v: Vector) -> Vector {
        let vx = v.vx
        let vy = v.vy
        
        if vx == 0 { return Vector(vx: 0, vy: 1) }
        if vy == 0 { return Vector(vx: 1, vy: 0) }
        
        if vy % vx == 0 { return Vector(vx: 1, vy: vy/vx) }
        if vx % vy == 0 { return Vector(vx: vx/vy, vy: 1) }
        
        let possible = [abs(vx), abs(vy), abs(vy-vx)].min()!
        if possible < 2 {
            return Vector(vx: vx, vy: vy)
        }
        for i in 2...possible {
            let divider = possible - i + 2
            if abs(vx) % divider == 0 && abs(vy) % divider == 0 {
                return Vector(vx: vx/divider, vy:vy/divider)
            }
        }
        return Vector(vx: vx, vy: vy)
    }
    
    struct Vector: Hashable, CustomStringConvertible {
        var description: String {
            return "(vx: \(vx), vy: \(vy))"
        }
        
        let vx: Int
        let vy: Int
    }
    
    func getVector(i: Point, j: Point) -> Vector {
        let vx = j.x - i.x
        let vy = j.y - i.y
        
        if vx < 0 { return Vector(vx: -vx, vy: -vy)}
        if vx == 0 { return Vector(vx: 0, vy: abs(vy))}
        return Vector (vx: vx, vy: vy)
    }
    
    func checkVector(v: Vector, vectors: inout Set<Vector>) {
        for known in vectors {
            if known.vx == 0 {
                if v.vx != 0 { continue }
                return
            }
            if known.vy == 0 {
                if v.vy != 0 { continue }
                return
            }
            
            if v.vx % known.vx != 0 { continue }
            if v.vy % known.vy != 0 { continue }

            if v.vx / known.vx == v.vy / known.vy { return }
        }
        vectors.insert(minimizedVector(v: v))
    }
    
    var vectors = Set<Vector>()
    
    
    for i in 0..<n-1 {
        for j in i+1..<n {
            myDebugPrint(points[i], points[j])
            let vector = getVector(i: points[i], j: points[j])
            checkVector(v: vector, vectors: &vectors)
            myDebugPrint(vectors)
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
