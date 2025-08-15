@echo off
echo ========================================
echo Проверка и установка Java для сборки APK
echo ========================================
echo.

echo Проверяем наличие Java...
java -version >nul 2>&1
if %errorlevel% equ 0 (
    echo Java найдена ✓
    java -version
    echo.
    echo Можно приступать к сборке APK!
    echo Выполните команду: gradlew.bat assembleDebug
    pause
    exit /b 0
)

echo Java не найдена ❌
echo.
echo Устанавливаем Java автоматически...
echo.

echo Скачиваем Java JDK 17...
powershell -Command "& {Invoke-WebRequest -Uri 'https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.9%2B9/OpenJDK17U-jdk_x64_windows_hotspot_17.0.9_9.msi' -OutFile 'jdk17.msi'}"

if exist "jdk17.msi" (
    echo Java JDK 17 скачан ✓
    echo.
    echo Устанавливаем Java JDK 17...
    echo Пожалуйста, следуйте инструкциям установщика
    echo.
    start /wait jdk17.msi
    
    echo.
    echo Устанавливаем переменные окружения...
    setx JAVA_HOME "C:\Program Files\Eclipse Adoptium\jdk-17.0.9+9" /M
    setx PATH "%PATH%;C:\Program Files\Eclipse Adoptium\jdk-17.0.9+9\bin" /M
    
    echo.
    echo Java установлена! Перезапустите командную строку и попробуйте снова.
    echo.
    echo Удаляем временные файлы...
    del jdk17.msi
    
) else (
    echo Ошибка скачивания Java ❌
    echo.
    echo Ручная установка:
    echo 1. Перейдите на https://adoptium.net/
    echo 2. Скачайте Java JDK 17 для Windows
    echo 3. Установите Java
    echo 4. Настройте переменную JAVA_HOME
)

echo.
echo ========================================
echo Альтернативные способы сборки APK:
echo ========================================
echo 1. Используйте Android Studio (рекомендуется)
echo 2. Загрузите проект на GitHub и используйте GitHub Actions
echo 3. Используйте онлайн-сервисы сборки
echo.
pause

