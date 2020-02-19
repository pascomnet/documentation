---
title: SIP Header ändern
description: Wie passt man den SIP Header ab pascom 19.03 an? 
---
 
{{< doctype "both" >}} 

{{< description >}}

{{% notice warning %}}
PJSIP erlaubt das Manipulieren von SIP Headern nur noch in sogenannten Pre-Dial Handlern, somit funktionieren die früher erlernten Dialplan Apps nicht mehr!
{{% /notice %}}

## Überblick

Manchmal ist es notwendig, den ein oder anderen SIP Header anzupassen. Beispiele: abweichende Klingeltöne je nach Anrufer, CLIP no screening Einstellungen usw.
Nachfolgend finden Sie zu einigen Szenarien Beispiele, auf welche Arten SIP Header angepasst werden können. 

### Über die Trunk-Optionen

Die einfachste Methode ist die Verwendung des **Optionenfelds** in den Trunk-Account Einstellungen. Eine pascom spezifische Syntax erleichtert das Setzen von Headern.
In den Optionen gesetzte SIP Header schlagen automatisch immer die durch den Trunk gesetzten Werte ***(z.B. CLIP=auto)***.

**Beispiel:** Clip no screening.

```
header/P-Asserted-Identity=<sip:09916666666@provider.des.kundens>
```
Das **Optionenfeld** ist ab pascom 19.03 flexibel mit Variablen nutzbar. Ein komplexeres Beispiel:

```
header/P-Asserted-Identity=<sip:{{{048pee_username}}}@{{{048pee_domain}}}>
```
<br />
Variablen werden erst sehr spät im Dialplan evaluiert. Man kann also auch z.B. die gewählte Rufnummer oder Werte aus Labels in einen Header setzen ($(EXTEN)etc.).

### Über ein Outbound Skript

Natürlich kann man, wie man es bisher kennt, ein **Outbound Skript** benutzen, um SIP Header zu manipulieren.

**Beispiel:** Setzen/überschreiben eines Headers
```
Set(HASH(__SIPHEADERS,P-mein-header)=mein-wert)
```
**Beispiel:** entfernen eines Headers
```
Set(HASH(__SIPHEADERS,Alert-info)=remove)
```
### Für Endgeräte

Für Endgeräte muss man immer noch auf ein **Skript** oder **Aktionen** zurückgreifen. Die Syntax ist identisch mit dem **Outbound Skript**  

**Beispiel:** Setzen/überschreiben eines Headers
```
Set(HASH(__SIPHEADERS,Alert-info)=<http://www.notused.de>\;info=alert-group\;x-line-id=0)
```
**Beispiel:** entfernen eines Headers
```
Set(HASH(__SIPHEADERS,Alert-info)=remove)
```
