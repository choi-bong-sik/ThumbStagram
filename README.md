# ThumbStagram
인스타그램 API 를 활용한 toy 프로젝트

## 1. Instagram API
* 인증
> 인스타그램에 로그인 하여 token 을 발급받는다.
> https://api.instagram.com/oauth/authorize/
* 미디어조회
> 사용자가 업로드한 미디어를 json 형태로 내려준다.
> https://api.instagram.com/v1/users/self/media/recent/


## 2. OPEN SOURCE
cocoapod 을 이용해 오픈소스를 관리한다.
* Alamofire
> 인스타그램 api 통신(.get)에 사용한다.
* KeychainAccess
> 인증시 발급된 토큰을 keychain 에 저장하는데 사용한다.
* Player
> 사용자 미디어중 동영상을 표현하기 위해 사용한다.
* Toast-Swift
> 토스트와 indicator 를 표현하기 위해 사용한다.

## 3. PROJECT 구조
> Extensions
> Views
> Models
> ViewControllers
> Network
