---
layout: post
title: Ходовая часть робота (Adafruit Driver)
date: 2014-11-22 10:12:12
author: OrelSokolov
categories: robots
permalink: /robot-chassis-with-adafruit-driver/
---

{% image 'dk-electronics-driver-mini.png' %}

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
