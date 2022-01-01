//public struct BrailleToKor {
//    public private(set) var text = "Hello, World!"
//
//    public init() {
//    }
//}
import Foundation

public class BrailleToKor{
    public init() {}
    
    static let CHO:[Character] = ["ㄱ","ㄲ","ㄴ","ㄷ","ㄸ","ㄹ","ㅁ","ㅂ","ㅃ","ㅅ","ㅆ","ㅇ","ㅈ","ㅉ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"]

    static let JUNG:[Character] = ["ㅏ", "ㅐ", "ㅑ", "ㅒ", "ㅓ", "ㅔ", "ㅕ", "ㅖ", "ㅗ", "ㅘ", "ㅙ", "ㅚ", "ㅛ", "ㅜ", "ㅝ", "ㅞ", "ㅟ", "ㅠ", "ㅡ", "ㅢ", "ㅣ"]

    static let JONG:[Character] = [" ", "ㄱ", "ㄲ", "ㄳ", "ㄴ", "ㄵ", "ㄶ", "ㄷ", "ㄹ", "ㄺ", "ㄻ", "ㄼ", "ㄽ", "ㄾ", "ㄿ", "ㅀ", "ㅁ", "ㅂ", "ㅄ", "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"]

    static let JONG_DOUBLE = [
        "ㄲ":"ㄱㄱ","ㄳ":"ㄱㅅ","ㄵ":"ㄴㅈ","ㄶ":"ㄴㅎ","ㄺ":"ㄹㄱ","ㄻ":"ㄹㅁ",
        "ㄼ":"ㄹㅂ","ㄽ":"ㄹㅅ","ㄾ":"ㄹㅌ","ㄿ":"ㄹㅍ","ㅀ":"ㄹㅎ",
        "ㅄ":"ㅂㅅ"
    ]

    // 전체 문장 번역
    public class func translation(_ input: String) -> String{
        var result = ""
        let startTime = CFAbsoluteTimeGetCurrent()
        // 점자 빈칸, 그냥 빈칸
        
        let numbertranslatedInput = translateNumber(text: input)
        let components = numbertranslatedInput.components(separatedBy: ["⠀"," "])
        
        
        let punctuationTranslatedWords = translatePunc(words: components)
        
//        let englishTranslatedWords = translateEng(words: punctuationTranslatedWords)
        
//        print(components)
        for word in punctuationTranslatedWords{
//            let numberTranslateWords = translateNumber(text: word)
            result += brailleTosyllable(word)
            result += " "
        }
        let durationTime = CFAbsoluteTimeGetCurrent() - startTime
        print(durationTime)
        return result
    }
    
    private class func isBraille(_ input: String) -> Bool{

        for i in input.utf16{
            if i >= 10240 && i <= 10303{
                return true
            }else{
 
                return false
            }
        }

        return false
    }
    
    // 끊은 '단어' 점자를 한글로 바꾸는 역할
    private class func brailleTosyllable(_ word: String) -> String{
        
        var brailleWord = word // brailleWord로 번역을 함
        
        var abb_braille = "" // 약어 점자
        var abb_kor = "" // 약어
        
        var wordResult = "" // 번역 결과
        
        var cho = "" // 초성
        var jung = "" // 중성
        var jong = "" // 종성
        
        // 초성/중성/종성 정해졌다는 flag
        var selectedCho = false
        var selectedJung = false
        var selectedJong = false
        
        //ㅖ+받침있을때 flag(continue 두 번 하기 위해서)
        var ye_jong = false
        
        // 껏의 된소리표 flag
        var flag_14 = false
        
        var last = brailleWord.count - 1 // 마지막 음절의 인덱스

        // 단어 자체가 약어라면 바로 점자로 번역해서 리턴
        if abb_word_list[word] != nil{
            wordResult += abb_word_list[word]!
            return wordResult
        }
        else { // 단어에 약어가 포함
            for (key,value) in abb_word_list{
                if word.contains(key){
                    abb_braille = key
                    abb_kor = value
                }
            }

            if abb_braille != "" { // 약어 포함되어있다면
                // [다만] 위에 제시된 말들의 앞에 다른 음절이 붙어 쓰일 때에는 약어를 사용하여 적지 않는다.
                if word[0] != abb_braille[0]{ // 종성이 가장 먼저 오는 경우 X

                }else{
                    wordResult += abb_kor
                    brailleWord = brailleWord.replacingOccurrences(of: "\(abb_braille)", with: "")
                    last = brailleWord.count - 1 // 갱신
                }
            }
            
        }


        for i in 0..<brailleWord.count{
            var letter_front = ""
            let letter = String(brailleWord[i])
            var letter_back = ""
            var letter_back_back = ""
            
            let letter_isBraille = isBraille(letter)
            var letter_back_isBraille = false
            var letter_back_back_isBraille = false
            
            if !letter_isBraille {
                
                wordResult += letter
                continue
                
            }
            
            if i > 0 {
                letter_front = String(brailleWord[i-1])
            }
            
            if i < last {
                letter_back = String(brailleWord[i+1])
                letter_back_isBraille = isBraille(letter_back)
            }
            if i < last - 1 {
                letter_back_back = String(brailleWord[i+2])
                letter_back_back_isBraille = isBraille(letter_back_back)
            }
            
            if letter == "⠤"{ // 붙임표면 pass
                cho = ""
                jung = ""
                jong = ""
                selectedCho = false
                selectedJung = false
                selectedJong = false
                continue
            }
            
            if flag_14{ // 껏 flag
                flag_14 = false
                continue
            }
            
            // 것, 껏 처리
            if (letter == "⠠" && abb_cho_jung_jong[letter_back + letter_back_back] != nil){ // 껏
                cho = "ㄲ"
                jung = "ㅓ"
                jong = "ㅅ"
                selectedCho = true
                selectedJung = true
                selectedJong = true
                flag_14 = true // 된소리표 pass
                continue
            }else if (!selectedCho) && (abb_cho_jung_jong[letter+letter_back] != nil){ // 것
                cho = "ㄱ"
                jung = "ㅓ"
                jong = "ㅅ"
                selectedCho = true
                selectedJung = true
                selectedJong = true
                continue
            }
            
            if ye_jong {
                ye_jong = false
                continue
            }
            
            // 초성 처리
            if !selectedCho {
                // 초성 없이 중성이 먼저 나오는 경우
                if jung_braille[letter] != nil{ // 초성 'ㅇ'
                    cho = "ㅇ"
                    selectedCho = true
                    selectedJung = true
                    
                    if double_jung_braille[letter+letter_back] != nil{
                        jung = double_jung_braille[letter+letter_back]!
                        if jong_braille[letter_back_back] == nil{ // 이중 중성 + 종성이 없는 경우
                            jong = " "
                            selectedJong = true
                        }
                        continue
                    }
                    else{ // 기본 중성일 때
                        jung = jung_braille[letter]!
                    }

                    

                    if jong_braille[letter_back] == nil{ // letter_back이 종성이 아닐 때
                        jong = " " // 종성이 없음
                        selectedJong = true
                    }else{
                        continue
                    }
                }

                else if abb_jung_jong_list[letter] != nil { //초성 ㅇ이고 letter가 중+종 약자일때

                    cho = "ㅇ"
                    selectedCho = true

                    jung = abb_jung_jong_list[letter]![0]
                    jong = abb_jung_jong_list[letter]![1]

                    selectedJung = true
                    selectedJong = true
                    
                    if jong_braille[letter_back] != nil { //letter_back이 종성일때 => 겹받침
                        jong = double_jong_braille[jong+letter_back] ?? ""
                        continue
                    }
                }
                
                // 'ㅏ' 약자일 때 - 초성 리스트에 존재하고(이 때 'ㄱ','ㄹ','ㅅ' 제외, letter_back이 초성이거나 종성일 때)
                else if abb_cho_braille[letter] != nil && ((cho_braille[letter_back] != nil || jong_braille[letter_back] != nil || i == last || letter_back == "⠫" || letter_back == "⠇" || letter_back == "⠤") || !letter_back_isBraille) {
                    cho = cho_braille[letter]!
                    jung = "ㅏ"
                    selectedCho = true
                    selectedJung = true

                    if letter_back == "⠌"{
                        
                        if jong_braille[letter_back_back] != nil{ // ex) 톈 case 해결 위해
                            jung = "ㅖ"
                            //jong = jong_braille[letter_back_back]!
                            ye_jong = true
                            continue
                        }

                        if cho == "ㅎ"{
                            jung = "ㅖ"
                            jong = " "
                        }else{
                            jung = "ㅏ"
                            jong = "ㅆ"
                        }

                        selectedJong = true
                        continue
                    }

                    else if letter_back == "⠤"{ // 초성처리에서 letter_back이 붙임표일 때 음절 완성
                        jong = " "
                        selectedJong = true
//                        continue
                    }
                    
                    else if jong_braille[letter_back] == nil{
                        jong = " "
                        selectedJong = true
                    }
                    
                }
                
                else if abb_cho_list[letter] != nil { //'가', '사'
                    cho = abb_cho_list[letter]![0]
                    jung = "ㅏ"
                    selectedCho = true
                    selectedJung = true

                    if letter_back == "⠌" { //뒤에 3,4점
                        jung = "ㅏ"
                        jong = "ㅆ"

                        selectedJong = true
                        continue
                    }

                    else if jong_braille[letter_back] == nil { //뒤에 뒤에 종성이 없을
                        jong = " "
                        selectedJong = true
                    }
                }

                else if letter == "⠠" { //6점(된소리)
                    //'ㅏ' 약자(까, 싸 제외)
                    if abb_cho_braille[letter_back] != nil && ((cho_braille[letter_back_back] != nil || jong_braille[letter_back_back] != nil || i+1 == last || letter_back_back == "⠫" || letter_back_back == "⠇") || !letter_back_back_isBraille) {
                        cho = cho_braille[letter+letter_back]!
                        jung = "ㅏ"
                        selectedCho = true
                        selectedJung = true

                        if letter_back_back == "⠌" { //땄 같은 경우
                            jong = "ㅆ"
//                            selectedJong = true
                            continue
                        }

                        else if jong_braille["\(letter_back_back)"] == nil { //종성이 없을때. 따.
                            jong = " "
                            selectedJong = true
                        }
                    }
                
                    
                    else if abb_cho_list[letter_back] != nil{ // 까, 싸 - letter_back이 가, 사 일 때
                        
                        cho = abb_cho_list[letter+letter_back]?[0] ?? ""
                        jung = abb_cho_list[letter+letter_back]?[1] ?? ""
                        
                        selectedCho = true
                        selectedJung = true

                        if letter_back_back == "⠌"{
                            jong = "ㅆ"
//                            selectedJong = true
                        }
                        
                        if jong_braille[letter_back_back] == nil {
                            jong = " "
                            selectedJong = true
                        }
                        
                    }

                    else if cho_braille[letter_back] == nil{ // 된소리가 아니라 'ㅅ'일 때
                        cho = cho_braille[letter] ?? ""
                        selectedCho = true
                    }

                    else if cho_braille["\(letter_back)"] != nil{ // 된소리 + 초성
                        cho = double_cho_braille[letter + letter_back] ?? ""
                        selectedCho = true
                    }
                    
                    continue
                }
                else if cho_braille[letter] != nil{
                    cho = cho_braille[letter]!
                    selectedCho = true
                }else{
                    continue
                }
            }
            
            // 중성 처리
            if selectedCho && !selectedJung{

                if abb_jung_jong_list[letter] != nil { //중성 + 종성 약자
                    jung = abb_jung_jong_list[letter]![0]
                    jong = abb_jung_jong_list[letter]![1]

                    selectedJung = true
                    selectedJong = true

                    if double_jong_braille[jong+letter_back] != nil { //이중 종성(겹받침)
                        jong = double_jong_braille[jong+letter_back]!
                        continue
                    }

                }

                else if jung_braille[letter] != nil { //중성일때
                    jung = jung_braille[letter]!
                    selectedJung = true
                    

                    if double_jung_braille[letter+letter_back] != nil{ // 이중 중성
                        jung = double_jung_braille[letter+letter_back]!
                        
                        if jong_braille[letter_back_back] == nil {
                            jong = " "
                            selectedJong = true
                        }

                        continue
                    }
                    else if jong_braille[letter_back] == nil { // 중성 + 종성이 없는 경우
                        jong = " "
                        selectedJong = true
                    }
                    else if jong_braille[letter_back] != nil{ // 종성이 있으면 continue
                        continue
                    }
                }
                
            }
            
            // 종성 처리
            if selectedCho && selectedJung && !selectedJong{
                if jong_braille[letter] != nil {
                    jong = jong_braille[letter]!
                    selectedJong = true
                    
                    if double_jong_braille[jong+letter_back] != nil { //이중 종성
                        jong = double_jong_braille[jong+letter_back]!
                        continue
                    }
                }
            }
        
            // 음절 완성
            if selectedCho && selectedJung && selectedJong{
                // 제 16항: '성, 썽, 정, 쩡, 청'은 'ㅅ,  ㅆ,  ㅈ,  ㅉ,  ㅊ’  다음에  'ㅕㅇ'의 약자를 적어 나타낸다.
                if (cho == "ㅅ" || cho == "ㅆ" || cho == "ㅈ" || cho == "ㅉ" || cho == "ㅊ") && jung == "ㅕ" && jong == "ㅇ"{
                    jung = "ㅓ"
                }
//                print("wordResult: \(wordResult)")
                wordResult += String(JamoCombination(c1: Character(cho), c2: (Character(jung)), c3: Character(jong))!)
                
                selectedCho = false
                selectedJung = false
                selectedJong = false
                cho = ""
                jung = ""
                jong = ""

            }
            
        }
        
        return wordResult
    }
    
//MARK: - COMBINATION
    private class func JamoCombination(c1:Character,c2:Character,c3:Character) -> Character? {
            var cho_i = 0
            var jung_i = 0
            var jong_i = 0

            // 초성
            for i in 0 ..< CHO.count {
                if CHO[i] == c1 {
                    cho_i = i
                }
            }
            let choValue = cho_i*21*28


            // 중성
            for i in 0 ..< JUNG.count {
                if JUNG[i] == c2 {
                    jung_i = i
                }
            }
            let jungValue = jung_i * 28


            // 종성
            for i in 0 ..< JONG.count
            {
                if JONG[i] == c3
                {
                    jong_i = i
                }

            }
            var jongValue = 0

            // 종성이 없으면
            if jong_i == 0{
                jongValue = 0
            }else{ // 종성이 있으면
                jongValue += jong_i
            }

            let uniValue:Int = choValue + jungValue + jongValue + 0xAC00

            if let uni = Unicode.Scalar(uniValue) {
                return Character(uni)
            }
            return nil

    }
}
