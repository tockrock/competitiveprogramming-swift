// https://algo-method.com/tasks/844
// 2022-03-28 09:10:01

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            8
            0 green
            0 orange
            0 red
            1 2
            1 4
            0 blue
            0 yellow
            1 4
            """,
        expected: """
            red orange
            red orange green
            yellow blue red orange
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
    
    enum List<Element>: Sequence, IteratorProtocol, ExpressibleByNilLiteral {
        case none
         indirect case some(_ element: Element, next: List)
        
        mutating func prepend(_ element: Element) {
            self = .some(element, next: self)
        }
        
        func makeIterator() -> List<Element> { self }
        mutating func next() -> Element? {
            guard case .some(let element, let next) = self else { return nil }
            self = next
            return element
        }
        
        init(nilLiteral: ()) { self = .none }
    }
    
    let n: Int = .init(readLine()!)!
    
    var list: List<String> = nil
    for _ in 0 ..< n {
        let q = readLine()!.split(separator: " ").map(String.init)
        if q[0] == "0" {
            list.prepend(q[1])
        } else {
            print(list.prefix(Int(q[1])!).joined(separator: " "))
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
