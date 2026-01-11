import Foundation

let inputLine = readLine()!
let skills = inputLine.split(separator: " ").map { Int($0)! }

func groupIntoPairs(_ array: [Int]) -> [[[Int]]] {
    if array.isEmpty {
        return [[]]
    }
    
    if array.count == 1 {
        return [[[array[0]]]]
    }
    
    var result: [[[Int]]] = []
    let first = array[0]
    let remaining = Array(array.dropFirst())
    
    // 첫 번째 요소를 나머지 요소들과 각각 페어링하는 경우만 고려
    for i in 0..<remaining.count {
        let partner = remaining[i]
        var newRemaining = remaining
        newRemaining.remove(at: i)
        
        let subPairings = groupIntoPairs(newRemaining)
        for pairing in subPairings {
            result.append([[first, partner]] + pairing)
        }
    }
    
    return Array(Set(result))
}

let combiArr = groupIntoPairs(skills)
let reduceArr = combiArr.map { $0.map { $0.reduce(0) {$0 + $1} } }

if combiArr.count == 1 {
    print(-1)
} else {
    var answer = Int.max

    for i in reduceArr {
        answer = min(answer, i.max()! - i.min()!)
    }
    print(answer)
}

