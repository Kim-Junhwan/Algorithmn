import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]

let a = readLine()!.split(separator: " ").map { Int($0)! }
let b = readLine()!.split(separator: " ").map { Int($0)! }

var bDict: [Int: Int] = [:]

for i in b {
    if bDict[i] == nil {
        bDict[i] = 1
    } else {
        bDict[i]! += 1
    }
}

var answer = 0

for i in 0..<n-m+1 {
    var aDict: [Int: Int] = [:]
    for j in Array(a[i..<i+m]) {
        if aDict[j] == nil {
            aDict[j] = 1
        } else {
            aDict[j]! += 1
        }
    }

    if aDict == bDict {
        answer += 1
    }
}

print(answer)