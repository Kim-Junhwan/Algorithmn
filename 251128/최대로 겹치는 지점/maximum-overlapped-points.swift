import Foundation

let n = Int(readLine()!)!
var segments = [(Int, Int)]()

for _ in 0..<n {
    let values = readLine()!.split(separator: " ").map { Int(String($0))! }
    segments.append((values[0], values[1]))
}

var arr: [Int] = Array(repeating: 0, count: 201)

for command in segments {
    for i in command.0 ... command.1 {
        arr[i] += 1
    }
}

print(arr.max()!)