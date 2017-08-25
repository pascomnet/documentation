---
title: Creating FlexPanels
keywords:
       - Creating FlexPanels
       - Creating Wallboards
       - CallCenter Wallboards
       - Switchboard dashboards
       - Supervisor dashboards
       - monitoring dashboards
description: The FlexPanel Framework provides a platform for building and adapting Contact Center wallboards, Supervisor and switchboard dashboards. 
url: /clients/create-flexpanels/
linkde: /clients/flexpanel-einrichten/
prev: /clients/mobile-hub-setup/
weight: 36
toc: true
---

![FlexPanel Demo](/flexpanel_demo.png)

## Overview

The pascom FlexPanel Framework lends itself perfectly for the creation of [ContactCenter Wallboards] (https://www.pascom.net/en/call-center/ "pascom Contact Center Phone Systems") and switchboard call distribution panels. That said, the flexibility of the framework also ensures that FlexPanels can be created for any number of scenarios suited for any business size from SMB to large Enterprise, which is why the FlexPanel Framework is included as standard in [all our VoIP phone systems] (https://www.pascom.net/en/mobydick-voip/). 

The FlexPanel Framework can be completely modified to suit the intended users' needs. As a foundation, the admin can define any size of panel and then assign widgets which are already available from pascom to the panel. The widgets can then be parametrized according to size, function and appearance. 

<!--//FixMe Download Example Code for this Panel-->

Once the FlexPanel has been defined once, one can then assign it to different users. These users can then either start the FlexPanel manually using the menu or automatically upon pascom Desktop Client startup according to their settings. The User can then complete all their actions within the FlexPanel per Drag&Drop, meaning that the Panels are also suitable for Touch Screens.

Example uses of the FlexPanel include the Smart Attendant (switchboard environment) Supervisory and Monitoring Solutions.

## Configuration

### Add New FlexPanel
Under the menu ***Advanced > FlexPanel*** through using the `Add` button, you can add a new FlexPanel

|Parameter| Description|
|----------|----------|
|Title|Enter a panel name here|
|Open Automatically| YES / NO: Should this Panel open automatically upon the pascom Desktop Client startup. This does not apply for all pascom Destkop Client users, rather only those which are assign under the Assignment Tab.|
|Parent Panel| Panels can inherit definitions and styles from other panels, which is practical when, one only wants to modify the details of a pre-existing panel for a particular user. When you select a parent panel here, the child panel will inherit the definition and style of the parent.|
|Documentation|    This field is for any documentation regarding the panel and is optional but recommended.|

**Additional Tabs:**

|Tab|Description|
|---|---|
|**Assignment**|Assign the users who should be permitted view / use this panel within their Desktop UC client.|
|**Definition**|Here you can program the FlexPanel.|
|**Style**|Per default, each FlexPanel takes on either the **dark** or **light** colour schemes from the Desktop Client. Should an additional scheme be desired, it can be defined here.|


### Create FlexPanel
The Definition contains the programming for the FlexPanel, for which we use the programming language Grovy and a new panel will require as a minimum the following code:
  
    // Necessary Imports
        
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
    
    // Panel Definition
       
    frame.setShortcut(new KeyCodeCombination(KeyCode.F, KeyCombination.SHORTCUT_DOWN));
    OpPane pane = frame.getMainPane()
    
    // Whole Panel Width (Pixels)
    frame.setWidth(1440)
    
    // Whole Panel Height (Pixels)
    frame.setHeight(728)
      
    // Add widgets from here onwards
    // ...

Simply copy this minimum coding set to the definition box and modify the size of the panel to your requirements (in our example 1440 x 728). 

Doing so with the above settings will generate an empty panel. You can bow save and apply the panel and be able to start open it via the Desktop Client. Lastly, the panel must be completed or "filled" with widgets according to your needs. 

### Add Widgets
Widgets are added under the `Definition` tab. Each widget requires 3 code lines in order to be *created*, *positioned*  and *displayed*: 


    // Create New Widget
    WIDGET MEIN_WIDGET_NAME = new WIDGET(PARAMETER)
    
    // Define X and Y Position of the Widget on the Panel (in Pixels)
    MEIN_WIDGET_NAME.relocate(X,Y)
    
    // Display Widget on the Panel
    pane.addWidget(MEIN_WIDGET_NAME)

The following placeholders must be replaced for every widget:

|Placeholder| Description|
|----------|----------|
|WIDGET|   Specify here which widget you would like to create e.g. HangupWidget, UserItem, ... All available widgets are listed below.|
|PARAMETER|    Here you can pass on parameters to the widget, e.g. User or Team names, which should be used within this widget. Some widgets do not have any parameters, such as the HangupWidget.|
|MY_WIDGET_NAME|   For every widget, a **unique** name must be specified in order to be able to recall it later, for example you can name widgets after users, teams or functions.|
|X, Y| Define the X and Y coordinates on which the widget should be placed within the panel. X and Y are referenced as according the top left corner of the Widget.|

A concrete example of the HangupWidget is illustrated below:

    HangupWidget hangup = new HangupWidget()
    hangup.relocate(10,10)
    pane.addWidget(hangup)

**Widget Methods:**

Some Widgets can be changed in terms of function and appearance via alternative means. The UserItem, for example, knows the method *setAppearance()*. Meaning you can switch the appearance of the widget from normal to a compact view. For example, to add the user **jflores** to the compact view of the widget in the panel, the code will now require an extra line as follows:

    UserItem jflores = new UserItem("jflores@mddemo")
    jflores.setAppearance(WidgetAppearance.Compact)
    jflores.relocate(10,50)
    pane.addWidget(jflores)

**Address Users Correctly:**
Should a Widget User be passed on as a Parameter, this must be done using the following notation:

    USERNAME@XMPP-DOMAIN

For the user with the user name *jflores* the example widget *UserItem* with the XMPP domain *mobydick* entry looks like this:

    UserItem jflores = new UserItem("jflores@mobydick")
    jflores.relocate(10,50)
    pane.addWidget(jflores)

The XMPP-Domain is automatically set to *mobydick* during the installation of a pascom system. For more information, please refer to our [XMPP API Developer Documentation] (https://www.pascom.net/en/documentation/developer/xmpp-api/ "Developer Documentation").

### Example FlexPanel

You can download a [Demo FlexPanel and example code here](/flexpanel_demo.pdf).

### Available Widgets
You can find a complete list of all the available widgets under FlexPanel Widgets in the Developers Documentation.

### Change Styling

As standard, every FlexPanel will take on the **dark** or **light** theme, which can be set in the **pascom Desktop Client** under `Settings > Client > Theme`.

The complete has been programmed using *less*, which is a Meta Language from which the CSS Code can then be compiled. The *less source code* for both the **dark** and **light** themes available to [download here] (/Archiv.zip). You can then modify these source codes using an editor of your choice and then generate the new CSS Code using a *less compiler*. This code can then be uploaded in to the pascom Web User Interface under `Advanced > Flexpanel> Style` which will then override the existing FlexPanel Theme. 

A free less compiler which is able to run on both Windows and OSX is [SimpLESS](https://wearekiss.com/simpless).

#### Theme Modification

* Download Theme Source Code Archive. In the archive you will find both the **dark** and **light** themes in less format

* Edit the Source Code using a TextEditor, edit the file *_colors.less_* in the theme of your choice and modify the colours according to your requirements.

* Install and start the SimpLESS compiler and move the total modified theme folder into the compiler. Next, compile the file *operatorpanel.less* again by clicking on the *Refresh* symbol. In order to get nice readable CSS, turn off the *minify* function (the small blue box on the right hand side of cell on the same row as the folder symbol).

* Load your new styles. Add the *content* of your newly created *operatorpanel.css* file to the pascom Web UI under the FlexPanel *Style* tab. Now all you need to do is ***Save and Apply***, and when you open the corresponding panel after restarting the pascom Desktop Client, you will see the new modified Style. 



