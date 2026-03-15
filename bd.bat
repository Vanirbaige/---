@echo off
chcp 65001 >nul
:: 开启高级色彩模式
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do set ESC=%%b
color 0A
title 幻想物语RE - 自动更新补丁

:menu
cls
echo %ESC%[92m==================================================%ESC%[0m
echo %ESC%[97m      欢迎使用整合包自动更新程序 - 作者:白咕      %ESC%[0m
echo %ESC%[92m==================================================%ESC%[0m
echo.
:: --- BEGIN LATEST LOG ---
echo %ESC%[92m==================================================%ESC%[0m
echo %ESC%[97m                 【 最新日志 】                   %ESC%[0m
echo %ESC%[96m●新增mino模组和扑克牌模组(经过测试未出现bug,之后会上架任务里)%ESC%[0m
echo %ESC%[96m●为tp购买任务添加图片指引%ESC%[0m
echo %ESC%[96m●修复挖砍的箱子有概率开出空气的bug%ESC%[0m
:: --- END LATEST LOG ---
echo.
:: --- BEGIN PAST LOG ---
echo %ESC%[92m==================================================%ESC%[0m
echo %ESC%[97m               【 以往更新日志 】                 %ESC%[0m
echo %ESC%[93m●删除Waystones Teleport Pets模组,此模组会导致玩家宠物总是被石碑传走%ESC%[0m
echo %ESC%[93m●修复农夫乐事的刀不能破坏方块的bug%ESC%[0m
echo %ESC%[93m●修改神话钥匙合成只需要4个石头%ESC%[0m
:: --- END PAST LOG ---
echo %ESC%[92m==================================================%ESC%[0m

echo 请选择您当前要更新的环境：
echo.
echo %ESC%[97m[1] 更新客户端! (将自动寻找 .minecraft)%ESC%[0m
echo %ESC%[97m[2] 更新服务端! (将自动寻找 run.bat)%ESC%[0m
echo %ESC%[97m[3] 退出程序%ESC%[0m
echo.
set /p choice=%ESC%[92m请输入数字 (1, 2 或 3) 并按回车键: %ESC%[0m

if "%choice%"=="1" goto client
if "%choice%"=="2" goto server
if "%choice%"=="3" goto cleanup_and_exit
goto menu

:client
echo.
echo %ESC%[93m正在检测客户端环境...%ESC%[0m
if not exist ".minecraft" (
    echo %ESC%[91m[错误] 找不到 .minecraft 文件夹！%ESC%[0m
    echo 请确认您把本程序放在了客户端的根目录里。
    echo.
    pause
    goto menu
)
echo %ESC%[92m检测通过！开始更新客户端文件...%ESC%[0m
echo %ESC%[92m--------------------------------------------------%ESC%[0m
if exist ".minecraft\versions\幻想物语RE\mods\传送石传送宠物WaystonesTeleportPets-1.20-1.20.1--1.2.jar" (
    del /f /q ".minecraft\versions\幻想物语RE\mods\传送石传送宠物WaystonesTeleportPets-1.20-1.20.1--1.2.jar"
    echo %ESC%[91m[删除]%ESC%[92m 已删除旧文件: %ESC%[97mmods\传送石传送宠物WaystonesTeleportPets-1.20-1.20.1--1.2.jar%ESC%[0m
)
if not exist ".minecraft\versions\幻想物语RE\kubejs\server_scripts\" mkdir ".minecraft\versions\幻想物语RE\kubejs\server_scripts\"
copy /y "新文件\地牢传送无限.js" ".minecraft\versions\幻想物语RE\kubejs\server_scripts\" >nul
echo %ESC%[96m[添加]%ESC%[92m 已将 %ESC%[97m地牢传送无限.js%ESC%[92m 添加到目录 %ESC%[97mkubejs\server_scripts\%ESC%[0m
if not exist ".minecraft\versions\幻想物语RE\config\paxi\datapacks\" mkdir ".minecraft\versions\幻想物语RE\config\paxi\datapacks\"
copy /y "新文件\inax.zip" ".minecraft\versions\幻想物语RE\config\paxi\datapacks\" >nul
echo %ESC%[96m[添加]%ESC%[92m 已将 %ESC%[97minax.zip%ESC%[92m 添加到目录 %ESC%[97mconfig\paxi\datapacks\%ESC%[0m
if not exist ".minecraft\versions\幻想物语RE\config\kinetictweaks\" mkdir ".minecraft\versions\幻想物语RE\config\kinetictweaks\"
copy /y "新文件\attributes.toml" ".minecraft\versions\幻想物语RE\config\kinetictweaks\" >nul
echo %ESC%[96m[添加]%ESC%[92m 已将 %ESC%[97mattributes.toml%ESC%[92m 添加到目录 %ESC%[97mconfig\kinetictweaks\%ESC%[0m
if not exist ".minecraft\versions\幻想物语RE\config\kinetictweaks\" mkdir ".minecraft\versions\幻想物语RE\config\kinetictweaks\"
copy /y "新文件\mixin_toggles.toml" ".minecraft\versions\幻想物语RE\config\kinetictweaks\" >nul
echo %ESC%[96m[添加]%ESC%[92m 已将 %ESC%[97mmixin_toggles.toml%ESC%[92m 添加到目录 %ESC%[97mconfig\kinetictweaks\%ESC%[0m
if not exist ".minecraft\versions\幻想物语RE\config\" mkdir ".minecraft\versions\幻想物语RE\config\"
copy /y "新文件\epicfight-client.toml" ".minecraft\versions\幻想物语RE\config\" >nul
echo %ESC%[96m[添加]%ESC%[92m 已将 %ESC%[97mepicfight-client.toml%ESC%[92m 添加到目录 %ESC%[97mconfig\%ESC%[0m
if not exist ".minecraft\versions\幻想物语RE\mods\" mkdir ".minecraft\versions\幻想物语RE\mods\"
copy /y "新文件\扑克牌playingcards-2.0.0.jar" ".minecraft\versions\幻想物语RE\mods\" >nul
echo %ESC%[96m[添加]%ESC%[92m 已将 %ESC%[97m扑克牌playingcards-2.0.0.jar%ESC%[92m 添加到目录 %ESC%[97mmods\%ESC%[0m
if not exist ".minecraft\versions\幻想物语RE\mods\" mkdir ".minecraft\versions\幻想物语RE\mods\"
copy /y "新文件\minopp-1.4.0+1.20.1+forge.jar" ".minecraft\versions\幻想物语RE\mods\" >nul
echo %ESC%[96m[添加]%ESC%[92m 已将 %ESC%[97mminopp-1.4.0+1.20.1+forge.jar%ESC%[92m 添加到目录 %ESC%[97mmods\%ESC%[0m
if not exist ".minecraft\versions\幻想物语RE\config\paxi\resourcepacks\" mkdir ".minecraft\versions\幻想物语RE\config\paxi\resourcepacks\"
copy /y "新文件\mmorpg.zip" ".minecraft\versions\幻想物语RE\config\paxi\resourcepacks\" >nul
echo %ESC%[96m[添加]%ESC%[92m 已将 %ESC%[97mmmorpg.zip%ESC%[92m 添加到目录 %ESC%[97mconfig\paxi\resourcepacks\%ESC%[0m

echo %ESC%[92m--------------------------------------------------%ESC%[0m
echo %ESC%[97m客户端更新全部完成！按任意键将清理临时文件并退出...%ESC%[0m
pause >nul
goto cleanup_and_exit

:server
echo.
echo %ESC%[93m正在检测服务端环境...%ESC%[0m
if not exist "run.bat" (
    echo %ESC%[91m[错误] 找不到 run.bat 文件！%ESC%[0m
    echo 请确认您把本程序放在了服务端的根目录里。
    echo.
    pause
    goto menu
)
echo %ESC%[92m检测通过！开始更新服务端文件...%ESC%[0m
echo %ESC%[92m--------------------------------------------------%ESC%[0m
if exist "mods\传送石传送宠物WaystonesTeleportPets-1.20-1.20.1--1.2.jar" (
    del /f /q "mods\传送石传送宠物WaystonesTeleportPets-1.20-1.20.1--1.2.jar"
    echo %ESC%[91m[删除]%ESC%[92m 已删除旧文件: %ESC%[97mmods\传送石传送宠物WaystonesTeleportPets-1.20-1.20.1--1.2.jar%ESC%[0m
)
if exist "mods\[史诗战斗] epicfight-forge-20.14.3-1.20.1 - 副本.jar" (
    del /f /q "mods\[史诗战斗] epicfight-forge-20.14.3-1.20.1 - 副本.jar"
    echo %ESC%[91m[删除]%ESC%[92m 已删除旧文件: %ESC%[97mmods\[史诗战斗] epicfight-forge-20.14.3-1.20.1 - 副本.jar%ESC%[0m
)
if exist "config\paxi\resourcepacks\mmorpg.zip" (
    del /f /q "config\paxi\resourcepacks\mmorpg.zip"
    echo %ESC%[91m[删除]%ESC%[92m 已删除旧文件: %ESC%[97mconfig\paxi\resourcepacks\mmorpg.zip%ESC%[0m
)
if not exist "kubejs\server_scripts\" mkdir "kubejs\server_scripts\"
copy /y "新文件\地牢传送无限.js" "kubejs\server_scripts\" >nul
echo %ESC%[96m[添加]%ESC%[92m 已将 %ESC%[97m地牢传送无限.js%ESC%[92m 添加到目录 %ESC%[97mkubejs\server_scripts\%ESC%[0m
if not exist "config\paxi\datapacks\" mkdir "config\paxi\datapacks\"
copy /y "新文件\inax.zip" "config\paxi\datapacks\" >nul
echo %ESC%[96m[添加]%ESC%[92m 已将 %ESC%[97minax.zip%ESC%[92m 添加到目录 %ESC%[97mconfig\paxi\datapacks\%ESC%[0m
if not exist "config\kinetictweaks\" mkdir "config\kinetictweaks\"
copy /y "新文件\attributes.toml" "config\kinetictweaks\" >nul
echo %ESC%[96m[添加]%ESC%[92m 已将 %ESC%[97mattributes.toml%ESC%[92m 添加到目录 %ESC%[97mconfig\kinetictweaks\%ESC%[0m
if not exist "config\kinetictweaks\" mkdir "config\kinetictweaks\"
copy /y "新文件\mixin_toggles.toml" "config\kinetictweaks\" >nul
echo %ESC%[96m[添加]%ESC%[92m 已将 %ESC%[97mmixin_toggles.toml%ESC%[92m 添加到目录 %ESC%[97mconfig\kinetictweaks\%ESC%[0m
if not exist "config\" mkdir "config\"
copy /y "新文件\epicfight-client.toml" "config\" >nul
echo %ESC%[96m[添加]%ESC%[92m 已将 %ESC%[97mepicfight-client.toml%ESC%[92m 添加到目录 %ESC%[97mconfig\%ESC%[0m
if not exist "mods\" mkdir "mods\"
copy /y "新文件\扑克牌playingcards-2.0.0.jar" "mods\" >nul
echo %ESC%[96m[添加]%ESC%[92m 已将 %ESC%[97m扑克牌playingcards-2.0.0.jar%ESC%[92m 添加到目录 %ESC%[97mmods\%ESC%[0m
if not exist "mods\" mkdir "mods\"
copy /y "新文件\minopp-1.4.0+1.20.1+forge.jar" "mods\" >nul
echo %ESC%[96m[添加]%ESC%[92m 已将 %ESC%[97mminopp-1.4.0+1.20.1+forge.jar%ESC%[92m 添加到目录 %ESC%[97mmods\%ESC%[0m
if not exist "mods\" mkdir "mods\"
copy /y "新文件\[JEI物品管理器] jei-1.20.1-forge-15.20.0.106.jar" "mods\" >nul
echo %ESC%[96m[添加]%ESC%[92m 已将 %ESC%[97m[JEI物品管理器] jei-1.20.1-forge-15.20.0.106.jar%ESC%[92m 添加到目录 %ESC%[97mmods\%ESC%[0m

echo %ESC%[92m--------------------------------------------------%ESC%[0m
echo %ESC%[97m服务端更新全部完成！按任意键将清理临时文件并退出...%ESC%[0m
pause >nul
goto cleanup_and_exit

:cleanup_and_exit
cls
echo %ESC%[93m正在进行最后的清理工作，请稍候...%ESC%[0m
:: --- 彻底清理解压出的文件夹 ---
if exist "新文件" (
    rd /s /q "新文件"
    echo %ESC%[92m[清理] 已成功移除临时文件夹 "新文件"%ESC%[0m
)
:: --- 程序自毁逻辑 ---
echo %ESC%[92m[完成] 更新程序即将自动退出并删除自身。%ESC%[0m
timeout /t 2 >nul
(goto) 2>nul & del "%~f0" & exit
