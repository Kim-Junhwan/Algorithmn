import Foundation

let n = Int(readLine()!)!

var remainNum = n
var answer = ""

while remainNum != 0 {
    answer += "\(remainNum%2)"
    remainNum /= 2
}

print(answer.isEmpty ? "0" : String(answer.reversed()))