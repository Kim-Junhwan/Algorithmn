import Foundation

let n = Int(readLine()!)!
var commands = [(Int, String)]()
for _ in 0..<n {
    let parts = readLine()!.split(separator: " ")
    let x = Int(parts[0])!
    let direction = String(parts[1])
    commands.append((x, direction))
}

// true 흰색, false 검은색
var arr: [Bool?] = Array(repeating: nil, count: 200001)
var currentLocation = 100000

for command in commands {
    let direction = command.1
    let distance = command.0

    let start = direction == "L" ? currentLocation - distance + 1 : currentLocation
    let end = direction == "L" ? currentLocation : currentLocation + distance - 1

    for i in start...end {
        let changeColor = direction == "L"

        arr[i] = changeColor
    }

    currentLocation = direction == "L" ? start : end
}

print("\(arr.compactMap{$0}.filter { $0 }.count) \(arr.compactMap{$0}.filter { !$0 }.count)")