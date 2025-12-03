import Foundation

let n = Int(readLine()!)!
var numbers = [Int]()
for _ in 0..<n {
    numbers.append(Int(readLine()!)!)
}

var maxNum = 0
var num = 1

for i in 1..<n {
    if numbers[i] * numbers[i-1] > 0 {
        num += 1
    } else {
        num = 1
    }
    maxNum = max(maxNum, num)
}
print(maxNum)