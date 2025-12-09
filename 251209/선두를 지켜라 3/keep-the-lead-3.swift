import Foundation

let firstLine = readLine()!
let firstParts = firstLine.split(separator: " ").map { Int($0)! }
let n = firstParts[0]
let m = firstParts[1]

var aMovements: [(speed: Int, time: Int)] = []
for _ in 0..<n {
    let line = readLine()!
    let parts = line.split(separator: " ").map { Int($0)! }
    aMovements.append((speed: parts[0], time: parts[1]))
}

var bMovements: [(speed: Int, time: Int)] = []
for _ in 0..<m {
    let line = readLine()!
    let parts = line.split(separator: " ").map { Int($0)! }
    bMovements.append((speed: parts[0], time: parts[1]))
}

func solution() {
    var aArr: [Int] = [0]
    var bArr: [Int] = [0]

    for a in aMovements {
        for i in 0..<a.time {
            aArr.append(aArr.last!+a.speed)
        }
    }

    for b in bMovements {
        for i in 0..<b.time {
            bArr.append(bArr.last!+b.speed)
        }
    }

    var answer = 0
    var firstMan = ""

    for i in 1..<aArr.count {
        if aArr[i] == bArr[i] { 
            if firstMan != "AB" {
                answer += 1
                firstMan = "AB"
            }
            continue
            }
        let currentFirst = aArr[i] > bArr[i] ? "A" :"B"

        if firstMan != currentFirst {
            answer += 1
            firstMan = currentFirst
        }
    }

    print(answer)
}

solution()