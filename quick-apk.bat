@echo off
echo ========================================
echo БЫСТРОЕ СОЗДАНИЕ APK
echo Калькулятор "Прикинь, Света!"
echo ========================================
echo.

echo Проверяем доступные инструменты...

REM Проверяем Java
java -version >nul 2>&1
if %errorlevel% equ 0 (
    echo Java найдена ✓
    goto :build_with_java
)

REM Проверяем Android Studio
if exist "%LOCALAPPDATA%\Google\AndroidStudio*" (
    echo Android Studio найден ✓
    goto :build_with_android_studio
)

REM Проверяем Docker
docker --version >nul 2>&1
if %errorlevel% equ 0 (
    echo Docker найден ✓
    goto :build_with_docker
)

echo Инструменты не найдены ❌
goto :show_alternatives

:build_with_java
echo.
echo Собираем APK с помощью Java...
echo Выполняем: gradlew.bat assembleDebug
echo.
call gradlew.bat assembleDebug
if %errorlevel% equ 0 (
    goto :success
) else (
    echo Ошибка сборки ❌
    goto :show_alternatives
)

:build_with_android_studio
echo.
echo Android Studio найден!
echo Откройте проект в Android Studio:
echo 1. File -> Open
echo 2. Выберите папку проекта
echo 3. Build -> Build Bundle(s) / APK(s) -> Build APK(s)
echo.
goto :show_alternatives

:build_with_docker
echo.
echo Собираем APK с помощью Docker...
echo.
docker run --rm -v %cd%:/app -w /app openjdk:17-jdk bash -c "chmod +x gradlew && ./gradlew assembleDebug"
if %errorlevel% equ 0 (
    goto :success
) else (
    echo Ошибка сборки Docker ❌
    goto :show_alternatives
)

:success
echo.
echo ========================================
echo УСПЕХ! APK файл создан ✓
echo ========================================
echo.
if exist "app\build\outputs\apk\debug\*.apk" (
    for %%f in ("app\build\outputs\apk\debug\*.apk") do (
        echo Файл: %%~ff
        echo Размер: %%~zf байт
        
        echo Копируем APK в корневую директорию...
        copy "%%~ff" "Прикинь_Света_Калькулятор.apk" >nul
        echo APK скопирован в: Прикинь_Света_Калькулятор.apk
        
        echo.
        echo ========================================
        echo УСТАНОВКА НА ТЕЛЕФОН:
        echo ========================================
        echo 1. Скопируйте APK на Android устройство
        echo 2. Включите "Установка из неизвестных источников"
        echo 3. Установите APK
        echo 4. Запустите "Прикинь, Света!"
        echo.
        echo ГОТОВО! 🎉🍊
    )
) else (
    echo APK файл не найден ❌
    goto :show_alternatives
)
goto :end

:show_alternatives
echo.
echo ========================================
echo АЛЬТЕРНАТИВНЫЕ СПОСОБЫ ПОЛУЧЕНИЯ APK:
echo ========================================
echo.
echo 🚀 СПОСОБ 1: GitHub Actions (5 минут)
echo    - Создайте репозиторий на GitHub
echo    - Загрузите все файлы проекта
echo    - GitHub автоматически соберет APK
echo.
echo 💻 СПОСОБ 2: Android Studio (10 минут)
echo    - Скачайте Android Studio
echo    - Откройте проект и соберите APK
echo.
echo ⚙️ СПОСОБ 3: Установите Java (15 минут)
echo    - Скачайте Java JDK с https://adoptium.net/
echo    - Настройте JAVA_HOME
echo    - Запустите gradlew.bat assembleDebug
echo.
echo 📖 Подробная инструкция в файле: ПОШАГОВАЯ_ИНСТРУКЦИЯ_APK.md

:end
echo.
echo Нажмите любую клавишу для выхода...
pause >nul

