@echo off
echo Limpando cache...
rd /s /q "cache"

timeout 3

.\Build\FXServer.exe +set onesync on +set onesync_enableInfinity true +set onesync_enableBeyond true +set onesync_forceMigration true +set onesync_distanceCullVehicles true +exec server.cfg
