// https://algo-method.com/tasks/845
// 2022-03-29 09:35:02

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            6
            0 red
            1
            1
            0 orange
            0 blue
            1
            """,
        expected: """
            red
            Error
            blue
            """)),
]

// =================================
// Extentions
// Remember to paste these as well!!
// =================================

myDebugPrint("foo")

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
    
    myDebugPrint("bar")

    func readStrings() -> [String] { readLine()!.split(separator: " ").map(String.init) }

    enum Command: String {
        case pushHead = "0"
        case popHead = "1"
    }

    enum List<Element>: ExpressibleByNilLiteral {
        case none
        indirect case some(Element, next: List<Element>)
        
        mutating func prepend(_ element: Element) {
            Swift.print(element, type(of: element), type(of: self), self)
            self = .some(element, next: self)
        }
        
//        mutating func pushHead(_ element: Element) {
//            Swift.print("hello")
//            self = .some(element, next: self)
//            Swift.print("Goodbye")
//        }
//
//        func popHead() -> Element? {
//            guard case .some(let element, next: _) = self else { return nil }
//            return element
//        }
        
//        func makeIterator() -> List<Element> { self }
//        mutating func next() -> Element? {
//            guard case .some(let element, next: let next) = self else { return nil }
//            self = next
//            return element
//        }
//
        init(nilLiteral: ()) { self = .none }
    }
//
    var stack: List<String> = .none
//
    let Q = Int(readLine()!)!

    myDebugPrint(Q)

    for _ in 0..<Q {
        let query = readStrings()
        myDebugPrint(query)
        switch Command(rawValue: query[0])! {
        case .pushHead:
            stack.prepend(query[1])
            print("pushHead")
        case .popHead:
            guard case .some(let element, next: let next) = stack else {
                print("Error")
                continue
            }
            print(element)
            stack = next
        }
        myDebugPrint(stack)
    }
    
    print("foo")
    
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

