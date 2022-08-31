import Foundation

var input = Int(readLine()!)!

for _ in 0..<input {
    var caseNum = Int(readLine()!)!
    var clothDict: [String:Int] = [:]
    for _ in 0..<caseNum {
        var cloth = readLine()!.split(separator: " ").map {String($0)}
        if clothDict.keys.contains(cloth[1]) {
            clothDict[cloth[1]]! += 1
        } else {
            clothDict[cloth[1]] = 1
        }
    }
    print(solution(clothDict: clothDict))
}

func solution(clothDict: [String:Int])->Int{
    var count = 1
    for item in clothDict.values {
        count = count * (item+1)
    }
    return count-1
}
