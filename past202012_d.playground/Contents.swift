// https://atcoder.jp/contests/past202012-open/tasks/past202012_d

import Foundation

func sortCondition(_ first: String, _ second: String) -> Bool {
    // We don't know the number of digits, and may not fit in a numerical type
    // There for it's easier to do things as a string
    
    // get the number without the leading zero
    let firstCore = first.drop { $0 == "0" }
    let secondCore = second.drop { $0 == "0" }
    
    // simple detection by number of digits
    if firstCore.count != secondCore.count {
        return firstCore.count < secondCore.count
    }
    
    // the number of digits are the same, strings are comparable
    if firstCore != secondCore {
        return firstCore < secondCore
    }
    
    // the strings of the cores are the same, so we look at the number of leading zeros
    return first.count > second.count
}

var inputArray: [String] = []

while true {
    guard let input: String = readLine() else {
        break
    }
    inputArray.append(input)
}

let outputArray = inputArray[1...].sorted(by: {sortCondition($0, $1)})
print(outputArray.joined(separator: "\n"))
