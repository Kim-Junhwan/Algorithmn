import Foundation

var number = readLine()?.split(separator: " ").map{Int($0)}
var n = Set<String>()
var m : [String] = []
var answer = 0

for _ in 0..<number![0]!{
    n.insert(readLine()!)
}
for _ in 0..<number![1]!{
    var inputString = readLine()!
    if n.contains(inputString){
        answer += 1
    }
}

print(answer)
