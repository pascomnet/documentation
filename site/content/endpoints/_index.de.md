---
title: Endgeräte
description: pascom ist zu einer Vielzahl an Hardware IP-Telefonen kompatibel. An dieser Stelle erfahren Sie wie diese automatisch und sicher eingebunden werden können.
icon: "fa fa-phone"
type : "pages"
weight : 6
---
{{% notice tip %}}
Verwenden Sie von pascom unterstütze Endgeräte um alle integrierten Provisionierungs- und CTI- Tools zu nutzen!
{{% /notice %}}

# Übersicht unterstützter Endgeräte

[SNOM IP-Telefone](#snom-ip-telefone "SNOM IP-Telefone")  
[SNOM DECT-Systeme](#snom-dect-systeme "SNOM DECT-Systeme")      
[Yealink IP-Telefone](#yealink-ip-telefone "Yealink IP-Telefone")  
[Yealink DECT-Systeme](#yealink-dect-systeme "Yealink DECT-Systeme")  
[Grandstream IP-Telefone](#grandstream-ip-telefone "Grandstream IP-Telefone")  
[Mitel DECT-Systeme](#mitel-dect-systeme "Mitel DECT-Systeme")     

## SNOM IP-Telefone

|Provisionierung|Firmware-Verwaltung|Fernsteuerung über Desktop-Client|pascom Menü|
|---|---|---|---|
|ja|ja|ja|ja|

**Provisionierung**: Das IP-Telefon wird über die pascom verwaltet.<br>
**Firmware-Verwaltung**: Die Firmware kann über pascom aktualisiert werden.<br>
**Fernsteuerung über Desktop-Client**: Gespräche können über den Desktop-Client gestartet werden.<br>
**pascom Menü**: An einer Taste am Telefon wird das pascom Menü hinterlegt.

{{% notice warning %}}
Modelle aus der Snom 3XX Reihe sind in der aktuellen pascom Cloud-Lösung nicht funktionsfähig und können nur OnSite verwendet werden. 
{{% /notice %}}

|Modelle||
|---|---|
|Snom D120|Snom D715|
|Snom D315|Snom D717|
|Snom D345|Snom D725|
|Snom D375|Snom D735|
|Snom D385|Snom D745|
|Snom D712|Snom D765|
|Snom D785||

<!--- |Modell|getestete Firmware-Version|
|---|---|
|Snom D120|10.1.33.33|
|Snom D315| 8.9.|
|Snom D345|8.9.3.40|
|Snom D375|8.9.3.60|
|Snom D385|10.1.33.33|
|Snom D715|8.9.3.80|
|Snom D725|8.9.3|
|Snom D735|10.1.33.33|
|Snom D745|8.9.3.80|
|Snom D765|8.9.3|

alt:
|Snom D785|10.1.20.0|
|Snom 710|8.7.3.25.5|
|Snom 720|8.7.3.25.5|
|Snom 760|8.7.3.25.5|
|Snom 821|?| --->

{{% notice note %}}
Da es für die verschiedenen IP-Telefone eine Vielzahl von Firmwares gibt ist es uns leider nicht möglich jede zu testen, so dass es sein kann, dass manche Firmware-Versionen pascom Funktionen nicht unterstützen.
{{% /notice %}}

{{% notice info %}}
Aufgrund aktueller Sicherheitsstandards werden Snom IP-Telefone der 3XX Reihe in der kommenden pascom 19 Version nicht mehr unterstützt.
{{% /notice %}}

## SNOM DECT-Systeme

|Modelle||
|---|---|
|Snom M700|Snom M900|

## Yealink IP-Telefone

|Provisionierung|Firmware-Verwaltung|Fernsteuerung über Desktop-Client|pascom Menü|
|---|---|---|---|
|ja|ja|ja|ja|

**Provisionierung**: Das IP-Telefon wird über die pascom verwaltet.<br>
**Firmware-Verwaltung**: Die Firmware kann über pascom aktualisiert werden.<br>
**Fernsteuerung über Desktop-Client**: Gespräche können über den Desktop-Client gestartet werden.<br>
**pascom Menü**: An einer Taste am Telefon wird das pascom Menü hinterlegt.

|Modelle||
|---|---|
|Alle Modelle der T4-Serie|Alle Modelle der T5-Serie|

{{% notice note %}}
Da es für die verschiedenen IP-Telefone eine Vielzahl von Firmwares gibt ist es uns leider nicht möglich jede zu testen, so dass es sein kann, dass manche Firmware-Versionen pascom Funktionen nicht unterstützen. 
{{% /notice %}}

<!--- |Modell|Firmware|
|---|---|
|T41P|36.81.0.110|
|T46G|28.81.0.110, 28.73.0.50|
|T46S|66.81.0.20, 66.81.0.110| --->

## Yealink DECT-Systeme

|Modelle||
|---|---|
|Yealink W52P|Yealink W60P|

## Grandstream IP-Telefone

|Provisionierung|Firmware-Verwaltung|Fernsteuerung über Desktop-Client|pascom Menü|
|---|---|---|---|
|ja|ja|ja|nein|

**Provisionierung**: Das IP-Telefon wird über die pascom verwaltet.<br>
**Firmware-Verwaltung**: Die Firmware kann über pascom aktualisiert werden.<br>
**Fernsteuerung über Desktop-Client**: Gespräche können über den Desktop-Client gestartet werden.<br>
**pascom Menü**: Das pascom Menü ist nicht auf dem IP-Telefon hinterlegt.

|Modelle||
|---|---|
|Grandstream GXP 1610|Grandstream GXP 1630|
|Grandstream GXP 1615|Grandstream GXP 2130|
|Grandstream GXP 1620|Grandstream GXP 2135|
|Grandstream GXP 1625|Grandstream GXP 2160|
|Grandstream GXP 1628|Grandstream GXP 2170|
|Grandstream GXP 1760||
|Grandstream GXV 3240|Grandstream GXV 3275|
|Grandstream GRP 2612|Grandstream GRP 2613|
|Grandstream GRP 2614|Grandstream GRP 2615|
|Grandstream GRP 2616||

{{% notice note %}}
Da es für die verschiedenen IP-Telefone eine Vielzahl von Firmwares gibt ist es uns leider nicht möglich jede zu testen, so dass es sein kann, dass manche Firmware-Versionen pascom Funktionen nicht unterstützen. 
{{% /notice %}}

<!--- |Modell|Empfohlene Firmware|
|---|---|
|GXP 1630|1.0.4.55|
|GXP 2130|1.0.7.25|
|GXP 2135|1.0.7.97|
|GXP 2160|1.0.7.97|
|GXV 3240|1.0.3.158| --->

## Mitel DECT-Systeme

|Modelle||
|---|---|
|Mitel RFP 44 indoor|Mitel RFP 45 indoor|
|Mitel RFP 47 indoor|Mitel RFP 47 DRC outdoor|