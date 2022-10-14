# 점자를 한글로 번역하는 Swift Package Manager💡

### Swift Package Manager
```Swift
dependencies: [
    .package(url: "https://github.com/Bridge-NOONGIL/BrailleToKor.git", .upToNextMajor(from: "1.3.5"))
]
```

### 사용 방법
1. Xcode에서 `Package Dependencies`에서 해당 레포의 URL을 복사해서 검색, 적용
2. `import BrailleToKor`
3. 모듈 내 `translation`함수 입력 값으로 점자 `String` 입력
 ```Swift
  import BrailleToKor
  
  let translate = BrailleToKor.translation("⠘⠪⠐⠕⠄⠨⠕⠀⠉⠛⠈⠕⠂")
  print(translate) //번역 결과가 translate에 string으로 저장됨
 ```
---
### 지원하는 번역 기능
- 한글 점자 문장
- 숫자가 포함된 한글 점자 문장
- 문장 부호
### 추후 지원할 번역 기능
- 수학 기호
- 외국어(영어) 혼용 문장
<br></br>
## Made by: Bridge(브릿지)
| 김나연 | 김세연 | 양유진 |
| :-: | :-: | :-: |
| <img src='https://avatars.githubusercontent.com/u/76769919?v=4' width='150px' height='150px' alt='avatar'/><br/><b>[n-y-kim](https://github.com/n-y-kim)</b> | <img src='https://avatars.githubusercontent.com/u/48678324?v=4' width='150px' height='150px' alt='avatar'/><br/><b>[080101](https://github.com/080101)</b> | <img src='https://avatars.githubusercontent.com/u/70887135?v=4' width='150px' height='150px' alt='avatar'/><br/><b>[uujinn](https://github.com/uujinn)</b> |

#### 문의 사항, 에러 확인 및 풀리퀘는 언제나 환영입니다.
