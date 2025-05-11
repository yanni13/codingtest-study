import Foundation

func solution(_ maps: [String]) -> Int {
    let board = maps.map { Array($0) }
    let rows = board.count
    let cols = board[0].count
    let directions = [(0,1), (1,0), (0,-1), (-1,0)]
    
    func bfs(from start: (Int, Int), to target: Character) -> Int? {
        var visited = Array(repeating: Array(repeating: false, count: cols), count: rows)
        var queue: [(Int, Int, Int)] = [(start.0, start.1, 0)]
        visited[start.0][start.1] = true
        
        while !queue.isEmpty {
            let (r, c, dist) = queue.removeFirst()
            if board[r][c] == target {
                return dist
            }
            for (dr, dc) in directions {
                let nr = r + dr, nc = c + dc
                if nr >= 0, nr < rows, nc >= 0, nc < cols,
                   !visited[nr][nc], board[nr][nc] != "X" {
                    visited[nr][nc] = true
                    queue.append((nr, nc, dist + 1))
                }
            }
        }
        return nil
    }
    
    var start: (Int, Int)?
    var lever: (Int, Int)?
    
    for i in 0..<rows {
        for j in 0..<cols {
            if board[i][j] == "S" {
                start = (i, j)
            } else if board[i][j] == "L" {
                lever = (i, j)
            }
        }
    }
    
    guard let s = start, let l = lever else {
        return -1
    }
    
    guard let toLever = bfs(from: s, to: "L") else {
        return -1
    }
    
    guard let toEnd = bfs(from: l, to: "E") else {
        return -1
    }
    
    return toLever + toEnd
}
