---
prev: /endgeraete/snom-tischtelefone-300-700-serie/
url:  /endgeraete/beliebiges-ip-geraet/
next: /endgeraete/snom-dect/
weight: 45
title: Beliebiges IP Endgerät einrichten
keywords:
    - Softphone integrieren
    - IP Endgerät einrichten
    - grandstream
    - SIP Telefone einrichten
description: mobyidck integriert IP-Telefone unterschiedlicher Hersteller und unterstützt jedes verfügbare SIP Softphone
toc: true

---

## IP-Telefone anderer Hersteller & Softphones einrichten

{{% notice tip %}}
Die pascom [VoIP Software](https://www.pascom.net/de/mobydick-voip/ "VoIP Software") kommt Out-of-the-Box mit einem vollintegrieten Softphone für Windows, Linux und MacOS. Dieser wird automatisch mit dem mobydick Client ausgerollt. Alle Informationen unter mobydick [Desktop Client nutzen]({{< relref "02client-user.md" >}})
{{% /notice %}}

mobydick ist prinzipiell zu jedem SIP-Fähigen Endgerät kompatibel. Im Unterschied zu den Hardware IP-Telefonen von snom, Yealink, Auerswald und openstage werden alle anderen SIP Endgeräte nicht von mobydick provisioniert. Das bedeutet diese erscheinen nicht automatisch in der Geräteliste und mobydick legt hierfür auch kein automatik SIP-Peer an.

Um ein sonstiges IP-Telefon in die mobydick einzubuchen drücken Sie in der Geräteliste auf `Hinzufügen` und wählen als Gerätetyp IP-Telefon: **Hersteller beliebig oder Softphone** aus:
![Screenshot - IP-Telefone anderer Hersteller & Softphone Menü](../../images/device_add_softphone.png?width=30% "IP-Telefone anderer Hersteller & Softphone Menü")

Anschließend vergeben Sie einen **Benutzernamen** und **Passwort** für das Gerät:
![Screenshot - IP-Telefone anderer Hersteller & Softphone Menü](../../images/device_softphone_detail.png?width=100% "IP-Telefone anderer Hersteller & Softphone Menü")

Diesen **Benutzernamen** und **Passwort** verwenden Sie dann um das Gerät an der mobydick anzumelden (im Beispiel das Softphone Bria von CounterPath):
![Screenshot - Softphone Bria anmelden](../../images/device_softphone_bria_settings.png?width=50% "Softphone Bria anmelden")

Als nächstes fahren Sie mit Benutzer und Arbeitsplätze anlegen fort.
