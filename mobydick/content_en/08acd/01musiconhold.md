---
title: Custom Prompts & Music on Hold
url: /call-distribution/prompts-and-music-on-hold/
linkde: /anrufverteilung/ansagen_und_wartemusik/
prev: /call-distribution/
next: /call-distribution/business-hours/
weight: 71
toc: true
---

## Concept

During a telephone call, there are numerous situations where you could use prompts (please see The Concept of Actions) or music on hold. mobydick already comes with a number of prompt templates in both German and English. However it might make sense to create your own voice prompts to welcome your customers or inform them about your business hours.    

{{% notice tip %}}
If you prefer to create your announcements in a recording studio with the help of professional voice actors, please contact our sales department. They will be glad to help you.
{{% /notice %}}

## Configuration

### Adding Voice Prompts 

In order to add a new prompt to mobydick, select **Advanced > Prompts**  in the web mobydick Web UI and click `Add`. Should you wish to edit an existing prompt, then select the prompt and click `Edit`.

{{% notice note %}}
We recommend using a prefix when naming your custom prompts in order to maintain a good overview and being able to find them more easily later. This prefix could be something like CC-businesshours, where the CC stands for the company ChaosConsulting.
{{% /notice %}}
![Screenshot - manage prompts](../../images/prompts_add.png?width=90% "manage voice prompts in mobydick")

Under the ***Prompts*** tab, you will be able to find the already added prompts for any language that is pre configured in your mobydick system. 

In the Upload column, you also have the option of uploading a custom prompt. 
![Screenshot - upload voice prompts](../../images/prompts_custom.png?width=90% "upload voice prompts to mobydick")

After the successful uploading and saving of the prompt, the play back symbol () will appear in the Play column which enables you to listen to the prompt. Should you want to, you can also create a backup copy of this prompt, you can download to your PC using the download link in the promptfile column. 

#### Further Actions
![Screenshot - action prompts](../../images/prompts_actions.png?width=90% "actions for prompts")
You can download all your prompts in a .tar.gz-packet by clicking on the ***Actions*** button within the prompts overview menu and selecting ***Export custom prompt files***. Should you have an archive of existing prompts, you can upload these in one go using the ***Import an archive with promptfiles*** option. However, these prompts must also be packed as a .tar.gz-archive. 

Should you require additional prompt languages, these can be added using the ***Action - > Language: edit*** option (see below for more info). 

### Creating Prompts using a Telephone

Should you wish to, it is also possible to overwrite an existing prompt using your phone as the recording device. 

In order to be able to do this, you must first ensure that the prompt has been "shared" by clicking on ***Share*** in the ***Shared*** column. Once this is done, a six figure Prompt ID will appear. 
![Screenshot - sharing prompts](../../images/prompts_sharing.png?width=90% "sharing prompts")

Now dial ***50** in order to call the mobydick Prompt System. By pressing 1, you will now be able to record a voice prompt. You will then be prompted to enter the prompt ID. After the **beep** you can start recording your voice prompt. 

{{% notice note %}}
Once you have finished reading out your voice prompt, do not hangup but rather press the **hash / pound (#) key** in order to save your voice prompt.
If you hangup, your prompt will still be saved but you will also record the sound of hanging up the receiver/handset, which is obviously not advisable.
{{% /notice %}}

You can playback your recorded voice prompt by once again dialling ***50** to enter the prompt system and instead of pressing 1, simply press any other key. You will now need to enter the prompt ID and the corresponding prompt will be played back. 
![Screenshot - customized prompts](../../images/prompts_sharing_custom.png?width=90% "shared prompts")

You can also listen to and download your Voice Prompts by using the mobydick commander web UI. If the voice prompt is fit for purpose and no longer needs to be edited (re-recorded), click on the red X on the left of the prompt ID which will lock the prompt meaning it cannot be overwritten using the telephone function. By clicking the X, the prompt ID will disappear and should it be shared again in the future, a new ID will be generated. 

### Adding Additional Languages

As has already been described, English and German are currently available as the installation languages. However, further languages can be added according to your needs, through using the menu tab ***Advanced > Languages*** and clicking on the //FixMe  button. 

![Screenshot - add additional languages](../../images/prompts_add_language.jpg?width=90% "add additional languages")

Upon saving, your new language will appear in the Languages overview list. 
![Screenshot - languages overview](../../images/prompts_languages_overview.jpg?width=90% "created languages overview")

### Managing Music on Hold

The recordings used for your music on hold can be managed in the **Advanced > Music on Hold** menu of the mobydick web interface.
{{% notice warning %}}
Always make sure you do not violate any intellectual property rights when using a particular song for your music on hold. Either use music by artists not covered by collecting societies (such as the German musical performance and reproductions rights protection society: GEMA) or pay the royalties. As the music you will be using is made publicly available by playing it to the caller, not paying the royalties incurs the risk of legal action against you.
{{% /notice %}}
{{% notice tip %}}
http://www.musicfox.com has an excellent selection of Music on Hold which can be licenced for telephony purposes.
{{% /notice %}}

![Screenshot - music on hold overview](../../images/musiconhold_overview.png?width=90% "manage music on hold")

With mobydick, you should select whole playlists and not individual songs which should be played. mobydick comes with the playlist (class) called **"default"**. It includes song snippets created by Asterisk developers and can be used without having to pay any royalties to GEMA.

Once you have selected a playlist, **Action > Display music** allows you to display or remove individual songs within the playlist.

Compatible formats are **WAV** and **MP3** files.

By pressing the //FixMe button you can create additional playlists to suit your needs. Which playlist is played can be adapted for several scenarios, e.g.under Team and selecting waiting music. This way, you could use specific background music referring to your ticket system for your support team or you can also advertise the latest promotional deals on your sales hotline.

Putting a caller on **HOLD** will always cause the **default** playlist to be used.

### Creating uploading prompts with your PC

In order to ensure the best possible recording quality, we recommend you to use a PC for the recording and then uploading the file to your mobydick. You can use almost any input format, as mobydick will convert your audio file to its required format after uploading; we observed the best results when using a standard **WAV file** as the source.


#### Creating Prompts with Audacity
Audacity is a good, platform-independent and free program you can use to create your voice prompts.

![Screenshot - create prompt with audacity](../../images/audacity.png?width=90% "create prompt with audacity")

Using it is quite simple. Select your microphone (see drop-down menu "Built-in Microphone" in the screenshot), adjust the volume and press the red button to start recording.

{{% notice tip %}}
Don't worry if the recording is not perfect on the first try. Simply press the record button and repeat your text several times in a row. You can cut the recording later by marking the soundtrack at the desired points and pressing the DEL key.
{{% /notice %}}

Once you are satisfied with the output, select **File -> Export** and create a **WAV (Microsoft 16-bit PCM** file.
If you want to edit your file later, you should save the project file as well by selecting **File -> Save project**.

#### Including Background Music

You can also add background music to the prompts, such as a suitable jingle during the Christmas season etc. Audacity can handle several sound tracks at once.

Record your prompts as described above. Then select **File -> Import -> Audio**. Choose the file that contains the desired music and import it. Audacity will then create a second sound track. If you press **Play**, both the recorded voice prompt and the song will be played.

You will be able to hear that the music is so loud it drowns out the the voice prompt. In addition, it might not be desirable for the music and the prompt to start at the same time.

To start the voice prompt a bit later than the background music, position the cursor at the beginning of the voice prompt's sound track and add about three seconds of silence by clicking **Generate -> Silence**. This way, the background music will start about three seconds before the voice prompt.

To reduce the loudness of the background music, use the envelope tool. When the envelope tool is activated while you position your cursor in the sound track and move your mouse up and down, you will notice you an change the volume of the sound track. Repeating this process in several more parts along the sound track will cause Audacity to create an envelope from all the selected positions, indicated by small white dots. 
![Screenshot - create prompt with audacity](../../images/audacity_envelope_editing.png?width=90% "create prompts with audacity")

The result should like this:
![Screenshot - prompt with audacity](../../images/audacity_music.png?width=90% "prompt with audacity")

If you like the result, select **File -> Export** and create a **WAV (Microsoft) 16-bit PCM** file. The sound tracks will be merged automatically.

If you want to edit your file later, you should save the project file as well by selecting File **-> Save project**.


