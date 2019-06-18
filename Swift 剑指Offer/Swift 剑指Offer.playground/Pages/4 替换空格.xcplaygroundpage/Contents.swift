import Foundation


/*
   请实现一个函数，将一个字符串中的空格替换成“%20”。例如，当字符串为We Are Happy.
   则经过替换之后的字符串为We%20Are%20Happy
 */

class StringReplace {
    func replaceTheBlankSpace(_ str:String,_ replace:String) -> String {
        return str.replacingOccurrences(of: " ", with: replace,options: .literal,range: nil)
    }
    
    func replaceTheBlankSpace_1(_ str:String,_ replace:String) -> String {
        var newStr = ""
        for i in str.enumerated() {
            if i.element == " "{
                newStr.append(replace)
            }else{
                newStr.append(i.element)
            }
        }
        return newStr
    }
    
    func replaceTheBlankSpace_2(_ str:String,_ replace:String) -> String {
       
        var blankCount = 0
        
        for i in str.enumerated() {
            if i.element == " " {
                blankCount += 1
            }
        }
        
        guard blankCount > 0 else {return str}

        let targetLength = str.count + (replace.count - 1) * blankCount
        var l = str.count - 1
        var t = targetLength - 1
        
        var chars = Array<Character>(repeating: "_", count: targetLength)
        var moveCount: Int = 0
        while l >= 0 {
            let start = str.index(str.startIndex, offsetBy: l)
            let end = str.index(str.startIndex, offsetBy: l + 1)
            let char = Character(String(str[start..<end]))
            print("char = \(char)")
            if char == " "{
                chars[t-2...t] = ["%","2","0"]
                t -= 2
            }else{
                chars[t] = char
                moveCount += 1
            }
            l -= 1
            t -= 1
        }
        
        debugPrint(moveCount)
        return String(chars)
    }
    
}


let strReplace = StringReplace()
let str = strReplace.replaceTheBlankSpace("We Are Happy.", "%20")
let str1 = strReplace.replaceTheBlankSpace_1("We Are Happy.", "%20")
let str2 = strReplace.replaceTheBlankSpace_2("We Are Happy.", "%20")
