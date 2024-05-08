chcp 65001
@echo off
setlocal

echo Використання цього батч-файлу:
echo %0 <джерело> <призначення>
echo.

pause

rem Перевірка наявності введених аргументів
if "%~1"=="" (
    echo Потрібно ввести аргументи. Використовуйте %0 <джерело> <призначення>
    exit /b 1
)

rem Встановлення змінних для джерела та призначення
set "source=%~1"
set "destination=%~2"

rem Перевірка наявності джерела та призначення
if not exist "%source%\" (
    echo Джерело "%source%" не знайдено.
    exit /b 1
)
if not exist "%destination%\" (
    echo Призначення "%destination%" не знайдено.
    exit /b 1
)

rem Виконання копіювання з джерела в призначення
robocopy "%source%" "%destination%" /E /XO /MOV 

rem Перевірка коду завершення та виведення відповідного повідомлення
if %errorlevel% equ 0 (
    echo Копіювання завершено успішно.
) else (
    echo Помилка під час копіювання. Код завершення: %errorlevel%.
    echo %errorlevel%
)

pause
endlocal
