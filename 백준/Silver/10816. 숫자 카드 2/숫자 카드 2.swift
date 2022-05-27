import Foundation

var dictHasNumberList : [Int:Int] = [:]
var hasNumber = readLine()!
var answer = ""
readLine()!.split(separator: " ").map { num in
    var number = Int(num)!
    if dictHasNumberList.keys.contains(number){
        dictHasNumberList[number]! += 1
    }else{
        dictHasNumberList[number] = 1
    }
}
var number = readLine()!
var numberList = readLine()!.split(separator: " ").map { Int($0)!}

numberList.map { num in
    if dictHasNumberList.keys.contains(num){
        answer += "\(dictHasNumberList[num]!) "
    }else{
       answer += "\(0) "
    }
}
print(answer)
