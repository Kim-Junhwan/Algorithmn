import Foundation

let firstLine = readLine()!
let firstParts = firstLine.split(separator: " ")
let n = Int(firstParts[0])!
let m = Int(firstParts[1])!

var aInstructions = [(direction: String, time: Int)]()
for _ in 0..<n {
    let line = readLine()!
    let parts = line.split(separator: " ")
    let direction = String(parts[0])
    let time = Int(parts[1])!
    aInstructions.append((direction: direction, time: time))
}

var bInstructions = [(direction: String, time: Int)]()
for _ in 0..<m {
    let line = readLine()!
    let parts = line.split(separator: " ")
    let direction = String(parts[0])
    let time = Int(parts[1])!
    bInstructions.append((direction: direction, time: time))
}

var aHistory: [Int] = [0]
var bHistory: [Int] = [0]

var currentA = 0
for a in aInstructions {
    let direction = a.direction == "L" ? -1 : 1
    for i in 1...a.time {
        currentA += direction
        aHistory.append(currentA)
    }
}

var currentB = 0
for b in bInstructions {
    let direction = b.direction == "L" ? -1 : 1
    for i in 1...b.time {
        currentB += direction
        bHistory.append(currentB)
    }
}

func solution() {
for i in 1..<aHistory.count {
    if aHistory[i] == bHistory[i] {
        print(i)
        return
    }
}
print(-1)
}

solution()