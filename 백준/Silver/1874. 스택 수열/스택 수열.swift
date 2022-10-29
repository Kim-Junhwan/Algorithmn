let n = Int(readLine()!)!
var sequence: [Int] = []
var stack: [Int] = []
var answerArr: [Int] = []
var answer = ""
for _ in 0..<n {
    sequence.append(Int(readLine()!)!)
}

func solution() -> String{
    var target = 0
    var item = 1
    while true {
        if sequence[target] >= item {
            for _ in 0...(sequence[target]-item) {
                stack.append(item)
                answer.append("+\n")
                item += 1
            }
        } else {
            let popNum = stack.removeLast()
            if popNum == sequence[target] {
                answerArr.append(popNum)
                answer.append("-\n")
                target += 1
            } else {
                return "NO"
            }
        }
        if answerArr.count == sequence.count {
            return answer
        }
    }
}

print(solution())
