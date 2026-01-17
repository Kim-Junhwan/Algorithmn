import Foundation

let n = Int(readLine()!)!
var points = [(Int, Int)]()

for _ in 0..<n {
    let parts = readLine()!.split(separator: " ").map { Int($0)! }
    points.append((parts[0], parts[1]))
}

var answer = 0

func distance(x1: Int, y1: Int, x2: Int, y2: Int) -> Double {
    let deltaX = Double(x2 - x1)
    let deltaY = Double(y2 - y1)
    
    // 피타고라스 정리: sqrt(a^2 + b^2)
    return sqrt(pow(deltaX, 2) + pow(deltaY, 2))
}

for i in 0..<points.count {
    for j in i..<points.count {
        for z in j..<points.count {
            var xParell: Bool = false
            var yParell: Bool = false
            if points[i].0 == points[j].0 || points[i].0 == points[z].0 || points[j].0 == points[z].0 {
                xParell = true
            }

            if points[i].1 == points[j].1 || points[i].1 == points[z].1 || points[j].1 == points[z].1 {
                yParell = true
            }

            if !(xParell && yParell) {
                continue
            } 

            let p1 = points[i]
            let p2 = points[j]
            let p3 = points[z]
            
            // 신발끈 공식 (Shoelace Formula) 적용
            // Area = 0.5 * |x1(y2 - y3) + x2(y3 - y1) + x3(y1 - y2)|
            let area = abs(Double(p1.0 * (p2.1 - p3.1) + p2.0 * (p3.1 - p1.1) + p3.0 * (p1.1 - p2.1)))
            
            if area > 0 {
                answer = max(answer, Int(area))
            } else {
                continue
            }
        }
    }
}
print(answer)