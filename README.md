# Clone MegaCoffee App Project
> **UI위주로 구현 Clone Mega Coffee UI App Study입니다.**
&nbsp;


</br>

## 🤝_ 프로젝트 목표
1. 깃을 통한 협업과정 익혀보기
2. 
&nbsp;



</br>

## 💻  _ Developers 

| Name | link | Part |
| :---: | :---: | :---: |
| 박기우 | https://github.com/KiWooPark | 메가오더 |
| 원준연 | https://github.com/chobo5 | 선물하기 |
| 이지훈 | https://github.com/hooni0918 | 메인페이지 |
| 김성호 | https://github.com/KemiKIM | 더보기 |



</br>

## 🎯 _ 개발 목표 기간
`2022.10.05` ~ `2022.12.05`
&nbsp;



</br>

## 🛠  _ Development Environment & Simulator
- iOS `15.5` 
- XCode `13.4`, `13.4.1`
&nbsp;


</br>


#### 📚 _ Library

| 라이브러리        | Version | Tool |
| ----------------- | :-----: | ----- |
| nil       | `0.0.0` | `CocoaPod` |
| nil       | `0.0.0` | `CocoaPod` |
| nil       | `0.0.0` | `CocoaPod` |





</br>

## 🗂 _ Foldering
&nbsp;


</br>

## 🌳  _ Git Branch & Source Tree

개별 브랜치 관리 및 병합의 안정성을 위해 `Git Forking & Source Tree WorkFlow`를 적용했습니다.
&nbsp;



### 💁‍♂️ _ Git forking workflow 적용

1. 방장 프로젝트 repo를 Fork합니다.(이하 방장 repo = 방장 develop)
2. Fork한 개인 repo(이하 개인 repo)를 clone합니다. (Desktop에 빈 folder를 만들어서 clone)
3. Source Tree에 개인 repo 주소를 추가하고, 원격저장소에 방장 repo 주소를 추가합니다.
4. 이제 신경써야할 branch는 방장 develop, 개인 develop, 개인 branch 입니다.

🟡🟡🟡🟡🟡 소스트리 작업 하기 전 필수 사항! 🟡🟡🟡🟡🟡
1. ⭐️ 필수 ⭐️ 현재 브런치를 확인합니다. (개인 develop)
2. 방장 develop(원격)에서 개인 develop(로컬)으로 pull합니다.
3. 개인 develop에서 개인 develop으로 push합니다.
4. 개인 branch로 branch를 변경합니다.
5. 개인 branch에서 개인 develop에 있는 작업물을 pull합니다.
6. 개인 branch에서 개인 branch으로 push합니다.
7. 본인의 작업물을 확인합니다. (자신의 작업물과 pull로 땡겨온 작업물이 공존하고, build가 되는지.)
8. 이상이 없다면, 개인 branch에서 개인 branch로 push합니다.
9. 개인 develop으로 branch를 변경합니다.
10. 개인 develop에서 개인 branch를 pull로 땡겨옵니다.
11. 개인 devleop에서 개인 develop으로 push합니다.
12. 자신의 git fork 저장소로 접속합니다. (website)
13. pull request를 누른 후 정상적으로 머지가 된다는 표시를 확인하고 pull request 요청을 보냅니다.
14. 방장이 확인 후 merge합니다.

15. 모든 인원의 작업물이 합쳐지고, 방장 develop에서 정상적으로 되는지 확인되면, 최종 결과물을 main branch로 이동합니다.
&nbsp;


</br>

## 💪 _ 10월 개인별 일정

- **박기우**

| 기간 | 구현 목표 | `완료` `미완료` `노력필요` `생각중` | 보완점(간단히) |
|:---:|:---:|:---:|:---:|
|`10.06-10.12`| 1. 매장선택 뷰 구현 </br>2. 주문하기 팝업 뷰 구현 </br>3. 주문하기 뷰 구현 </br> | `완료` </br>`완료` </br>`미완료` | 영업중, 준비중 분기 구현 </br>맵뷰 수정 </br>- |
|`10.13-10.19`| 입력해주세요. | `노력필요` | 입력해주세요. |
|`10.20-10.26`||||
|`10.27-11.02`||||
  

&nbsp;
- **원준연**

| 기간 | 구현 목표 | `완료` `미완료` `노력필요` `생각중` | 보완점(간단히) |
|:---:|:---:|:---:|:---:|
|`10.06-10.12`| 입력해주세요. | `완료` | 입력해주세요. |
|`10.13-10.19`| 입력해주세요. | `노력필요` | 입력해주세요. |
|`10.20-10.26`||||
|`10.27-11.02`||||
  

&nbsp;
- **이지훈**

| 기간 | 구현 목표 | 완료 미완료 노력필요 생각중 | 보완점(간단히) |
| --- | --- | --- | --- |
| `10.06-10.12` | 1.MainHead 사진 구현 </br>2. 스탬프,쿠폰 button 구현 </br> | `완료` | 입력해주세요. |
| `10.13-10.19` | 입력해주세요. | 노력필요 | 입력해주세요. |
| `10.20-10.26` | 1.Event 배너 이미지스와이프에서 화면전환으로 수정 </br>2. 메뉴추천 기본틀 제작 </br>3. 새소식 기본틀 제작|’노력필요’|collectionView 여러개를 가질때 연결법 | `노력필요` |  |
| `10.27-11.02` | 1. compositional layout 구성(메인화면) 2. 바코드 화면 구현 3.  | `완료` | 바코드 계층문제(alpha) 해결
compositional 사용할지 결정 |
| `11.02-11.09` | 1. 바코드 view 계층문제 해결 2. 알람 table 구현완료  | `완료` |  |
| `11.10-11.17` | 1. gif 사용 문제 해결 2. stamp 화면 1페이지 완료
3.쿠폰 page Segment Control 사용 예정 | 노력필요 | 마지 실수로 파일 이전파일 전체삭제..
**무조건 커밋하고 푸시하기…!** |
| `11.18-11.25` | 1. stamp 이미지, 내부 이름 구현완료 2. 쿠폰page와 알람 page didselect 연결완료
3. main 화면 기본 view 전체 구성완료   | 노력필요 | composiotional 사용 안하고 전체 구성완료. didselect 하고 popup과 각 페이지 연결하기 |
| `11.26-12.05` | 1. recommend popupView Push, Dismiss 완료 | 노력필요 | 나머지 페이지 연결하기( 배너, 공지사항,뉴스), segment control로 쿠폰 1단계, 스탬프 2단계 완성하기 |
| `12.05-12.14` | 1. segmentcontrol 로 Stamp 화면 구성 완료
2. collectionView 로 cell 바꿔치기로 쿠폰기록 구현하기
3. PopupView 각 page와 연결하기(dissmiss후 present) | 노력필요 | 디테일 구조 잡기 |
| `이후` | 1. 디테일 잡기,
2. view 끼리 연결 완료하기(분기처리된곳)
3. DummyData 구조체로 묶어서 MVC 모델 완성하기
 | 생각중 |  |
  

&nbsp;
- **김성호**

| 기간 | 구현 목표 | `완료` `미완료` `노력필요` `생각중` | 보완점(간단히) |
|:---:|:---:|:---:|:---:|
|`10.01-10.05`| nickname님까지 구현 | `완료` | code정리가 필요합니다. |
|`10.06-10.12`| 1. collectionView</br>로 이미지 애니메이션 구현.</br>2. view의</br>좌우여백 및</br>UI일부수정하기. | `생각중`</br>`노력필요` |1. AD우측하단</br>(현재갯수/총갯수) </br>표시 구현</br>2. currentIndex를 인지하고</br>다음으로 넘기는 기능|
|`10.13-10.19`| 1. collectionview</br>밑 내용 tableview로</br>구현하기 |`-`| nil |
|`10.20-10.26`| nil |`-`| nil |
|`10.27-11.02`| nil |`-`| nil |
