import Foundation
var count = 0
var sb = ""
var num = Int(readLine()!)!
hanoi(n: num, start: 1, mid: 2, to: 3)
print(count)
print(sb)
func hanoi(n: Int, start: Int, mid: Int, to:Int){
    if(n==1){
        sb.append("\(start) \(to)\n")
        count+=1
        return
    }
    hanoi(n: n-1, start: start, mid: to, to: mid)
    sb.append("\(start) \(to)\n")
    count+=1
    hanoi(n: n-1, start: mid, mid: start, to: to)
    
}
