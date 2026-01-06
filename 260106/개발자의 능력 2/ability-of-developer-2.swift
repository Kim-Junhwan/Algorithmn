import Foundation

let inputLine = readLine()!
let skills = inputLine.split(separator: " ").map { Int($0)! }

func groupIntoPairs(numbers: [Int]) -> [[[Int]]] {
    var results: [[[Int]]] = []
    
    func backtrack(remaining: [Int], currentGroups: [[Int]]) {
        // 모든 숫자를 다 사용했다면 결과에 추가
        if remaining.isEmpty {
            results.append(currentGroups)
            return
        }
        
        // 1. 항상 남은 숫자 중 첫 번째를 고정 (중복 방지 핵심)
        var rest = remaining
        let first = rest.removeFirst()
        
        // 2. 고정된 첫 번째 숫자와 짝을 이룰 두 번째 숫자를 선택
        for i in 0..<rest.count {
            var nextRemaining = rest
            let second = nextRemaining.remove(at: i) // 선택된 숫자를 제외함
            
            var nextGroups = currentGroups
            nextGroups.append([first, second])
            
            // 3. 남은 숫자로 재귀 호출
            backtrack(remaining: nextRemaining, currentGroups: nextGroups)
        }
    }
    
    backtrack(remaining: numbers, currentGroups: [])
    return results
}

let allCombinations = groupIntoPairs(numbers: skills)

var answer = Int.max

for combi  in allCombinations {
    let reduceArr = combi.map { $0.reduce(0){$0+$1} }
    let maxComb = reduceArr.max()
    let minComb = reduceArr.min()
    answer = min(answer, maxComb!-minComb!)
}
print(answer)
