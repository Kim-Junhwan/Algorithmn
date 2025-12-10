import Foundation

let commands = Array(readLine()!)

var coordi = (0,0)
var direction = 0

let dx = [0,1,0,-1]
let dy = [1,0,-1,0]

for command in commands {
    if command == "L" {
        direction = (direction+3)%4 
    } else if command == "R" {
        direction = (direction + 1)%4
    } else {
        coordi = (coordi.0+dx[direction], coordi.1+dy[direction])
    }
}

print("\(coordi.0) \(coordi.1)")