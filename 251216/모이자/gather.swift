import Foundation

let n = Int(readLine()!)!
let people = readLine()!.split(separator: " ").map { Int($0)! }
var answer = Int.max

for i in 0..<n {
    var sum = 0
    for j in 0..<n {
        if i == j { continue }
        sum += people[j] * abs(j-i)
    }

    answer = min(answer, sum)
}

print(answer)