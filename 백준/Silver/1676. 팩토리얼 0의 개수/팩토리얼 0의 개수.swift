import Foundation

var input = Int(readLine()!)!

func solution(num: Int) -> Int{
    var answer = 0
    var copyNum = num
    while (copyNum >= 5) {
        answer += copyNum/5
        copyNum /= 5
    }
    return answer
}

print(solution(num: input))
