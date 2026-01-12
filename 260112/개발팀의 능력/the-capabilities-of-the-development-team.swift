import Foundation

let inputLine = readLine()!
let skills = inputLine.split(separator: " ").map { Int($0)! }.sorted()

func allGroupedCombinations(_ nums: [Int]) -> [[[Int]]] {
    let nums = nums.sorted()
    var used = Array(repeating: false, count: nums.count)
    var result = Set<String>()
    var finalResult = [[[Int]]]()
    
    func backtrack(_ current: [[Int]]) {
        // 모든 숫자를 사용한 경우
        if !used.contains(false) {
            // 정규화 (조합 내부 + 전체 정렬)
            let normalized = current
                .map { $0.sorted() }
                .sorted { $0.count == $1.count ? $0 < $1 : $0.count < $1.count }
            
            let key = normalized
                .map { $0.map(String.init).joined(separator: ",") }
                .joined(separator: "|")
            
            if !result.contains(key) {
                result.insert(key)
                finalResult.append(normalized)
            }
            return
        }
        
        // 첫 번째 미사용 인덱스 찾기
        guard let first = used.firstIndex(of: false) else { return }
        
        // 1개짜리 그룹
        used[first] = true
        backtrack(current + [[nums[first]]])
        used[first] = false
        
        // 2개짜리 그룹
        for i in (first + 1)..<nums.count {
            if !used[i] {
                used[first] = true
                used[i] = true
                backtrack(current + [[nums[first], nums[i]]])
                used[first] = false
                used[i] = false
            }
        }
    }
    
    backtrack([])
    return finalResult
}


let combiArr = allGroupedCombinations(skills)
let reduceArr = combiArr.map { $0.map { $0.reduce(0) {$0 + $1} } }

if combiArr.count == 1 {
    print(-1)
} else {
    var answer = Int.max

    for i in reduceArr {
        if Set(i).count == 1 {continue}
        answer = min(answer, i.max()! - i.min()!)
    }
    print(answer)
}

