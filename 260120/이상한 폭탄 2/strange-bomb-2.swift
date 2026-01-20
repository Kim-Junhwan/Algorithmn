let firstLine = readLine()!
let inputs = firstLine.split(separator: " ")
let n = Int(inputs[0])!
let k = Int(inputs[1])!

var bombs = [Int]()
var visited: [Bool] = Array(repeating: false, count: n)
for _ in 0..<n {
    bombs.append(Int(readLine()!)!)
}
var answer = -1

for i in 0..<n {
    let boomBomb = bombs[i]
    let end = i+k >= n ? n-1 : i+k
    for checkBomb in i...end {
        if i == checkBomb { continue }
        if boomBomb == bombs[checkBomb] {
            answer = max(answer, boomBomb)
            break
        }
    }
}
print(answer)
