# Скрипт для сборки APK файла калькулятора "Прикинь, Света!"
# Требует установленного Android SDK и Java

Write-Host "=== Сборка APK для калькулятора 'Прикинь, Света!' ===" -ForegroundColor Green

# Проверяем наличие Java
Write-Host "Проверяем наличие Java..." -ForegroundColor Yellow
try {
    $javaVersion = java -version 2>&1
    Write-Host "Java найдена: $javaVersion" -ForegroundColor Green
} catch {
    Write-Host "ОШИБКА: Java не найдена!" -ForegroundColor Red
    Write-Host "Установите Java JDK 8 или выше" -ForegroundColor Red
    Write-Host "Скачать можно с: https://adoptium.net/" -ForegroundColor Cyan
    exit 1
}

# Проверяем наличие Android SDK
Write-Host "Проверяем наличие Android SDK..." -ForegroundColor Yellow
$androidHome = $env:ANDROID_HOME
if (-not $androidHome) {
    Write-Host "ОШИБКА: ANDROID_HOME не установлен!" -ForegroundColor Red
    Write-Host "Установите Android SDK и установите переменную ANDROID_HOME" -ForegroundColor Red
    Write-Host "Или используйте Android Studio для сборки" -ForegroundColor Cyan
    exit 1
}

Write-Host "Android SDK найден: $androidHome" -ForegroundColor Green

# Проверяем наличие Gradle
Write-Host "Проверяем наличие Gradle..." -ForegroundColor Yellow
try {
    $gradleVersion = gradle -version 2>&1
    Write-Host "Gradle найден: $gradleVersion" -ForegroundColor Green
} catch {
    Write-Host "Gradle не найден, пытаемся использовать gradlew..." -ForegroundColor Yellow
    
    if (Test-Path "gradlew.bat") {
        Write-Host "Найден gradlew.bat, используем его..." -ForegroundColor Green
        $gradleCommand = ".\gradlew.bat"
    } else {
        Write-Host "ОШИБКА: Gradle не найден и gradlew отсутствует!" -ForegroundColor Red
        Write-Host "Установите Gradle или используйте Android Studio" -ForegroundColor Red
        exit 1
    }
}

# Создаем директории для сборки
Write-Host "Создаем директории для сборки..." -ForegroundColor Yellow
$buildDir = "app\build"
$outputDir = "$buildDir\outputs\apk\debug"

if (-not (Test-Path $buildDir)) {
    New-Item -ItemType Directory -Path $buildDir -Force | Out-Null
}

if (-not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
}

# Пытаемся собрать APK
Write-Host "Начинаем сборку APK..." -ForegroundColor Yellow

try {
    if ($gradleCommand) {
        Write-Host "Выполняем: $gradleCommand assembleDebug" -ForegroundColor Cyan
        & $gradleCommand assembleDebug
    } else {
        Write-Host "Выполняем: gradle assembleDebug" -ForegroundColor Cyan
        gradle assembleDebug
    }
    
    # Проверяем результат
    $apkFile = Get-ChildItem -Path $outputDir -Filter "*.apk" | Select-Object -First 1
    
    if ($apkFile) {
        Write-Host "=== УСПЕХ! APK файл создан ===" -ForegroundColor Green
        Write-Host "Файл: $($apkFile.FullName)" -ForegroundColor Green
        Write-Host "Размер: $([math]::Round($apkFile.Length / 1MB, 2)) MB" -ForegroundColor Green
        
        # Копируем APK в корневую директорию
        $finalApkPath = "Прикинь_Света_Калькулятор.apk"
        Copy-Item $apkFile.FullName $finalApkPath
        Write-Host "APK скопирован в: $finalApkPath" -ForegroundColor Green
        
    } else {
        Write-Host "ОШИБКА: APK файл не найден после сборки!" -ForegroundColor Red
        Write-Host "Проверьте логи сборки выше" -ForegroundColor Red
    }
    
} catch {
    Write-Host "ОШИБКА при сборке: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "Попробуйте использовать Android Studio для сборки" -ForegroundColor Cyan
}

Write-Host "`n=== Инструкции по установке ===" -ForegroundColor Cyan
Write-Host "1. Скопируйте APK файл на Android устройство" -ForegroundColor White
Write-Host "2. Разрешите установку из неизвестных источников" -ForegroundColor White
Write-Host "3. Установите APK файл" -ForegroundColor White
Write-Host "4. Запустите приложение 'Прикинь, Света!'" -ForegroundColor White

Write-Host "`nСборка завершена!" -ForegroundColor Green

