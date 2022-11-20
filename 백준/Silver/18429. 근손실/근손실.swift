let nk = readLine()!.split(separator: " ").map { Int($0)! }

let increment = readLine()!.split(separator: " ").map { Int($0)! }
var isVisit: [Bool] = Array(repeating: false, count: nk[0])
var answer = 0
var orderArr: [Int] = []

func baektracking(depth: Int, inputNum: Int) {
    if depth == nk[0] {
        checkWeight()
        return
    } else {
        for item in 1...nk[0] {
            if !isVisit[item-1] {
                orderArr.append(item)
                isVisit[item-1] = true
                baektracking(depth: depth+1, inputNum: item)
                orderArr.removeLast()
                isVisit[item-1] = false
            }
        }
    }
}

func checkWeight() {
    var weight = 500
    for item in orderArr {
        weight = weight + ( increment[item-1] - nk[1])
        if weight < 500 {
            return
        }
    }
    answer += 1
}

baektracking(depth: 0, inputNum: 0)
print(answer)
