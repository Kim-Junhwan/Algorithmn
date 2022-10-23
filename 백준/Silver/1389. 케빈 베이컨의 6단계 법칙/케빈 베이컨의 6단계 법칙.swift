import Foundation

let num = readLine()!.split(separator: " ").map {Int($0)!}

var relationArr: [[Int]] = Array(repeating: Array(repeating: 9999, count: num[0]+1), count: num[0]+1)
var answerArr: [Int] = []
for _ in 0..<num[1] {
    let relation = readLine()!.split(separator: " ").map {Int($0)!}
    relationArr[relation[0]][relation[1]] = 1
    relationArr[relation[1]][relation[0]] = 1
}
for item in 1...num[0] {
    relationArr[item][item] = 0
}

for i in 1...num[0] {
    for j in 1...num[0] {
        for k in 1...num[0] {
            relationArr[j][k] = min(relationArr[j][k], relationArr[j][i]+relationArr[i][k])
        }
    }
}
for item in 1...num[0] {
    var sum = 0
    for way in 1...num[0] {
        sum += relationArr[item][way]
    }
    answerArr.append(sum)
    sum = 0
}
print(answerArr.firstIndex(of: answerArr.min()!)!+1)
