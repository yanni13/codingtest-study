
let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = input[0]
let M = input[1]

var graph = [[Int]]()

for _ in 0..<N {
    let map = readLine()!.split(separator: " ").map { Int($0)! }
    graph.append(map)
}


func bfs(_ x: Int, _ y: Int) -> Int {
    let dx = [-1, -1, -1,  0, 1, 1,  1,  0] // 대각선도 허용
    let dy = [-1,  0,  1,  1, 1, 0, -1, -1] // 대각선도 허용
    
    var visited = Array(repeating: Array(repeating: false, count: M), count: N)

    var queue = [(x,y, 0)]
    visited[x][y] = true
    
    while !queue.isEmpty {
        let (cx, cy, dist) = queue.removeFirst()
        
        if graph[cx][cy] == 1 {
            return dist
        }
        for i in 0..<8 {
            let nx = cx + dx[i]
            let ny = cy + dy[i]
            
            if nx >= 0, ny >= 0, nx < N, ny < M {
                if !visited[nx][ny] {
                    visited[nx][ny] = true
                    queue.append((nx, ny, dist+1))
                }
            }
        }
    }
    return -1
}

var result = 0

// 그 중에서 최대값을 찾아야 함
for i in 0..<N {
    for j in 0..<M {
        if graph[i][j] == 0 {
            result = max(result, bfs(i, j))
        }
    }
}

print(result)
