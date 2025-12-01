import Foundation

let rect1Input = readLine()!.split(separator: " ").map { Int(String($0))! }
let rect2Input = readLine()!.split(separator: " ").map { Int(String($0))! }

let rect1X1 = rect1Input[0]
let rect1Y1 = rect1Input[1]
let rect1X2 = rect1Input[2]
let rect1Y2 = rect1Input[3]

let rect2X1 = rect2Input[0]
let rect2Y1 = rect2Input[1]
let rect2X2 = rect2Input[2]
let rect2Y2 = rect2Input[3]
let offsetX = min(rect1X1, rect2X1)
let offsetY = min(rect1Y1, rect2Y1)

var map: [[Bool]] = Array(repeating: Array(repeating: false, count: 2000), count: 2000)
for i in (rect1Y1-offsetY)..<(rect1Y2-offsetY) {
    for j in (rect1X1-offsetX)..<(rect1X2-offsetX) {
        map[i][j] = true
    }
}

for i in (rect2Y1-offsetY)..<(rect2Y2-offsetY) {
    for j in (rect2X1-offsetX)..<(rect2X2-offsetX) {
        map[i][j] = false
    }
}

var minX = Int.max
var maxX = -Int.max
var minY = Int.max
var maxY = -Int.max

for i in (rect1Y1-offsetY)..<(rect1Y2-offsetY) {
    for j in (rect1X1-offsetX)..<(rect1X2-offsetX) {
        if map[i][j] {
            minX = min(minX, j)
            maxX = max(maxX, j)
            minY = min(minY, i)
            maxY = max(maxY, i)
        }
    }
}
if map.flatMap{$0}.filter{$0}.count > 0 {
    print((maxX-minX+1) * (maxY-minY+1))
} else {
    print("0")
}