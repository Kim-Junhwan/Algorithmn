import Foundation

let n = Int(readLine()!)!
var numbers = [Int]()
for _ in 0..<n {
    let number = Int(readLine()!)!
    numbers.append(number)
}

func digitsMath(_ number: Int) -> [Int] {
    var n = abs(number)
    var result: [Int] = []

    while n > 0 {
        result.append(n % 10)
        n /= 10
    }

    return result
}

func isCarry(_ a: Int, _ b: Int, _ c: Int) -> Bool {
    var ten = 10
    let maxNum = max(max(a,b),c)

    let aArr = digitsMath(a)
    let bArr = digitsMath(b)
    let cArr = digitsMath(c)

    let maxLength = max(max(aArr.count, bArr.count), cArr.count)

    for i in 0..<maxLength {
        let aNum = aArr.count > i ? aArr[i] : 0
        let bNum = bArr.count > i ? bArr[i] : 0
        let cNum = cArr.count > i ? cArr[i] : 0

        if aNum + bNum + cNum >= 10 {
            return false
        }
    }

    return true
}

var answer = Int.min

for i in 0..<numbers.count-2 {
    for j in i+1..<numbers.count-1 {
        for z in j+1..<numbers.count {
            let a = numbers[i]
            let b = numbers[j]
            let c = numbers[z]

            if isCarry(a,b,c) {
                answer = max(answer, a+b+c)
            }
        }
    }
}

print(answer == Int.min ? -1 : answer)