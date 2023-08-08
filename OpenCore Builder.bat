@ECHO OFF
CLS
ECHO 1. Erase USB (must be 16GB+)
ECHO 2. Install macOS Ventura Recovery
ECHO 3. Setup OpenCore
ECHO 4. Help
ECHO 5. Credits
ECHO.

CHOICE /C 12345 /M "Enter your choice:"

:: Note - list ERRORLEVELS in decreasing order
IF ERRORLEVEL 5 GOTO Credits
IF ERRORLEVEL 4 GOTO Help
IF ERRORLEVEL 3 GOTO OcSetup
IF ERRORLEVEL 2 GOTO Recovery
IF ERRORLEVEL 1 GOTO USBerase

:USBerase
echo 		 - USB Eraser -
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo EVERYTHING ON DISK WILL BE ERASED!
echo BACKUP YOUR USB FILES!
echo CLICK ANY KEY 3 TIMES TO ERASE!
pause
pause
pause
diskpart
sel dis 1
clean
cre par pri
sel par 0
for fs=fat32 quick
sel par 0
ass letter=Q
exit
echo Done.
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
pause


:Recovery
echo 	   - Recovery Installer -
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo Making recovery catalog...
python macrecovery.py -b Mac-B4831CEBD52A0C4C -m 00000000000000000 download
xcopy /e /i com.apple.recovery.boot Q:\
echo Recovery is now exists on USB.
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
pause


:OcSetup
echo 	      - OpenCore Setup -
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo Found Intel Laptop OC folders.
echo Found Intel Desktop OC folders.
echo Found AMD OC folder.
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo Intel users:
echo Find platform, CPU gen and copy EFI folder to your USB.
echo AMD users:
echo Copy EFI folder from AMD to USB.
echo Click anything to show EFIs.
echo After copying, you can boot from USB!
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
pause
start OC-EFIs
pause


:Help
echo          - Help Page -
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo A - No USB entry in BIOS, help!
echo B - You must have EFI folder to boot.
echo A - I don't know my CPU generation!
echo B - Install CPU-Z and see "Code Name".
echo A - Do I need to erase Windows?
echo B - You can dual-boot or only macOS.
echo A - Internet error?
echo B - Use Ethernet cable.
echo A - Do I need 16GB USB?
echo B - YES.
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
pause


:Credits
echo          - Credits -
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo acidanthera - OpenCore and macrecovery
echo netvn82 - OpenCore EFIs
echo dortania - OpenCore Install Guide
echo windows3280 - coding this in batch
echo apple - macOS and BaseSystem Recovery
echo microsoft - batch (this app code launguage is batch)
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
pause
