::chcp 65001 define UTF-8
chcp 65001
@echo off
@echo Verificando se apk/ existe....
IF exist apk/. (@echo apk/ já existe!) ELSE (@echo apk/ não existe! && mkdir apk && @echo apk/ foi criada!)
@echo: && @echo Limpando o projeto.... && flutter clean && @echo: && @echo Gerando o APK.... && flutter build apk --release --obfuscate --split-debug-info=./debug && @echo: && @echo Movendo o APK para apk/ .... && move "build\app\outputs\apk\release\app-release.apk" "apk\games_%Date:~-10,2%_%Date:~-7,2%_%Date:~-4,4%_%time:~0,2%_%time:~3,2%.apk" && @echo: && @echo APK gerado!
