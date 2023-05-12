function [back, backFS, bomb,gun, alert,fight,bombFs,gunFs,fightFs, alertFS, win, winFS]=loadSound()
[back, backFS] = audioread('back.wav');
back = back(1:300*backFS);

[bomb,bombFs] = audioread('soundbomb.wav');
bomb=bomb(1:6*bombFs);

[gun,gunFs] = audioread('soundgun.wav');
gun=gun(1:3*0.1*gunFs);

[fight,fightFs] = audioread('soundfight.wav');
fight=fight(1:20*fightFs);

[alert, alertFS] = audioread('soundalert.wav');
alert = alert(1:300*backFS);

[win, winFS] = audioread('soundwin.wav');
win = win(1:4*backFS);
