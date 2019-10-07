# TODOアプリ
## 開発環境
- OS X  :v10.13.6
- Ruby  :v2.3.7
- Rails :v5.2.3
- Mysql :v8.0.16
- RSpec :v3.7

## 機能
- 管理者ユーザログイン(管理者権限あり、ユーザ登録あり、全機能可)
- ユーザログイン(管理者権限なし、ユーザ登録あり、機能制限[中])
- ゲストログイン(管理者権限なしユーザ登録なし、機能制限[小])
- タスク作成、削除、編集、完了機能
- プロジェクト機能、タグ機能
- 検索機能
- レスポンシブデザイン

## 作成スケジュール
- 開発開始 (2019/6/8)
- 設計、環境構築 (2019/6/8)
- 画面デザイン、モック作成 (2019/6/9~16)
- アプリ基本動作[CRUD]作成 (2019/6/17~23)
- UT作成 (2019/6/24~30)
- 追加機能実装(2019/7/1~31)
- ログイン・ログアウト機能(2019/6/29~7/5)
- 管理者ユーザー機能(~2019/7/5)
- Project機能
- タグ機能
- Task検索機能(~2019/8/25)
- フロントエンドをVue.jsに改修(2019/10/04~)

## Prefix Rule
### Type
- Must be one of the following:  

- feat: A new feature  
- fix: A bug fix  
- docs: Documentation only changes  
- style: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)  
- refactor: A code change that neither fixes a bug nor adds a feature  
- perf: A code change that improves performance  
- test: Adding missing or correcting existing tests  
- chore: Changes to the build process or auxiliary tools and libraries such as documentation generation  
