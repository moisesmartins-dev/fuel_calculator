::chcp 65001 define UTF-8
chcp 65001
@echo off
@echo Limpando o projeto.... && flutter clean && @echo: && @echo Baixando dependências....&& flutter pub get && @echo: && @echo Run BUILD RUNNER && flutter pub run build_runner build --delete-conflicting-outputs