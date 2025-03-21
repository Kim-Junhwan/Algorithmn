import Foundation

let input = readLine()!
let numArr = input.components(separatedBy: CharacterSet(["+","-"])).map {Int(String($0))! }
let operatorArr = Array(input).filter{ $0 == "+" || $0 == "-" }

func solution() -> Int {
    var sum = 0
    var operatorIdx = 0
    var nextOp: String = "+"
    for i in numArr {
        if nextOp == "+" {
            sum += i
        } else {
            sum -= i
        }
        if nextOp == "+" && operatorIdx < operatorArr.count {
            let op = operatorArr[operatorIdx]
            nextOp = String(op)
            operatorIdx += 1
        }
        
    }
    return sum
}

print(solution())
