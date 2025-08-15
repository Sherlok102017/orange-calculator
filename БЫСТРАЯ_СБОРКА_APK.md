# 🚀 Быстрая сборка APK без установки Java

## ⚡ Самый быстрый способ (5 минут)

### Вариант 1: GitHub Actions (рекомендуется)
1. Создайте аккаунт на [GitHub](https://github.com)
2. Создайте новый репозиторий
3. Загрузите все файлы проекта
4. Создайте файл `.github/workflows/build.yml`:

```yaml
name: Build APK
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - name: Set up JDK 17
      uses: actions/setup-java@v3
      with:
        java-version: '17'
        distribution: 'temurin'
    - name: Grant execute permission for gradlew
      run: chmod +x gradlew
    - name: Build APK
      run: ./gradlew assembleDebug
    - name: Upload APK
      uses: actions/upload-artifact@v3
      with:
        name: app-debug
        path: app/build/outputs/apk/debug/
```

5. Подождите 2-3 минуты
6. Скачайте APK из Actions → Artifacts

### Вариант 2: Gitpod (онлайн IDE)
1. Перейдите на [Gitpod](https://gitpod.io)
2. Вставьте URL вашего GitHub репозитория
3. В терминале выполните: `./gradlew assembleDebug`
4. Скачайте APK из папки `app/build/outputs/apk/debug/`

### Вариант 3: Codespaces (GitHub)
1. В репозитории нажмите "Code" → "Codespaces"
2. Создайте новый codespace
3. В терминале: `./gradlew assembleDebug`
4. Скачайте APK

## 🔧 Альтернативные способы

### Способ 1: Android Studio Online
1. Перейдите на [Android Studio Online](https://developer.android.com/studio)
2. Загрузите проект
3. Соберите APK в браузере

### Способ 2: AppInventor
1. Перейдите на [MIT App Inventor](https://appinventor.mit.edu/)
2. Создайте калькулятор с оранжевой темой
3. Скачайте APK

### Способ 3: BuildFire
1. Перейдите на [BuildFire](https://buildfire.com/)
2. Создайте приложение-калькулятор
3. Соберите APK

## 📱 Что делать с готовым APK

1. **Скопируйте APK на Android устройство**
2. **Включите "Установка из неизвестных источников"**
3. **Установите APK**
4. **Запустите "Прикинь, Света!"**

## 🎯 Результат

После любого из способов вы получите:
- ✅ Готовый APK файл
- ✅ Приложение "Прикинь, Света!"
- ✅ Оранжевый калькулятор
- ✅ Работает на Android 7.0+

## 🆘 Если ничего не работает

1. **Используйте готовый APK** (если есть)
2. **Попросите помощи у разработчика**
3. **Используйте Android Studio на другом компьютере**
4. **Загрузите проект на GitHub и используйте Actions**

## 🎉 Готово!

Теперь у вас есть APK файл калькулятора "Прикинь, Света!" в оранжевом цвете!

---
**Время выполнения: 5-15 минут** ⏱️
**Сложность: Легко** 🌟
**Результат: Готовый APK** 📱

