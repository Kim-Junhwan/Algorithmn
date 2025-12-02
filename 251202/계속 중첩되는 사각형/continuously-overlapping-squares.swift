import Foundation

let n = Int(readLine()!)!

var x1 = [Int]()
var y1 = [Int]()
var x2 = [Int]()
var y2 = [Int]()
var offsetX = 1000
var offsetY = 1000
for _ in 0..<n {
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }
    x1.append(numbers[0])
    y1.append(numbers[1])
    x2.append(numbers[2])
    y2.append(numbers[3])

    offsetX = min(offsetX, numbers[0])
    offsetY = min(offsetY, numbers[1])
}

var map: [[Bool]] = Array(repeating: Array(repeating: false, count: 200), count: 200)

for i in 0..<n {
    let curX1 = x1[i]
    let curY1 = y1[i]
    let curX2 = x2[i]
    let curY2 = y2[i]

    let isBlue = i%2 != 0
    
    for y in (curY1-offsetY)..<(curY2-offsetY) {
        for x in (curX1-offsetX)..<(curX2-offsetX) {
            map[y][x] = isBlue
        }
    }
}

print(map.flatMap{$0}.filter{$0}.count)