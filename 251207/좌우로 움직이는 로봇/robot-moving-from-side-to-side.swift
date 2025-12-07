import Foundation

let firstLine = readLine()!
let parts = firstLine.split(separator: " ")
let n = Int(parts[0])!
let m = Int(parts[1])!

var movesA: [(t: Int, d: String)] = []
for _ in 0..<n {
    let line = readLine()!
    let parts = line.split(separator: " ")
    let t = Int(parts[0])!
    let d = String(parts[1])
    movesA.append((t: t, d: d))
}

var movesB: [(t: Int, d: String)] = []
for _ in 0..<m {
    let line = readLine()!
    let parts = line.split(separator: " ")
    let t = Int(parts[0])!
    let d = String(parts[1])
    movesB.append((t: t, d: d))
}


func solution() {
    var answer = 0
    var aMove: [Int] = [0]
    var bMove: [Int] = [0]

    for i in movesA {
        let direction = i.1 == "L" ? -1 : 1

        for j in 0..<i.0 {
            aMove.append(aMove.last! + direction)
        }
    }

    for i in movesB {
        let direction = i.1 == "L" ? -1 : 1

        for j in 0..<i.0 {
            bMove.append(bMove.last! + direction)
        }
    }

    let max = max(aMove.count, bMove.count)

    for i in 1..<max {
        let checkAIndex = min(i, aMove.count-1)
        let aNotMove = i > aMove.count-1
        let checkBIndex = min(i, bMove.count-1)
        let bNotMove = i > bMove.count-1

        if aMove[checkAIndex] == bMove[checkBIndex] {
            if aMove[aNotMove ? checkAIndex : checkAIndex-1] == bMove[bNotMove ? checkBIndex : checkBIndex-1] {
                continue
            } else {
                answer += 1
            }
        }
    }

    print(answer)
}

solution()