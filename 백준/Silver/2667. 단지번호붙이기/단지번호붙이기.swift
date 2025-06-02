import Foundation

let N = Int(readLine()!)!
var graph = [[Int]]()

for _ in 0..<N {
    let row = Array(readLine()!).map { Int(String($0))! }
    graph.append(row)
}

var visited = Array(repeating: Array(repeating: false, count: N), count: N)
var counts = [Int]()

// BFS 함수
func bfs(_ x: Int, _ y: Int) -> Int {
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    var queue = [(x, y)]
    visited[x][y] = true
    var count = 1
    
    while !queue.isEmpty {
        let (cx, cy) = queue.removeFirst()
        
        for i in 0..<4 {
            let nx = cx + dx[i]
            let ny = cy + dy[i]
            
            if nx >= 0, nx < N, ny >= 0, ny < N {
                if graph[nx][ny] == 1 && !visited[nx][ny] {
                    queue.append((nx, ny))
                    visited[nx][ny] = true
                    count += 1
                }
            }
        }
    }
    
    return count
}

// 전체 탐색
for i in 0..<N {
    for j in 0..<N {
        if graph[i][j] == 1 && !visited[i][j] {
            let result = bfs(i, j)
            counts.append(result)
        }
    }
}

counts.sort()

print(counts.count)
for count in counts {
    print(count)
}
