---
url: /flexpanel-widgets/
prev: /xmpp-api/module-xmppuser/
next: /io-framework/
weight: 40
title: Flexpanel Widgets
keywords:
  - mobydick FlexPanel Widgets
  - individual UC control panel
  - Team widget
  - phone widgets
description: A compete list of all available mobydick FlexPanel widgets
toc: true
lang: en
icon: <i class="fa fa-desktop" aria-hidden="true"></i>

---

## Overview
User can create own operator panel script. File is available in application directory and named OperatorPanelScript. It's very important to not touch existing imports in the script.

By calling OpPane pane = frame.getMainPane() we get main panel where we can put our widgets. Please take care that every widget has unique name in the script.

## Existing widgets

### UserItem
This widget represents one user from the roster. It shows the user's current state, phone state, user's full name and current status

#### Available constructors
* UserItem(userBareJid) - example UserItem jflores = new UserItem("jflores@mobydick)
* UserItem(extension,isExtension) - example UserItem jflores = new UserItem("320",true)
    * creates user item for given extension. It searches for roster member with given extension

#### Available methods
* setAppearance(WidgetAppearance.Compact)
    * This method will change appearance of the widget. It will show just name and phone state.
    - example jflores.setAppearance(WidgetAppearance.Compact)
* setAppearance(WidgetAppearance.Default)  
    * Widget appearance will be as in initial description
    - example jflores.setAppearance(WidgetAppearance.Default)

#### Default size
Compact (w:200,h:30), DefaultAppearance (w:200,h:50);

### PhonebookItem
This widget represents one user from the phonebook. It's not read from MobyDick database. You can put custom name and phone number in this widget

#### Available constructors
* PhonebookItem(name,phoneNumber) - example PhonebookItem phonebookItem1 = new PhonebookItem("Stefan Tosic","123123");

#### Available methods
* setAppearance(WidgetAppearance.Compact)
    * This method will change appearance of the widget. It will show just the name.
    - example phonebookItem1.setAppearance(WidgetAppearance.Compact)
* setAppearance(WidgetAppearance.Default)  
    * Widget appearance will be as in initial description
    - example phonebookItem1.setAppearance(WidgetAppearance.Default)

#### Default size
Compact(w:200,h:30), Default(w:200,h:50)

### TeamWidget
This widget represents one queue. It can show agents or waiting calls in the queue

#### Available constructors
* TeamWidget(queueName,numberOfItems,numberOfColumns,teamWidgetContent)
    * Creates the queue widget with numberOfItems items. It will be vertical and calls be not ordered by time if TeamWidgetContent is Calls
    * example TeamWidget developers = new TeamWidget("Developers",5,1,TeamWidgetContent.Calls);
* TeamWidget(queueName,numberOfItems,numberOfColumns,widgetOrientation,teamWidgetContent)
    * Creates the queue widget with numberOfItems items. Calls will be not ordered by time if TeamWidgetContent is Calls
    * example TeamWidget developers = new TeamWidget("Developers",5,1,WidgetOrientation.Vertical,TeamWidgetContent.Calls);
* TeamWidget(queueName,numberOfItems,numberOfColumns,timeOrdered,teamWidgetContent)
    * Creates the queue widget with numberOfItems items. Widget will be vertical
    * example TeamWidget developers = new TeamWidget("Developers",5,1,false,TeamWidgetContent.Calls);
* TeamWidget(queueName,numberOfItems,numberOfColumns,widgetOrientation,timeOrdered,teamWidgetContent)
    * Creates the queue widget with numberOfItems items
    * example TeamWidget developers = new TeamWidget("Developers",5,1,WidgetOrientation.Vertical,false,TeamWidgetContent.Calls);

#### Parameter description
* queueName - queue name
* numberOfItems - number of items (agents or waiting calls) visible on screen (slots). If number is less then number of waiting calls or agents, some items will be invisible
* numberOfColumns - in how many columns/rows items will be arranged
* widgetOrientation - orientation of widget, aligning of the items. Can be WidgetOrientation.Horizontal or WidgetOrientation.Vertical
* timeOrdered - if team shows waiting calls this parameter determinates how waiting calls will be ordered. If true items will be ordered as they came in the queue. If false waiting call finds the first available slot
* teamWidgetContent - what widget contains. Can be TeamWidgetContent.Calls - shows waiting calls, TeamWidgetContent.AllAgents - show all agents, TeamWidgetContent.LoggedAgents - show only logged agents in the queue

* Available methods
* setAppearance(WidgetAppearance.Compact)
    * This method will change appearance of the widget. It will show just name and extension of the queue.
    - example developers.setAppearance(WidgetAppearance.Compact)
* setAppearance(WidgetAppearance.Default)  
    * Widget appearance will be as in initial description
    - example developers.setAppearance(WidgetAppearance.Default)

#### Default size
Depends of number of elements:

* WidgetOrientation.Vertical
  Gap between elements is 5. Vertical padding in total 39(title+margin). Horizontal padding in total 32(margin).
* WidgetOrientation.Horizontal
  Gap between elements is 5. Vertical padding in total 29(title+margin). Horizontal padding in total 32(margin).

### InboundQueueChannelItem
Subitem of the TeamWidget. Represents one waiting call. Can't be created out of the TeamWidget

#### Default size
(w:200,h:50)

### AgentItem
Subitem of the TeamWidget. Represents one agent in the queue. Can't be created out of the TeamWidget

#### Default size
Compact (w:200,h:30), DefaultAppearance (w:200,h:50);

### InboundChannelItem

This widget represents one incoming call to my phone. If user does't have incoming call this widget will show no data. When user has incoming call widget will show call info in the widget and color the borders depending of the call state (ringing, busy...)

#### Available constructors
* InboundChannelItem() - example InboundChannelItem inboundChannelItem = new InboundChannelItem();

#### Default size
(w:200,h:70)

### HangupWidget
This widget is used to hangup the incoming call. It just shows the icon. User need to drop the chosen call to this widget and this call will be hanged up

#### Available constructors
* HangupWidget() - example HangupWidget hangupWidget = new HangupWidget();

#### Default size
(w:50,h:50)

### HoldWidget
This widget is used to hold the call. User need to drop the chosen call to this widget and this call will be holden

#### Available constructors
* HoldWidget() - example HoldWidget holdWidget = new HoldWidget();

#### Default size
(w:200,h:70)

### OffhookWidget
This widget is used to answer the call. It just shows the icon. User need to drop the chosen call to this widget and this call will be answered

#### Available constructors
* OffhookWidget() - example OffhookWidget offhookWidget = new OffhookWidget();

#### Default size
(w:50,h:50)

### SearchWidget
This widget is used to search for some phonebook entry in mobydick database. It just shows the icon. Depending on the trigger action widget can perform multiple actions

#### Available constructors
* SearchWidget() - example SearchWidget searchWidget = new SearchWidget();

#### Default size
(w:50,h:50)

### ExternalUrlItem
This widget is used to forward call information to some url. It appends the call parameters to the URL and opens it in the defualt browser.

#### Available constructors
* ExternalUrlItem(name,url) - example ExternalUrlItem externalUrlItem = new ExternalUrlItem("OTRS","www.otrs.com");

#### Default size
(w:200,h:50)

### WebViewWidget
This widget is used to show some content in internal web browser (webview).

#### Available constructors
* WebViewWidget(url,refreshInterval,width,height) - example WebViewWidget webViewWidget = new WebViewWidget("www.google.com",5,300,300);
* WebViewWidget(url,refreshInterval) - example WebViewWidget webViewWidget = new WebViewWidget("www.google.com",5);
    * creates widget with predefined size

#### Parameter description:
* refreshInterval - if 0 webViewWidget will not refresh, if >0 then widget will refresh content each refreshInterval seconds

#### Default size
(w:200,h:150)

### StatusWidget
This widget shows the failure messages received from the server. User can track what happens with sent commands

#### Available constructors
* StatusWidget() - example StatusWidget statusWidget = new StatusWidget();

#### Default size
(w:200,h:55)

### StatisticWidget
This widget shows the counters of one team. It shows number of busy,ringing,paused, free and not active agents in the queue

#### Available constructors
* StatisticWidget
    * (queueName,showInactive,showNumbers,width,height)
    * example StatisticWidget statisticWidget = new StatisticWidget("Developers",true,true,300,400);

{{% notice note %}}
Statistic Widget
Creates the statistic widget with given dimensions. showInactive can be true or false. If true, inactive counters will be included otherwise not. showNumbers can be true or false. If true, the numbers of the agents will be shown in the label
{{% /notice%}}

* StatisticWidget
    * (queueName,showInactive)
    * example StatisticWidget statisticWidget = new StatisticWidget("Developers",true);

{{% notice note %}}
Statistic Widget
Creates the statistic widget with default size 300x300 and doesn't show numbers in legend
{{%/notice%}}

#### Default size
(w:200,h:150)

### WaitingCounterWidget
This widget shows the number of waiting callers in the queue. It can show the number in different styles when given conditions are satisfied

#### Available constructors
* WaitingCounterWidget
    * (String queueName)
    * example WaitingCounterWidget waitingCounterWidget = new WaitingCounterWidget("Developers");
* WaitingCounterWidget
    * (String queueName, String title)
    * example WaitingCounterWidget waitingCounterWidget = new WaitingCounterWidget("Developers","pascom Developers");
* WaitingCounterWidget
    * (String queueName, String title, int width, int height)
    * example WaitingCounterWidget waitingCounterWidget = new WaitingCounterWidget("Developers","pascom Developers",250,250);
* WaitingCounterWidget
    * (String queueName, String title, int width, int height, int firstLevelAlert)
    * example WaitingCounterWidget waitingCounterWidget = new WaitingCounterWidget("Developers","pascom Developers",250,250,3);
* WaitingCounterWidget
    * (String queueName, String title, int width, int height, int firstLevelAlert, int secondLevelAlert)
    * example WaitingCounterWidget waitingCounterWidget = new WaitingCounterWidget("Developers","pascom Developers",250,250,2,4);

#### Parameter description
* queueName - The name of the queue to monitor
* title - Title of the widget
* width - Custom width of the widget
* height - Custom height of the widget
* firstLevelAlert - If number of waiters in the queue is equals or higher then this number but lower then second level, widget will apply first level alert style
* secondLevelAlert - If number of waiters in the queue is equals or higher then this number, widget will apply second level alert style

#### Default size
(w:150,h:150)
