import Foundation

let firstLine = readLine()!
let firstParts = firstLine.split(separator: " ").map { Int(String($0))! }
let n = firstParts[0]
let m = firstParts[1]

var aMoves: [(v: Int, t: Int)] = []
for _ in 0..<n {
    let parts = readLine()!.split(separator: " ").map { Int(String($0))! }
    aMoves.append((v: parts[0], t: parts[1]))
}

var bMoves: [(v: Int, t: Int)] = []
for _ in 0..<m {
    let parts = readLine()!.split(separator: " ").map { Int(String($0))! }
    bMoves.append((v: parts[0], t: parts[1]))
}

var a: [Int] = [0]
var b: [Int] = [0]

for i in aMoves {
    for _ in 0..<i.1 {
        a.append(a.last! + i.0)
    }
}

for i in bMoves {
    for _ in 0..<i.1 {
        b.append(b.last! + i.0)
    }
}

var currentForward = ""
var answer = 0

for i in 0..<a.count {
    if a[i] == b[i] {
        continue
    }

    let nowForward = a[i] > b[i] ? "A" : "B"
    if currentForward != nowForward {
        answer += 1
        currentForward = nowForward
    }
}

print(answer-1)