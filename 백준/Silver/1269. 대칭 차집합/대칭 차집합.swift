import Foundation

var num = readLine()!.split(separator: " ").map {Int($0)!}
var a : Set<Int> = []
var b : Set<Int> = []
var answer = 0
readLine()!.split(separator: " ").map {a.insert(Int($0)!)}
readLine()!.split(separator: " ").map {b.insert(Int($0)!)}
answer += a.subtracting(b).count
answer += b.subtracting(a).count
print(answer)
