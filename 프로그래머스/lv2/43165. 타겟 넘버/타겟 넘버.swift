import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var result = 0
    result += dfs(deep: 1, sign: 1, sum: 0, numbers: numbers, target: target)
    result += dfs(deep: 1, sign: -1, sum: 0, numbers: numbers, target: target)
    return result
}

func dfs(deep : Int, sign : Int, sum : Int, numbers : [Int], target : Int)->Int{
    var result = 0
    let num = sum + (sign*numbers[deep-1])
        if deep == numbers.count{
        if target == num{
            result += 1
        }
    }else{
        result += dfs(deep: deep+1, sign: 1, sum: num, numbers: numbers, target: target)
        result += dfs(deep: deep+1, sign: -1, sum: num, numbers: numbers, target: target)
    }
    return result
}