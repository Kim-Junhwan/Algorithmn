struct Number: Comparable {
    static func < (lhs: Number, rhs: Number) -> Bool {
        lhs.value < rhs.value
    }
    
    let index: Int
    let value: Int
}

let n = Int(readLine()!)!
var numArr: [Number] = []


for i in 0..<n {
    let input = Int(readLine()!)!
    numArr.append(Number(index: i, value: input))
}

func solution() {
    let sortedArr = numArr.sorted()
    var answer = Int.min
    for i in 0..<n {
        answer =  max(answer, (sortedArr[i].index-numArr[i].index)+1)
    }
    print(answer)
}

solution()
