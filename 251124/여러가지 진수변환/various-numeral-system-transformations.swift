let inputLine = readLine()!
let inputParts = inputLine.split(separator: " ")
let n = Int(inputParts[0])!
let b = Int(inputParts[1])!
var remainNum = n

var answer = ""

while remainNum >= b {
    answer += "\(remainNum%b)"
    remainNum = remainNum/b
}
answer += "\(remainNum)"

print(String(answer.reversed()))