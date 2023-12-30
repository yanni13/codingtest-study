import Foundation

let map_size = readLine()!.split(separator:" ").map {Int(String($0))!}
let (n,m) = (map_size[0], map_size[1])

var graph = [[Int]]()
for _ in 0..<n {
    graph.append(readLine()!.map {Int(String($0))! })
}

func dfs(_ x:Int, _ y:Int) -> Bool {
    if (x <= -1 || x >= n || y <= -1 || y >= m) {
        return false
    }

    if graph[x][y] == 0 {
        graph[x][y] = 1 //해당 노드 방문 처리

        //상하좌우 탐색
        dfs(x-1, y)
        dfs(x, y-1)
        dfs(x+1, y)
        dfs(x, y+1)
        
        return true //주변이 다 막혀있으면 종료
    }
    return false
}

var result = 0

for i in 0..<n {
    for j in 0..<m {
        if dfs(i,j) {
            result += 1
        }
    }
}

print(result)