---
title: Remote Control - Mobilgeräte steuern |BETA
weight: 16
description: In diesem Abschnitt erfahren Sie, wie der pascom Desktop Client die pascom Mobile App steuern kann.
---

{{< doctype "both" >}}
 
{{< description >}}


## Mit dem Desktop Client den Mobil Client steuern

Sie wollen Ihre Arbeit, vermehrt auf das Smartphone verlagern um die Vorteile einer standortunabhängigen Konnektivität zu genießen? Kein Problem, der pascom Client bietet die Möglichkeit, über den pascom Desktop Client die mobile pascom App am Handy zu steuern. Dies geschieht über sogenannte **Push-Calls**, welche an Ihr Mobilgerät gesendet werden.

</br>
![Übersicht Push Call](overview-remotecontrol.png)
</br>

### Voraussetzung - Mobilgerät für ausgehende Gespräche

Damit dieses Feature funktioniert, muss ein Mobilgerät als **bevorzugtes Gerät** in der **Gerätesteuerung** eingestellt werden. 

Weitere Informationen dazu finden Sie [hier]({{< ref "/client-desktop-userguide/mydevices" >}}).

### Anruf starten und übergeben

Tätigen Sie nun über den **pascom Desktop Client** einen ausgehenden Anruf, wird dieser an Ihr Mobiltelefon übergeben.

1. **Android:** Auf Mobilgeräten mit Android Betriebssystem, wird die **pascom App** automatisch durch den **Push-Call** aufgeweckt/gestartet und der Anruf übergeben.

2. **Apple iOS:** Auf Mobilgeräten von Apple mit dem iOS Betriebssystem, wird durch den **Push-Call** zunächst ein Anruf initiiert, welchen Sie Annehmen müssen. Danach wird der ausgehende Rufaufbau zum gewünschten Teilnehmer fortgesetzt. 
(*Aufgrund des Apple Callkit, können Push-Calls die Anwendung nicht aufwecken/starten, wenn diese nicht im Fokus ist*)

### Mobilgerät in Dockingstation

![Dockingstation](dockingstation.jpg?width=60%)
</br>

Nutzen Sie Ihr Mobilgerät in einer **Dockingstation**, kann das Gespräch vom **pascom Desktop Client** nahtlos auf das Mobiltelefon übergeben werden, da sich das Mobilgerät im Ladezustand befindet und das Display in der Regel eingeschalten ist. Dies funktioniert sowohl bei **Android** als auch bei **iOS** Geräten.

</br>
