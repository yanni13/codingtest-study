import Foundation

// 문자열이 회문인지 검사하는 함수
func isPalindrome(_ s: String) -> Bool {
    let chars = Array(s)
    var left = 0
    var right = chars.count - 1

    while left < right {
        if chars[left] != chars[right] {
            return false
        }
        left += 1
        right -= 1
    }
    return true
}

// 문자열이 유사 회문인지 검사하는 함수
func isPseudoPalindrome(_ s: String) -> Bool {
    let chars = Array(s)
    var left = 0
    var right = chars.count - 1

    while left < right {
        if chars[left] != chars[right] {
            // 한 쪽 문자를 건너뛰고 검사
            return isPalindrome(String(chars[left+1...right])) || isPalindrome(String(chars[left...right-1]))
        }
        left += 1
        right -= 1
    }
    return true
}

// 메인 로직
let n = Int(readLine()!)!
for _ in 0..<n {
    let s = readLine()!

    if isPalindrome(s) {
        print(0)
    } else if isPseudoPalindrome(s) {
        print(1)
    } else {
        print(2)
    }
}
