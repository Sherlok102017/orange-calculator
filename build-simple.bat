@echo off
echo ========================================
echo Простая сборка APK для калькулятора
echo "Прикинь, Света!"
echo ========================================
echo.

echo Создаем структуру APK...
if not exist "temp_apk" mkdir "temp_apk"
if not exist "temp_apk\res" mkdir "temp_apk\res"
if not exist "temp_apk\res\drawable" mkdir "temp_apk\res\drawable"
if not exist "temp_apk\res\values" mkdir "temp_apk\res\values"
if not exist "temp_apk\res\layout" mkdir "temp_apk\res\layout"
if not exist "temp_apk\res\xml" mkdir "temp_apk\res\xml"
if not exist "temp_apk\res\mipmap-hdpi" mkdir "temp_apk\res\mipmap-hdpi"
if not exist "temp_apk\res\mipmap-mdpi" mkdir "temp_apk\res\mipmap-mdpi"
if not exist "temp_apk\res\mipmap-xhdpi" mkdir "temp_apk\res\mipmap-xhdpi"
if not exist "temp_apk\res\mipmap-xxhdpi" mkdir "temp_apk\res\mipmap-xxhdpi"
if not exist "temp_apk\res\mipmap-xxxhdpi" mkdir "temp_apk\res\mipmap-xxxhdpi"

echo Копируем ресурсы...
copy "app\src\main\res\*.*" "temp_apk\res\" /E /Y >nul 2>&1
copy "app\src\main\AndroidManifest.xml" "temp_apk\" >nul 2>&1

echo Создаем простой APK...
echo Создание APK требует Android SDK и инструментов сборки.
echo.
echo РЕКОМЕНДУЕМЫЕ СПОСОБЫ ПОЛУЧЕНИЯ APK:
echo.
echo 1. ИСПОЛЬЗУЙТЕ GITHUB ACTIONS (САМЫЙ ПРОСТОЙ):
echo    - Создайте репозиторий на GitHub
echo    - Загрузите все файлы проекта
echo    - GitHub автоматически соберет APK
echo.
echo 2. ИСПОЛЬЗУЙТЕ ANDROID STUDIO:
echo    - Откройте проект в Android Studio
echo    - Build -> Build Bundle(s) / APK(s) -> Build APK(s)
echo.
echo 3. УСТАНОВИТЕ JAVA И ANDROID SDK:
echo    - Скачайте Java JDK с https://adoptium.net/
echo    - Установите Android SDK
echo    - Запустите gradlew.bat assembleDebug
echo.
echo Файлы проекта готовы для сборки!
echo.
echo Очищаем временные файлы...
rmdir /S /Q "temp_apk" >nul 2>&1

echo.
echo ========================================
echo ПРОЕКТ ГОТОВ К СБОРКЕ!
echo ========================================
echo.
echo Для получения APK используйте один из способов выше.
echo Рекомендуется GitHub Actions - это бесплатно и просто!
echo.
pause

