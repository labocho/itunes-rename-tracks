# itunes-rename-tracks

OSX Yosemite の JavaScript for Automation を利用した iTunes で選択中のトラック名取得・変更スクリプト。

# Requirements

OSX 10.10.1 / ruby 2.1.3 で動作確認。

# itunes-get-names

iTunes 起動して、トラックを選択した状態で実行すると、トラック名を標準出力に出力する。

```
$ ./itunes-get-names
Schubert: Winterreise, D 911 - Gute Nacht
Schubert: Winterreise, D 911 - Die Wetterfahne
Schubert: Winterreise, D 911 - Gerfrorne Tränen
```

# itunes-set-names

iTunes 起動して、トラックを選択した状態で実行し、標準入力から新しいトラック名を入力すると、古いトラック名と新しいトラック名が並べて表示され、プロンプトが表示される。
`y` を入力すると、トラック名を変更する。

```
$ ./itunes-set-names
SCHUBERT: Winterreise, D 911 - Gute Nacht
SCHUBERT: Winterreise, D 911 - Die Wetterfahne
SCHUBERT: Winterreise, D 911 - Gerfrorne Tränen
^D
   Schubert: Winterreise, D 911 - Gute Nacht
-> SCHUBERT: Winterreise, D 911 - Gute Nacht
   Schubert: Winterreise, D 911 - Die Wetterfahne
-> SCHUBERT: Winterreise, D 911 - Die Wetterfahne
   Schubert: Winterreise, D 911 - Gerfrorne Tränen
-> SCHUBERT: Winterreise, D 911 - Gerfrorne Tränen
Rename?: y
done
```

# License

[CC0](http://creativecommons.org/publicdomain/zero/1.0/deed)
