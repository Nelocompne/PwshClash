$ui_dlpath = "ui"

$directories_ui = "$ui_dlpath\yacd", "$ui_dlpath\dashboard"
foreach ($ui_dir in $directories_ui) {
  if (!(Test-Path $ui_dir)) {
    curl -L "https://github.com/MetaCubeX/Yacd-meta/archive/gh-pages.zip" -o "yacd.zip"
    curl -L "https://github.com/MetaCubeX/Razord-meta/archive/gh-pages.zip" -o "dashboard.zip"
    Expand-Archive -Path "yacd.zip" -DestinationPath "$ui_dlpath"
    Expand-Archive -Path "dashboard.zip" -DestinationPath "$ui_dlpath"
    mv $ui_dlpath\Razord-meta-gh-pages $ui_dlpath\dashboard
    mv $ui_dlpath\Yacd-meta-gh-pages $ui_dlpath\yacd
    rm dashboard.zip, yacd.zip
  }
}
