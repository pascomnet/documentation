---
title: Creating FlexPanels
keywords:
       - Creating FlexPanels
       - Creating Wallboards
       - CallCenter Wallboards
       - Switchboard dashboards
       - Supervisor dashboards
       - monitoring dashboards
description: The FlexPanel Framework provides a platform for building and adapting wallboards for contactcenters, supervisory and switchboard dashboards. 
url: /clients/create-flexpanels/
linkde: /clients/flexpanel-einrichten/
prev: /clients/mobile-hub-setup/
weight: 36
toc: true
---

## Overview
The FlexPanel Framework can be completely modified to suit the intended users' needs. As a foundation, the admin can define any size of panel and then assigns Widgets which are already available from mobydick to the panel.  The widgets can then be parameterised according to size, function and appearance. 

<!--//FixMe Download Example Code for this Panel-->

Once the FlexPanel has been defined once, one can then assign it to different users.  These users can then either start the FlexPanel manually using the menu or automatically upon mobydick Desktop Client startup according to their settings. The User can then complete all their actions within the FlexPanel per Drag&Drop, meaning that the Panels are also suitable for Touch Screens.

Example uses of the FlexPanel include the Smart Attendant (switchboard environment) Supervisory and Monitoring Solutions.

## Configuration

### Create a New FlexPanel
Under the menu ***Advanced > FlexPanel*** through using the `Add` button, you can add a new FlexPanel

|Parameter| Description|
|----------|----------|
|Title|Panel Name|
|Open Automatically|   Should this Panel open automatically upon the mobydick Desktop Client startup. This does not apply for all mobydick Client users, rather only those which are assign under the Assignment Tab.|
|Parent Panel| Panels can inherit definitions and styles from other panels, which is practical when, one only wants to modify the details of a pre-existing panel for a particular user. When you select a parent panel here, the child panel will inherit the definition and style of the parent.|
|Documentation|    This field is for any documentation regarding the panel and is optional but recommended.|

### User Assignment
Using the ***Assignment*** Tab, you can decide who is allowed to use the panel. As soon as you have added a user and provide them with permissions to user the panel, they will be start the panel from the mobydick Client. 

If you have set the settings under ***Basic Data*** to **Open Automatically ---> Yes** then the panel will start automatically with the corresponding user. 

### Definition
The Definition contains the programming for the FlexPanel, for which we use the programming language Grovy and a new panel will require as a minimum the following code:

    //
    
    // Notwendige Imports
    
    //
    
    import net.pascom.ahab.op.widgets.*
    import net.pascom.ahab.client.services.*
    import net.pascom.ahab.client.serviceimpl.*
    import net.pascom.cmd.*
    import net.pascom.cmd.base.*
    import javafx.collections.ObservableList
    import net.pascom.ahab.roster.data.RosterEntryData
    import org.jivesoftware.smack.util.StringUtils
    import javafx.scene.image.Image;
    import javafx.scene.image.ImageView;
    import javafx.scene.input.KeyCode;
    import javafx.scene.input.KeyCodeCombination;
    import javafx.scene.input.KeyCombination;
    
    //
    
    // Definition des Panels
    
    //
    
    frame.setShortcut(new KeyCodeCombination(KeyCode.F, KeyCombination.SHORTCUT_DOWN));
    OpPane pane = frame.getMainPane()
    
    // Breite des gesamten Panels in Pixel
    frame.setWidth(1440)
    
    // Hoehe des gesamten Panels in Pixel
    frame.setHeight(728)
    
    //
    
    // Ab hier fuegen Sie die Widgets ein
    
    // ...

Simply copy these minimum coding in to the definition box and modify the size of the panel to your requirements (in our example 1440 x 728). 

#### Style

As standard, every FlexPanel will take on the **dark** or **light** theme, which can be set in the **mobydick Desktop Client** under ***Settings > Client > Theme***.

The complete has been programmed using Less, which is a Meta Language from which the CSS Code can then be compiled. We have already made the **Less source code** for the **dark** and **light** themes available to download. You can then modify these source codes using an editor of your choice and then generate the new CSS Code using a Less compiler, which can then be uploaded in to the mobydick Web User Interface under the FlexPanel **Style** Tab which will then override the existing FlexPanel Theme. 

A free less compiler which is able to run on both Windows and OSX is SimpLEss.

In order to modify a theme, follow the instructions below:

##### Download Theme Source Code

In the archive you will find both the **dark** and **light** themes in less format

##### Edit the Source Code
Using a TextEditor, edit the file _colors.less in the theme of your choice and modify the colours according to your requirements.

##### Compilation
Install and start the SimpLESS compiler and move the total modified theme folder into the compiler as shown below:

After that, compile the file **operatorpanel.less** again by clicking on the ***"Refresh"*** symbol. in order to get nice readable CSS, turn of the **minify** function (the small blue box on the right hand side of cell on the same row as the folder symbol).

##### Load your New Styles
To load your new styles, you need to add the **content** of your newly created **operatorpanel.css** file to the mobydick Web UI under the FlexPanel **Style**. Now all you need to do is ***Save and Apply***, and when you open the corresponding panel after restarting the mobydick Desktop Client, you will see the new modified Style. 

##### Starting Panels
As a result of these settings, you have now created an empty panel, which you can start as soon as you completed the save and apply function(Web UI) and restarted mobydick Desktop Client:

In the area outlined in red, the panels which are available for the user will be displayed. After starting a the panel, you will be displayed an empty panel in the predefined size. A User can only have one panel open at a time. 


### Adding Widgets
Until now the panel that we created has had no functions added to it, but now we can fill the panel with the appropriate widgets. To do this, you need to enter the corresponding Widget Code in the panels' ***Definition*** tab. Every widget can be created, positioned and displayed with the following 3 lines of coding:


    // Create New Widget
    WIDGET MEIN_WIDGET_NAME = new WIDGET(PARAMETER)
    
    // Define X and Y Position of the Widget on the Panel (in Pixels)
    MEIN_WIDGET_NAME.relocate(X,Y)
    
    // Display Widget on the Panel
    pane.addWidget(MEIN_WIDGET_NAME)

The following placeholders must be replaced for every widget:

|Parameter| Description|
|----------|----------|
|WIDGET|   Specify here which widget you would like to create e.g. HangupWidget, UserItem, ... All available widgets are listed below.|
|PARAMETER|    Here you can pass on parameters to the widget, e.g. User or Team names, which should be used within this widget. Some widgets do not have any parameters, such as the HangupWidget.|
|MY_WIDGET_NAME|   For every widget, a **unique** name must be specified in order to be able to recall it later, for example you can name widgets after users, teams or functions.|
|X, Y| Define the X and Y coordinates on which the widget should be placed within the panel. X and Y are referenced as according the top left corner of the Widget.|

A concrete example of the HangupWidget is illustrated below:

    HangupWidget hangup = new HangupWidget()
    hangup.relocate(10,10)
    pane.addWidget(hangup)

### Widget Methods
Some Widgets can be changed in terms of function and appearance through other methods. The UserItem, for example, knows the method **setAppearance()**. Meaning you can switch the appearance of the widget from normal to a compact view. Now I would like to add the user **jflores** to the compact view of the widget in my panel, and the code will now require an extra line as follows:

    UserItem jflores = new UserItem("jflores@mddemo")
    jflores.setAppearance(WidgetAppearance.Compact)
    jflores.relocate(10,50)
    pane.addWidget(jflores)

### Address Users Correctly
Should a Widget User be passed on as a Parameter, this must be done using the following notation:

    USERNAME@XMPP-DOMAIN

For the user with the user name **jflores** the example widget **UserItem** with the XMPP domain **mobydick** entry looks like this:

    UserItem jflores = new UserItem("jflores@mobydick")
    jflores.relocate(10,50)
    pane.addWidget(jflores)

The XMPP-Domain is automatically set to **mobydick** during the installation of a mobydick system. For more information, please refer to our [XMPP API Developer Documentation] (https://www.pascom.net/en/documentation/developer/xmpp-api/ "Developer Documentation").

### Available Widgets
You can find a complete list of all the available widgets under FlexPanel Widgets in the Developers Documentation.
