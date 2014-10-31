---
layout: post
title:  Соединение EM-2260 и GNU/Linux
date:   2014-10-30 09:10:57
author: OrelSokolov
categories: moxa
---

## Инструкция для Xubuntu (14.04)

Отключите `NetworkManager`. Для этого на панеле нажмите на значок с сетью и
снимите галочку `EnableNetworking`.

{% image "xubuntu-disable-network-manager.png" %}

Это нужно для того, чтобы система не контролировала
автоматически сеть, а контроллировали ее мы.

Выполните в терминале:

```bash
ifconfig eth0  192.168.3.126
# или
ifconfig eth0  192.168.4.126
# В зависимости от того, к какому порту подключаетесь
```

