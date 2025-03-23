import Foundation

let n = Int(readLine()!)!

func solution() {
    var sosuArr: [Int] = Array(0...1100000)
    sosuArr[1] = 0
    
    for i in 2...Int(sqrt(Double(sosuArr.count))) {
        if sosuArr[i] != 0 {
            var current = i+i
            while current < sosuArr.count {
                sosuArr[current] = 0
                current += i
            }
        }
    }
    for i in n...sosuArr.count-1 {
        if sosuArr[i] != 0 {
            if isPelindrom(num: sosuArr[i]) {
                print(sosuArr[i])
                return
            }
        }
    }
    
    func isPelindrom(num: Int) -> Bool {
        let numToString = Array(String(num))
        var start = 0
        var end = numToString.count-1
        while start <= end {
            if (numToString[start] != numToString[end]) {
                return false
            }
            start += 1
            end -= 1
        }
        return true
    }
}

solution()
