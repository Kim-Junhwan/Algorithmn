import Foundation

let n = Int(readLine()!)!
var x = [Int]()
var y = [Int]()
for _ in 0..<n {
    let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
    x.append(nums[0])
    y.append(nums[1])
}
 
var memo: [[Int?]] = Array(repeating: Array(repeating: nil, count: n), count: n)
var answer = Int.max

for passNode in 1..<n-1 {
    var currentNode = 0
    var sum = 0
    for i in 0..<n {
        if i == passNode {
            continue
        }
        let distance = abs(abs(x[currentNode]-x[i])+abs(y[currentNode]-y[i]))
        sum += distance
        currentNode = i
    }
    answer = min(answer, sum)
}

print(answer)