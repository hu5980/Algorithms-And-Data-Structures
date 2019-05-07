import Foundation


/*
   请实现一个函数，将一个字符串中的空格替换成“%20”。例如，当字符串为We Are Happy.
   则经过替换之后的字符串为We%20Are%20Happy
 */

class StringReplace {
    func replaceTheBlankSpace(_ str:String,_ replace:String) -> String {
        return str.replacingOccurrences(of: " ", with: replace,options: .literal,range: nil)
    }
}


let strReplace = StringReplace()
let str = strReplace.replaceTheBlankSpace("We Are Happy.", "%20")
