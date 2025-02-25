import Foundation

let n = Int(readLine()!)!
let numArr = readLine()!.split(separator: " ").map { Int($0)! }

func solution() {
    let sortedArr = numArr.sorted()
    var sum = 0
    var answer = 0
    for num in sortedArr {
        sum = sum + num
        answer += sum
    }
    print(answer)
}

solution()