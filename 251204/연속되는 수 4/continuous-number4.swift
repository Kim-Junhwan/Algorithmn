import Foundation

let n = Int(readLine()!)!
var numbers = [Int]()
for _ in 0..<n {
    numbers.append(Int(readLine()!)!)
}

var maxCount = 1
var count = 1
for i in 1..<n {
    if numbers[i] > numbers[i-1] {
        count += 1
    } else {
        count = 1
    }
    maxCount = max(maxCount, count)
}

print(maxCount)