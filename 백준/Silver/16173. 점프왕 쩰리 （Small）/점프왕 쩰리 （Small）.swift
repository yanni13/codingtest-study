import Foundation

let N = Int(readLine()!)! // 맵의 크기
var graph = [[Int]]()

for _ in 0..<N {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    graph.append(row)
}

var visited = Array(repeating: Array(repeating: false, count: N), count: N)

// MARK: BFS
func bfs() -> Bool {
    var queue = [(0, 0)]
    visited[0][0] = true
    
    // 큐가 비었는지 확인 -> 비었다면 큐에서 노드 꺼냄
    while !queue.isEmpty {
        //큐에서 노드 꺼냄
        let (x, y) = queue.removeFirst()
        // 점프할 수 있는 값을 넣음
        let jump = graph[x][y]
        
        // -1 은 오른쪽 아래니까 -1 만나면 true 값 리턴
        if jump == -1 {
            return true
        }
        
        // 오른쪽 이동 경로
        let right = y + jump
        if right < N && !visited[x][right] {
            visited[x][right] = true
            queue.append((x, right))
        }
        
        // 아래 이동 경로
        let down = x + jump
        if down < N && !visited[down][y] {
            visited[down][y] = true
            queue.append((down, y))
        }
    }
    return false
}

print(bfs() ? "HaruHaru" : "Hing")
