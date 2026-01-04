import Foundation

let n = Int(readLine()!)!
var a = [Int]()
var b = [Int]()
var c = [Int]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    a.append(input[0])
    b.append(input[1])
    c.append(input[2])
}

func checknotSameNum(_ x: Int) -> Bool {
    let arr = Set(Array(String(x)))
    return arr.count == 3
}

func checkIsValid(_ num: Int) -> Bool {
    for index in 0..<4 {
        let compareNum = a[index]
        var cArr = Array(String(compareNum))
        var numArr = Array(String(num))

        // 자릿수 매칭
        var matchCount = 0
        for i in 0..<3 {
            if cArr[i] == numArr[i] {
                matchCount += 1
            } 
        }

        if matchCount != b[index] {
            return false
        }

        // 숫자 개수 매칭
        var countMatch = 0
        for i in 0..<3 {
            if numArr.contains(cArr[i]) {
                countMatch += 1
            }
        }
        countMatch -= matchCount

        if countMatch != c[index] {
            return false
        }
    }
    print(num)
    return true
}
var answer = 0
for i in 100..<1000 {
    if !checknotSameNum(i) { continue }

    if checkIsValid(i) {
        answer += 1
    }
}

print(answer)