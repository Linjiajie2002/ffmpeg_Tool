@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

for %%i in (*.mp3) do (
    if not exist "%%~ni.flac" (
        echo 正在转换: "%%i"
        ffmpeg -i "%%i" -c:a flac -compression_level 8 -y "%%~ni.flac" 2>nul
        if !errorlevel! equ 0 (
            echo 转换成功: "%%~ni.flac"
        ) else (
            echo 转换失败: "%%i"
        )
    ) else (
        echo 文件已存在，跳过: "%%~ni.flac"
    )
)

echo 所有转换任务完成
pause