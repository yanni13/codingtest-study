
let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]

var board = [[Int]]()
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: M), count: N)
for _ in 0..<N {
    board.append(readLine()!.map { Int(String($0))! })
}

var maxSize = 1

for i in 0..<N {
    for j in 0..<M {
        for size in 1..<min(N,M) {
            if i+size < N && j+size < M {
                let topLeft = board[i][j]
                let topRight = board[i][j+size]
                let bottomLeft = board[i+size][j]
                let bottomRight = board[i+size][j+size]
                
                if topLeft == topRight && topRight == bottomLeft && bottomLeft == bottomRight {
                    maxSize = max(maxSize, size+1)
                }
            }
        }
    }
}
print(maxSize * maxSize)
