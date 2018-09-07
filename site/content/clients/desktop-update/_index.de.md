---
title: Desktop Client Update
description: Der pascom Desktop Client updatet sich automatisch. Durch unsere Updatechannels ist es auf einfache Weise möglich Beta- und Featureversionen zu nutzen.
weight: 20

---

{{< doctype "both" >}}
 
{{< description >}}

## Automatik Updates

Der pascom Client bezieht seine Updates via HTTPS über [my.pascom.net](https://my.pascom.net/). Der Desktop Client ist dabei zu den pascom Servern abwärtskompatibel.

## Manuelle Updates

Sie können die automatischen Updates auch durch die Kommandozeilen Option `--noUpdate` unterbinden und Ihre Updates selbst verteilen oder manuell installieren. Der aktuellste Desktop Client steht auf unserer [Homepage](https://www.dev.pascom.net/de/downloads) zum Download zur Verfügung.

Automatische Updates werden, auch ohne Angabe des `--noUpdate` Parameter, im Falle einer [Terminalserver Installation]({{< ref "/clients/desktop-installation#terminalserver-installation" >}}) deaktiviert.

## Update-Channels

Ihnen stehen unterschiedliche Update-Channels zur Verfügung.
Diese finden Sie in Ihrem Desktop-Client unter `Einstellungen` > `Über pascom client` > `Channel`. 

Standardmäßig ist hier der `Stable` Channel ausgewählt - dieser enthält die selbe Version, die Sie auch über unsere [Homepage](https://www.pascom.net/de/downloads) erhalten können.

### Beta Programm

Sie können jederzeit den Update-Channel auf den `Beta` Channel umstellen und an unserem Beta Programm teilnehmen. 

Ihre Mithilfe ist uns sehr willkommen und wir freuen uns über Ihr Feedback in unserem [Forum](https://www.pascom.net/forum/)

{{% notice warning %}}
Wenn Sie von einem eigenen Update-Channel oder dem `Beta` Channel auf `Stable` zurück wechseln möchten, werden alle Benutzerprofile gelöscht, da es sich hierbei in der Regel um einen Downgrade handelt. In Ihrem Benutzerprofil sind Einstellungen wie das verwendete Desktop Theme oder Sortierreihenfolgen gespeichert. Diese Einstellungen müssen Sie dann erneut vornehmen. 
{{% /notice %}}

### Feature Channels

Alternativ können Sie manuell einen Feature-Channel einstellen. Diese werden gelegentlich zum testen neuer Einzelfunktionen angelegt und über unser [Forum](https://www.pascom.net/forum/) bzw. den Support bekannt gegeben. 



