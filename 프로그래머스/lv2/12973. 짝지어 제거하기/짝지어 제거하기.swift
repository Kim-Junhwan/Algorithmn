
import Foundation

func solution(_ s:String) -> Int{
    var str = Array(s)
    var result : [Character] = []
    let leng = str.count
    for item in 0..<leng{
        if !result.isEmpty && result.last == str[item]{
            result.removeLast()
        }else{
            result.append(str[item])
        }
    }
    return result.isEmpty ? 1 : 0
}
