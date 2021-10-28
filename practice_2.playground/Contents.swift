// https://atcoder.jp/contests/practice/tasks/practice_2
// 2021-10-29 07:55:19

import Foundation

func readSubsequence () -> [String.SubSequence] { readLine()!.split(separator: " ")}
func readInts() -> [Int] { readSubsequence().map{Int($0)!} }

func readTwoInts() -> (a: Int, b: Int) {
    let ints = readInts()
    return (a: ints[0], b: ints[1])
}

let (N, Q) = readTwoInts()

var list = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map({$0})[0..<5].map({String($0)})
list.sort(by: {
    print("? \($0) \($1)")
    let result = readLine()!
    switch(result) {
    case ">" :
        return $0 > $1
    case "<" :
        return $0 > $1
    default:
        return true
    }
})

print("!", list.joined())
