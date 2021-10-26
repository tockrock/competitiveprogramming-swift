// https://atcoder.jp/contests/past202012-open/tasks/past202012_b

import Foundation

func firstInput() -> Int {
    
    guard let inputString: String = readLine() else {
        return 30
    }
    guard let inputInt: Int = Int(inputString) else {
        return 30
    }
    return inputInt
}

func secondInput() -> String {
    guard let input: String = readLine() else {
        return "ryfoxchyvfmsewlwpoyvhdjkbvdjsa"
    }
    return input
}

func main() {
    let _ = firstInput()
    let inputString = secondInput()
    let characterArray = Array(inputString)
    var resultString = ""
    
    for character in characterArray {
        if resultString.contains(character) {
            resultString = resultString.replacingOccurrences(of: String(character), with: "")
        }
        resultString.append(contentsOf: String(character))
            
    }
    
    print(resultString)

}

main()

