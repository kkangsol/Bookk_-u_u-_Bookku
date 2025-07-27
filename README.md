
# 북끄북끄 도서관 관리 미니 웹 페이지

- 자바, HTML, 람다, JPA로 만든 조용하고 귀여운 책 대여 시스템
- "부끄부끄(_u_u_)하게 책을 빌리고 싶은 사람들을 위한 프로젝트"

  <br>

### 👨‍👩‍👧‍👦 팀원 소개

| <img src="https://github.com/kkangsol.png" width="100"> | <img src="https://github.com/kohtaewoo.png" width="100"> | <img src="https://github.com/kddmmm.png" width="100"> | <img src="https://github.com/ottffss1005.png" width="100"> |
|:--:|:--:|:--:|:--:|
| **강한솔**  <br> [@kkangsol](https://github.com/kkangsol) | **고태우**  <br> [@kohtaewoo](https://github.com/kohtaewoo) | **김동민**  <br> [@kddmmm](https://github.com/kddmmm) | **최소영**  <br> [@ottffss1005](https://github.com/ottffss1005) |

<br>

## 📌 프로젝트 개요

- **목표**: JPA, JSP, MySQL 실습 및 간단한 데이터 CRUD와 웹사이트 구현
- **설명**:
  - 도서관의 도서 정보를 서버에 저장 및 불러올 수 있음
  - 사용자는 도서 목록을 확인하고 제목 / 저자 / 카테고리 별로 검색 가능
  - 도서 정보를 직접 등록할 수 있는 기능도 구현
<br>
> <img width="573" height="720" alt="Image" src="https://github.com/user-attachments/assets/87792bd3-77dd-4d96-91bd-3b24b711e0db" />

---

## 📂 사용 데이터

- **출처**: [공공 데이터 포탈 - 성남시 미디어센터 도서정보](https://www.data.go.kr/data/15031482/fileData.do#layer_data_infomation)
- **데이터 개수**: 총 939개 도서 정보 (CSV 파일)

> 📌 Book table  
<img width="228" height="381" alt="Image" src="https://github.com/user-attachments/assets/e7490811-10c0-4784-84a0-30e25897d82e" />
<br>
<img width="1202" height="412" alt="Image" src="https://github.com/user-attachments/assets/ed458b9e-fe5c-4aa4-ad5f-973001a51380" />

---

## 🧱 프로젝트 구조

<img width="389" height="545" alt="Image" src="https://github.com/user-attachments/assets/a5900dfc-de14-4d0f-91ba-a2cf11574b21" />

<br>

```
📁 controller
├── Controller.java         // 전체 도서 검색
├── InsertController.java   // 도서 객체 저장 및 forward
├── ResultController.java   // 등록 결과 list forward
└── SearchController.java   // title/author/category별 도서 데이터 필터링

📁 model
└── BookDAO.java            // 도서 select 쿼리

📁 model.entity
└── Book.java               // Book entity

📁 view
├── failView.jsp            // 검색 실패 시 화면
├── bookCard.jsp            // 도서 목록 화면
├── bookRegister.jsp        // 도서 등록 화면
└── bookSearch.jsp          // 도서 검색 화면

📁 run
└── index.jsp               // 첫 실행 화면
```

---

## 🖥 실행 화면

<img width="1633" height="818" alt="Image" src="https://github.com/user-attachments/assets/e8ffaaea-a186-4e96-9502-a78a192d9cf7" />

<br>

<img width="1889" height="885" alt="Image" src="https://github.com/user-attachments/assets/efe57616-dd81-4ea3-8e71-caf4171fe478" />

<br>

<img width="1837" height="852" alt="Image" src="https://github.com/user-attachments/assets/b971f2bb-4510-4587-b047-74373da1c1ed" />

<br>

<img width="1906" height="823" alt="Image" src="https://github.com/user-attachments/assets/1c1c455e-09e7-41d6-816e-130aecb23a15" />

<br>

<img width="1863" height="842" alt="Image" src="https://github.com/user-attachments/assets/6f4d91a4-e530-4df6-88f6-701f574da80a" />

---

## 🖥 Lambda & Map  활용

- Map은 키(Key)와 값(Value)을 쌍으로 저장하는 자료구조
- Lambda(람다식)은 함수형 인터페이스를 간단히 표현할 수 있게 도와주는 자바 8 이상의 기능.
```
        Map<String, Function<String, List<Books>>> searchMap = new HashMap<>();

        searchMap.put("title", wrap(model::findTitle, response));
	searchMap.put("author", wrap(model::findAuthor, response));
	searchMap.put("category", wrap(model::findCategory, response));

```
---

## 🧩 트러블슈팅

1. **서버 문제**
   - 수업에서 설정된 서버와 로컬 서버가 달라 충돌 발생
   - → 서버 초기화 후 로컬 환경에 맞는 서버 새로 설정

2. **호환성 문제**
   - pom.xml 그대로 사용했더니 `tomcat 10.1`과 호환되지 않음
   - → 호환되는 버전으로 수정 및 업그레이드

3. **web.xml 부재**
   - Maven 프로젝트에 `web.xml`이 없어 서버 구동 불가
   - → Maven 프로젝트로 생성 후 `web.xml` 및 관련 설정 수동 추가

---

## 🚀 확장 아이디어

- 도서 폐기 기능 (DELETE)
- 도서 대출 및 반납 현황 기능
- 사용자 로그인 기능
- 도서별 태그/리뷰 기능
