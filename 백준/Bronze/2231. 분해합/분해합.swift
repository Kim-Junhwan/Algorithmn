import Foundation

var num = Int(readLine()!)

func solution(input : Int) -> Int{
for item in input/2...input{
    var intToString = String(format: "%d", item).unicodeScalars.map(String.init)
    if (item + intToString.reduce(0) { Int($0)+Int($1)!}) == num{
        return item
    }
}
    return 0
}

print(solution(input: num!))
