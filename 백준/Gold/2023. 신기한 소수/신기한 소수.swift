import Foundation

let n = Int(readLine()!)!

func isPrime(num: Int) -> Bool {
    for i in 2...Int(sqrt(Double(num))) {
        if num % i == 0 {
            return false
        }
    }
    return true
}

func solution() {
    var answerStr = ""
    func dfs(depth: Int, num: Int) {
        
        if depth == n {
            answerStr += "\(num)\n"
        }
        
        for i in 1...9 {
            let nextNum = num*10+i
            if i%2 == 0 || !isPrime(num: nextNum) { continue }
            dfs(depth: depth+1, num: nextNum)
        }
        
        
        
    }
    
    dfs(depth: 1, num: 2)
    dfs(depth: 1, num: 3)
    dfs(depth: 1, num: 5)
    dfs(depth: 1, num: 7)
    print(answerStr)
}

solution()
