let n = Int(readLine()!)!
var papers = [(x: Int, y: Int)]()
var minY = Int.max
var minX = Int.max

for _ in 0..<n {
    let parts = readLine()!.split(separator: " ").map { Int(String($0))! }
    papers.append((x: parts[0], y: parts[1]))
    minY = min(minY, parts[1])
    minX = min(minX, parts[0])
}

var map: [[Bool]] = Array(repeating: Array(repeating: false, count: 200), count: 200)

for paper in papers {
    let y = paper.1 - minY
    let x = paper.0 - minX
    for i in y..<y+8 {
        for j in x..<x+8 {
            map[i][j] = true
        }
    }
}

print(map.flatMap{$0}.filter{$0}.count)