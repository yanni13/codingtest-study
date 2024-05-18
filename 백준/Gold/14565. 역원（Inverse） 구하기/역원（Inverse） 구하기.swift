var input = readLine()!.split(separator: " ").map { Int(String($0))! }

var N = input[0]
var A = input[1]
var b = 0
var c = 0

func extendedGCD(_ a: Int, _ b: Int) -> (Int, Int, Int) {
    if b == 0 {
        return (a, 1, 0)
    } else {
        let (g, x, y) = extendedGCD(b, a % b)
        return (g, y, x - (a / b) * y)
    }
}

func modInverse(_ a: Int, _ n: Int) -> Int {
    let (g, x, _) = extendedGCD(a, n)
    if g != 1 {
        return -1  
    }
    return (x % n + n) % n  
}

b = (N-A)%N
c = modInverse(A, N)

print(b, c)

