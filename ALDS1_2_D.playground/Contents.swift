// Book: ALDS1_2_D: Shell Sort
// 2021-11-10 14:15:04

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            5
            5
            1
            4
            3
            2
            """,
        expected: """
            2
            4 1
            3
            1
            2
            3
            4
            5
            """)),
    ("2", Example(
        input: """
            10
            4
            8
            9
            1
            10
            6
            2
            5
            3
            7
            """,
        expected: """
            3
            4 3 1
            foo
            1
            2
            3
            4
            5
            6
            7
            8
            9
            10
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    func myDebugPrint (_ s: Any... ) { if DEBUG { Swift.print(s.map({"\($0)"}).joined(separator: " ")) } }
    func readString () -> String { readLine()! }
    func readSubsequence () -> [String.SubSequence] { readString().split(separator: " ")}
    func readCharStrings () -> [String] {readString().map({String($0)})}
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
    
    let g = [4, 3, 1]
    
    func insertionSort(a: [Int], n: Int, g: Int) -> (Int, [Int]) {
        myDebugPrint("g: \(g)")
        var count = 0
        var working = a
        
        for i in g...n-1 {
            let v = working[i]
            var j = i - g
            myDebugPrint(v, working)
            while j>=0 && working[j] > v {
                working[j+g] = working[j]
                j = j - g
                count += 1
                myDebugPrint(v, working, count)
            }
            working[j+g] = v
            myDebugPrint(v, working)

        }
        
        return (count, working)
    }
    
    let n = readInt()
    var a = [Int]()
    var sum = 0
    for _ in 0..<n {
        a.append(readInt())
    }
    
    for i in g {
        let count: Int
        (count, a) = insertionSort(a: a, n: n, g: i)
        sum += count
    }
    
    print(g.count)
    print(g[0], g[1])
    print(sum)
    for i in a {
        print(i)
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
