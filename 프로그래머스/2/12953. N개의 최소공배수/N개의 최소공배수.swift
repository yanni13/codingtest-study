func solution(_ arr:[Int]) -> Int {
    var arr = arr
    while arr.count >= 2 {
        let v1 = arr.popLast()!
        let v2 = arr.popLast()!
        arr.append(gcm(v1, v2))
    }

    return arr.first!
}

func gcd(_ b: Int, _ s: Int) -> Int {
    let r = b%s
    return r == 0 ? s : gcd(s, r)
}

func gcm(_ b: Int, _ s: Int) -> Int {
    return b*s / gcd(b, s)
}