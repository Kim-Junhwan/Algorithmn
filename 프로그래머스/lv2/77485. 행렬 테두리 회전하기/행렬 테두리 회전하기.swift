import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var graph : [[Int]] = []
    var answer : [Int] = []
    for row in 0..<rows{
        graph.append(Array(row * columns+1...row*columns+columns))
    }
    for rotation in queries{
        let minY = rotation[0]-1 //0
        let minX = rotation[1]-1 //0
        let maxY = rotation[2]-1 //1
        let maxX = rotation[3]-1 //1
        var numMin = rows*columns
        var blank = graph[minY][maxX]
        //위쪽 좌->우
        for x in (minX+1...maxX).reversed(){
            numMin = min(graph[minY][x-1],numMin)
            graph[minY][x] = graph[minY][x-1]
        }
        
        for y in minY..<maxY{
            numMin = min(graph[y+1][minX],numMin)
            graph[y][minX] = graph[y+1][minX]
        }

        for x in minX..<maxX{
            numMin = min(graph[maxY][x+1],numMin)
            graph[maxY][x] = graph[maxY][x+1]
        }

        for y in (minY+1...maxY).reversed(){
            numMin = min(graph[y-1][maxX],numMin)
            graph[y][maxX] = graph[y-1][maxX]
        }
        numMin = min(blank, numMin)
        graph[minY+1][maxX] = blank
        answer.append(numMin)
    }
    return answer
}
