import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let str = Array(readLine()!).map{ String($0) }
let numCount = readLine()!.split(separator: " ").map { Int($0)! }

func solution() {
    var answer = 0
    var psDict: [String: Int] = ["A":numCount[0] , "C":numCount[1], "G":numCount[2], "T":numCount[3]]
    var start = 0
    var end = input[1]-1
    var tmpDict: [String: Int] = ["A":0 , "C":0, "G":0, "T":0]
    for i in start...end {
        tmpDict[str[i]]! += 1
    }
    while true {
        var flag = false
        for d in psDict {
            if (tmpDict[d.key]! < psDict[d.key]!) {
                flag = true
                break
            }
        }
        if !flag {
            answer += 1
        }
        start += 1
        end += 1
        if end >= input[0] {
            break
        }
        tmpDict[str[start-1]]! -= 1
        tmpDict[str[end]]! += 1
    }
    print(answer)
}

solution()
