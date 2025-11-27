import Foundation

let n = Int(readLine()!)!
var distances = [Int]()
var directions = [String]()

for _ in 0..<n {
    let inputs = readLine()!.split(separator: " ")
    let distance = Int(inputs[0])!
    let direction = String(inputs[1])
    distances.append(distance)
    directions.append(direction)
}

var arr = Array(repeating: 0, count: 2001)
var currentLocation = 1000

for i in 0..<n {
    let a = directions[i] == "R" ? currentLocation : currentLocation-distances[i]
    let b = directions[i] == "R" ? currentLocation+distances[i] : currentLocation

    for j in a..<b {
        arr[j] += 1
    }

    currentLocation = directions[i] == "R" ? currentLocation+distances[i] : currentLocation-distances[i]
}
print(arr.filter{ $0 >= 2 }.count)