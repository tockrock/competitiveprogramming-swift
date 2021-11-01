// https://atcoder.jp/contests/abc225/tasks/abc225_c
// 2021-10-30 21:22:56

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            2 3
            1 2 3
            8 9 10
            """,
        expected: """
            Yes
            """)),
    ("2", Example(
        input: """
            1 1
            1
            """,
        expected: """
            Yes
            """)),
    ("2-2", Example(
        input: """
            2 1
            1
            2
            """,
        expected: """
            No
            """)),
    ("2-3", Example(
        input: """
            1 2
            7 8
            """,
        expected: """
            No
            """)),
    ("3", Example(
        input: """
            10 4
            1346 1347 1348 1349
            1353 1354 1355 1356
            1360 1361 1362 1363
            1367 1368 1369 1370
            1374 1375 1376 1377
            1381 1382 1383 1384
            1388 1389 1390 1391
            1395 1396 1397 1398
            1402 1403 1404 1405
            1409 1410 1411 1412
            """,
        expected: """
            Yes
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // actual code goes here
    func readSubsequence () -> [String.SubSequence] { readLine()!.split(separator: " ")}
    func readStrings () -> [String] { readSubsequence().map({String($0)}) }
    func readInts() -> [Int] { readSubsequence().map{Int($0)!} }
    func readInt() -> Int { Int(readLine()!)! }
    func readTwoInts() -> (a: Int, b: Int) {
        let ints = readInts()
        return (a: ints[0], b: ints[1])
    }
    func readThreeInts() -> (a: Int, b: Int, c: Int) {
        let ints = readInts()
        return (a: ints[0], b: ints[1], c: ints[2])
    }
    
    func calendar_validator() -> String {
        var expected = 0
        let (N, M) = readTwoInts()
        
        var expectedLine = readInts()
        expected = expectedLine[0]

        if expected % 7 + M > 8 {
            return "No"
        } else if expected % 7 == 0 && M > 1 {
            return "No"
        }
                        
        for B in expectedLine[1...] {
            expected += 1
            if B != expected {
                return "No"
            }
        }
        if N < 2 {
            return "Yes"
        }
        
        for _ in 1..<N  {
            expectedLine = expectedLine.map { $0 + 7 }
            if expectedLine != readInts() {
                return "No"
            }
        }
        
        return "Yes"
        
    }
    
    print(calendar_validator())
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

