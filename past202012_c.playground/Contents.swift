// https://atcoder.jp/contests/past202012-open/tasks/past202012_c
import Foundation

let sampleInput = [(123, "3F"), (2304, "1S0"), (0, "0")]
let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { String($0) }

func decimal36(_ decimal: Int) -> String {
    var result: [String] = []
    var current = decimal
    
    while true {
        let (digit, remainder) = getDigit(current)
        result.append(digit)
        if remainder == 0 {
            break
        }
        current = remainder
    }
    
    return result.reversed().joined(separator: "")
}

func getDigit(_ decimal: Int) -> (String, Int) {
    let digit = decimal % 36
    return (digit36(digit), (decimal - digit) / 36)
}
    
    
func digit36(_ digit: Int) -> String {
    guard digit < 36 else {
        return "more than 36"
    }
    if digit < 10 {
        return String(digit)
    }
    
    return alphabet[digit - 10]
}

func main() {
    let input = readLine()!
    guard let decimal: Int = Int(input) else {
        print("input wasn't an int")
        return
    }
    
    print(decimal36(decimal))
}

main()
