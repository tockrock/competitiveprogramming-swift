// https://algo-method.com/tasks/892
// 2022-05-05 07:22:56

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            5 6
            G...#.
            .##.#.
            #.#..#
            ....#.
            S.#.##
            """,
        expected: """
            10
            """)),
    ("2", Example(
        input: """
            3 3
            ##G
            ##.
            S.#
            """,
        expected: """
            -1
            """)),
    ("3", Example(
        input: """
            5 6
            G...#.
            .##.#.
            #.#..#
            ....#.
            SG#.##
            """,
        expected: """
            1
            """)),
    ("4", Example(
        input: """
            5 6
            G...#.
            .##.#.
            #.#..#
            .G..#.
            S.#.##
            """,
        expected: """
            2
            """)),
    ("5", Example(
        input: """
            5 6
            G...#.
            .##.#.
            #.#..#
            ..G.#.
            S.#.##
            """,
        expected: """
            3
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
    
    struct Maze {
        private enum CellStatus {
            case wall
            case unTravelled
            case travelled
            case goal
        }
        
        private struct CellPosition {
            let h: Int
            let w: Int
        }
        
        private let H: Int
        private let W: Int
        
        init(H: Int, W: Int) {
            self.H = H
            self.W = W
        }

        private var mazeMap = [[CellStatus]]()
        private var nextSteps = [CellPosition]()

        mutating func addMapLine(line: String) {
            var mazeLine = [CellStatus]()
            for cell in line {
                switch cell {
                case "#":
                    mazeLine.append(.wall)
                case "G":
                    mazeLine.append(.goal)
                case "S":
                    nextSteps.append(CellPosition(h: mazeMap.count, w: mazeLine.count))
                    mazeLine.append(.travelled)
                default:
                    mazeLine.append(.unTravelled)
                }
            }
            mazeMap.append(mazeLine)
        }
        
        mutating func solve() -> Int {
            var nextDistance = 1
            while !nextSteps.isEmpty {
                var newSteps = [CellPosition]()
                for cell in nextSteps {
                    for (dH, dW) in [(1, 0), (0, 1), (-1, 0), (0, -1)] {
                        let nextH = cell.h + dH
                        let nextW = cell.w + dW
                        
                        guard 0 <= nextH && nextH < H else { continue }
                        guard 0 <= nextW && nextW < W else { continue }
                        
                        let cellStatus = mazeMap[nextH][nextW]
                        switch cellStatus {
                        case .wall, .travelled:
                            continue
                        case .goal:
                            return nextDistance
                        case .unTravelled:
                            mazeMap[nextH][nextW] = .travelled
                            newSteps.append(CellPosition(h: nextH, w: nextW))
                        }
                    }
                }
                nextSteps = newSteps
                nextDistance += 1
            }
            return -1
        }
    }
    
    let HW = readLine()!.split(separator: " ").map {Int(String($0))!}
    let H = HW[0]
    let W = HW[1]
    
    var maze = Maze(H: H, W: W)
    
    for _ in 0..<H {
        maze.addMapLine(line: readLine()!)
    }
    
    print(maze.solve())
    
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
