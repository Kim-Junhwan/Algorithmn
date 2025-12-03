import Foundation

let n = Int(readLine()!)!
var numbers: [Int] = []
for _ in 0..<n {
    numbers.append(Int(readLine()!)!)
}

var num = 0
var maxNum = 0 
for i in 0..<n {
    if i == 0 || numbers[i] == numbers[i-1] {
        num += 1
    } else {
        num = 1
    }
    maxNum = max(maxNum, num)
}
print(maxNum)