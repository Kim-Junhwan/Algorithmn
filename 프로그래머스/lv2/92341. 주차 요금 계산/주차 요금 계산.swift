import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var answer: [Int] = []
    var answerDict: [Int: Int] = [:]
    var recordsArr = records
    var carDict: [String: String] = [:]
    var parkTimeDict: [String: Int] = [:]
    for item in recordsArr {
        let splitStr = item.split(separator: " ").map {String($0)}
        if carDict.keys.contains(splitStr[1]) {
            let outTime = splitStr[0].split(separator: ":").map {Int($0)}
            var inTime = carDict[splitStr[1]]!.split(separator: ":").map {Int($0)}
            let parkTime = ((outTime[0]! - inTime[0]!)*60) + (outTime[1]! - inTime[1]!)
            if parkTimeDict.keys.contains(splitStr[1]) {
                parkTimeDict[splitStr[1]]! += parkTime
            } else {
                parkTimeDict[splitStr[1]] = parkTime
            }
            carDict[splitStr[1]] = nil
        } else {
            carDict[splitStr[1]] = splitStr[0]
        }
    }
    if !carDict.isEmpty {
        let outTime = [23,59]
        for item in carDict {
            let inTime = item.value.split(separator: ":").map {Int($0)}
            let parkTime = ((outTime[0] - inTime[0]!)*60) + (outTime[1] - inTime[1]!)
            if parkTimeDict.keys.contains(item.key) {
                parkTimeDict[item.key]! += parkTime
            } else {
                parkTimeDict[item.key] = parkTime
            }
        }
    }
    
    for record in parkTimeDict {
        if record.value <= fees[0] {
            answerDict[Int(record.key)!] = fees[1]
        } else {
            let extraTime = record.value-fees[0]
            if extraTime%fees[2] != 0 {
                answerDict[Int(record.key)!] = fees[1]+(extraTime/fees[2]+1)*fees[3]
            } else {
                answerDict[Int(record.key)!] = fees[1]+(extraTime/fees[2])*fees[3]
            }
        }
    }
      _ = answerDict.sorted { one, two in
            return one.key < two.key
        }.map { _, value in
            answer.append(value)
        }
    return answer
}