import Foundation

let firstLine = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = firstLine[0]
let t = firstLine[1]

let secondLine = readLine()!.split(separator: " ")
var r = Int(String(secondLine[0]))!
var c = Int(String(secondLine[1]))!
var d = String(secondLine[2])

var currentLocation = (r-1, c-1)
var currentDirection = 0

if d == "U" {
    currentDirection = 1
} else if d == "D" {
    currentDirection = 3
} else if d == "R" {
    currentDirection = 0
} else {
    currentDirection = 2
}

let dx = [1,0,-1,0]
let dy = [0,1,0,-1]
var answer = 0

for _ in 0..<t {
    let nextX = currentLocation.1 + dx[currentDirection]
    let nextY = currentLocation.0 + dy[currentDirection]

    if nextX < 0 || nextX >= n || nextY < 0 || nextY >= n {
        currentDirection = (currentDirection + 2)%4
        answer += 1
        continue
    }

    currentLocation = (nextY, nextX)
    answer += 1
}

print("\(currentLocation.0+1) \(currentLocation.1+1)")