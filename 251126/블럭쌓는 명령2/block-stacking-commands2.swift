import Foundation

let firstLine = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = firstLine[0]
let k = firstLine[1]
var commands: [(a: Int, b: Int)] = []

for _ in 0..<k {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    commands.append((a: line[0]-1, b: line[1]-1))
}

var map: [Int] = Array(repeating: 0, count: n)

for command in commands {
    for i in command.0...command.1 {
        map[i] += 1
    }
}

print(map.max()!)