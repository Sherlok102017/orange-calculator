# Инструкция по сборке APK файла калькулятора "Прикинь, Света!"

## 🚀 Быстрый способ (рекомендуется)

### Вариант 1: Использование Android Studio (самый простой)
1. Скачайте и установите [Android Studio](https://developer.android.com/studio)
2. Откройте проект в Android Studio
3. Нажмите `Build` → `Build Bundle(s) / APK(s)` → `Build APK(s)`
4. APK файл будет создан в `app/build/outputs/apk/debug/`

### Вариант 2: Онлайн сборка
1. Загрузите проект на [GitHub](https://github.com)
2. Используйте [GitHub Actions](https://github.com/features/actions) для автоматической сборки
3. Или используйте [Appetize.io](https://appetize.io) для онлайн сборки

## 🔧 Ручная сборка (для разработчиков)

### Шаг 1: Установка Java JDK
1. Скачайте [Eclipse Temurin JDK 17](https://adoptium.net/) (рекомендуется)
2. Установите JDK
3. Настройте переменную JAVA_HOME:
   ```cmd
   setx JAVA_HOME "C:\Program Files\Eclipse Adoptium\jdk-17.0.x-hotspot"
   ```
4. Добавьте Java в PATH:
   ```cmd
   setx PATH "%PATH%;%JAVA_HOME%\bin"
   ```

### Шаг 2: Установка Android SDK
1. Скачайте [Android Studio](https://developer.android.com/studio)
2. Установите Android SDK через SDK Manager
3. Настройте переменную ANDROID_HOME:
   ```cmd
   setx ANDROID_HOME "C:\Users\%USERNAME%\AppData\Local\Android\Sdk"
   ```

### Шаг 3: Сборка APK
1. Откройте командную строку в папке проекта
2. Выполните команду:
   ```cmd
   gradlew.bat assembleDebug
   ```
3. APK файл будет создан в `app/build/outputs/apk/debug/`

## 📱 Установка APK на устройство

### Способ 1: Через ADB (для разработчиков)
1. Подключите устройство по USB
2. Включите отладку по USB
3. Выполните команду:
   ```cmd
   adb install app-debug.apk
   ```

### Способ 2: Ручная установка
1. Скопируйте APK файл на устройство
2. Включите "Установка из неизвестных источников"
3. Откройте APK файл и установите

## 🎨 Особенности приложения

- **Название**: "Прикинь, Света!"
- **Тип**: Калькулятор
- **Цветовая схема**: Оранжевая
- **Функции**: 
  - Базовые математические операции
  - Современный Material Design
  - Адаптивный интерфейс
  - Поддержка десятичных чисел

## 🛠️ Технические требования

- **Минимальная версия Android**: API 24 (Android 7.0)
- **Целевая версия Android**: API 34 (Android 14)
- **Язык**: Kotlin
- **Архитектура**: MVVM с ViewBinding

## 📋 Структура проекта

```
app/
├── src/main/
│   ├── java/com/example/orangecalculator/
│   │   └── MainActivity.kt
│   ├── res/
│   │   ├── layout/activity_main.xml
│   │   ├── values/colors.xml
│   │   ├── values/strings.xml
│   │   └── values/themes.xml
│   └── AndroidManifest.xml
└── build.gradle
```

## 🚨 Решение проблем

### Ошибка "JAVA_HOME is not set"
- Установите Java JDK
- Настройте переменную JAVA_HOME

### Ошибка "ANDROID_HOME is not set"
- Установите Android SDK
- Настройте переменную ANDROID_HOME

### Ошибка сборки Gradle
- Проверьте версию Java (должна быть 8+)
- Очистите проект: `gradlew clean`
- Синхронизируйте Gradle файлы

## 📞 Поддержка

Если у вас возникли проблемы:
1. Проверьте логи сборки
2. Убедитесь, что все зависимости установлены
3. Попробуйте использовать Android Studio
4. Обратитесь к официальной документации Android

## 🎯 Результат

После успешной сборки вы получите APK файл:
- **Имя**: `app-debug.apk`
- **Расположение**: `app/build/outputs/apk/debug/`
- **Размер**: примерно 2-5 МБ
- **Готов к установке**: Да

Удачи в сборке! 🎉
