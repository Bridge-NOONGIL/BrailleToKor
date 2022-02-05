//
//  main.swift
//  NumberBraille
//
//  Created by 양유진 on 2021/11/09.
//

import Foundation

let number_braille = "⠼"

let number_braille_dict = ["⠚": "0", "⠁": "1", "⠃": "2", "⠉": "3", "⠙": "4", "⠑": "5", "⠋": "6", "⠛": "7", "⠓": "8", "⠊": "9"]

let number_punctuation_invalid = ["~", " ", "⠀"] // 수표 효력 무효
let number_punctuation_valid = [":", "-", ".", "·", "⠲", "⠐","⠤"] // 수표 효력 유효


func translateNumber(text: String) -> String{
    var result = ""
    var isdigit = false
    for i in 0...text.count - 1{
        if String(text[i]) == number_braille { // 수표 만나면
            isdigit = true
            continue
        }else if number_punctuation_valid.contains(String(text[i])) && isdigit{ // 수표 O & 효력 유효
            if text[i] == "⠲"{
                result += "."
            }else if text[i] == "⠐"{
                result +=  ","
            }else{
                result += String(text[i])
            }
            isdigit = true
            continue
        }else if number_punctuation_invalid.contains(String(text[i])){ // 수표 O & 효력 무효 만남
            result += String(text[i])
            isdigit = false
            continue
        }else if number_braille_dict["\(String(text[i]))"] != nil && isdigit{ // 수표 O && 숫자
            result += changeToNumber(c: text[i])
            isdigit = true
            continue
        }else{ // 기타 점자
            isdigit = false
            result += String(text[i])
            continue
        }
    }
    
    return result
        
}

func changeToNumber(c: Character) -> String {
    
    var translatedNumber = ""
    translatedNumber = number_braille_dict[String(c)]!
    
    return translatedNumber
}

