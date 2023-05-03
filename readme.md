# shell いろいろ

## bash でも powerline っぽい何かを使いたい

はじめに Unicode character を表示できるように以下のフォントを導入します。ここはお好きなフォントに読み替えてください。私は SF Mono が好きなので、SF Mono と Nerd を統一した SFMono Nerd を使います。

```
brew install --cask epk/epk/font-sfmono-nerd-font
```

後は `bash-powerline` をご参照ください。bash 3 と古いものですが、このようになります。ポイントは unicode を utf-8 の hex に変えることで bash 3 でも扱えるようにしています。今後は好きな文字に対応できるよう自動化しようと思います。

![image](./images/Screen%20Shot%202023-02-26%20at%2011.22.03.png)

## mac の ls でも色をいじりたい
Linux なら `dircolors -p > ~/.dircolors` して、`.dircolor` をいじればいいですが BSD 系 UNIX だとそうはいかないので以下を設定します。

```
export CLICOLOR=1
export LSCOLORS=CxBxhxDxfxhxhxhxhxcxcx
#               0 1 2 3 4 5 6 7 8 9 a
```
上記番号の意味と色
```
# 0, Directory
# 1, Symlink
# 2, Socket
# 3, Pipe
# 4, Executable
# 5, Block special
# 6, Character special
# 7, Executable w/ setuid bit
# 8, Executable w/ setgid bit
# 9, Directory w/ sticky bit
# a, Directory wo/ sticky bit
#
# a Black
# b Red
# c Green
# d Brown
# e Blue
# f Magenda
# g Cyan
# h Grey
# A Bold Black
# B Bold Red
# C Bold Green
# D Bold Brown
# E Bold Blue
# F Bold Magenda
# G Bold Cyan
# H Bold Grey
```

## OS に合わせて alias を設定したい
本当のコマンドを忘れてしまうので alias は設定したくないけど、それでもやはり設定すると楽なので設定する。
