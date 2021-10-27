// https://atcoder.jp/contests/past202012-open/tasks/past202012_e

import Foundation

let sampleInput = """
3 3
...
.#.
..#
#.#
###
...
"""
var workingInput = sampleInput.split(separator: "\n")
var standardIO: Bool?

func myReadLine() -> String? {
    if standardIO == nil or standardIO! = true {
        let input = readLine()
        if input != nil {
            standardIO = true
            return input
        }
    }
    let input = readLine()
    if input != nil {
        
    }
}

extension workingInput {
    func popFirst() -> Element {
        
    }
}

let definitionRaw = readLine()
let definition = definitionRaw != nil ? definitionRaw! : String(workingInput.first!)
workingInput.dropFirst()

let definitionArray = definition.split(separator: " ")
let h = definitionArray[0]
let w = definitionArray[1]

