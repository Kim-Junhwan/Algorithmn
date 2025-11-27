let n = Int(readLine()!)!
var segments: [(Int, Int)] = []

for _ in 0..<n {
    let parts = readLine()!.split(separator: " ")
    let x1 = Int(parts[0])!
    let x2 = Int(parts[1])!
    segments.append((x1+100, x2+100))
}

var arr: [Int] = Array(repeating: 0, count: 201)

for command in segments {
    for i in command.0 ..< command.1 {
        arr[i] += 1
    }
}

print(arr.max()!)