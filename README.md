# 🐾 Wepet — 반려동물 산책 파트너·펫시터 매칭 애플리케이션
### 보호자의 현재 위치 기반 산책 파트너 매칭과 커뮤니티 기반 펫시터 연결 기능을 제공하는 Flutter 애플리케이션입니다.
### 보호자는 인근 반려인과 산책을 함께하거나, 펫시터를 구해 반려동물을 대신 산책시켜줄 사람을 찾을 수 있습니다.
<br>

## 📑 목차
#### 🖥️ 개발 환경
#### 🔑 핵심 기술
#### 🧠 주요 기능
#### 🔭 프로젝트 구조
#### 📦 실행 방법
<br>
<br>

## 🖥️ 개발 환경
#### Flutter: 3.21.0
#### Dart: 3.4.0
#### IDE: Android Studio / VS Code
#### 지원 플랫폼: iOS / Android
<br>
<br>

## 🔑 핵심 기술
### 🗃️ 프레임워크 & 라이브러리
#### Flutter (Dart) — 선언형 UI 기반 하이브리드 앱 개발
#### Dio + Retrofit — REST API 네트워크 레이어 구축
#### Riverpod — 화면 상태 및 전역 상태 관리
#### shared_preferences — 사용자 정보 로컬 저장
<br>
<br>

## 🧠 주요 기능
### 1. 📍 위치 기반 산책 파트너 매칭
#### • 현재 위치를 기준으로 주변 보호자를 탐색
#### • 주변 반려인과 산책 파트너 매칭 화면 제공
<br>
### 2. 🐶 펫시터 매칭 기능
#### • 커뮤니티 기능을 활용하여 반려동물을 대신 산책해줄 사람을 모집
#### • 게시글 기반 요청 → 수락 흐름 구현
<br>
### 3. 🔐 사용자 인증 및 로컬 저장
#### • KakaoSDK를 통한 카카오 로그인 기능 구현
#### • shared_preferences로 닉네임·토큰 등 로컬 저장
#### • 재로그인 없이 자동 로그인 지원
<br>
### 4. 🌐 안정적인 네트워크 통신 레이어
#### • Dio + Retrofit 기반 커스텀 API 레이어 구축
#### • 공통 에러 처리, 요청/응답 모델 구조화
#### • 플랫폼 간 일관된 데이터 전송 모델 설계
<br>
<br>

## 🔭 프로젝트 구조
```
Wepet/
 ├── http_api/
 │   ├── community_api.dart
 │   ├── myprofile_api.dart
 │   ├── pet_api.dart
 │   └── user_api.dart
 │
 ├── providers/
 │   └── user_provider.dart
 │
 └── screens/
     ├── community_page.dart
     ├── login_page.dart
     ├── walking_page.dart
     └── profile_page.dart
```
<br>
<br>

## 📦 실행 방법
### 1) 프로젝트 클론
```
git clone https://github.com/JmSmartProject/FrontEnd
```
### 2) 패키지 설치
```
flutter pub get
```
### 3) 실행
```
flutter run
```
