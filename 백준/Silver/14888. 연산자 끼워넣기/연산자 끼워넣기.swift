let numCount = Int(readLine()!)!
var numArr: [Int] = []
var calculatorArr: [Int] = []
//+-x/
var usedCalculatorArr: [Int] = Array(repeating: 0, count: 4)
let calculatorCount = numCount-1
var calculatorSolutionArr: [Int] = Array(repeating: -1, count: numCount)

var minValue = Int.max
var maxValue = Int.min

numArr = readLine()!.split(separator: " ").map({Int($0)!})
calculatorArr = readLine()!.split(separator: " ").map({Int($0)!})

func dfs(deep: Int, sum: Int) {
    if deep == numCount {
        minValue = min(minValue, sum)
        maxValue = max(maxValue, sum)
    } else {
        if calculatorArr[0] > 0 {
            calculatorArr[0] -= 1
            dfs(deep: deep+1, sum: sum + numArr[deep])
            calculatorArr[0] += 1
        }
        if calculatorArr[1] > 0 {
            calculatorArr[1] -= 1
            dfs(deep: deep+1, sum: sum - numArr[deep])
            calculatorArr[1] += 1
        }
        if calculatorArr[2] > 0 {
            calculatorArr[2] -= 1
            dfs(deep: deep+1, sum: sum * numArr[deep])
            calculatorArr[2] += 1
        }
        if calculatorArr[3] > 0 {
            calculatorArr[3] -= 1
            dfs(deep: deep+1, sum: sum / numArr[deep])
            calculatorArr[3] += 1
        }
    }
}

dfs(deep: 1, sum: numArr[0])
print(maxValue)
print(minValue)