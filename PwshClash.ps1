Clear-Host

if (Get-Process "clash" -ErrorAction SilentlyContinue) {
    $run_test_talk = "关闭"
} else {
    $run_test_talk = "启动"
}

Write-Host "Welcome to My TUI Demo"
Write-Host "======================="
Write-Host "todo: "
Write-Host "     [x]程序运行、配置安装"
Write-Host "     [ ]选择核心"
Write-Host "     [ ]根据订阅生成配置文件"
Write-Host "     [x]下载面板"
Write-Host ""
Write-Host "第一次启动请先运行【初始化目录】"
Write-Host "Choose an option:"
Write-Host "1. 初始化目录"
Write-Host "2. $run_test_talk Clash"
Write-Host "3. 生成配置"
Write-Host "4. 下载面板"

$choice = Read-Host "Enter your choice(输入 q 退出): "

if ($choice -eq "1") {
    Clear-Host
    Write-Host "You chose Option One"
    scripts\setup.ps1
    # Pause
    Goto start
} elseif ($choice -eq "2") {
    Clear-Host
    Write-Host "You chose Option Two"
    if ($run_test_talk -eq "关闭") {
        Stop-Process -ProcessName "clash"
    } elseif ($run_test_talk -eq "启动") {
        scripts\clash.ps1 &
    }
    Start-Sleep -Seconds 0.8
    # Pause
    Goto start
} elseif ($choice -eq "3") {
    Clear-Host
    Write-Host "You chose Option 3"
    Get-Content profile\general.yaml, profile\dns.yaml, profile\tun.yaml, main.yaml | Set-Content config\config.yaml
    Pause
    Goto start
} elseif ($choice -eq "4") {
    Clear-Host
    Write-Host "You chose Option 4"
    scripts\ui.ps1
    Pause
    Goto start
} elseif ($choice -eq "q") {
    Clear-Host
    Write-Host "Goodbye!"
    # Pause
    Exit
} else {
    Clear-Host
    Write-Host "Invalid choice, please try again."
    # Pause
    Goto start
}

:start
Clear-Host
.\PwshClash.ps1


# Clear-Host
# Write-Host "打开以下链接进入面板（二选一）："
# Write-Host "============================"
# Write-Host ""
# Write-Host "1. http://127.0.0.1:9090/ui/yacd/?hostname=127.0.0.1&port=9090&secret=123456#/proxies"
# Write-Host "2. http://127.0.0.1:9090/ui/dashboard/#/proxies?host=127.0.0.1&port=9090&secret=123456"
