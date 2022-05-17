import Foundation

var answer : Set<Int> = []

func solution(_ numbers:String) -> Int {
    var numList = numbers.map{String($0)}
    for i in 1...numList.count{
        dfs(numLength: i, depth: 0, array: numList, value: "")
    }
    return answer.count
}

func dfs(numLength : Int, depth : Int, array : [String], value : String){
    if numLength == depth{
        if isPrime(stringNum: value){
            //소수이면 답 list에 추가
            answer.insert(Int(value)!)
        }
    }else{
        for item in 0..<array.count{
            var removedArray = array
            var selectedNum = removedArray.remove(at: item)
            dfs(numLength: numLength, depth: depth+1, array: removedArray, value: "\(value)\(selectedNum)")
            
        }
    }
}


//소수이면 true, 아니면 false
func isPrime(stringNum : String)->Bool{
    var num = Int(stringNum)!
    if num < 2{
        return false
    }else{
        for item in 2..<num{
            if num%item == 0{
                return false
            }
        }
        return true
    }
}