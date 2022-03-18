var array = Array(0...5) // [0, 1, 2, 3, 4, 5]

var slice = array[1...3] // [1, 2, 3]
slice.startIndex // 1
slice.endIndex // 4

slice.popFirst()
slice.startIndex // 2

slice.popLast()
slice.endIndex // 3

slice.append(6) // [2, 6]
slice.endIndex // 4
