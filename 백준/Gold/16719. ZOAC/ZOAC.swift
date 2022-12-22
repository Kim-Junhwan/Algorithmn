let word = Array(readLine()!)

var isPrintedArr: [Bool] = Array(repeating: false, count: word.count)

func solution(left: Int ,right: Int) {
    if left > right || right < left {
        return
    }
    var middle: Int = -1
    var min = Int.max
    var output = ""
    for item in left...right {
        if min > Int(UnicodeScalar(String(word[item]))!.value)  && !isPrintedArr[item] {
            middle = item
            min = Int(UnicodeScalar(String(word[item]))!.value)
        }
    }
    if min == Int.max {
        return
    }
    isPrintedArr[middle] = true
    for item in 0..<isPrintedArr.count {
        if isPrintedArr[item] {
            output += String(word[item])
        }
    }
    print(output)
    solution(left: middle+1, right: right)
    solution(left: left, right: middle-1)
}

solution(left: 0, right: word.count-1)
