// https://algo-method.com/tasks/849
// 2022-04-03 08:57:54

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            5
            2 3 4 0 1
            6
            0 4
            1 2
            1 0
            0 4
            0 3
            0 0
            """,
        expected: """
            3
            Error
            4
            Error
            """)),
    ("2", Example(
        input: """
            6
            5 0 3 2 4 1
            6
            0 1
            0 1
            0 1
            1 0
            0 1
            0 1
            """,
        expected: """
            4
            2
            3
            5
            Error
            """)),
]

// =================================
// Extensions
// Remember to paste these as well!!
// =================================

extension Array {
    func tupled() -> (Element, Element) { (self[0], self[1]) }
 }

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
    
    // let mod = 1000000007
    // let mod = 998244353
    
    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }

    enum Command: Int {
        case overtake
        case dropout
    }
    
    struct Race {
        private struct Runner {
            var ahead: Int?
            var behind: Int?
        }
        
        private var runners: [Runner]
        
        init(_ current: [Int]) {
            runners = [Runner](repeating: Runner(), count: current.count)
            var previous = current.first!
            for runner in current[1...] {
                runners[runner].ahead = previous
                runners[previous].behind = runner
                previous = runner
            }
        }
        
        mutating func overtake(_ overtaker: Int) -> Int? {
            guard let overtaken = runners[overtaker].ahead else { return nil }
            if let ahead = runners[overtaken].ahead {
                runners[ahead].behind = overtaker
            }
            if let behind = runners[overtaker].behind {
                runners[behind].ahead = overtaken
            }
            runners[overtaker].ahead = runners[overtaken].ahead
            runners[overtaken].behind = runners[overtaker].behind

            runners[overtaker].behind = overtaken
            runners[overtaken].ahead = overtaker
            
            return overtaken
        }
        
        mutating func dropout(_ dropout: Int) {
            if let ahead = runners[dropout].ahead {
                runners[ahead].behind = runners[dropout].behind
            }
            if let behind = runners[dropout].behind {
                runners[behind].ahead = runners[dropout].ahead
            }
            runners[dropout].ahead = nil
            runners[dropout].behind = nil
        }
    }
    
    let _ = readLine()
    let A = readInts()
    
    var race = Race(A)
    
    let Q = Int(readLine()!)!
    
    for _ in 0..<Q {
        let (rawCommand, v) = readInts().tupled()
        switch Command(rawValue: rawCommand)! {
        case .overtake:
            print(race.overtake(v) ?? "Error")
        case .dropout:
            race.dropout(v)
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
