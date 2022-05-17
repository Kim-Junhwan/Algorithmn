import Foundation

var ans = [0,0]

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var size = brown + yellow
    for width in (1...size-1).reversed(){
        if size%width != 0 {
            continue
        }
        var height = size / width
        var y = (width-2) * (height - 2)
        var b = size - y
        
        if (y == yellow ) && (b == brown){
            ans[0] = width
            ans[1] = height
            break
        }
    }
    return ans
}