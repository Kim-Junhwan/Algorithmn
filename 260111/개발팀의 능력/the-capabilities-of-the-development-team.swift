import Foundation

let inputLine = readLine()!
let skills = inputLine.split(separator: " ").map { Int($0)! }.sorted()

func generateAllPairings(_ array: [Int]) -> [[[Int]]] {
    // 빈 배열
    if array.isEmpty {
        return [[]]
    }
    
    // 1개만 남은 경우
    if array.count == 1 {
        return [[[array[0]]]]
    }
    
    // 2개만 있는 경우
    if array.count == 2 {
        return [[[array[0], array[1]]]]
    }
    
    var result: [[[Int]]] = []
    let first = array[0]
    
    // 첫 번째 요소와 나머지 요소들을 각각 페어링
    for i in 1..<array.count {
        let partner = array[i]
        
        // 첫 번째와 i번째를 제외한 나머지 요소들
        var newRemaining: [Int] = []
        for j in 0..<array.count {
            if j != 0 && j != i {
                newRemaining.append(array[j])
            }
        }
        
        // 나머지 요소들로 재귀적으로 조합 생성
        let subPairings = generateAllPairings(newRemaining)
        
        // 현재 페어를 앞에 추가
        for pairing in subPairings {
            let newPairing = [[first, partner]] + pairing
            if isValidPairing(newPairing) {
                result.append(newPairing)
            }
        }
    }
    
    return result
}

// 동일한 수로 구성된 페어가 있는지 확인
func isValidPairing(_ pairing: [[Int]]) -> Bool {
    let pairs = pairing.filter { $0.count == 2 }
    
    for i in 0..<pairs.count {
        for j in (i+1)..<pairs.count {
            let pair1 = Set(pairs[i])
            let pair2 = Set(pairs[j])
            
            if pair1 == pair2 {
                return false
            }
        }
    }
    
    return true
}

let combiArr = generateAllPairings(skills)
print(combiArr)
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

