import Foundation

let nm = readLine()!.split(separator: " ")
let n = Int(nm[0])!
let m = Int(nm[1])!

var map: [[Int?]] = Array(repeating: Array(repeating: nil, count: m), count: n)
var currentLocation = (0,0)
var currentDirection = 0
let dx = [1,0,-1,0]
let dy = [0,1,0,-1]
var currentNum = 1

for i in 0..<n {
    for j in 0..<m {
        map[currentLocation.1][currentLocation.0] = currentNum
        currentNum += 1

        let nextX = currentLocation.0 + dx[currentDirection]
        let nextY = currentLocation.1 + dy[currentDirection]

        if nextX < 0 || nextX >= m || nextY < 0 || nextY >= n || map[nextY][nextX] != nil {
            currentDirection = (currentDirection + 1) % 4
            let changeX = currentLocation.0 + dx[currentDirection]
            let changeY = currentLocation.1 + dy[currentDirection]
            currentLocation = (changeX, changeY)
            continue
        } 

        currentLocation = (nextX, nextY)
    }
}

for i in map {
    print(i.map{String("\($0!)")}.joined(separator: " "))
}