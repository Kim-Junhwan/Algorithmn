import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
  
    var answer = 0
    let binaryNum = String(n, radix: k, uppercase: false)
    binaryNum.split(separator: "0").map { num in
        if isPrime(num: Int(num, radix: 10)!) {
            answer += 1
        }
    }

    return answer
}

func isPrime(num: Int) -> Bool {
    if(num<4) {
        return num == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if(num % i == 0) { return false }
    }
    return true
}
