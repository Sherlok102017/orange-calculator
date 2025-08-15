@echo off
chcp 65001 >nul
echo.
echo ========================================
echo 🍊 КАЛЬКУЛЯТОР "ПРИКИНЬ, СВЕТА!" 🍊
echo ========================================
echo.
echo Ваш проект полностью готов!
echo Теперь нужно получить APK файл.
echo.
echo Выберите способ получения APK:
echo.
echo [1] 🚀 GitHub Actions (РЕКОМЕНДУЕТСЯ - 5 минут)
echo [2] 💻 Android Studio (10 минут)
echo [3] ⚙️ Локальная сборка (15 минут)
echo [4] 📖 Показать все инструкции
echo [5] 🔧 Попробовать быструю сборку
echo [0] Выход
echo.
set /p choice="Введите номер (0-5): "

if "%choice%"=="1" goto :github_actions
if "%choice%"=="2" goto :android_studio
if "%choice%"=="3" goto :local_build
if "%choice%"=="4" goto :show_all
if "%choice%"=="5" goto :quick_build
if "%choice%"=="0" goto :exit
goto :invalid

:github_actions
echo.
echo ========================================
echo 🚀 GITHUB ACTIONS - САМЫЙ ПРОСТОЙ СПОСОБ
echo ========================================
echo.
echo Шаг 1: Создайте аккаунт GitHub
echo        Перейдите на https://github.com
echo        Нажмите "Sign up" и создайте аккаунт
echo.
echo Шаг 2: Создайте репозиторий
echo        Нажмите "+" → "New repository"
echo        Название: orange-calculator
echo        ВАЖНО: Сделайте репозиторий ПУБЛИЧНЫМ
echo        Нажмите "Create repository"
echo.
echo Шаг 3: Загрузите файлы проекта
echo        Нажмите "uploading an existing file"
echo        Перетащите ВСЕ файлы из папки проекта
echo        Включите папки: app, gradle, .github
echo        Нажмите "Commit changes"
echo.
echo Шаг 4: Получите APK
echo        Перейдите на вкладку Actions
echo        Дождитесь зеленой галочки (2-3 минуты)
echo        Нажмите на зеленую галочку
echo        Скачайте APK из Artifacts
echo.
echo Время выполнения: 5 минут
echo Сложность: Очень легко
echo.
pause
goto :menu

:android_studio
echo.
echo ========================================
echo 💻 ANDROID STUDIO - ПРОФЕССИОНАЛЬНЫЙ СПОСОБ
echo ========================================
echo.
echo Шаг 1: Установите Android Studio
echo        Скачайте с https://developer.android.com/studio
echo        Установите Android Studio
echo.
echo Шаг 2: Откройте проект
echo        Запустите Android Studio
echo        File → Open
echo        Выберите папку с проектом
echo.
echo Шаг 3: Соберите APK
echo        Build → Build Bundle(s) / APK(s) → Build APK(s)
echo        Дождитесь завершения сборки
echo        APK будет в app/build/outputs/apk/debug/
echo.
echo Время выполнения: 10 минут
echo Сложность: Средняя
echo.
pause
goto :menu

:local_build
echo.
echo ========================================
echo ⚙️ ЛОКАЛЬНАЯ СБОРКА - ДЛЯ РАЗРАБОТЧИКОВ
echo ========================================
echo.
echo Шаг 1: Установите Java
echo        Скачайте Java JDK 17 с https://adoptium.net/
echo        Установите Java
echo        Настройте переменную JAVA_HOME
echo.
echo Шаг 2: Установите Android SDK
echo        Скачайте Android SDK
echo        Настройте переменную ANDROID_HOME
echo.
echo Шаг 3: Соберите APK
echo        Откройте командную строку в папке проекта
echo        Выполните: gradlew.bat assembleDebug
echo        APK будет в app/build/outputs/apk/debug/
echo.
echo Время выполнения: 15 минут
echo Сложность: Сложная
echo.
pause
goto :menu

:show_all
echo.
echo ========================================
echo 📖 ВСЕ ИНСТРУКЦИИ
echo ========================================
echo.
echo В папке проекта есть файлы:
echo.
echo 🚀_БЫСТРО_ПОЛУЧИТЬ_APK.md - Самый быстрый способ
echo ПОШАГОВАЯ_ИНСТРУКЦИЯ_APK.md - Подробная инструкция
echo ФИНАЛЬНАЯ_СВОДКА.md - Полная сводка проекта
echo README.md - Описание для GitHub
echo.
echo Откройте любой из этих файлов для подробной информации!
echo.
pause
goto :menu

:quick_build
echo.
echo ========================================
echo 🔧 БЫСТРАЯ СБОРКА
echo ========================================
echo.
echo Пытаемся собрать APK с помощью доступных инструментов...
echo.
call quick-apk.bat
goto :menu

:invalid
echo.
echo Неверный выбор! Введите число от 0 до 5.
echo.
pause
goto :menu

:menu
cls
echo.
echo ========================================
echo 🍊 КАЛЬКУЛЯТОР "ПРИКИНЬ, СВЕТА!" 🍊
echo ========================================
echo.
echo Ваш проект полностью готов!
echo Теперь нужно получить APK файл.
echo.
echo Выберите способ получения APK:
echo.
echo [1] 🚀 GitHub Actions (РЕКОМЕНДУЕТСЯ - 5 минут)
echo [2] 💻 Android Studio (10 минут)
echo [3] ⚙️ Локальная сборка (15 минут)
echo [4] 📖 Показать все инструкции
echo [5] 🔧 Попробовать быструю сборку
echo [0] Выход
echo.
set /p choice="Введите номер (0-5): "

if "%choice%"=="1" goto :github_actions
if "%choice%"=="2" goto :android_studio
if "%choice%"=="3" goto :local_build
if "%choice%"=="4" goto :show_all
if "%choice%"=="5" goto :quick_build
if "%choice%"=="0" goto :exit
goto :invalid

:exit
echo.
echo ========================================
echo 🎉 УДАЧИ С ВАШИМ КАЛЬКУЛЯТОРОМ!
echo ========================================
echo.
echo Следуйте инструкциям и получите APK файл!
echo Калькулятор "Прикинь, Света!" ждет вас! ��✨
echo.
pause
exit

