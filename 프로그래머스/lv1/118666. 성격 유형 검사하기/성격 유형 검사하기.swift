import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var mbtiTable : [String : Int] = ["R":0,"T":0,"C":0,"F":0,"J":0,"M":0,"A":0,"N":0]
    var currentIndex = 0
    var answer = ""
    //bmtiTable에 survey에 포함된 성격 유형 넣기
    survey.map{$0.unicodeScalars.map(String.init)}.map{mbtiTable[$0[0]] = 0; mbtiTable[$0[1]] = 0}
    choices.map{ score in
        if score != 4{
            if score < 4{
                var target = survey[currentIndex].unicodeScalars.map(String.init)[0]
                mbtiTable[target] = mbtiTable[target]! + (4 - score)
            }
            else if score > 4{
                var target = survey[currentIndex].unicodeScalars.map(String.init)[1]
                mbtiTable[target] = mbtiTable[target]! + (score - 4)
            }
        }
        currentIndex += 1
    }
    
    answer.append(returnBig(first: "R", second: "T", mtbiTable: mbtiTable))
    answer.append(returnBig(first: "C", second: "F", mtbiTable: mbtiTable))
    answer.append(returnBig(first: "J", second: "M", mtbiTable: mbtiTable))
    answer.append(returnBig(first: "A", second: "N", mtbiTable: mbtiTable))
    return answer
}


func returnBig(first : String, second : String , mtbiTable : [String: Int])->String{
    if mtbiTable[first]! < mtbiTable[second]!{
        return second
    }
    else if mtbiTable[first]! > mtbiTable[second]!{
        return first
    }
    else{
        return first
    }
}
