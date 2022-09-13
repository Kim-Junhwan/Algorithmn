import Foundation

import Foundation

struct Stage {
    let stageNum: Int
    let humanCount: Int
    var failure: Double
}

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    let sortedStages = stages.sorted { $0 < $1 }
    let userCount = stages.count
    //var answer: [Int] = Array(repeating: -1, count: N+1)
//    var stageDict: [Int:Int] = [:]
    var stageDict: [Stage] = Array(repeating: Stage(stageNum: 0, humanCount: 0, failure: 0.0), count: N+1)
    var lastUserCount = 0
    
    for userStage in 1...N+1 {
        if let userStageCount = sortedStages.lastIndex(of: userStage) {
            //stageDict.append(Stage(stageNum: userStage+1, humanCount: userStageCount+1, failure: 0.0))
            stageDict[userStage-1] = Stage(stageNum: userStage, humanCount: userStageCount+1-lastUserCount, failure: 0.0)
            lastUserCount = userStageCount+1
        } else {
            stageDict[userStage-1] = Stage(stageNum: userStage, humanCount: 0, failure: 0.0)
        }
        
    }
    var currentUser = userCount
    for item in 0..<stageDict.count {
        if stageDict[item].humanCount == 0 {
            stageDict[item].failure = 0
        }else {
            stageDict[item].failure = Double(Double(stageDict[item].humanCount)/Double(currentUser))
            currentUser -= stageDict[item].humanCount
        }
    }
    stageDict.removeLast()
    var answer = stageDict.sorted { num1, num2 in
        if num1.failure == num2.failure {
            return num1.stageNum < num2.stageNum
        } else {
            return num1.failure > num2.failure
        }
    }.map { $0.stageNum }
    return answer
}