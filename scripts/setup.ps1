$directories = ".\logs", ".\profile", ".\config"

foreach ($dir in $directories) {
  if (!(Test-Path $dir)) {
    New-Item -ItemType Directory -Force -Path $dir
    Write-Host "Directory $dir created."
  }
}

$dns_Content = @"
dns:
  enable: true
  enhanced-mode: fake-ip
  nameserver:
    - 114.114.114.114
    - 223.5.5.5
    - 8.8.8.8
  fallback: []
  fake-ip-filter:
    - +.stun.*.*
    - +.stun.*.*.*
    - +.stun.*.*.*.*
    - +.stun.*.*.*.*.*
    - "*.n.n.srv.nintendo.net"
    - +.stun.playstation.net
    - xbox.*.*.microsoft.com
    - "*.*.xboxlive.com"
    - "*.msftncsi.com"
    - "*.msftconnecttest.com"
    - WORKGROUP
"@

$general_Content = @"
mixed-port: 7890
log-level: info
mode: rule
external-controller: 0.0.0.0:9090
secret: '123456'
external-ui: ..\ui
ipv6: false
# allow-lan: true
# bind-address: "*"
# hosts:
profile:
  store-selected: true
  store-fake-ip: true
sniffer:
  enable: true
  force-dns-mapping: true
  parse-pure-ip: true
  sniff:
    TLS:
    HTTP:
  sniffing:
    - tls
    - http
experimental:
  sniff-tls-sni: true
"@

$tun_Content = @"
tun:
  enable: true
  stack: gvisor
  dns-hijack:
  - 0.0.0.0:53
  auto-route: true
  auto-detect-interface: true
"@

Set-Content -Path "profile\dns.yaml" -Value $dns_Content
Set-Content -Path "profile\general.yaml" -Value $general_Content
Set-Content -Path "profile\tun.yaml" -Value $tun_Content
