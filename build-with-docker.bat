@echo off
echo ========================================
echo Сборка APK с помощью Docker
echo ========================================
echo.

echo Проверяем наличие Docker...
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Docker не найден ❌
    echo.
    echo Установите Docker Desktop с https://docker.com/
    echo Или используйте другие способы сборки
    pause
    exit /b 1
)

echo Docker найден ✓
docker --version
echo.

echo Создаем Dockerfile для сборки...
echo FROM openjdk:17-jdk > Dockerfile
echo RUN apt-get update ^&^& apt-get install -y unzip wget >> Dockerfile
echo WORKDIR /app >> Dockerfile
echo COPY . . >> Dockerfile
echo RUN chmod +x gradlew >> Dockerfile
echo RUN ./gradlew assembleDebug >> Dockerfile
echo CMD ["cp", "-r", "app/build/outputs/apk/debug", "/output"] >> Dockerfile

echo Dockerfile создан ✓
echo.

echo Собираем Docker образ...
docker build -t android-builder .
if %errorlevel% neq 0 (
    echo Ошибка сборки Docker образа ❌
    pause
    exit /b 1
)

echo Docker образ собран ✓
echo.

echo Создаем APK...
docker run --rm -v %cd%:/output android-builder
if %errorlevel% neq 0 (
    echo Ошибка создания APK ❌
    pause
    exit /b 1
)

echo.
echo ========================================
echo УСПЕХ! APK файл создан
echo ========================================
echo.

echo Проверяем результат...
if exist "app\build\outputs\apk\debug\*.apk" (
    for %%f in ("app\build\outputs\apk\debug\*.apk") do (
        echo Файл: %%~ff
        echo Размер: %%~zf байт
        
        echo Копируем APK в корневую директорию...
        copy "%%~ff" "Прикинь_Света_Калькулятор.apk" >nul
        echo APK скопирован в: Прикинь_Света_Калькулятор.apk
    )
) else (
    echo APK файл не найден ❌
    echo Проверьте логи выше
)

echo.
echo Очищаем временные файлы...
del Dockerfile
docker rmi android-builder

echo.
echo ========================================
echo Сборка завершена!
echo ========================================
pause

