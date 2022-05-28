import Foundation

var humanNum = readLine()!.split(separator: " ").map {Int($0)!}
var n : [String:Int] = [:]
var answer : [String] = []
var answerString = ""
for _ in 0..<humanNum[0]{
    var input = readLine()!
    n[input] = 1
}
for _ in 0..<humanNum[1]{
    var input = readLine()!
    if n.keys.contains(input){
        answer.append(input)
    }
}
answer.sort()
answerString += "\(answer.count)\n"
answer.map {answerString += "\($0)\n"}
print(answerString)
