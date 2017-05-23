---
prev: /endgeraete/aastra-dect/
url:  /endgeraete/beliebiges-ip-geraet/
weight: 48
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
Die pascom [VoIP Software](https://www.pascom.net/de/mobydick-voip/ "VoIP Software") kommt Out-of-the-Box mit einem vollintegrieten Softphone für Windows, Linux und MacOS. Dieser wird automatisch mit dem Desktop Client ausgerollt. Alle Informationen unter mobydick [Desktop Client nutzen]({{< relref "02client-user.md" >}}).
{{% /notice %}}

mobydick ist prinzipiell zu jedem SIP-fähigen Endgerät kompatibel. Im Unterschied zu den unterstützten Hardware-IP-Telefonen werden alle anderen SIP-Endgeräte nicht von mobydick provisioniert. Das bedeutet diese erscheinen nicht automatisch in der Geräteliste und mobydick legt hierfür auch nicht automatisch ein SIP-Peer an.

+ Um ein beliebiges IP-Telefon in die mobydick einzubuchen klicken Sie in der Web-UI unter `Endgeräte` > `Geräteliste` auf `Hinzufügen` und wählen als Gerätetyp IP-Telefon: `IP-Telefon: Hersteller beliebig oder Softphone` aus.
+ Nun werden für das *Softphone* ein **Geräte-Anmeldename** und ein **Passwort** vorgeschlagen. Das Passwort können Sie mit dem Button `Passwort anzeigen/ausblenden` einsehen. Sie können diese natürlich auch ändern.
+ Den **Geräte-Anmeldenamen** und das **Passwort** können Sie nun als SIP-Identität an einem beliebigen Softphone verwenden.

Das folgende Beispiel zeigt eine Anmeldung des Softphones Bria von Counterpath an die mobydick:

![Bria](/anysip_bria.png)
