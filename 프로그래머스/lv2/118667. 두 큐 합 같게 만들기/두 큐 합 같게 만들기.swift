import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var accumulateArr: [Int] = [0]
    var answer = Int.max
    var start = 0
    
    for item in queue1+queue2 {
        accumulateArr.append(accumulateArr.last!+item)
    }
    let targetNum = accumulateArr.last!/2
    if accumulateArr.last!%2 != 0 {
        return -1
    }
    if accumulateArr[queue1.count] == targetNum {
        return 0
    }
    
    func getWorkCount(start: Int ,end: Int)-> Int {
        if 0..<queue1.count ~= start {
            if end == queue1.count-1 {
                return start
            }
            if 0..<queue1.count ~= end {
                return start + end + queue2.count + 1
            } else {
                return start + end - queue1.count + 1
            }
        }
        return end + (start-queue1.count) + 1
    }
    
    for item in 1..<accumulateArr.count {
        if accumulateArr[item] - accumulateArr[start] > targetNum {
            while accumulateArr[item] - accumulateArr[start] > targetNum {
                start += 1
            }
        }
        if accumulateArr[item] - accumulateArr[start] == targetNum {
            answer = min(answer, getWorkCount(start: start, end: item-1))
        }
    }
    
    return answer == Int.max ? -1 : answer
}