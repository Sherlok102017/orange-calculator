@echo off
echo ========================================
echo Сборка APK для калькулятора "Прикинь, Света!"
echo ========================================
echo.

echo Проверяем наличие Java...
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo ОШИБКА: Java не найдена!
    echo Установите Java JDK 8 или выше
    echo Скачать можно с: https://adoptium.net/
    pause
    exit /b 1
)
echo Java найдена ✓
echo.

echo Проверяем наличие Android SDK...
if "%ANDROID_HOME%"=="" (
    echo ОШИБКА: ANDROID_HOME не установлен!
    echo Установите Android SDK и установите переменную ANDROID_HOME
    echo Или используйте Android Studio для сборки
    pause
    exit /b 1
)
echo Android SDK найден: %ANDROID_HOME% ✓
echo.

echo Проверяем наличие Gradle...
gradle -version >nul 2>&1
if %errorlevel% neq 0 (
    echo Gradle не найден, пытаемся использовать gradlew...
    if exist "gradlew.bat" (
        echo Найден gradlew.bat, используем его...
        set GRADLE_CMD=gradlew.bat
    ) else (
        echo ОШИБКА: Gradle не найден и gradlew отсутствует!
        echo Установите Gradle или используйте Android Studio
        pause
        exit /b 1
    )
) else (
    echo Gradle найден ✓
    set GRADLE_CMD=gradle
)
echo.

echo Создаем директории для сборки...
if not exist "app\build" mkdir "app\build"
if not exist "app\build\outputs" mkdir "app\build\outputs"
if not exist "app\build\outputs\apk" mkdir "app\build\outputs\apk"
if not exist "app\build\outputs\apk\debug" mkdir "app\build\outputs\apk\debug"
echo.

echo Начинаем сборку APK...
echo Выполняем: %GRADLE_CMD% assembleDebug
echo.

if "%GRADLE_CMD%"=="gradlew.bat" (
    call gradlew.bat assembleDebug
) else (
    call gradle assembleDebug
)

echo.
echo Проверяем результат сборки...
if exist "app\build\outputs\apk\debug\*.apk" (
    echo ========================================
    echo УСПЕХ! APK файл создан
    echo ========================================
    
    for %%f in ("app\build\outputs\apk\debug\*.apk") do (
        echo Файл: %%~ff
        echo Размер: %%~zf байт
        
        echo Копируем APK в корневую директорию...
        copy "%%~ff" "Прикинь_Света_Калькулятор.apk" >nul
        echo APK скопирован в: Прикинь_Света_Калькулятор.apk
    )
) else (
    echo ========================================
    echo ОШИБКА: APK файл не найден после сборки!
    echo ========================================
    echo Проверьте логи сборки выше
    echo.
    echo Рекомендуется использовать Android Studio для сборки
)

echo.
echo ========================================
echo Инструкции по установке:
echo ========================================
echo 1. Скопируйте APK файл на Android устройство
echo 2. Разрешите установку из неизвестных источников
echo 3. Установите APK файл
echo 4. Запустите приложение "Прикинь, Света!"
echo.
echo Сборка завершена!
pause

