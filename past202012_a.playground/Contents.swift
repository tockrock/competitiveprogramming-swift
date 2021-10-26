// https://atcoder.jp/contests/past202012-open/tasks/past202012_a

import Foundation

let inputSample = ["xooox", "xxxxx", "xoxxo"]

func getInput() -> String {
    guard let input: String = readLine() else {
        return inputSample[Int.random(in: 0 ..< inputSample.count)]
    }
    return input
}

func main() {
    let input = getInput()
    
    switch true {
    case input.contains("xxx"):
        print("x")
    case input.contains("ooo"):
        print("o")
    default:
        print("draw")
    }
}

main()

