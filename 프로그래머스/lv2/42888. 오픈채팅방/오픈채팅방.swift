import Foundation

func solution(_ record:[String]) -> [String] {
    var answer : [String] = record
    var result : [String] = []
    var userInfo : [String : String] = [:]
    for log in record{
        var splitLog = log.split(separator: " ").map {String($0)}
        if (splitLog[0]=="Enter") || (splitLog[0]=="Change"){
            userInfo[splitLog[1]] = splitLog[2]
        }
      }
    for str in record{
        var splitLog = str.split(separator: " ").map {String($0)}
        switch splitLog[0]{
        case "Enter":
            result.append("\(userInfo[splitLog[1]]!)님이 들어왔습니다.")
        case "Leave":
            result.append("\(userInfo[splitLog[1]]!)님이 나갔습니다.")
        default :
            continue
        }
    }
    return result
}