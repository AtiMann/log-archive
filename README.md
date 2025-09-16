# Log Archive Script

Ez egy PowerShell szkript, amely logfájlok archiválását és naplózását végzi.  
A `logarc.psd1` konfigurációs fájllal állítható a keresési és mentési útvonal.

## Funkciók

- **write-log** – Naplóüzenetet ír időbélyeggel.  
- **get-file** – Megkeresi a log fájlokat egy adott mappában (`.log` kiterjesztés vagy `*log*` a névben).  
- **log-archive** – Összegyűjti és `.tar.gz` archívumba menti a logokat, majd rögzíti az eseményeket a logban.  

## Konfiguráció
 - A logarc.psd1 tartalmazza az elérési útvonalakat.
 
- **-filepath** - A mappa, ahol a tömörítendő fájlokat keresi a szkript..
- **-path** - A célútvonal, ahova a tömörített archívumok mentésre kerülnek.
## Mód
 - Alapértelmezett mód (config alapján) **.\logarc.ps1**
 - Gyors mód saját útvonalak megadásával **.\logarc.ps1 -path "xy" -filepath "xy"** # Gyors mód indítása esetén nem kötelező mind a két útvonalat megadni. Ha nincs megadott útvonal az alapártelmezett útvonalat használja.
