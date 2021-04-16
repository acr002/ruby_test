
> git init

> git status
インデックスに登録されていないファイルがUntracked filesとして表示される。

> git add xxxxx.rb
インデックスにファイルを登録します。

> git config --global user.email "tamada@across-net.co.jp"
> git config --global user.name "acr002"
登録？

> git commit -m "add new file"
ローカルリポジトリにコミットします。

> git remote add origin https://github.com/acr002/ruby-test.git
リモートリポジトリに情報を追加します。

> git push origin master
ローカルの変更をリモートに反映させます。

## git remote
リモートリポジトリに対する指示
ローカルリポジトリをリモートの方に追加したり、リモートリポジトリを削除したりします。

git remote add 名前 URL
  この「名前」はリモートリポジトリに付けるものなので、通常はoriginを使用します。

git remote remove 名前
  現在のリポジトリからリモートリポジトリを削除します。

git remote set-url 名前 URL
  リモートのURLを変更します。

git remote get-url 名前
  リモートのURLを表示します。

git remote set-head 名前
  リモートのデフォルトブランチを設定します。

git remote set-branches 名前 ブランチ
  リモートで追跡するブランチを変更します。
  ブランチは複数指定可能。

git remote
  リモートリポジトリの名前を返します。

git remote -v
  リモートリポジトリの名前と場所を返します。

git remote show 名前
  指定したリモートリポジトリの詳しい情報を返します。




# 2021.04.16(金)
https://github.com/acr002/ruby_test.git
git@github.com:acr002/ruby_test.git

ファイル更新までの基本手順
- ファイルを追加
- ファイルをコミット
- ファイルを更新
  git add [ファイル名] //追加
  git commit -a -m "任意のコメント"  //コミット (-aオプションは変更を自動検出してくれる)
  git push origin master  //masterを更新

git addの使用例
  git add . //すべてのファイル・ディレクトリ
  git add *.css //すべてのCSSファイル
  git add -n //追加されるファイルを調べる
  git add -u //変更されたファイルを追加する
  git rm --cached //addしてしまったファイルを除外

git commitの使用例
  git commit -a //変更のあったファイルすべて
  git commit --amend //直前のコミットを取り消す
  git commit -v //変更点を表示してコミット

コミットの取り消し
  git reset --soft HEAD~2 // 最新のコミットから2件分をワークディレクトリの内容を保持し取り消す
  git reset --hard HEAD~2 // 最新のコミットから2件分のワークディレクトリの内容とコミットを取り消す


# たぶんこれを使うであろう流れ。
git add .
git commit -a -m "comments"
git push origin master



# comment
Add         追加
Fix         修正
Update
Use         切替え
Improve     改良
Avoid       避ける
Emit        内容・挙動を確認しやすくした
Remove      除去
Move        移動
Rename      名称変更
Change
Allow
Implement
Handle

Fix         バグ修正
Fix typos   タイポの修正
Add tests
Add comment
Add docs
Update README.md
clean       整理

Change A to B(Use B instead of A)


# branch
<作業の分類>/#<Issue番号><作業内容>

作業の分類
feature   新機能開発中
hotfix    公開中のもののバグ修正用
review    レビュー用

例) git branch feature/#19implement_login_func


# ローカルのmasterブランチを最新にする
git checkout master
git pull
(git fetch + git merge origin/master)





