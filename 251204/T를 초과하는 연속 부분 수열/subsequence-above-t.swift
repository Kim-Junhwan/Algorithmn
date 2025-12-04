let firstLine = readLine()!
let first = firstLine.split(separator: " ").map { Int($0)! }
let n = first[0]
let t = first[1]

let secondLine = readLine()!
let arr = secondLine.split(separator: " ").map { Int($0)! }

var maxCount = 0
var count = 0

for i in 0..<n {
    if arr[i] > t {
        count += 1
    } else {
        count = 0
    }
    maxCount = max(maxCount, count)
}

print(maxCount)