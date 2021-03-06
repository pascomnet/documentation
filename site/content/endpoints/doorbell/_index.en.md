---
title: Generic Doorbell |BETA
description: How to integrate generic SIP door bells into the pascom telephone system
weight: 10
---

{{< doctype "both"  >}}

{{< description >}}

## Overview

The pascom telephone system offers the possibility to integrate generic door bells. For the integration, a few prerequisites must be met by the manufacturer.

### Requirements

To be able to operate a SIP door bell on the pascom server, the following requirements are necessary:

* **SIP via TCP/TLS** (encrypted signaling)
* **SRTP** (encrypted call data)
* **Outbound-Proxy** (Send data via session border controller)
* **RTSP-Videostream** (Transmission of video, mjpeg/rtsp)


## Door Bell Setup

On the pascom admin web interface, go to {{< ui-button "Devices" >}} > {{< ui-button "Device List" >}} and click {{< ui-button "Add" >}}. In the next window select the template for **generic Doorbell**.

### Parameter for Setup

Fill in the predefined fields with your data.

|Field|Example Value|Description|
|---|---|---|
|Name|**Frontdoor**|Name of the door bell|
|Device-Login|**XXXXXXXXXXX**|Login name is generated by **pascom**|
|Password| **XXXXXXX** | Password is generated by **pascom**|
|Image-URL|```http://user:password@1.2.3.4/jpg/image.jpg```|URL of the Image|
|Video-URL|```http://user:password@1.2.3.4/mjpg/video.mjpg```| URL of the video stream|
|Door Code|**1234**| DTMF Code to open the door|
|Extension|**503**| Internal extension of the door bell|

</br>

**Example**

![Example Parameter](parameter.en.PNG?width=80%)

## Door Bell Configuration

Below you will find an overview of door bells that have been tested by pascom during the implementation. In general, you can use any SIP-enabled door bell. The following URL addresses must be set up on the door bell itself and also on the pascom telephone system. For the configuration of the door bell, also have the manufacturer's documentation available as a useful aid.

### Base Technology

|Function|Protocol|Description|
|---|---|---|
|Image|HTTP / HTTPS|JPEG/JPG|
|Video|HTTP / HTTPS / RTSP |H264 / MJPEG|

### Reference List

Here you can find some reference URLs, for the integration of the video and  image functionality, which have already been tried out by pascom. **Please note** that the URL addresses are structured differently for each manufacturer. 

*The manufacturers listed here are in no way intended to be a recommendation to buy.*

## Baudisch

|Typ|URL|
|---|---|
|MJPEG via HTTP|```http://user:password@1.2.3.4/mjpg/video.mjpg```|
|JPG Image|```http://user:password@1.2.3.4/jpg/image.jpg```|

</br>

**SIP Configuration**

![Baudisch Sip Configuration](baudisch-phonesettings.en.PNG?width=80%)

</br>

**Video Konfiguration**

![Baudisch Sip Configuration Video](baudisch-videosettings.en.PNG?width=80%)

Please note that additionally the opening of the door must be configured by DTMF code.


</br>

## 2N IP Base

|Typ|URL|
|---|---|
|MJPEG via HTTP|```https://admin:12345678@1.2.3.4/api/camera/snapshot?width=640&height=480&fps=15```|
|RTSP h264|```rtsp://1.2.3.4:554/h264_stream```|
|RTSP mjpeg|```rtsp://1.2.3.4:554/mjpeg_stream```|
|JPG Image|--|

</br>

**SIP Configuration**

![2N Sip Configuration Part1](2n-phonesettings.en.PNG?width=80%)

</br>

![2N Sip Configuration Part2](2n-phonesettings-part2.en.PNG?width=80%)

**Video Configuration**

![2N Sip Configuration Video](2n-videosettings.en.PNG?width=80%)

Please note that additionally the opening of the door must be configured by DTMF code.

</br>

**Grandstream**

|Typ|URL|
|---|---|
|RTSP h264|```rtsp://admin:1234567@1.2.3.4:554/4```|
|JPG Image|```http://admin:1234567@1.2.3.4/snapshot/view0.jpg```|

</br>

**SIP Configuration**

![Grandstream Configuration](Grandstream0.PNG?width=80%)


**Video Configuration**

![Grandstream Configuartion Video](Grandstream1.PNG?width=80%)

Please note that additionally the opening of the door must be configured by DTMF code.

## Behnke

|Typ|URL|
|---|---|
|RTSP h264|```rtsp://root:Admin@1.2.3.4/axis-media/media.amp```|
|JPG Image |```http://root:Admin@1.2.3.4/axis-cgi/jpg/image.cgi```|

**SIP Configuration**

![Behnke Part1](behnke0.PNG?width=80%)

</br>

![Behnke Part2](behnke1.PNG?width=80%)

</br>

**Video Configuration**

1. No Image available

</br>

Please note that additionally the opening of the door must be configured by DTMF code.

[Behnke Manual PDF](https://www.behnke-online.de/telefonanlagen/540-pascom-cloud-anlage/file)(Steps of the manual no longer up to date!)

## Functions of the Door Bell in the pascom Client

The pascom client enables extensive interaction with connected door bells. This includes the operation of the door intercom, the opening of the door and also the stream of the video camera. For a full use of all functions, the door bell must have a direct connection to the pascom Client.

A direct connection means that the pascom client must be in the same network as the door intercom. It does not matter whether it is the pascom Desktop or Mobile Client.


![Network Overview](network.en.png)
*Mobile client without video stream, outside the corporate network*
</br>

### Video Stream and Image in the pascom Client

As you can see from the graphic above, a video stream between the door bell and the pascom client is only possible in the same network. Devices outside the company network must go without the video stream.

### Door Intercom usage

The door intercom establishes a normal call when the bell is pressed, which can be received via SIP/SRTP from anywhere. The pascom client does not have to be in the same network.

### Door opener usage

To open a door, the pascom client sends a DTMF code during the active call. The pascom client does not have to be in the same network and the door opener can be operated from anywhere.

### Useful Informations

1. **How can I make the video stream of my door bell available outside the company network?**
</br>
To do this, you must make settings on your network/router. For assistance, use our instructions for the [mobile access via internet]({{< ref "/howto/mobile-access" >}}).

2. **Why do Iphone devices have a black image when streaming video?**
</br>
If the door bell delivers the image/video data via HTTPS with a self-signed certificate, no image may be displayed on iOS devices. This is an iOS security policy. To get a picture, either a trusted certificate must be installed or the door bell must be switched to HTTP.

