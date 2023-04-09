#    ,        ]`  {|=,,|]                    L ,,||}  'L       L,
#    L]       |  C!     ")                  ]"`   '||  L       |]
#     |       [ L' ,,,,   }                    ,,,, || [       | 
#     [       ,Lg@M"`'`"*Ng'  |            g@*"`''"M@g"[       | 
#     [       L@" ,r*%$@k| %              / |/'*$@k, "@[       ] 
#    |[       $' ,   /$$$k     M         A  (, ,$$$lL '[       ]L
#     |       [  @$@@  Wl|    ]` V  /   "   l$$  $llj  [       | 
#     |       [  ]lllwg|ll         F  c     Mllww|ll[  |       [ 
#     ]       |   Ylllll$`      ,<,-"        Qlllll@   [       [ 
#             ]     """`                       """     |       L 
#             ]                                        |       ` 
#    ,                                                 [         
#    |%L                                               L       M|
#    ll|                    ` ~.,    ,.-^`             F      ]ll
#    @yj       \                                      g       |@W
#    ```       ``                                    ``       ```

# Revert execution policy to what it was before the script was run
$oldpolicy = $args[0]
Set-ExecutionPolicy -Scope CurrentUser $oldpolicy

Write-Host "Pikarchiver v0.5"


$strings = @{
    "EN" = @{
        "DISCLAIMER" = "! DO NOT REUPLOAD OR SHARE MEMBERSHIP CONTENT !
This script is intended for people to make a personal backup and not to share.
Please respect Pikamee's wishes by following this rule.



Press Enter if you understand
"
        "ARIGATOU" = "== ARIGATOU! =="
        "DESCRIPTION" = "This script will download all of Pikamee's currently available membership-only streams and place them in a 'pikarchive' folder.
It will take several hours to download everything, depending on your download speed. The script can be paused using the 'Pause' key on your keyboard and resumed again by pressing Enter.
It will also resume its progress if you exit the script and start it again later.

Created by aiex#5555 for the Pikairforce. Contact me if you need assistance
"
        "YT-DLP" = "yt-dlp.exe not found. This is required to download youtube videos.

Please download the latest version of yt-dlp.exe from the github releases page and place it next to this script.

https://github.com/yt-dlp/yt-dlp/releases"
        "ARIA2C" = "aria2c.exe not found. This is required to speed up downloads.

Please download the latest version of aria2c.exe from the aria2c releases page and place it next to this script.

https://github.com/aria2/aria2/releases/tag/release-1.36.0
"
        "FFMPEG" = "ffmpeg not found. ffmpeg is required to join the video and audio together after being downloaded.

Please download the latest version of ffmpeg.exe from here and place it next to this script

https://www.gyan.dev/ffmpeg/builds/ => ffmpeg-release-essentials.zip and extract ffmpeg.exe
"
        "PLAYLIST" = "Please select which videos to download.
1`tMembership-only videos
2`tPublic videos
3`tBoth"
        "PLAYLIST-OPTIONS" = "(1, 2 or 3)"
        "PLAYLIST-ERROR" = "Invalid option. Please enter a number between 1 and 3."
        "RESOLUTION" = "Please select which resolution to download videos.
Option`tRes`tMembership Size Estimate`tPublic Size Estimate
1`t1080p`t500GB`t`t`t`tTBD
2`t720p`t250GB`t`t`t`tTBD
3`t480p`t100GB`t`t`t`tTBD

Please note that this download will take at least several hours. The script can be exited and started again later to resume progress"
        "RESOLUTION-OPTIONS" = "(1, 2 or 3)"
        "RESOLUTION-ERROR" = "Invalid option. Please enter a number between 1 and 3."
        "BROWSER" = "Select your web browser that you use for Youtube. This script will read the cookies from that browser to allow access to the membership content.
You can also supply a cookies.txt file if you have one
1`tChrome
2`tFirefox
3`tEdge
4`tSafari
5`tOpera
6`tChromium
7`tVivaldi
8`tBrave
9`tSupply cookies.txt (netscape format)"
        "BROWSER-OPTIONS" = "(1, 2, 3, 4, 5, 6, 7, 8 or 9): "
        "COOKIES" = "You have selected to supply your own cookies.txt file. Place cookies.txt next to this script and press enter."
        "COOKIES-ERROR" = "cookies.txt not found. Please try again."
        "BROWSER-ERROR" = "Invalid option. Please enter a number from 1 and 9."
        "CHAT" = "Download chat logs? This will add a lot of download time"
        "COMMENTS" = "Download video comments? (adds a little bit of download time)"
        "ERROR-YN" = "Invalid option. Please enter Y or N."
        "FINISH" = "The download has finished! Please check errorlog.txt to see if any videos failed to download. The error about the external downloader can be ignored."
    }
    "JA" = @{
        "DISCLAIMER" = "

! 再アップロードや会員限定コンテンツの共有は禁止です !
このスクリプトは個人的なバックアップ作成用途でのみ使用することを目的としています。共有をしないでください。
このルールに従って、ピカミィさんの希望を尊重してください。

理解した場合はEnterキーを押してください。
"
        "ARIGATOU" = "

== ありがとう！ ==

"
        "DESCRIPTION" = "このスクリプトは、ピカミィさんが現在提供している全ての会員限定配信をダウンロードし、'pikarchive' フォルダに保存します。
ダウンロードには、ダウンロード速度に応じて数時間かかる場合があります。スクリプトは、キーボードの 'Pause' キーで一時停止し、Enter キーで再開することができます。
また、スクリプトを終了して後で再開すると、進捗状況が保存され、続きからダウンロードが再開されます。

Pikairforce の aiex#5555 が作成しました。お困りの際はご連絡ください。
"
        "YT-DLP" = "yt-dlp.exeが見つかりませんでした。YouTube動画をダウンロードするために必要です。

最新のyt-dlp.exeをGitHubのリリースページからダウンロードし、このスクリプトと同じフォルダに配置してください。

https://github.com/yt-dlp/yt-dlp/releases"
        "ARIA2C" = "aria2c.exeが見つかりませんでした。ダウンロードを高速化するために必要です。

最新のaria2c.exeをaria2cのリリースページからダウンロードし、このスクリプトと同じフォルダに配置してください。

https://github.com/aria2/aria2/releases/tag/release-1.36.0
"
        "FFMPEG" = "ffmpegが見つかりませんでした。ダウンロード後に動画とオーディオを結合するために必要です。

こちらから最新のffmpeg.exeをダウンロードし、このスクリプトと同じフォルダに配置してください。

https://www.gyan.dev/ffmpeg/builds/ => ffmpeg-release-essentials.zip からffmpeg.exeを抽出してください。
"
        "PLAYLIST" = "どの動画をダウンロードするか選択してください。
1`tメン限動画
2`t公開動画
3`t両方"
        "PLAYLIST-OPTIONS" = "(1、2、または3)"
        "PLAYLIST-ERROR" = "無効なオプションです。1から3の数字を入力してください。"
        "RESOLUTION" = "ダウンロードする動画の解像度を選択してください。
オプション`t解像度`tメン限動画大体のサイズ`t`t公開動画大体のサイズ
1`t`t1080p`t500GB`t`t`t`tTBD
2`t`t720p`t250GB`t`t`t`tTBD
3`t`t480p`t100GB`t`t`t`tTBD

このダウンロードには数時間以上かかることがあります。スクリプトは中断し、後で再開して進捗状況を続行することができます。"
        "RESOLUTION-OPTIONS" = "(1、2、または3)"
        "RESOLUTION-ERROR" = "無効なオプションです。1から3の数字を入力してください。"
        "BROWSER" = "
YouTubeに使用するWebブラウザを選択してください。このスクリプトは、そのブラウザからクッキーを読み取って、会員限定コンテンツへのアクセスを許可します。
もしcookies.txtファイルがある場合は、それを使用することもできます。
1`tChrome
2`tFirefox
3`tEdge
4`tSafari
5`tOpera
6`tChromium
7`tVivaldi
8`tBrave
9`tcookies.txtファイルを使用する（netscape形式）"
        "BROWSER-OPTIONS" = "(1、2、3、4、5、6、7、8、または9)"
        "COOKIES" = "cookies.txtファイルを指定することを選択しました。このスクリプトと同じフォルダにcookies.txtファイルを配置し、Enterキーを押してください。"
        "COOKIES-ERROR" = "cookies.txtファイルが見つかりませんでした。再度お試しください。"
        "BROWSER-ERROR" = "無効なオプションです。1から9の数字を入力してください。"
        "CHAT" = "
チャットログをダウンロードしますか？ダウンロード時間がかなり長くなります。"
        "COMMENTS" = "
動画のコメントをダウンロードしますか？ダウンロード時間が少し長くなります。）"
        "ERROR-YN" = "無効なオプションです。YまたはNを入力してください。"
        "FINISH" = "ダウンロードが完了しました！ダウンロードに失敗した動画がある場合は、errorlog.txtを確認してください。外部ダウンローダーに関するエラーは無視しても構いません。"

    }
}

Write-Host "
Please select your preferred language. お好みの言語を選択してください。
1`tEnglish
2`t日本語"
$lang = ""
while ($lang -eq ""){
    $input = Read-Host "(1, 2)"
    if ($input -eq "1") {
        $lang = "EN"
    } 
    elseif ($input -eq "2") {
        $lang = "JA"
    } 
    else {
        Write-Host "Invalid option. Please enter 1 or 2. 無効なオプションです。1または2を入力してください。"
    }
}

Write-Host
$ilovepika = Read-Host $strings[$lang]["DISCLAIMER"]
Write-Host
Write-Host $strings[$lang]["ARIGATOU"]

$GoodToGo = $true

if (-not (Test-Path ".\yt-dlp.exe")) {
    Write-Host
    Write-Host $strings[$lang]["YT-DLP"]
    $GoodToGo = $false
}

if (-not (Test-Path ".\aria2c.exe")) {
    Write-Host
    Write-Host $strings[$lang]["ARIA2C"]
    $GoodToGo = $false
}

if (-not (Test-Path ".\ffmpeg.exe")) {
    Write-Host
    Write-Host $strings[$lang]["FFMPEG"]
    $GoodToGo = $false
}

if ($GoodToGo -eq $false){
    Exit 1
}

Write-Host
Write-Host $strings[$lang]["PLAYLIST"]
$playlist = ''
while ($playlist -eq ''){
    $input = Read-Host $strings[$lang]["PLAYLIST-OPTIONS"]

    if ($input -eq "1") {
        $playlist = "membership"
    } 
    elseif ($input -eq "2") {
        $playlist = "public"
    } 
    elseif ($input -eq "3") {
        $playlist = "both"
    }
    else {
        Write-Host $strings[$lang]["PLAYLIST-ERROR"]
    }
}

Write-Host
Write-Host $strings[$lang]["RESOLUTION"]
$res = ''
while ($res -eq ''){
    $input = Read-Host $strings[$lang]["RESOLUTION-OPTIONS"]

    if ($input -eq "1") {
        $res = 1080
    } 
    elseif ($input -eq "2") {
        $res = 720
    } 
    elseif ($input -eq "3") {
        $res = 480
    }
    else {
        Write-Host $strings[$lang]["RESOLUTION-ERROR"]
    }
}

Write-Host
Write-Host $strings[$lang]["BROWSER"]
$browser =""
while ($browser -eq ""){
    $browser = Read-Host $strings[$lang]["BROWSER-OPTIONS"]
    if ($browser -eq "1") {
        $browser = "chrome"
    } 
    elseif ($browser -eq "2") {
        $browser = "firefox"
    } 
    elseif ($browser -eq "3") {
        $browser = "edge"
    } 
    elseif ($browser -eq "4") {
        $browser = "safari"
    } 
    elseif ($browser -eq "5") {
        $browser = "opera"
    } 
    elseif ($browser -eq "6") {
        $browser = "chromium"
    } 
    elseif ($browser -eq "7") {
        $browser = "vivaldi"
    } 
    elseif ($browser -eq "8") {
        $browser = "brave"
    } 
    elseif ($browser -eq "9") {
        Read-Host $strings[$lang]["COOKIES"]
        if (-not (Test-Path ".\cookies.txt")) {
            Write-Host $strings[$lang]["COOKIES-ERROR"]
            $browser = ""
        } else {
            $browser = "cookies.txt"
        }
    } 
    else {
        Write-Host $strings[$lang]["BROWSER-ERROR"]
    }
}

Write-Host
Write-Host $strings[$lang]["CHAT"]
$downloadchat = "pikakyomu"
while ($downloadchat -eq "pikakyomu"){
    $input = Read-Host "(Y/N): "

    if ($input -eq "y") {
        $downloadchat = "--write-subs --sub-langs 'all'"
    } 
    elseif ($input -eq "Y") {
        $downloadchat = "--write-subs --sub-langs 'all'"
    } 
    elseif ($input -eq "n") {
        $downloadchat = ""
    }
    elseif ($input -eq "N") {
        $downloadchat = ""
    }
    else {
        Write-Host $strings[$lang]["ERROR-YN"]
    }
}

Write-Host
Write-Host $strings[$lang]["COMMENTS"]
$downloadcomments = "pikakyomu"
while ($downloadcomments -eq "pikakyomu"){
    $input = Read-Host "(Y/N): "

    if ($input -eq "y") {
        $downloadcomments = "--write-comments"
    } 
    elseif ($input -eq "Y") {
        $downloadcomments = "--write-comments"
    } 
    elseif ($input -eq "n") {
        $downloadcomments = ""
    }
    elseif ($input -eq "N") {
        $downloadcomments = ""
    }
    else {
        Write-Host $strings[$lang]["ERROR-YN"]
    }
}


if ($browser -eq "cookies.txt"){
    $browserparam = "--cookies './cookies.txt'"
} else {
    $browserparam = "--cookies-from-browser $browser"
}

if ($playlist -eq "membership"){
    $playlisturl = "https://www.youtube.com/playlist?list=UUMOajhBT4nMrg3DLS-bLL2RCg"
} elseif($playlist -eq "public"){
    $playlisturl = "https://www.youtube.com/@Pikamee"
} elseif ($playlist -eq "both"){
    $playlisturl = "https://www.youtube.com/playlist?list=UUMOajhBT4nMrg3DLS-bLL2RCg https://www.youtube.com/@Pikamee"
} else {
    Exit 1
}


$command = "./yt-dlp.exe -f 'bestvideo[height=$res][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' --embed-metadata --download-archive archive.txt --write-description -N 4 -c -w --progress $browserparam -o 'pikarchive/%(playlist)s/%(upload_date)s/%(title)s.%(ext)s' --write-thumbnail --postprocessor-args VideoRemuxer:movflags=+faststart $downloadchat $downloadcomments $playlisturl --external-downloader aria2c --external-downloader-args '-j 16 -x 16 -s 16 -k 15M'"



Invoke-Expression $command

Write-Host
Write-Host
Write-Host $strings[$lang]["FINISH"]