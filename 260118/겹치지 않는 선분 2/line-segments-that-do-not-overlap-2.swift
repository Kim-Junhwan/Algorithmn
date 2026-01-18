let n = Int(readLine()!)!
var x1Array = [Int]()
var x2Array = [Int]()

for _ in 0..<n {
    let parts = readLine()!.split(separator: " ")
    let x1 = Int(parts[0])!
    let x2 = Int(parts[1])!
    x1Array.append(x1)
    x2Array.append(x2)
}

var answer = 0

for i in 0..<n {
    var isOverlap = false
    for j in 0..<n {
        if i == j { continue }
        // 겹쳐진거면 continue
        if (x1Array[i] > x1Array[j]) && (x2Array[i] < x2Array[j]) || (x1Array[i] < x1Array[j]) && (x2Array[i] > x2Array[j]) {
            isOverlap = true
            break
        }
    }
    if !isOverlap {
        answer += 1
    }
}

print(answer)