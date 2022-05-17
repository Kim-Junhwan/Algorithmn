/**
* 메모리: 79512 KB, 시간: 20 ms
* 2022.05.18
* by Alub
*/
import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = input[0], m = input[1]
    

    func visit(_ values: [Int], _ count: Int) -> Void {
        if count == 1 {
            var result = ""
            for i in values {
                result += "\(i) "
            }
            print(result)
        } else {
            if values.last! > n {
                return
            } else {
                for i in values.last!...n {
                    var nextValues = values
                    nextValues.append(i)
                    visit(nextValues, count-1)
                }
            }
        }
    }
    for i in 1...n {
        visit([i],m)
    }
}

solution()