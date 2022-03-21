// https://algo-method.com/tasks/834
// 2022-03-20 20:43:10

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            3
            1 4 1
            6
            0 3
            1 5
            2 0
            2 5
            1 9
            2 5
            """,
        expected: """
            3
            Error
            9
            """)),
]

// =================================
// Extentions
// Remember to paste these as well!!
// =================================

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
    
    func readInts() -> [Int] {
        return readLine()!.split(separator: " ").map { Int(String($0))! }
    }
    
    enum Command: Int {
        case pushFront, pushBack, get
    }

    
    let _ = readLine()
    var front = [Int]()
    var back = readInts()
    let Q = Int(readLine()!)!
    for _ in 0..<Q {
        let input = readInts()
        
        switch Command(rawValue: input[0])! {
        case .pushFront:
            front.append(input[1])
        case .pushBack:
            back.append(input[1])
        case .get:
            let frontCount = front.count
            let allCount = frontCount + back.count
            switch input[1] {
            case 0..<frontCount:
                let k = frontCount - 1 - input[1]
                print(front[k])
            case frontCount..<allCount:
                let k = input[1] - frontCount
                print(back[k])
            default:
                print("Error")
            }
        }
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

func myDebugPrint (_ s: Any... ) { Swift.print(s.map {"\($0)"}.joined(separator: " ")) }

