import Foundation

let n = Int(readLine()!)!
var directions = [String]()
var distances = [Int]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ")
    directions.append(String(input[0]))
    distances.append(Int(input[1])!)
}

let dx = [0,1,0, -1]
let dy = [1,0,-1,0]

var currentDistance = (0, 0)

for i in 0..<n {
    let direction = directions[i]
    let distance = distances[i]

    let index: Int

    switch direction {
        case "W": index = 3
        case "S": index = 2
        case "N": index = 0
        case "E": index = 1
        default: index = 1
    }

    let moveY = dy[index] * distance
    let moveX = dx[index] * distance

    currentDistance = (currentDistance.0+moveY, currentDistance.1+moveX)
}

print("\(currentDistance.1) \(currentDistance.0)")