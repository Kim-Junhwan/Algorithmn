import Foundation

var N = Int(readLine()!)!
var NList = readLine()!.split(separator: " ").map { Int($0)! }
var M = Int(readLine()!)!
var MList = readLine()!.split(separator: " ").map { Int($0)! }
NList.sort()

func solution()->String{
var answer = ""
    for item in MList{
        if binarySearch(0, N-1, item, NList){
            answer.append("1 ")
    }else{
        answer.append("0 ")
    }
}
    return answer
}

func binarySearch(_ left : Int, _ right : Int, _ number : Int, _ array : [Int]) -> Bool{
    var result = false
    if left > right{
        return false
    }
    let middle = (left + right) / 2
    if array[middle] > number{
        result = binarySearch(left, middle-1, number, array)
    }else if array[middle] < number{
        result = binarySearch(middle+1, right, number, array)
    }else{
        return true
    }
    return result
}

print(solution())
