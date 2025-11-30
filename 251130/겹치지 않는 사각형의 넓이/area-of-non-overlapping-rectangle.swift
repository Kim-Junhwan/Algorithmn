import Foundation

let rectAInput = readLine()!.split(separator: " ").map { Int($0)! }
let rectBInput = readLine()!.split(separator: " ").map { Int($0)! }
let rectMInput = readLine()!.split(separator: " ").map { Int($0)! }

let aX1 = rectAInput[0], aY1 = rectAInput[1], aX2 = rectAInput[2], aY2 = rectAInput[3]
let bX1 = rectBInput[0], bY1 = rectBInput[1], bX2 = rectBInput[2], bY2 = rectBInput[3]
let mX1 = rectMInput[0], mY1 = rectMInput[1], mX2 = rectMInput[2], mY2 = rectMInput[3]

let minX = min(aX1, bX1)
let minY = min(aY1, bY1)

var map: [[Bool]] = Array(repeating: Array(repeating: false, count: 2000), count: 2000)

for y in abs(minY - aY1) ..< abs(minY - aY2) {
    for x in abs(minX - aX1) ..< abs(minX - aX2) {
        map[y][x] = true
    }
}

for y in abs(minY - bY1) ..< abs(minY - bY2) {
    for x in abs(minX - bX1) ..< abs(minX - bX2) {
        map[y][x] = true
    }
}

for y in abs(minY - mY1) ..< abs(minY - mY2) {
    for x in abs(minX - mX1) ..< abs(minX - mX2) {
        map[y][x] = false
    }
}

print(map.flatMap { $0 }.filter{$0}.count)