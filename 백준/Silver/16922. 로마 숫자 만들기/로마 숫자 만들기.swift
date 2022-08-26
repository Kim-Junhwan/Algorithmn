import Foundation

let num = Int(readLine()!)!

func solution(num: Int) -> Int {
    var answer = 0
    let numArr = [1,5,10,50]
    var depArr: [[Int]] = [[Int]](repeating: [], count: num+1)
    
    func dfs(depth: Int, sum: Int) {
        if depArr[depth].contains(sum) {
            return
        }
        depArr[depth].append(sum)
        if depth == num {
            answer += 1
            return
        }
        
        for item in 0..<numArr.count {
            dfs(depth: depth+1, sum: sum+numArr[item])
        }
    }
    
    dfs(depth: 0, sum: 0)
    return answer
}

print(solution(num: num))