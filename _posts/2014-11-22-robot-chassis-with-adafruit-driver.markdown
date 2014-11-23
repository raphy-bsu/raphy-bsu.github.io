---
layout: post
title: Ходовая часть робота (Adafruit Driver)
date: 2014-11-22 10:12:12
author: OrelSokolov
categories: robots
permalink: /robot-chassis-with-adafruit-driver/
---

Данный стенд сделан для быстрого понимания того как можно управлять
моторами с помощью драйвера Adafruit.

Стенд включает в себя:

* Arduino Uno
* Adafruit Driver
* 2 мотора с проводами
* USB кабель

{% image robots/robot-motor-stand-1.jpg %}
{% image robots/robot-motor-stand-2.jpg %}

Тут используется [Adafruit Motor Driver](/adafruit-motor-shield/)

```cpp
#include <AFMotor.h>

AF_DCMotor motorL(2);
AF_DCMotor motorR(3);

void setup() {
}

void loop() {

  motorL.run(FORWARD);
  motorL.setSpeed(240);

  motorR.run(FORWARD);
  motorR.setSpeed(240);

}

```
