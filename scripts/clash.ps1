$psi = New-Object System.Diagnostics.ProcessStartInfo
$psi.FileName = ".\clash.exe"
$psi.Arguments = "-d .\config"
$psi.RedirectStandardOutput = $true
$psi.UseShellExecute = $false
$psi.WindowStyle = [System.Diagnostics.ProcessWindowStyle]::Hidden
$psi.CreateNoWindow = $true

$process = New-Object System.Diagnostics.Process
$process.StartInfo = $psi
$process.Start() | Out-Null
$output = $process.StandardOutput.ReadToEnd()

# 获取当前时间日期并格式化为字符串表示形式
$dateString = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"

# 将输出写入以当前时间日期为名称的文件中
$output | Out-File -FilePath ".\logs\log_$dateString.txt" -Encoding UTF8
