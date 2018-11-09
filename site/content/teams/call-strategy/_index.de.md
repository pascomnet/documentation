---
title: Rufstrategien
description: Teams in pascom sind vergleichbar mit Warteschlangen. Rufstrategien helfen Ihnen Anrufe gezielt zu steuern.
weight: 30
---

{{< doctype "both" >}}

{{< description >}}

## Rufstrategien

|Strategie|Beschreibung|
|---|---|
|**alle anklingeln**|Alle Mitglieder werden gleichzeitig gerufen.|
|**nacheinander**|Die Mitglieder werden nach der Zuweisungsreihenfolge gerufen.<br>**Achtung**:Dynamische Mitglieder verändern durch Ein- und Ausbuchen aus dem Team die Position.|
|**längste zurück**|Das Mitglied welches am längsten keinen Anruf entgegen genommen hat kommt als nächstes dran.<br>**Achtung**: Dynamische Mitglieder setzten durch Ein- und Ausbuchen aus dem Team alle Zähler zurück und sind somit nach dem Einbuchen automatisch immer derjenige der am längsten keinen Anruf bekommen hat.|
|**wenigsten Anrufe**|Das Mitglied welches am wenigsten Anrufe angenommen hat kommt als nächstes dran. Diese Einstellung berücksichtig nicht die Anrufdauer. <br>**Achtung**:Dynamische Mitglieder setzten durch Ein- und Ausbuchen aus dem Team alle Zähler zurück und sind somit nach dem Einbuchen automatisch immer derjenige der am wenigsten Anruf bekommen hat.|
|**per Zufall**|Wählt zufällig einen Agenten aus.|
|**mem-nacheinander**|Wie nacheinander allerdings beginnt die Reihe beim nächsten Anrufer nicht von vorne sondern nach dem der als letztes einen Anruf entgegengenommen hat.|
|**per Zufall - gewichtet**|Wie per Zufall nur werden die Prioritäten der Agenten berücksichtigt. Erst wenn alle Agenten mit niedriger Priorität telefonieren werden die mit der nächst höheren gerufen.|

### alle anklingeln

Dies ist die Default-Einstellung. Bei dieser Rufstrategie werden alle eingehenden Anrufe im Team an alle aktiven Mitglieder gleichzeitig signalisiert. Diese Rufstrategie ist in Rufgruppen und Warteschlangen verfügbar.

### nacheinander

Bei dieser Rufstrategie werden alle Mitglieder nach der Zuweisungsreihenfolge angerufen. Die Klingel-Dauer des Anrufs wird hier durch den "Mitglieder-Timeout" definiert.       
Flexible Mitglieder verändern durch ein- und ausbuchen die Position im Team, daher wird empfohlen hier alle Mitglieder fest einzubuchen und stattdessen Pausengründe zu verwenden. Diese Rufstrategie ist in Rufgruppen und Warteschlangen verfügbar.

### längste zurück

Bei dieser Rufstrategie wird der eingehende Anruf zuerst dem Team-Mitglied signalisiert, welches am längsten keinen Anruf entgegen genommen hat.        
Flexible Mitglieder setzen durch ein- und ausbuchen aus dem Team alle Zähler zurück und sind nach dem Einbuchen immer automatisch das Mitglied, welches am längsten keinen Anruf bekommen hat. Wir empfehlen stattdessen Pausengründe zu verwenden, da diese keine Zähler zurücksetzen. Diese Rufstrategie ist nur in Warteschlangen verfügbar.

### wenigsten Anrufe

Bei dieser Rufstrategie wird der eingehende Anruf zuerst dem Team-Mitglied signalisiert, welches am wenigsten Anrufe angenommen hat.        
Diese Einstellung berücksichtigt nicht die Anrufdauer der getätigten Anrufe.
Das Mitglied welches am wenigsten Anrufe angenommen hat kommt als nächstes dran. Diese Einstellung berücksichtig nicht die Anrufdauer. Wenn ein Mitglied beispielsweise 5 mal eine Minute lang telefoniert und ein anderes 2 mal eine Stunde ist trotzdem letzteres an der Reihe.       
Flexible Mitglieder setzen durch ein- und ausbuchen aus dem Team alle Zähler zurück und sind nach dem Einbuchen immer automatisch das Mitglied, welches die wenigsten Anrufe entgegen genommen hat. Wir empfehlen stattdessen Pausengründe zu verwenden, da diese keine Zähler zurücksetzen. Diese Rufstrategie ist nur in Warteschlangen verfügbar.

### per Zufall

Bei dieser Rufstrategie wird der eingehende Anruf zufällig an ein Team-Mitglieder signalisiert. Diese Rufstrategie ist nur in Warteschlangen verfügbar.

### mem-nacheinander 

Bei dieser Rufstrategie werden alle Mitglieder nach der Zuweisungsreihenfolge angerufen. Nach einem angenommenen Anruf wird der nächste Anrufer jedoch nicht an das Mitglied am Anfang der Zuweisungsreihenfolge signalisiert, sondern an das Team-Mitglied nach dem Mitglied, das zuletzt den Anruf angenommen hat. Die Klingel-Dauer des Anrufs wird hier durch den "Mitglieder-Timeout definiert.        
Flexible Mitglieder verändern durch ein- und ausbuchen die Position im Team, daher wird empfohlen hier alle Mitglieder fest einzubuchen und stattdessen Pausengründe zu verwenden. Diese Rufstrategie ist nur in Warteschlangen verfügbar.

### per Zufall - gewichtet 

Bei dieser Rufstrategie wird der eingehende Anruf zufällig an ein Team-Mitglied signalisiert, jedoch fließen die Prioritäten in die Gewichtung mit ein - es bleibt aber weiterhin zufällig welcher Agent gerufen wird.      
Ein Agent mit niedrigerem Prioritätswert hat also nur eine höhere Wahrscheinlichkeit gerufen zu werden als ein Agent mit höhrer Priorität. Diese Rufstrategie ist nur in Warteschlangen verfügbar.
