// https://atcoder.jp/contests/practice/tasks/practice_2
// 2021-10-29 07:55:19

// hand copy of https://qiita.com/conf8o/items/a2e2d8cf38be93eb06a5.md

import Foundation

func lt(_ l: String, _ r: String) -> Bool {
    print("?", l, r)
    fflush(stdout)
    return readLine()! == "<"
}

func mergeSort(_ array: [String]) -> [String] {
    guard array.count > 1 else { return array }
    let mid = array.count / 2
    
    let sortedL = mergeSort(Array(array[..<mid]))
    let sortedR = mergeSort(Array(array[mid...]))
    
    return merge(sortedL, sortedR)
}

func merge(_ sortedL: [String], _ sortedR: [String]) -> [String] {
    var container = [String]()
    var l = 0
    var r = 0
    
    while l < sortedL.count && r < sortedR.count {
        if lt(sortedL[l], sortedR[r]) {
            container.append(sortedL[l])
            l += 1
        } else {
            container.append(sortedR[r])
            r += 1
        }
    }
    
    if l < sortedL.count {
        container += sortedL[l...]
    }
    if r < sortedR.count {
        container += sortedR[r...]
    }
    
    return container
}

func n5() -> [String] {
    var (x1, x2) = ("A", "B")
    if lt(x2, x1) {
        (x1, x2) = (x2, x1)
    }
    
    var (y1, y2) = ("C", "D")
    if lt (y2, y1) {
        (y1, y2) = (y2, y1)
    }
    
    if lt(y1, x1) {
        (x1, x2, y1, y2) = (y1, y2, x1, x2)
    }
    
    var sorted = [x1, y1, y2]
    
    let e = "E"
    var l = -1
    var r = sorted.count
    while r - l > 1 {
        let mid = (r + l) / 2
        if lt(e, sorted[mid]) {
            r = mid
        } else {
            l = mid
        }
    }
    sorted.insert(e, at: r)
    
    l = sorted.firstIndex(of: x1)!
    r = sorted.count
    while r - l > 1 {
        let mid = (r + l) / 2
        if lt(x2, sorted[mid]) {
            r = mid
        } else {
            l = mid
        }
    }
    sorted.insert(x2, at: r)
    
    return sorted
}

func readInt() -> [Int] {
    return readLine()!.split(separator: " ").map({Int($0)!})
}

func main() {
    let line = readInt()
    let N = line[0]
    
    let a = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".prefix(N).map { String($0) }
    
    let sorted = N == 5 ? n5() : mergeSort(a)
    
    print("!", sorted.joined(separator: ""))
}

main()
