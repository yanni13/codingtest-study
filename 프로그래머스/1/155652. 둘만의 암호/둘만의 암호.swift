import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    
    let alphabet = "abcdefghijklmnopqrstuvwxyz".map { String ($0)}
    var s = s.map { String ($0)} //알파벳을 요소로 갖는 배열
    
    for i in 0..<s.count { //s의 문자열만큼 반복 실행
        if var temp = alphabet.firstIndex(of: s[i]) {
        var index = index
            
        while index > 0 {
            temp += 1
            temp %= 26
            
            if skip.contains(alphabet[temp]) { continue }
            
            index -= 1
            s[i] = alphabet[temp]
            
            }
        }
    }
    
    return s.joined()
}