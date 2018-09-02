---
title: Benutzer und Arbeitsplätze
description: Was ist ein Benutzer, Arbeitsplatz in pascom und wie lassen diese sich einfach einrichten und verwalten?
weight: 10
---

{{< doctype "both" >}}

{{< description >}}

## Benutzer

Benutzer in pascom repräsentieren eine **reale Person**. Dem Benutzer wird eine **Durchwahl** zugeteilt, nicht dem Telefon. Jeder pascom Benutzer hat zwei **Präsenzstati**:

* **Telefonstatus**: zeigt an, ob dem Benutzer ein Telefon zur Verfügung steht oder an einem Arbeitsplatz angemeldet ist.
* **Clientstatus**: zeigt die Erreichbarkeit im pascom Client, z. B. ob der Benutzer im pascom Client an seinem PC-Arbeitsplatz angemeldet ist, ob er telefoniert, oder gerade seinen Platz verlassen hat.

![Konzept der pascom Benutzer](user_overview.de.png?width=80%)

Sind einem Benutzer mehrere Geräte zugeteilt oder nutzt er mehrere PCs oder Smartphones gleichzeitig wird der Präsenzstatus zusammengefasst.

## Telefone dem Benutzer direkt zuteilen

Im einfachsten Fall werden die Telefone dem Benutzer direkt zugeteilt. Alle zugeteilten Telefone sind dann unter der Durchwahl des Benutzers erreichbar. In welcher Reihenfolge und wie lange diese klingeln sollten wird durch [FollowMe]({{< relref "#followme">}}) eingestellt.

![Illustration - Benutzer mit Endgeräten](user_desktop_personal.de.png?width=35%)

Diese Methode ist gut wenn Ihre Benutzer jeden Tag am selben Arbeitsplatz sitzen, da nur der Administrator die Zuweisung der Telefone ändern kann, nicht der Benutzer selbst.

## Arbeitsplätze nutzen

Haben Sie jedoch Benutzer die den Arbeitsplatz wechseln oder an manchen Tagen von zu Hause aus arbeiten, sollten Sie Ihre Telefone nicht direkt dem Benutzer sondern **Arbeitsplätzen** zuweisen.
In diesem Fall werden die Telefone nicht direkt dem Benutzer sondern einem virtuellen **Arbeitsplatz** zugeteilt. Ein Benutzer kann selbst per pascom Client oder per Menü an seinem IP-Telefon entscheiden an welchem Arbeitsplatz er jetzt arbeiten möchte. Sobald sich der Benutzer an einem Arbeitsplatz angemeldet hat sind alle dem Arbeitsplatz zugeteilten Telefone unter der Durchwahl des Benutzer erreichbar.  In welcher Reihenfolge und wie lange die Telefone klingeln sollten wird beim Arbeitslatz eingestellt.

Ein Benutzer kann immer nur genau einem Arbeitsplatz zugeteilt werden. Standardmäßig kann sich jeder Benutzer auf jedem Arbeitsplatz anmelden. Möchte man dies nicht, kann man das per **Rolle** einschränken.

In unserem Beispielbild haben wir zwei Arbeitsplätze für den Chef eingerichtet. Einen für das Büro und einen zu Hause.

![Benutzer- und Arbeitsplatzprinzip](user_desktop_public.de.png?width=50% )

## Mischbetrieb

Es ist möglich, dass ein Benutzer einen Arbeitsplatz und gleichzeitig direkt zugewiesene Telefone benutzt.

Wechselt ein Benutzer seinen Arbeitsplatz ändert dies nichts an den direkt zugewiesenen Telefonen. Diese bleiben auf jedem Fall dem jeweiligen Benutzer zugeteilt.

![Benutzer- und Arbeitsplatz Mischbetrie](user_desktop_mixed.de.png?width=50% )