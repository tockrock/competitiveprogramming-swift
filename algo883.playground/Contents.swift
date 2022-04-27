// https://algo-method.com/tasks/883
// 2022-04-27 08:55:07

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            (1+2)*(3-4)
            7
            1 2 + 3 4 - *
            """,
        expected: """
            (1+2)*(3-4)=-3
            """)),
    ("2", Example(
        input: """
            14+3*(10-9)-2*5
            11
            14 3 10 9 - * + 2 5 * -
            """,
        expected: """
            14+3*(10-9)-2*5=7
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
    
    // let mod = 1000000007
    // let mod = 998244353
    
    enum Command: String {
        case add = "+"
        case sub = "-"
        case multi = "*"
    }
    
    let X = readLine()!
    let _ = readLine()
    
    let input = readLine()!.split(separator: " ").map { String($0) }
    
    var stack = [Int]()
    
    for next in input {
        switch Command(rawValue: next) {
        case .add:
            stack.append(stack.popLast()! + stack.popLast()!)
        case .sub:
            stack.append(-(stack.popLast()! - stack.popLast()!))
        case .multi:
            stack.append(stack.popLast()! * stack.popLast()!)
        default:
            stack.append(Int(next)!)
        }
    }
    
    print("\(X)=\(stack.last!)")
    
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

