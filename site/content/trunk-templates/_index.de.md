---
title: Amtsvorlagen
description: pascom liefert eine Vielzahl von Amtsvorlagen zur Erstellung von SIP-, Analog- und ISDN-Ämtern mit. Diese Vorlagen helfen Ihnen bei der Einrichtung und legen automatisch passende Rufregeln an.
type: "pages"
icon: "fa fa-copy"
weight: 9
---

{{< doctype "both" >}}

{{< description >}}

{{% notice warning %}}
Ist Ihr Amt nicht in den unten aufgelisteten Tabellen enthalten, nutzen Sie bitte die Vorlage "Generisches SIP-Amt". Wenden Sie sich bei Fragen zu offiziell nicht unterstützen Ämtern bitte direkt an unser [Forum](https://www.pascom.net/forum).
{{% /notice %}}

### pascom unterstützte Vorlagen

Folgende Amtsvorlagen werden vom pascom Support unterstützt. Um diese Unterstützung in Anspruch zu nehmen ist eine pascom Premium Version erforderlich.

|Vorlage/ Provider|verfügbar in|Produkt|OnSite|Cloud|
|---|---|---|---|---|
|[AVM Gateway]( {{< ref "/trunk-templates/fritzbox" >}})| - |FRITZ!Box|<i class='fas fa-check'></i> <br/><sub>Kann lokale SIP-Ämter terminieren.</sub>|<i class='fas fa-check'></i> <br/><sub>Kann lokale SIP-Ämter terminieren. Eine direkte Verbindung zur Box z. B. via VPN ist erforderlich.</sub>|
|BeroNet Gateway| - |BeroBox|<i class='fas fa-check'></i> <br/><sub>Kann alle Analogen und ISDN/ Primärmultiplex Ämter terminieren.</sub>|<i class='fas fa-check'></i> <br/><sub>Kann alle Analogen und ISDN/ Primärmultiplex Ämter terminieren.</sub>|
|Deutsche Telefon|DE|SIP TK-Anlagenanschluss|<i class='fas fa-check'></i>|<i class='fas fa-check'></i>|
|EasyBell|DE|Business|<i class='fas fa-check'></i>|<i class='fas fa-check'></i> <br/><sub>Bedingt durch Provider-seitiges Blacklisting kann es zu kurzen Unterbrechungen kommen.</sub>|
|[HFO Telekom]( {{< ref "/trunk-templates/hfo-telecom" >}})|DE|Alle|<i class='fas fa-check'></i>|<i class='fas fa-check'></i>|
|[M-net]( {{< ref "/trunk-templates/mnet-sip-trunk" >}})|DE (Regional)|SIP Trunk|<i class='fas fa-check'></i>|<i class='fas fa-check'></i>|
|peoplefone|CH, DE, AT, PL, LT|Alle|<i class='fas fa-check'></i>|<i class='fas fa-check'></i>|
|plusnet (QSC)|DE|Ipfonie extended connect|<i class='fas fa-check'></i>|<i class='fas fa-check'></i>|
|R-Kom|DE (Regional)|VoipTrunk|<i class='fas fa-check'></i>|<i class='fas fa-check'></i> <br/><sub>Bei einem Umzug des lokalen Amts zur pascom Cloud ist eine Abstimmung mit dem R-Kom Vertrieb notwendig.</sub>|
|sipgate|DE|Basic, Trunking, Team|<i class='fas fa-check'></i>|<i class='fas fa-check'></i>|
|[Telekom]( {{< ref "/trunk-templates/telekom-sip-trunk" >}})|DE|Einzelrufnummern (tel.t-online.de)|<i class='fas fa-check'></i> <br/><sub>Wenn mehrere Rufnummern von unterschiedlichen Standorten konsolidiert werden, ist das Amt des fremden Standorts nicht mehr für [Notrufe]({{< ref "/trunks/emergencies" >}}) geeignet. Es wird immer der Standort des Anschlusses, mit dem das Amt registriert wurde, an die Leitstelle übermittelt.</sub> |<i class='fas fa-check'></i><br/><sub>Dieses Amt ist in der Cloud nicht für [Notrufe]({{< ref "/trunks/emergencies" >}}) geeignet, da immer der Standort des Anschlusses, mit dem das Amt registriert wurde, an die Leitstelle übermittelt wird.|
|[Telekom]( {{< ref "/trunk-templates/telekom-sip-trunk" >}})|DE|SIP Trunk|<i class='fas fa-check'></i> <br/><sub>Wenn mehrere Trunks von unterschiedlichen Standorten konsolidiert werden und hierfür ein Telekom VDSL/FTTH Anschluss verwendet wird (nur genau diese Produkte der Telekom), ist das Amt des fremden Standorts nicht mehr für [Notrufe]({{< ref "/trunks/emergencies" >}}) geeignet. Es wird immer der Standort des Anschlusses, mit dem das Amt registriert wurde, an die Leitstelle übermittelt.</sub> |<i class='fas fa-check'></i>|
|[Vodafone]( {{< ref "/trunk-templates/vodafone-ngn" >}})|DE, UK, IR, CZ, IT, SP, PT, ... [vollständige Liste](https://www.vodafone.com/content/index/about/where.html)|Vodafone NGN|<i class='fas fa-check'></i> <br/><sub>Eine besondere Konfiguration ist aufgrund des Amts ohne Registrierung notwendig. [Zur Konfiguration]( {{< ref "/trunk-templates/vodafone-ngn" >}})</sub>|<i class='fas fa-times'></i> <br/><sub> Wird derzeit noch nicht unterstützt.</sub>|


### Partner unterstützte Vorlagen

Folgende Amts-Vorlagen sind ausschließlich durch unsere nachfolgend genannten Partner unterstützt. 
Bei Fragen und Problemen zu diesem Amt oder der Vorlage wenden Sie sich bitte direkt an den entsprechenden pascom Partner.

|Vorlage/ Provider|Ansprechpartner|
|---|---|
|Bergnet|CSP Partner [Bergnet GmbH](https://www.berg.net/)|
|Seabix|CSP Partner [Seabix AG](https://www.seabix.com/home)|


### Community gepflegte Vorlagen

Folgende Amts-Vorlagen wurden innerhalb der pascom Community im Forum durch aktive Nutzer erarbeitet und getestet. 
Da diese Vorlagen nicht von pascom selbst gepflegt werden, wenden Sie sich bei Fragen oder Problemen direkt an unser [Community Forum](https://www.pascom.net/forum).

|Vorlage/ Provider|
|---|
|amplus|
|colt|
|comingolstadt Business|
|envia TEL|
|equada|
|EWE|
|flowroute|
|Gradwell|
|inexio|
|IP Austria|
|iway.ch|
|Netcom Kassel|
|netplanet|
|Nexbridge|
|SBB|
|SIP Trunk Plus|
|sipcall.ch|
|Tele2|
|TeleData|
|TelemaxX|
|voipGATE Business|