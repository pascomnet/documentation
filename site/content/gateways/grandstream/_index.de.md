---
title: Grandstream ATA HT701 und HT802
description: Integrieren Sie Ihre Analog-Endgeräte mithilfe des Grandstream ATA HT701 und HT802 in Ihre pascom
weight: 40
---

{{< doctype "both"  >}}

{{< description >}}

## Kompatibilität

**Grandstream HT701**

- Ein FXS-Anschluss für ein analoges Endgerät.
![Grandstream HT701](grandstream_ht701.jpg?width=300px)


**Grandstream HT802**

- Zwei FXS-Anschlüsse für zwei analoge Endgeräte.
![Grandstream HT802](grandstream_ht802.png?width=300px)


|Provisionierung|Firmware-Verwaltung|
|---|---|
|ja|nein|

**Provisionierung**: Das Gateway wird über die pascom verwaltet.<br>
**Firmware-Verwaltung**: Die Firmware kann nicht über pascom aktualisiert werden.<br>


## Konfiguration

{{% tabs %}}

{{% tab "Cloud" %}}

**Pairing via URL funktioniert in der CLOUD + ONSITE**  

{{< num 1 "Gateway anschließen" >}}

{{% notice tip %}}
Handelt es sich nicht um ein fabrikneues Gateway setzen Sie es in jedem
Fall auf **Werkseinstellungen** zurück. Um dies am Gateway zu tun, wechseln Sie über Ihren Browser zu der Admin-Oberfläche des Gateway und führen dort einen **Reset** durch. Weitere Informationen entnehmen Sie dem Handbuch des Herstellers. 
{{% /notice %}}

Stecken Sie das Gateway an das Netzwerk. 


{{< num 2 "MAC-Adresse ermitteln" >}}

Die MAC-Adresse steht auf der Rückseite des Gateways.

Alternativ surfen Sie mit Ihrem Browser auf die Admin-Weboberfläche des Gateway oder verwenden Sie das Benutzerhandbuch.


{{< num 3 "Gateway anlegen" >}}

Loggen Sie sich in Ihrer Telefonanlage ein und fügen unter {{< ui-button "Gateways" >}} > {{< ui-button "Gatewayliste" >}} ein
neues Gerät vom Typ **ATA-Gateway: Grandstream** hinzu.

Wählen Sie das von Ihnen angeschlossene **Model** aus.

Tragen Sie im Feld **Mac-Adresse** die zuvor ermittelte MAC-Adresse des Gateways
ein.

Geben Sie eine individuelle Bezeichnung ein.

Abschließend klicken Sie auf **Weiter und Gateway anlegen**

{{< num 4 "Jobs Anwenden" >}}

Nach dem Speichern von Änderungen erscheint in der Job-Box (oben) ein
entsprechender Eintrag die Telefonie anzuwenden. Starten Sie den Job durch
einen Klick auf den {{< ui-button "grünen Haken" >}}.

{{< num 5 "Provisionierung-URL ermitteln" >}}

Haken Sie das Gateway in der Gatewayliste an und wählen {{< ui-button "Aktion" >}} > {{< ui-button "Provisioning URL" >}}. Kopieren Sie die **URL** in die Zwischenablage.

{{< num 6 "Provisionierung-URL am Gateway eintragen" >}}

Gehen Sie in die Admin-UI des Gateway und hinterlegen Sie die kopierte Provisionierungs-URL.

![Grandstream Provisioning URL](provisioning_url.png)

Speichern Sie die Änderungen und starten Sie das Gateway zur Provisionierung neu. Alternativ können Sie das Gateway
auch manuell kurz vom Strom nehmen.


{{< num 7 "Endgerät über SIP anlegen und Benutzer zuweisen" >}}

Wählen Sie unter {{< ui-button "Endgeräte" >}} > {{< ui-button "Geräteliste" >}} > {{< ui-button "Hinzufügen" >}} > den Eintrag **Via Grandstream Gateway: Analoges Endgerät per SIP**.
Im Tab {{< ui-button "Basisdaten" >}} wählen Sie den Port am Gateway, an dem das Endgerät angeschlossen werden soll. Anschließend weisen Sie das Gerät über den Tab {{< ui-button "Zuweisung" >}} einem Benutzer zu.

{{< num 8 "Funktion testen" >}}

Am einfachsten kann man die erfolgreiche Inbetriebnahme testen, indem man mit **\*100** die eigene Voicemailbox anruft. Daraufhin sollte die Ansage Ihrer Voicemailbox zu hören sein.

{{% /tab %}}

{{% tab "Onsite" %}}

**DHCP Provisioning funktioniert nur ONSITE**  


{{% notice note %}}
Für lokale Installationen des pascom Servers ist es möglich, Gateways per DHCP-Server vollautomatisch in Betrieb zu nehmen.
{{% /notice %}}

{{< num 1 "DHCP-Server vorbereiten" >}}

Bereiten Sie einen DHCP-Server wie unter [Telefon-Provisionierung via DHCP]({{< ref "/howto/dhcp-provisioning" >}}) beschreiben vor.

{{< num 2 "Gateway anschließen" >}}

{{% notice tip %}}
Handelt es sich nicht um ein fabrikneues Gateway setzen Sie es in jedem
Fall auf **Werkseinstellungen** zurück. Um dies am Gateway zu tun, wechseln Sie über Ihren Browser zu der Admin-Oberfläche des Gateway und führen dort einen **Reset** durch. Weitere Informationen entnehmen Sie dem Handbuch des Herstellers. 
{{% /notice %}}

Stecken Sie das Gateway an das Netzwerk.

Das Gerät wird **automatisch** vom pascom Server konfiguriert und **erscheint** daraufhin in der Liste {{< ui-button "Gateways" >}} > {{< ui-button "Gatewayliste" >}}. 

{{< num 3 "Endgerät über SIP anlegen und Benutzer zuweisen" >}}

Wählen Sie unter {{< ui-button "Endgeräte" >}} > {{< ui-button "Geräteliste" >}} > {{< ui-button "Hinzufügen" >}} > den Eintrag **Via Grandstream Gateway: Analoges Endgerät per SIP**.
Im Tab {{< ui-button "Basisdaten" >}} wählen Sie den Port am Gateway, an dem das Endgerät angeschlossen werden soll. Anschließend weisen Sie das Gerät über den Tab {{< ui-button "Zuweisung" >}} einem Benutzer zu.

{{< num 4 "Jobs Anwenden" >}}

Nach dem Speichern von Änderungen erscheint in der Job-Box (oben) ein
entsprechender Eintrag die Telefonie anzuwenden. Starten Sie den Job durch
einen Klick auf den {{< ui-button "grünen Haken" >}}.

{{< num 5 "Funktion testen" >}}

Am einfachsten kann man die erfolgreiche Inbetriebnahme testen, indem man mit **\*100** die eigene Voicemailbox anruft. Daraufhin sollte die Ansage Ihrer Voicemailbox zu hören sein.

{{% /tab %}}
{{% /tabs %}}

{{% notice tip %}}
Probleme bei der Provisionierung? Gelegentlich kommt es vor, dass die integrierte Auto-Provisionierungs-Funktion von 3CX eine Einrichtung auf der pascom blockiert.
{{% /notice %}}

### 3CX Auto-Provisionierung deaktivieren.

Sollte die Einrichtung des Gateway auf der pascom nicht funktionieren, ist evtl. die Auto-Provisionierung von 3CX aktiviert. Diese deaktivieren Sie über die Admin-Weboberfläche des Gateways.

![3CX Auto Provisioning](3cx_autoprovisioning.png?width=60%)


