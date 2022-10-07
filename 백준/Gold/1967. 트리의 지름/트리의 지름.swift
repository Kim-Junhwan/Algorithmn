let n = Int(readLine()!)!
var graph = Array(repeating: [(Int,Int)](), count: n+1)

//start로 부터 가장 멀리 떨어진 점을 찾는 함수
func bfs(start: Int) -> (node: Int, dist: Int){
    var visit = Array(repeating: false, count: n+1)
    visit[start] = true

    var queue = [(start,0)]
    var idx = 0
    
    //최대 거리 점/거리가 저장될 변수
    var maxDist = 0
    var maxNode = 0
    
    while queue.count > idx {
        let (curNode, curDist) = queue[idx]
        idx += 1
        
        if curDist >= maxDist {
            maxDist = curDist
            maxNode = curNode
        }
        
        for (nx, dist) in graph[curNode] {
            if !visit[nx] {
                visit[nx] = true
                queue.append((nx,curDist + dist))
            }
        }
    }
    
    return (maxNode,maxDist)
}

for _ in 0..<n-1 {
    let t = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (pNode, cNode, edgeCost) = (t[0],t[1],t[2])
    graph[pNode].append((cNode,edgeCost))
    graph[cNode].append((pNode,edgeCost))
}

//지름의 한쪽 점을 구한다
let diameterDot = bfs(start: 1).node

//지름을 구한다
let diameter = bfs(start: diameterDot).dist
print(diameter)

