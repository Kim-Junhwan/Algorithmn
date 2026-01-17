import Foundation

let n = Int(readLine()!)!

var leftTimes = [Int]()
var rightTimes = [Int]()

for _ in 0..<n {
    let parts = readLine()!.split(separator: " ").map { Int($0)! }
    leftTimes.append(parts[0])
    rightTimes.append(parts[1])
}

var workingTime: [Int] = Array(repeating: 0, count: 1001)

for i in 0..<n {
    for j in leftTimes[i]...rightTimes[i]-1 {
        workingTime[j] += 1
    }
}
var answer = 0
for i in 0..<n {
    var cpWork = workingTime
    for j in leftTimes[i]...rightTimes[i]-1 {
        cpWork[j] -= 1
    }
    answer = max(answer, cpWork.filter{$0 > 0}.count)
}

print(answer)
