
import Foundation

let m = Int(readLine()!)!
let colors = readLine()!.split(separator: " ").map{Int($0)!}
let k = Int(readLine()!)!
var answerArr: [Double] = Array(repeating: 0.0, count: m)

let stoneCount = colors.reduce(0, +)

var answer = 0.0

for i in 0..<m {
    if colors[i] >= k {
        answerArr[i] = 1.0
        for j in 0..<k {
            answerArr[i] *= Double(colors[i]-j) / Double(stoneCount-j)
        }
    }
    answer += answerArr[i]
}

print(answer)
