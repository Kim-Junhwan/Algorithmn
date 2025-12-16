import Foundation

let str = readLine()!
let n = str.count
let strArr = Array(str)

var answer = 0

for i in 0..<n {
    if strArr[i] == ")" { continue }
    for j in i..<n {
        if strArr[j] == ")" {
            answer += 1
        }
    }
}

print(answer)