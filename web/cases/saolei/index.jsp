<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>纯CSS3经典windows扫雷小游戏|DEMO_jQuery之家-自由分享jQuery、html5、css3的插件库</title>
	<link rel="stylesheet" type="text/css" href="css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="css/htmleaf-demo.css">
	<style type="text/css">

/* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
@charset "UTF-8";

body {
  min-height: 100vh;
  padding: 1px;
  box-sizing: border-box;
  counter-reset: mines 10;
  background: #ffffff;
}

form {
  display: flex;
  flex-flow: column nowrap;
  align-items: center;
}

input {
  visibility: hidden;
  position: absolute;
  top: -99px;
  left: -99px;
}

input[id^="f"]:checked {
  counter-increment: mines -1;
}

.infos {
  order: 2;
  display: flex;
  flex-flow: row nowrap;
  justify-content: space-between;
  width: 216px;
}

.timer {
  font-family: "Roboto Sans", monospace;
  font-size: 0;
  background: #ccc;
  border: 1px solid #808080;
  height: 2.25rem;
  line-height: 2.25rem;
  padding: 0 .5rem;
}
.timer .separator {
  display: inline-block;
  vertical-align: middle;
  font-size: 1rem;
}
.timer .separator:before {
  content: ':';
}
@keyframes digit {
  from {
    top: 0;
  }
  to {
    top: -1000%;
  }
}
@keyframes digitTo6 {
  from {
    top: 0;
  }
  to {
    top: -600%;
  }
}
@keyframes extend {
  from {
    width: 0;
  }
  10%, to {
    width: auto;
  }
}
.timer .digit {
  display: inline-block;
  position: relative;
  overflow: hidden;
  vertical-align: middle;
  font-size: 1rem;
}
.timer .digit:before {
  content: '0';
  visibility: hidden;
}
.timer .digit:after {
  content: '0 \A 1 \A 2 \A 3 \A 4 \A 5 \A 6 \A 7 \A 8 \A 9';
  position: absolute;
  top: 0;
  left: 0;
  animation: digit 1s steps(10) infinite paused;
}
.timer .digit:nth-last-child(1):after {
  animation-duration: 10s;
}
.timer .digit:nth-last-child(2):after {
  content: '0 \A 1 \A 2 \A 3 \A 4 \A 5';
  animation-name: digitTo6;
  animation-timing-function: steps(6);
  animation-duration: 60s;
}
.timer .digit:nth-last-child(4):after {
  animation-duration: 600s;
}
.timer .digit:nth-last-child(5):after {
  animation-duration: 6000s;
}
.timer .digit:nth-last-child(6) {
  width: 0;
  animation: extend 60000s steps(1) infinite paused;
}
.timer .digit:nth-last-child(6):after {
  animation-duration: 60000s;
}

.counter {
  display: inline-block;
  border: 1px solid #808080;
  background: #ccc;
  padding: 0 .5rem;
  font-size: 1.25rem;
  font-family: "Roboto Sans", monospace;
  height: 2.25rem;
  line-height: 2.25rem;
}
.counter:before {
  content: '🤔';
  font-size: 1rem;
  margin-right: .5em;
}
.counter:after {
  content: counter(mines);
}

input[id^="c"]:checked ~ .infos .timer .digit, input[id^="c"]:checked ~ .infos .timer .digit:after {
  animation-play-state: running;
}

.actionSelector {
  order: 1;
  text-align: center;
  margin: 10px;
}
.actionSelector label {
  display: inline-block;
  position: relative;
  width: 1.8em;
  height: 1.8em;
  text-align: center;
  line-height: 1.8em;
}
.actionSelector label:before {
  content: '';
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  transform: scale(0);
  border-radius: 50%;
  background: rgba(210, 210, 210, 0.8);
  box-sizing: border-box;
  border: 1px solid #808080;
  transition: transform .3s, border-radius .3s;
  transition-timing-function: cubic-bezier(0.75, 1.75, 0.75, 0.75);
  z-index: -1;
}

#modeMine:checked ~ .actionSelector label[for="modeMine"]:before,
#modeFlag:checked ~ .actionSelector label[for="modeFlag"]:before {
  transform: scale(1);
  border-radius: 2px;
}

.grid {
  order: 3;
  user-select: none;
  position: relative;
  margin: 10px auto;
  width: 9em;
  height: 9em;
  font-size: 24px;
  display: flex;
  flex-flow: row wrap;
  border: solid #808080;
  border-width: 1px 0 0 1px;
}
.grid label {
  display: block;
  position: relative;
  width: 1em;
  height: 1em;
  background: #c0c0c0;
  box-sizing: border-box;
  border: solid #808080;
  border-width: 0 1px 1px 0;
  flex: 0 0 11.11111%;
  overflow: hidden;
  cursor: pointer;
  pointer-events: none;
}
.grid label:before {
  content: '';
  font-size: .9rem;
  font-family: 'Roboto Mono', monospace;
  font-weight: bold;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
}
.grid label:after {
  content: '';
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  box-sizing: border-box;
  background: #c0c0c0;
  border: 2px outset #ececec;
  font-size: .75rem;
  text-align: center;
  pointer-events: auto;
}
.grid label:active:after {
  background: #bdbdbd;
  border: solid #999;
  border-width: 2px 0 0 2px;
}
.grid .flags {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  display: flex;
  flex-flow: row wrap;
  opacity: 0;
  visibility: hidden;
}
.grid .error, .grid .victory {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(10, 0, 0, 0.75);
  color: #fff;
  font-family: "Century Gothic",CenturyGothic,AppleGothic,sans-serif;
  border: none;
  opacity: 0;
  visibility: hidden;
  transition: opacity .3s, visibility .3s;
}
.grid .victory {
  background: rgba(0, 10, 0, 0.75);
}

#modeFlag:checked ~ .grid .flags {
  visibility: visible;
}

#modeMine:checked ~ .grid:active ~ .infos .counter:before {
  content: '😓' !important;
}

input[id^=f]:checked ~ .infos .counter:before {
  content: '😐';
}

input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ .infos .counter:before {
  content: '😏';
}

input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ .infos .counter:before {
  content: '🙂';
}

input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ .infos .counter:before {
  content: '😊';
}

input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ .infos .counter:before {
  content: '😃';
}

input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ .infos .counter:before {
  content: '🤓';
}

input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ .infos .counter:before {
  content: '😕';
}

input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ .infos .counter:before {
  content: '😒';
}

input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ .infos .counter:before {
  content: '😠';
}

input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ input[id^=f]:checked ~ .infos .counter:before {
  content: '🖕';
}

.grid label:nth-child(3):before {
  content: "1";
  color: #0000ff;
}

.grid label:nth-child(4):before {
  content: '💣';
  font-size: .75rem;
}

#c4:checked ~ .grid .error {
  opacity: 1;
  visibility: visible;
}
#c4:checked ~ .grid > label:after {
  visibility: hidden;
}
#c4:checked ~ .grid label:nth-child(4) {
  background-color: #f00;
}
#c4:checked ~ .grid:active ~ .infos .timer .digit, #c4:checked ~ .grid:active ~ .infos .timer .digit:after {
  animation: none;
}
#c4:checked ~ .infos .counter:before {
  content: '😣' !important;
}
#c4:checked ~ .infos .timer .digit, #c4:checked ~ .infos .timer .digit:after {
  animation-play-state: paused;
}

.grid label:nth-child(5):before {
  content: '💣';
  font-size: .75rem;
}

#c5:checked ~ .grid .error {
  opacity: 1;
  visibility: visible;
}
#c5:checked ~ .grid > label:after {
  visibility: hidden;
}
#c5:checked ~ .grid label:nth-child(5) {
  background-color: #f00;
}
#c5:checked ~ .grid:active ~ .infos .timer .digit, #c5:checked ~ .grid:active ~ .infos .timer .digit:after {
  animation: none;
}
#c5:checked ~ .infos .counter:before {
  content: '😣' !important;
}
#c5:checked ~ .infos .timer .digit, #c5:checked ~ .infos .timer .digit:after {
  animation-play-state: paused;
}

.grid label:nth-child(6):before {
  content: "2";
  color: #008100;
}

.grid label:nth-child(7):before {
  content: "1";
  color: #0000ff;
}

.grid label:nth-child(11):before {
  content: "1";
  color: #0000ff;
}

.grid label:nth-child(12):before {
  content: "2";
  color: #008100;
}

.grid label:nth-child(13):before {
  content: "3";
  color: #ff1300;
}

.grid label:nth-child(14):before {
  content: "3";
  color: #ff1300;
}

.grid label:nth-child(15):before {
  content: '💣';
  font-size: .75rem;
}

#c15:checked ~ .grid .error {
  opacity: 1;
  visibility: visible;
}
#c15:checked ~ .grid > label:after {
  visibility: hidden;
}
#c15:checked ~ .grid label:nth-child(15) {
  background-color: #f00;
}
#c15:checked ~ .grid:active ~ .infos .timer .digit, #c15:checked ~ .grid:active ~ .infos .timer .digit:after {
  animation: none;
}
#c15:checked ~ .infos .counter:before {
  content: '😣' !important;
}
#c15:checked ~ .infos .timer .digit, #c15:checked ~ .infos .timer .digit:after {
  animation-play-state: paused;
}

.grid label:nth-child(16):before {
  content: "1";
  color: #0000ff;
}

.grid label:nth-child(20):before {
  content: "1";
  color: #0000ff;
}

.grid label:nth-child(21):before {
  content: '💣';
  font-size: .75rem;
}

#c21:checked ~ .grid .error {
  opacity: 1;
  visibility: visible;
}
#c21:checked ~ .grid > label:after {
  visibility: hidden;
}
#c21:checked ~ .grid label:nth-child(21) {
  background-color: #f00;
}
#c21:checked ~ .grid:active ~ .infos .timer .digit, #c21:checked ~ .grid:active ~ .infos .timer .digit:after {
  animation: none;
}
#c21:checked ~ .infos .counter:before {
  content: '😣' !important;
}
#c21:checked ~ .infos .timer .digit, #c21:checked ~ .infos .timer .digit:after {
  animation-play-state: paused;
}

.grid label:nth-child(22):before {
  content: "2";
  color: #008100;
}

.grid label:nth-child(23):before {
  content: "2";
  color: #008100;
}

.grid label:nth-child(24):before {
  content: "1";
  color: #0000ff;
}

.grid label:nth-child(25):before {
  content: "2";
  color: #008100;
}

.grid label:nth-child(26):before {
  content: "1";
  color: #0000ff;
}

.grid label:nth-child(27):before {
  content: "1";
  color: #0000ff;
}

.grid label:nth-child(29):before {
  content: "1";
  color: #0000ff;
}

.grid label:nth-child(30):before {
  content: "2";
  color: #008100;
}

.grid label:nth-child(31):before {
  content: '💣';
  font-size: .75rem;
}

#c31:checked ~ .grid .error {
  opacity: 1;
  visibility: visible;
}
#c31:checked ~ .grid > label:after {
  visibility: hidden;
}
#c31:checked ~ .grid label:nth-child(31) {
  background-color: #f00;
}
#c31:checked ~ .grid:active ~ .infos .timer .digit, #c31:checked ~ .grid:active ~ .infos .timer .digit:after {
  animation: none;
}
#c31:checked ~ .infos .counter:before {
  content: '😣' !important;
}
#c31:checked ~ .infos .timer .digit, #c31:checked ~ .infos .timer .digit:after {
  animation-play-state: paused;
}

.grid label:nth-child(32):before {
  content: "1";
  color: #0000ff;
}

.grid label:nth-child(34):before {
  content: "1";
  color: #0000ff;
}

.grid label:nth-child(35):before {
  content: '💣';
  font-size: .75rem;
}

#c35:checked ~ .grid .error {
  opacity: 1;
  visibility: visible;
}
#c35:checked ~ .grid > label:after {
  visibility: hidden;
}
#c35:checked ~ .grid label:nth-child(35) {
  background-color: #f00;
}
#c35:checked ~ .grid:active ~ .infos .timer .digit, #c35:checked ~ .grid:active ~ .infos .timer .digit:after {
  animation: none;
}
#c35:checked ~ .infos .counter:before {
  content: '😣' !important;
}
#c35:checked ~ .infos .timer .digit, #c35:checked ~ .infos .timer .digit:after {
  animation-play-state: paused;
}

.grid label:nth-child(36):before {
  content: "1";
  color: #0000ff;
}

.grid label:nth-child(39):before {
  content: "2";
  color: #008100;
}

.grid label:nth-child(40):before {
  content: "2";
  color: #008100;
}

.grid label:nth-child(41):before {
  content: "2";
  color: #008100;
}

.grid label:nth-child(43):before {
  content: "1";
  color: #0000ff;
}

.grid label:nth-child(44):before {
  content: "1";
  color: #0000ff;
}

.grid label:nth-child(45):before {
  content: "1";
  color: #0000ff;
}

.grid label:nth-child(46):before {
  content: "1";
  color: #0000ff;
}

.grid label:nth-child(47):before {
  content: "1";
  color: #0000ff;
}

.grid label:nth-child(48):before {
  content: "2";
  color: #008100;
}

.grid label:nth-child(49):before {
  content: '💣';
  font-size: .75rem;
}

#c49:checked ~ .grid .error {
  opacity: 1;
  visibility: visible;
}
#c49:checked ~ .grid > label:after {
  visibility: hidden;
}
#c49:checked ~ .grid label:nth-child(49) {
  background-color: #f00;
}
#c49:checked ~ .grid:active ~ .infos .timer .digit, #c49:checked ~ .grid:active ~ .infos .timer .digit:after {
  animation: none;
}
#c49:checked ~ .infos .counter:before {
  content: '😣' !important;
}
#c49:checked ~ .infos .timer .digit, #c49:checked ~ .infos .timer .digit:after {
  animation-play-state: paused;
}

.grid label:nth-child(50):before {
  content: "1";
  color: #0000ff;
}

.grid label:nth-child(55):before {
  content: "1";
  color: #0000ff;
}

.grid label:nth-child(56):before {
  content: '💣';
  font-size: .75rem;
}

#c56:checked ~ .grid .error {
  opacity: 1;
  visibility: visible;
}
#c56:checked ~ .grid > label:after {
  visibility: hidden;
}
#c56:checked ~ .grid label:nth-child(56) {
  background-color: #f00;
}
#c56:checked ~ .grid:active ~ .infos .timer .digit, #c56:checked ~ .grid:active ~ .infos .timer .digit:after {
  animation: none;
}
#c56:checked ~ .infos .counter:before {
  content: '😣' !important;
}
#c56:checked ~ .infos .timer .digit, #c56:checked ~ .infos .timer .digit:after {
  animation-play-state: paused;
}

.grid label:nth-child(57):before {
  content: "2";
  color: #008100;
}

.grid label:nth-child(58):before {
  content: "2";
  color: #008100;
}

.grid label:nth-child(59):before {
  content: "2";
  color: #008100;
}

.grid label:nth-child(60):before {
  content: "1";
  color: #0000ff;
}

.grid label:nth-child(64):before {
  content: "1";
  color: #0000ff;
}

.grid label:nth-child(65):before {
  content: "1";
  color: #0000ff;
}

.grid label:nth-child(66):before {
  content: "2";
  color: #008100;
}

.grid label:nth-child(67):before {
  content: "2";
  color: #008100;
}

.grid label:nth-child(68):before {
  content: '💣';
  font-size: .75rem;
}

#c68:checked ~ .grid .error {
  opacity: 1;
  visibility: visible;
}
#c68:checked ~ .grid > label:after {
  visibility: hidden;
}
#c68:checked ~ .grid label:nth-child(68) {
  background-color: #f00;
}
#c68:checked ~ .grid:active ~ .infos .timer .digit, #c68:checked ~ .grid:active ~ .infos .timer .digit:after {
  animation: none;
}
#c68:checked ~ .infos .counter:before {
  content: '😣' !important;
}
#c68:checked ~ .infos .timer .digit, #c68:checked ~ .infos .timer .digit:after {
  animation-play-state: paused;
}

.grid label:nth-child(69):before {
  content: "1";
  color: #0000ff;
}

.grid label:nth-child(75):before {
  content: "1";
  color: #0000ff;
}

.grid label:nth-child(76):before {
  content: '💣';
  font-size: .75rem;
}

#c76:checked ~ .grid .error {
  opacity: 1;
  visibility: visible;
}
#c76:checked ~ .grid > label:after {
  visibility: hidden;
}
#c76:checked ~ .grid label:nth-child(76) {
  background-color: #f00;
}
#c76:checked ~ .grid:active ~ .infos .timer .digit, #c76:checked ~ .grid:active ~ .infos .timer .digit:after {
  animation: none;
}
#c76:checked ~ .infos .counter:before {
  content: '😣' !important;
}
#c76:checked ~ .infos .timer .digit, #c76:checked ~ .infos .timer .digit:after {
  animation-play-state: paused;
}

.grid label:nth-child(77):before {
  content: "2";
  color: #008100;
}

.grid label:nth-child(78):before {
  content: "1";
  color: #0000ff;
}

#f1:not(:checked) ~ #f2:not(:checked) ~ #f3:not(:checked) ~ #f4:checked ~ #f5:checked ~ #f6:not(:checked) ~ #f7:not(:checked) ~ #f8:not(:checked) ~ #f9:not(:checked) ~ #f10:not(:checked) ~ #f11:not(:checked) ~ #f12:not(:checked) ~ #f13:not(:checked) ~ #f14:not(:checked) ~ #f15:checked ~ #f16:not(:checked) ~ #f17:not(:checked) ~ #f18:not(:checked) ~ #f19:not(:checked) ~ #f20:not(:checked) ~ #f21:checked ~ #f22:not(:checked) ~ #f23:not(:checked) ~ #f24:not(:checked) ~ #f25:not(:checked) ~ #f26:not(:checked) ~ #f27:not(:checked) ~ #f28:not(:checked) ~ #f29:not(:checked) ~ #f30:not(:checked) ~ #f31:checked ~ #f32:not(:checked) ~ #f33:not(:checked) ~ #f34:not(:checked) ~ #f35:checked ~ #f36:not(:checked) ~ #f37:not(:checked) ~ #f38:not(:checked) ~ #f39:not(:checked) ~ #f40:not(:checked) ~ #f41:not(:checked) ~ #f42:not(:checked) ~ #f43:not(:checked) ~ #f44:not(:checked) ~ #f45:not(:checked) ~ #f46:not(:checked) ~ #f47:not(:checked) ~ #f48:not(:checked) ~ #f49:checked ~ #f50:not(:checked) ~ #f51:not(:checked) ~ #f52:not(:checked) ~ #f53:not(:checked) ~ #f54:not(:checked) ~ #f55:not(:checked) ~ #f56:checked ~ #f57:not(:checked) ~ #f58:not(:checked) ~ #f59:not(:checked) ~ #f60:not(:checked) ~ #f61:not(:checked) ~ #f62:not(:checked) ~ #f63:not(:checked) ~ #f64:not(:checked) ~ #f65:not(:checked) ~ #f66:not(:checked) ~ #f67:not(:checked) ~ #f68:checked ~ #f69:not(:checked) ~ #f70:not(:checked) ~ #f71:not(:checked) ~ #f72:not(:checked) ~ #f73:not(:checked) ~ #f74:not(:checked) ~ #f75:not(:checked) ~ #f76:checked ~ #f77:not(:checked) ~ #f78:not(:checked) ~ #f79:not(:checked) ~ #f80:not(:checked) ~ #f81:not(:checked) ~ .grid > label:after {
  visibility: hidden;
}
#f1:not(:checked) ~ #f2:not(:checked) ~ #f3:not(:checked) ~ #f4:checked ~ #f5:checked ~ #f6:not(:checked) ~ #f7:not(:checked) ~ #f8:not(:checked) ~ #f9:not(:checked) ~ #f10:not(:checked) ~ #f11:not(:checked) ~ #f12:not(:checked) ~ #f13:not(:checked) ~ #f14:not(:checked) ~ #f15:checked ~ #f16:not(:checked) ~ #f17:not(:checked) ~ #f18:not(:checked) ~ #f19:not(:checked) ~ #f20:not(:checked) ~ #f21:checked ~ #f22:not(:checked) ~ #f23:not(:checked) ~ #f24:not(:checked) ~ #f25:not(:checked) ~ #f26:not(:checked) ~ #f27:not(:checked) ~ #f28:not(:checked) ~ #f29:not(:checked) ~ #f30:not(:checked) ~ #f31:checked ~ #f32:not(:checked) ~ #f33:not(:checked) ~ #f34:not(:checked) ~ #f35:checked ~ #f36:not(:checked) ~ #f37:not(:checked) ~ #f38:not(:checked) ~ #f39:not(:checked) ~ #f40:not(:checked) ~ #f41:not(:checked) ~ #f42:not(:checked) ~ #f43:not(:checked) ~ #f44:not(:checked) ~ #f45:not(:checked) ~ #f46:not(:checked) ~ #f47:not(:checked) ~ #f48:not(:checked) ~ #f49:checked ~ #f50:not(:checked) ~ #f51:not(:checked) ~ #f52:not(:checked) ~ #f53:not(:checked) ~ #f54:not(:checked) ~ #f55:not(:checked) ~ #f56:checked ~ #f57:not(:checked) ~ #f58:not(:checked) ~ #f59:not(:checked) ~ #f60:not(:checked) ~ #f61:not(:checked) ~ #f62:not(:checked) ~ #f63:not(:checked) ~ #f64:not(:checked) ~ #f65:not(:checked) ~ #f66:not(:checked) ~ #f67:not(:checked) ~ #f68:checked ~ #f69:not(:checked) ~ #f70:not(:checked) ~ #f71:not(:checked) ~ #f72:not(:checked) ~ #f73:not(:checked) ~ #f74:not(:checked) ~ #f75:not(:checked) ~ #f76:checked ~ #f77:not(:checked) ~ #f78:not(:checked) ~ #f79:not(:checked) ~ #f80:not(:checked) ~ #f81:not(:checked) ~ .grid .victory {
  opacity: 1;
  visibility: visible;
}
#f1:not(:checked) ~ #f2:not(:checked) ~ #f3:not(:checked) ~ #f4:checked ~ #f5:checked ~ #f6:not(:checked) ~ #f7:not(:checked) ~ #f8:not(:checked) ~ #f9:not(:checked) ~ #f10:not(:checked) ~ #f11:not(:checked) ~ #f12:not(:checked) ~ #f13:not(:checked) ~ #f14:not(:checked) ~ #f15:checked ~ #f16:not(:checked) ~ #f17:not(:checked) ~ #f18:not(:checked) ~ #f19:not(:checked) ~ #f20:not(:checked) ~ #f21:checked ~ #f22:not(:checked) ~ #f23:not(:checked) ~ #f24:not(:checked) ~ #f25:not(:checked) ~ #f26:not(:checked) ~ #f27:not(:checked) ~ #f28:not(:checked) ~ #f29:not(:checked) ~ #f30:not(:checked) ~ #f31:checked ~ #f32:not(:checked) ~ #f33:not(:checked) ~ #f34:not(:checked) ~ #f35:checked ~ #f36:not(:checked) ~ #f37:not(:checked) ~ #f38:not(:checked) ~ #f39:not(:checked) ~ #f40:not(:checked) ~ #f41:not(:checked) ~ #f42:not(:checked) ~ #f43:not(:checked) ~ #f44:not(:checked) ~ #f45:not(:checked) ~ #f46:not(:checked) ~ #f47:not(:checked) ~ #f48:not(:checked) ~ #f49:checked ~ #f50:not(:checked) ~ #f51:not(:checked) ~ #f52:not(:checked) ~ #f53:not(:checked) ~ #f54:not(:checked) ~ #f55:not(:checked) ~ #f56:checked ~ #f57:not(:checked) ~ #f58:not(:checked) ~ #f59:not(:checked) ~ #f60:not(:checked) ~ #f61:not(:checked) ~ #f62:not(:checked) ~ #f63:not(:checked) ~ #f64:not(:checked) ~ #f65:not(:checked) ~ #f66:not(:checked) ~ #f67:not(:checked) ~ #f68:checked ~ #f69:not(:checked) ~ #f70:not(:checked) ~ #f71:not(:checked) ~ #f72:not(:checked) ~ #f73:not(:checked) ~ #f74:not(:checked) ~ #f75:not(:checked) ~ #f76:checked ~ #f77:not(:checked) ~ #f78:not(:checked) ~ #f79:not(:checked) ~ #f80:not(:checked) ~ #f81:not(:checked) ~ .grid:active ~ .infos .timer .digit, #f1:not(:checked) ~ #f2:not(:checked) ~ #f3:not(:checked) ~ #f4:checked ~ #f5:checked ~ #f6:not(:checked) ~ #f7:not(:checked) ~ #f8:not(:checked) ~ #f9:not(:checked) ~ #f10:not(:checked) ~ #f11:not(:checked) ~ #f12:not(:checked) ~ #f13:not(:checked) ~ #f14:not(:checked) ~ #f15:checked ~ #f16:not(:checked) ~ #f17:not(:checked) ~ #f18:not(:checked) ~ #f19:not(:checked) ~ #f20:not(:checked) ~ #f21:checked ~ #f22:not(:checked) ~ #f23:not(:checked) ~ #f24:not(:checked) ~ #f25:not(:checked) ~ #f26:not(:checked) ~ #f27:not(:checked) ~ #f28:not(:checked) ~ #f29:not(:checked) ~ #f30:not(:checked) ~ #f31:checked ~ #f32:not(:checked) ~ #f33:not(:checked) ~ #f34:not(:checked) ~ #f35:checked ~ #f36:not(:checked) ~ #f37:not(:checked) ~ #f38:not(:checked) ~ #f39:not(:checked) ~ #f40:not(:checked) ~ #f41:not(:checked) ~ #f42:not(:checked) ~ #f43:not(:checked) ~ #f44:not(:checked) ~ #f45:not(:checked) ~ #f46:not(:checked) ~ #f47:not(:checked) ~ #f48:not(:checked) ~ #f49:checked ~ #f50:not(:checked) ~ #f51:not(:checked) ~ #f52:not(:checked) ~ #f53:not(:checked) ~ #f54:not(:checked) ~ #f55:not(:checked) ~ #f56:checked ~ #f57:not(:checked) ~ #f58:not(:checked) ~ #f59:not(:checked) ~ #f60:not(:checked) ~ #f61:not(:checked) ~ #f62:not(:checked) ~ #f63:not(:checked) ~ #f64:not(:checked) ~ #f65:not(:checked) ~ #f66:not(:checked) ~ #f67:not(:checked) ~ #f68:checked ~ #f69:not(:checked) ~ #f70:not(:checked) ~ #f71:not(:checked) ~ #f72:not(:checked) ~ #f73:not(:checked) ~ #f74:not(:checked) ~ #f75:not(:checked) ~ #f76:checked ~ #f77:not(:checked) ~ #f78:not(:checked) ~ #f79:not(:checked) ~ #f80:not(:checked) ~ #f81:not(:checked) ~ .grid:active ~ .infos .timer .digit:after {
  animation: none;
}

#f1:not(:checked) ~ #f2:not(:checked) ~ #f3:not(:checked) ~ #f4:checked ~ #f5:checked ~ #f6:not(:checked) ~ #f7:not(:checked) ~ #f8:not(:checked) ~ #f9:not(:checked) ~ #f10:not(:checked) ~ #f11:not(:checked) ~ #f12:not(:checked) ~ #f13:not(:checked) ~ #f14:not(:checked) ~ #f15:checked ~ #f16:not(:checked) ~ #f17:not(:checked) ~ #f18:not(:checked) ~ #f19:not(:checked) ~ #f20:not(:checked) ~ #f21:checked ~ #f22:not(:checked) ~ #f23:not(:checked) ~ #f24:not(:checked) ~ #f25:not(:checked) ~ #f26:not(:checked) ~ #f27:not(:checked) ~ #f28:not(:checked) ~ #f29:not(:checked) ~ #f30:not(:checked) ~ #f31:checked ~ #f32:not(:checked) ~ #f33:not(:checked) ~ #f34:not(:checked) ~ #f35:checked ~ #f36:not(:checked) ~ #f37:not(:checked) ~ #f38:not(:checked) ~ #f39:not(:checked) ~ #f40:not(:checked) ~ #f41:not(:checked) ~ #f42:not(:checked) ~ #f43:not(:checked) ~ #f44:not(:checked) ~ #f45:not(:checked) ~ #f46:not(:checked) ~ #f47:not(:checked) ~ #f48:not(:checked) ~ #f49:checked ~ #f50:not(:checked) ~ #f51:not(:checked) ~ #f52:not(:checked) ~ #f53:not(:checked) ~ #f54:not(:checked) ~ #f55:not(:checked) ~ #f56:checked ~ #f57:not(:checked) ~ #f58:not(:checked) ~ #f59:not(:checked) ~ #f60:not(:checked) ~ #f61:not(:checked) ~ #f62:not(:checked) ~ #f63:not(:checked) ~ #f64:not(:checked) ~ #f65:not(:checked) ~ #f66:not(:checked) ~ #f67:not(:checked) ~ #f68:checked ~ #f69:not(:checked) ~ #f70:not(:checked) ~ #f71:not(:checked) ~ #f72:not(:checked) ~ #f73:not(:checked) ~ #f74:not(:checked) ~ #f75:not(:checked) ~ #f76:checked ~ #f77:not(:checked) ~ #f78:not(:checked) ~ #f79:not(:checked) ~ #f80:not(:checked) ~ #f81:not(:checked) ~ .infos .counter:before {
  content: '😎';
}
#f1:not(:checked) ~ #f2:not(:checked) ~ #f3:not(:checked) ~ #f4:checked ~ #f5:checked ~ #f6:not(:checked) ~ #f7:not(:checked) ~ #f8:not(:checked) ~ #f9:not(:checked) ~ #f10:not(:checked) ~ #f11:not(:checked) ~ #f12:not(:checked) ~ #f13:not(:checked) ~ #f14:not(:checked) ~ #f15:checked ~ #f16:not(:checked) ~ #f17:not(:checked) ~ #f18:not(:checked) ~ #f19:not(:checked) ~ #f20:not(:checked) ~ #f21:checked ~ #f22:not(:checked) ~ #f23:not(:checked) ~ #f24:not(:checked) ~ #f25:not(:checked) ~ #f26:not(:checked) ~ #f27:not(:checked) ~ #f28:not(:checked) ~ #f29:not(:checked) ~ #f30:not(:checked) ~ #f31:checked ~ #f32:not(:checked) ~ #f33:not(:checked) ~ #f34:not(:checked) ~ #f35:checked ~ #f36:not(:checked) ~ #f37:not(:checked) ~ #f38:not(:checked) ~ #f39:not(:checked) ~ #f40:not(:checked) ~ #f41:not(:checked) ~ #f42:not(:checked) ~ #f43:not(:checked) ~ #f44:not(:checked) ~ #f45:not(:checked) ~ #f46:not(:checked) ~ #f47:not(:checked) ~ #f48:not(:checked) ~ #f49:checked ~ #f50:not(:checked) ~ #f51:not(:checked) ~ #f52:not(:checked) ~ #f53:not(:checked) ~ #f54:not(:checked) ~ #f55:not(:checked) ~ #f56:checked ~ #f57:not(:checked) ~ #f58:not(:checked) ~ #f59:not(:checked) ~ #f60:not(:checked) ~ #f61:not(:checked) ~ #f62:not(:checked) ~ #f63:not(:checked) ~ #f64:not(:checked) ~ #f65:not(:checked) ~ #f66:not(:checked) ~ #f67:not(:checked) ~ #f68:checked ~ #f69:not(:checked) ~ #f70:not(:checked) ~ #f71:not(:checked) ~ #f72:not(:checked) ~ #f73:not(:checked) ~ #f74:not(:checked) ~ #f75:not(:checked) ~ #f76:checked ~ #f77:not(:checked) ~ #f78:not(:checked) ~ #f79:not(:checked) ~ #f80:not(:checked) ~ #f81:not(:checked) ~ .infos .timer .digit, #f1:not(:checked) ~ #f2:not(:checked) ~ #f3:not(:checked) ~ #f4:checked ~ #f5:checked ~ #f6:not(:checked) ~ #f7:not(:checked) ~ #f8:not(:checked) ~ #f9:not(:checked) ~ #f10:not(:checked) ~ #f11:not(:checked) ~ #f12:not(:checked) ~ #f13:not(:checked) ~ #f14:not(:checked) ~ #f15:checked ~ #f16:not(:checked) ~ #f17:not(:checked) ~ #f18:not(:checked) ~ #f19:not(:checked) ~ #f20:not(:checked) ~ #f21:checked ~ #f22:not(:checked) ~ #f23:not(:checked) ~ #f24:not(:checked) ~ #f25:not(:checked) ~ #f26:not(:checked) ~ #f27:not(:checked) ~ #f28:not(:checked) ~ #f29:not(:checked) ~ #f30:not(:checked) ~ #f31:checked ~ #f32:not(:checked) ~ #f33:not(:checked) ~ #f34:not(:checked) ~ #f35:checked ~ #f36:not(:checked) ~ #f37:not(:checked) ~ #f38:not(:checked) ~ #f39:not(:checked) ~ #f40:not(:checked) ~ #f41:not(:checked) ~ #f42:not(:checked) ~ #f43:not(:checked) ~ #f44:not(:checked) ~ #f45:not(:checked) ~ #f46:not(:checked) ~ #f47:not(:checked) ~ #f48:not(:checked) ~ #f49:checked ~ #f50:not(:checked) ~ #f51:not(:checked) ~ #f52:not(:checked) ~ #f53:not(:checked) ~ #f54:not(:checked) ~ #f55:not(:checked) ~ #f56:checked ~ #f57:not(:checked) ~ #f58:not(:checked) ~ #f59:not(:checked) ~ #f60:not(:checked) ~ #f61:not(:checked) ~ #f62:not(:checked) ~ #f63:not(:checked) ~ #f64:not(:checked) ~ #f65:not(:checked) ~ #f66:not(:checked) ~ #f67:not(:checked) ~ #f68:checked ~ #f69:not(:checked) ~ #f70:not(:checked) ~ #f71:not(:checked) ~ #f72:not(:checked) ~ #f73:not(:checked) ~ #f74:not(:checked) ~ #f75:not(:checked) ~ #f76:checked ~ #f77:not(:checked) ~ #f78:not(:checked) ~ #f79:not(:checked) ~ #f80:not(:checked) ~ #f81:not(:checked) ~ .infos .timer .digit:after {
  animation-play-state: paused;
}

#f1:checked ~ .grid label:nth-child(1):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f1:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(1):after {
  pointer-events: auto;
}

#c1:checked ~ .grid label:nth-child(1):after, #c1:checked ~ .grid label:nth-child(10):after, #c1:checked ~ .grid label:nth-child(19):after, #c1:checked ~ .grid label:nth-child(28):after, #c1:checked ~ .grid label:nth-child(37):after, #c1:checked ~ .grid label:nth-child(46):after, #c1:checked ~ .grid label:nth-child(29):after, #c1:checked ~ .grid label:nth-child(38):after, #c1:checked ~ .grid label:nth-child(46):after, #c1:checked ~ .grid label:nth-child(29):after, #c1:checked ~ .grid label:nth-child(47):after, #c1:checked ~ .grid label:nth-child(30):after, #c1:checked ~ .grid label:nth-child(39):after, #c1:checked ~ .grid label:nth-child(48):after, #c1:checked ~ .grid label:nth-child(47):after, #c1:checked ~ .grid label:nth-child(20):after, #c1:checked ~ .grid label:nth-child(29):after, #c1:checked ~ .grid label:nth-child(11):after, #c1:checked ~ .grid label:nth-child(20):after, #c1:checked ~ .grid label:nth-child(29):after, #c1:checked ~ .grid label:nth-child(2):after, #c1:checked ~ .grid label:nth-child(11):after, #c1:checked ~ .grid label:nth-child(3):after, #c1:checked ~ .grid label:nth-child(12):after, #c1:checked ~ .grid label:nth-child(11):after, #c1:checked ~ .grid label:nth-child(20):after, #c1:checked ~ .grid label:nth-child(11):after {
  pointer-events: none;
  visibility: hidden;
}

#c10:checked ~ .grid label:nth-child(1):after, #c10:checked ~ .grid label:nth-child(10):after, #c10:checked ~ .grid label:nth-child(19):after, #c10:checked ~ .grid label:nth-child(28):after, #c10:checked ~ .grid label:nth-child(37):after, #c10:checked ~ .grid label:nth-child(46):after, #c10:checked ~ .grid label:nth-child(29):after, #c10:checked ~ .grid label:nth-child(38):after, #c10:checked ~ .grid label:nth-child(46):after, #c10:checked ~ .grid label:nth-child(29):after, #c10:checked ~ .grid label:nth-child(47):after, #c10:checked ~ .grid label:nth-child(30):after, #c10:checked ~ .grid label:nth-child(39):after, #c10:checked ~ .grid label:nth-child(48):after, #c10:checked ~ .grid label:nth-child(47):after, #c10:checked ~ .grid label:nth-child(20):after, #c10:checked ~ .grid label:nth-child(29):after, #c10:checked ~ .grid label:nth-child(11):after, #c10:checked ~ .grid label:nth-child(20):after, #c10:checked ~ .grid label:nth-child(29):after, #c10:checked ~ .grid label:nth-child(2):after, #c10:checked ~ .grid label:nth-child(11):after, #c10:checked ~ .grid label:nth-child(3):after, #c10:checked ~ .grid label:nth-child(12):after, #c10:checked ~ .grid label:nth-child(11):after, #c10:checked ~ .grid label:nth-child(20):after, #c10:checked ~ .grid label:nth-child(11):after {
  pointer-events: none;
  visibility: hidden;
}

#c19:checked ~ .grid label:nth-child(1):after, #c19:checked ~ .grid label:nth-child(10):after, #c19:checked ~ .grid label:nth-child(19):after, #c19:checked ~ .grid label:nth-child(28):after, #c19:checked ~ .grid label:nth-child(37):after, #c19:checked ~ .grid label:nth-child(46):after, #c19:checked ~ .grid label:nth-child(29):after, #c19:checked ~ .grid label:nth-child(38):after, #c19:checked ~ .grid label:nth-child(46):after, #c19:checked ~ .grid label:nth-child(29):after, #c19:checked ~ .grid label:nth-child(47):after, #c19:checked ~ .grid label:nth-child(30):after, #c19:checked ~ .grid label:nth-child(39):after, #c19:checked ~ .grid label:nth-child(48):after, #c19:checked ~ .grid label:nth-child(47):after, #c19:checked ~ .grid label:nth-child(20):after, #c19:checked ~ .grid label:nth-child(29):after, #c19:checked ~ .grid label:nth-child(11):after, #c19:checked ~ .grid label:nth-child(20):after, #c19:checked ~ .grid label:nth-child(29):after, #c19:checked ~ .grid label:nth-child(2):after, #c19:checked ~ .grid label:nth-child(11):after, #c19:checked ~ .grid label:nth-child(3):after, #c19:checked ~ .grid label:nth-child(12):after, #c19:checked ~ .grid label:nth-child(11):after, #c19:checked ~ .grid label:nth-child(20):after, #c19:checked ~ .grid label:nth-child(11):after {
  pointer-events: none;
  visibility: hidden;
}

#c28:checked ~ .grid label:nth-child(1):after, #c28:checked ~ .grid label:nth-child(10):after, #c28:checked ~ .grid label:nth-child(19):after, #c28:checked ~ .grid label:nth-child(28):after, #c28:checked ~ .grid label:nth-child(37):after, #c28:checked ~ .grid label:nth-child(46):after, #c28:checked ~ .grid label:nth-child(29):after, #c28:checked ~ .grid label:nth-child(38):after, #c28:checked ~ .grid label:nth-child(46):after, #c28:checked ~ .grid label:nth-child(29):after, #c28:checked ~ .grid label:nth-child(47):after, #c28:checked ~ .grid label:nth-child(30):after, #c28:checked ~ .grid label:nth-child(39):after, #c28:checked ~ .grid label:nth-child(48):after, #c28:checked ~ .grid label:nth-child(47):after, #c28:checked ~ .grid label:nth-child(20):after, #c28:checked ~ .grid label:nth-child(29):after, #c28:checked ~ .grid label:nth-child(11):after, #c28:checked ~ .grid label:nth-child(20):after, #c28:checked ~ .grid label:nth-child(29):after, #c28:checked ~ .grid label:nth-child(2):after, #c28:checked ~ .grid label:nth-child(11):after, #c28:checked ~ .grid label:nth-child(3):after, #c28:checked ~ .grid label:nth-child(12):after, #c28:checked ~ .grid label:nth-child(11):after, #c28:checked ~ .grid label:nth-child(20):after, #c28:checked ~ .grid label:nth-child(11):after {
  pointer-events: none;
  visibility: hidden;
}

#c37:checked ~ .grid label:nth-child(1):after, #c37:checked ~ .grid label:nth-child(10):after, #c37:checked ~ .grid label:nth-child(19):after, #c37:checked ~ .grid label:nth-child(28):after, #c37:checked ~ .grid label:nth-child(37):after, #c37:checked ~ .grid label:nth-child(46):after, #c37:checked ~ .grid label:nth-child(29):after, #c37:checked ~ .grid label:nth-child(38):after, #c37:checked ~ .grid label:nth-child(46):after, #c37:checked ~ .grid label:nth-child(29):after, #c37:checked ~ .grid label:nth-child(47):after, #c37:checked ~ .grid label:nth-child(30):after, #c37:checked ~ .grid label:nth-child(39):after, #c37:checked ~ .grid label:nth-child(48):after, #c37:checked ~ .grid label:nth-child(47):after, #c37:checked ~ .grid label:nth-child(20):after, #c37:checked ~ .grid label:nth-child(29):after, #c37:checked ~ .grid label:nth-child(11):after, #c37:checked ~ .grid label:nth-child(20):after, #c37:checked ~ .grid label:nth-child(29):after, #c37:checked ~ .grid label:nth-child(2):after, #c37:checked ~ .grid label:nth-child(11):after, #c37:checked ~ .grid label:nth-child(3):after, #c37:checked ~ .grid label:nth-child(12):after, #c37:checked ~ .grid label:nth-child(11):after, #c37:checked ~ .grid label:nth-child(20):after, #c37:checked ~ .grid label:nth-child(11):after {
  pointer-events: none;
  visibility: hidden;
}

#c38:checked ~ .grid label:nth-child(1):after, #c38:checked ~ .grid label:nth-child(10):after, #c38:checked ~ .grid label:nth-child(19):after, #c38:checked ~ .grid label:nth-child(28):after, #c38:checked ~ .grid label:nth-child(37):after, #c38:checked ~ .grid label:nth-child(46):after, #c38:checked ~ .grid label:nth-child(29):after, #c38:checked ~ .grid label:nth-child(38):after, #c38:checked ~ .grid label:nth-child(46):after, #c38:checked ~ .grid label:nth-child(29):after, #c38:checked ~ .grid label:nth-child(47):after, #c38:checked ~ .grid label:nth-child(30):after, #c38:checked ~ .grid label:nth-child(39):after, #c38:checked ~ .grid label:nth-child(48):after, #c38:checked ~ .grid label:nth-child(47):after, #c38:checked ~ .grid label:nth-child(20):after, #c38:checked ~ .grid label:nth-child(29):after, #c38:checked ~ .grid label:nth-child(11):after, #c38:checked ~ .grid label:nth-child(20):after, #c38:checked ~ .grid label:nth-child(29):after, #c38:checked ~ .grid label:nth-child(2):after, #c38:checked ~ .grid label:nth-child(11):after, #c38:checked ~ .grid label:nth-child(3):after, #c38:checked ~ .grid label:nth-child(12):after, #c38:checked ~ .grid label:nth-child(11):after, #c38:checked ~ .grid label:nth-child(20):after, #c38:checked ~ .grid label:nth-child(11):after {
  pointer-events: none;
  visibility: hidden;
}

#c2:checked ~ .grid label:nth-child(1):after, #c2:checked ~ .grid label:nth-child(10):after, #c2:checked ~ .grid label:nth-child(19):after, #c2:checked ~ .grid label:nth-child(28):after, #c2:checked ~ .grid label:nth-child(37):after, #c2:checked ~ .grid label:nth-child(46):after, #c2:checked ~ .grid label:nth-child(29):after, #c2:checked ~ .grid label:nth-child(38):after, #c2:checked ~ .grid label:nth-child(46):after, #c2:checked ~ .grid label:nth-child(29):after, #c2:checked ~ .grid label:nth-child(47):after, #c2:checked ~ .grid label:nth-child(30):after, #c2:checked ~ .grid label:nth-child(39):after, #c2:checked ~ .grid label:nth-child(48):after, #c2:checked ~ .grid label:nth-child(47):after, #c2:checked ~ .grid label:nth-child(20):after, #c2:checked ~ .grid label:nth-child(29):after, #c2:checked ~ .grid label:nth-child(11):after, #c2:checked ~ .grid label:nth-child(20):after, #c2:checked ~ .grid label:nth-child(29):after, #c2:checked ~ .grid label:nth-child(2):after, #c2:checked ~ .grid label:nth-child(11):after, #c2:checked ~ .grid label:nth-child(3):after, #c2:checked ~ .grid label:nth-child(12):after, #c2:checked ~ .grid label:nth-child(11):after, #c2:checked ~ .grid label:nth-child(20):after, #c2:checked ~ .grid label:nth-child(11):after {
  pointer-events: none;
  visibility: hidden;
}

#f2:checked ~ .grid label:nth-child(2):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f2:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(2):after {
  pointer-events: auto;
}

#f3:checked ~ .grid label:nth-child(3):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f3:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(3):after {
  pointer-events: auto;
}

#c3:checked ~ .grid label:nth-child(3):after {
  pointer-events: none;
  visibility: hidden;
}

#f4:checked ~ .grid label:nth-child(4):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f4:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(4):after {
  pointer-events: auto;
}

#c4:checked ~ .grid label:nth-child(4):after {
  pointer-events: none;
  visibility: hidden;
}

#f5:checked ~ .grid label:nth-child(5):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f5:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(5):after {
  pointer-events: auto;
}

#c5:checked ~ .grid label:nth-child(5):after {
  pointer-events: none;
  visibility: hidden;
}

#f6:checked ~ .grid label:nth-child(6):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f6:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(6):after {
  pointer-events: auto;
}

#c6:checked ~ .grid label:nth-child(6):after {
  pointer-events: none;
  visibility: hidden;
}

#f7:checked ~ .grid label:nth-child(7):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f7:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(7):after {
  pointer-events: auto;
}

#c7:checked ~ .grid label:nth-child(7):after {
  pointer-events: none;
  visibility: hidden;
}

#f8:checked ~ .grid label:nth-child(8):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f8:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(8):after {
  pointer-events: auto;
}

#c8:checked ~ .grid label:nth-child(8):after, #c8:checked ~ .grid label:nth-child(7):after, #c8:checked ~ .grid label:nth-child(16):after, #c8:checked ~ .grid label:nth-child(17):after, #c8:checked ~ .grid label:nth-child(7):after, #c8:checked ~ .grid label:nth-child(16):after, #c8:checked ~ .grid label:nth-child(25):after, #c8:checked ~ .grid label:nth-child(26):after, #c8:checked ~ .grid label:nth-child(9):after, #c8:checked ~ .grid label:nth-child(18):after, #c8:checked ~ .grid label:nth-child(26):after, #c8:checked ~ .grid label:nth-child(27):after, #c8:checked ~ .grid label:nth-child(27):after {
  pointer-events: none;
  visibility: hidden;
}

#c17:checked ~ .grid label:nth-child(8):after, #c17:checked ~ .grid label:nth-child(7):after, #c17:checked ~ .grid label:nth-child(16):after, #c17:checked ~ .grid label:nth-child(17):after, #c17:checked ~ .grid label:nth-child(7):after, #c17:checked ~ .grid label:nth-child(16):after, #c17:checked ~ .grid label:nth-child(25):after, #c17:checked ~ .grid label:nth-child(26):after, #c17:checked ~ .grid label:nth-child(9):after, #c17:checked ~ .grid label:nth-child(18):after, #c17:checked ~ .grid label:nth-child(26):after, #c17:checked ~ .grid label:nth-child(27):after, #c17:checked ~ .grid label:nth-child(27):after {
  pointer-events: none;
  visibility: hidden;
}

#c9:checked ~ .grid label:nth-child(8):after, #c9:checked ~ .grid label:nth-child(7):after, #c9:checked ~ .grid label:nth-child(16):after, #c9:checked ~ .grid label:nth-child(17):after, #c9:checked ~ .grid label:nth-child(7):after, #c9:checked ~ .grid label:nth-child(16):after, #c9:checked ~ .grid label:nth-child(25):after, #c9:checked ~ .grid label:nth-child(26):after, #c9:checked ~ .grid label:nth-child(9):after, #c9:checked ~ .grid label:nth-child(18):after, #c9:checked ~ .grid label:nth-child(26):after, #c9:checked ~ .grid label:nth-child(27):after, #c9:checked ~ .grid label:nth-child(27):after {
  pointer-events: none;
  visibility: hidden;
}

#c18:checked ~ .grid label:nth-child(8):after, #c18:checked ~ .grid label:nth-child(7):after, #c18:checked ~ .grid label:nth-child(16):after, #c18:checked ~ .grid label:nth-child(17):after, #c18:checked ~ .grid label:nth-child(7):after, #c18:checked ~ .grid label:nth-child(16):after, #c18:checked ~ .grid label:nth-child(25):after, #c18:checked ~ .grid label:nth-child(26):after, #c18:checked ~ .grid label:nth-child(9):after, #c18:checked ~ .grid label:nth-child(18):after, #c18:checked ~ .grid label:nth-child(26):after, #c18:checked ~ .grid label:nth-child(27):after, #c18:checked ~ .grid label:nth-child(27):after {
  pointer-events: none;
  visibility: hidden;
}

#f9:checked ~ .grid label:nth-child(9):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f9:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(9):after {
  pointer-events: auto;
}

#f10:checked ~ .grid label:nth-child(10):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f10:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(10):after {
  pointer-events: auto;
}

#f11:checked ~ .grid label:nth-child(11):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f11:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(11):after {
  pointer-events: auto;
}

#c11:checked ~ .grid label:nth-child(11):after {
  pointer-events: none;
  visibility: hidden;
}

#f12:checked ~ .grid label:nth-child(12):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f12:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(12):after {
  pointer-events: auto;
}

#c12:checked ~ .grid label:nth-child(12):after {
  pointer-events: none;
  visibility: hidden;
}

#f13:checked ~ .grid label:nth-child(13):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f13:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(13):after {
  pointer-events: auto;
}

#c13:checked ~ .grid label:nth-child(13):after {
  pointer-events: none;
  visibility: hidden;
}

#f14:checked ~ .grid label:nth-child(14):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f14:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(14):after {
  pointer-events: auto;
}

#c14:checked ~ .grid label:nth-child(14):after {
  pointer-events: none;
  visibility: hidden;
}

#f15:checked ~ .grid label:nth-child(15):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f15:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(15):after {
  pointer-events: auto;
}

#c15:checked ~ .grid label:nth-child(15):after {
  pointer-events: none;
  visibility: hidden;
}

#f16:checked ~ .grid label:nth-child(16):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f16:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(16):after {
  pointer-events: auto;
}

#c16:checked ~ .grid label:nth-child(16):after {
  pointer-events: none;
  visibility: hidden;
}

#f17:checked ~ .grid label:nth-child(17):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f17:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(17):after {
  pointer-events: auto;
}

#f18:checked ~ .grid label:nth-child(18):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f18:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(18):after {
  pointer-events: auto;
}

#f19:checked ~ .grid label:nth-child(19):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f19:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(19):after {
  pointer-events: auto;
}

#f20:checked ~ .grid label:nth-child(20):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f20:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(20):after {
  pointer-events: auto;
}

#c20:checked ~ .grid label:nth-child(20):after {
  pointer-events: none;
  visibility: hidden;
}

#f21:checked ~ .grid label:nth-child(21):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f21:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(21):after {
  pointer-events: auto;
}

#c21:checked ~ .grid label:nth-child(21):after {
  pointer-events: none;
  visibility: hidden;
}

#f22:checked ~ .grid label:nth-child(22):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f22:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(22):after {
  pointer-events: auto;
}

#c22:checked ~ .grid label:nth-child(22):after {
  pointer-events: none;
  visibility: hidden;
}

#f23:checked ~ .grid label:nth-child(23):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f23:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(23):after {
  pointer-events: auto;
}

#c23:checked ~ .grid label:nth-child(23):after {
  pointer-events: none;
  visibility: hidden;
}

#f24:checked ~ .grid label:nth-child(24):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f24:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(24):after {
  pointer-events: auto;
}

#c24:checked ~ .grid label:nth-child(24):after {
  pointer-events: none;
  visibility: hidden;
}

#f25:checked ~ .grid label:nth-child(25):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f25:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(25):after {
  pointer-events: auto;
}

#c25:checked ~ .grid label:nth-child(25):after {
  pointer-events: none;
  visibility: hidden;
}

#f26:checked ~ .grid label:nth-child(26):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f26:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(26):after {
  pointer-events: auto;
}

#c26:checked ~ .grid label:nth-child(26):after {
  pointer-events: none;
  visibility: hidden;
}

#f27:checked ~ .grid label:nth-child(27):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f27:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(27):after {
  pointer-events: auto;
}

#c27:checked ~ .grid label:nth-child(27):after {
  pointer-events: none;
  visibility: hidden;
}

#f28:checked ~ .grid label:nth-child(28):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f28:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(28):after {
  pointer-events: auto;
}

#f29:checked ~ .grid label:nth-child(29):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f29:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(29):after {
  pointer-events: auto;
}

#c29:checked ~ .grid label:nth-child(29):after {
  pointer-events: none;
  visibility: hidden;
}

#f30:checked ~ .grid label:nth-child(30):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f30:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(30):after {
  pointer-events: auto;
}

#c30:checked ~ .grid label:nth-child(30):after {
  pointer-events: none;
  visibility: hidden;
}

#f31:checked ~ .grid label:nth-child(31):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f31:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(31):after {
  pointer-events: auto;
}

#c31:checked ~ .grid label:nth-child(31):after {
  pointer-events: none;
  visibility: hidden;
}

#f32:checked ~ .grid label:nth-child(32):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f32:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(32):after {
  pointer-events: auto;
}

#c32:checked ~ .grid label:nth-child(32):after {
  pointer-events: none;
  visibility: hidden;
}

#f33:checked ~ .grid label:nth-child(33):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f33:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(33):after {
  pointer-events: auto;
}

#c33:checked ~ .grid label:nth-child(33):after, #c33:checked ~ .grid label:nth-child(23):after, #c33:checked ~ .grid label:nth-child(32):after, #c33:checked ~ .grid label:nth-child(41):after, #c33:checked ~ .grid label:nth-child(24):after, #c33:checked ~ .grid label:nth-child(42):after, #c33:checked ~ .grid label:nth-child(32):after, #c33:checked ~ .grid label:nth-child(41):after, #c33:checked ~ .grid label:nth-child(50):after, #c33:checked ~ .grid label:nth-child(51):after, #c33:checked ~ .grid label:nth-child(41):after, #c33:checked ~ .grid label:nth-child(50):after, #c33:checked ~ .grid label:nth-child(59):after, #c33:checked ~ .grid label:nth-child(60):after, #c33:checked ~ .grid label:nth-child(43):after, #c33:checked ~ .grid label:nth-child(52):after, #c33:checked ~ .grid label:nth-child(60):after, #c33:checked ~ .grid label:nth-child(43):after, #c33:checked ~ .grid label:nth-child(61):after, #c33:checked ~ .grid label:nth-child(60):after, #c33:checked ~ .grid label:nth-child(69):after, #c33:checked ~ .grid label:nth-child(70):after, #c33:checked ~ .grid label:nth-child(60):after, #c33:checked ~ .grid label:nth-child(69):after, #c33:checked ~ .grid label:nth-child(78):after, #c33:checked ~ .grid label:nth-child(79):after, #c33:checked ~ .grid label:nth-child(69):after, #c33:checked ~ .grid label:nth-child(78):after, #c33:checked ~ .grid label:nth-child(71):after, #c33:checked ~ .grid label:nth-child(62):after, #c33:checked ~ .grid label:nth-child(53):after, #c33:checked ~ .grid label:nth-child(43):after, #c33:checked ~ .grid label:nth-child(44):after, #c33:checked ~ .grid label:nth-child(45):after, #c33:checked ~ .grid label:nth-child(54):after, #c33:checked ~ .grid label:nth-child(44):after, #c33:checked ~ .grid label:nth-child(45):after, #c33:checked ~ .grid label:nth-child(63):after, #c33:checked ~ .grid label:nth-child(72):after, #c33:checked ~ .grid label:nth-child(80):after, #c33:checked ~ .grid label:nth-child(81):after, #c33:checked ~ .grid label:nth-child(44):after, #c33:checked ~ .grid label:nth-child(34):after, #c33:checked ~ .grid label:nth-child(43):after, #c33:checked ~ .grid label:nth-child(25):after, #c33:checked ~ .grid label:nth-child(34):after, #c33:checked ~ .grid label:nth-child(43):after {
  pointer-events: none;
  visibility: hidden;
}

#c42:checked ~ .grid label:nth-child(33):after, #c42:checked ~ .grid label:nth-child(23):after, #c42:checked ~ .grid label:nth-child(32):after, #c42:checked ~ .grid label:nth-child(41):after, #c42:checked ~ .grid label:nth-child(24):after, #c42:checked ~ .grid label:nth-child(42):after, #c42:checked ~ .grid label:nth-child(32):after, #c42:checked ~ .grid label:nth-child(41):after, #c42:checked ~ .grid label:nth-child(50):after, #c42:checked ~ .grid label:nth-child(51):after, #c42:checked ~ .grid label:nth-child(41):after, #c42:checked ~ .grid label:nth-child(50):after, #c42:checked ~ .grid label:nth-child(59):after, #c42:checked ~ .grid label:nth-child(60):after, #c42:checked ~ .grid label:nth-child(43):after, #c42:checked ~ .grid label:nth-child(52):after, #c42:checked ~ .grid label:nth-child(60):after, #c42:checked ~ .grid label:nth-child(43):after, #c42:checked ~ .grid label:nth-child(61):after, #c42:checked ~ .grid label:nth-child(60):after, #c42:checked ~ .grid label:nth-child(69):after, #c42:checked ~ .grid label:nth-child(70):after, #c42:checked ~ .grid label:nth-child(60):after, #c42:checked ~ .grid label:nth-child(69):after, #c42:checked ~ .grid label:nth-child(78):after, #c42:checked ~ .grid label:nth-child(79):after, #c42:checked ~ .grid label:nth-child(69):after, #c42:checked ~ .grid label:nth-child(78):after, #c42:checked ~ .grid label:nth-child(71):after, #c42:checked ~ .grid label:nth-child(62):after, #c42:checked ~ .grid label:nth-child(53):after, #c42:checked ~ .grid label:nth-child(43):after, #c42:checked ~ .grid label:nth-child(44):after, #c42:checked ~ .grid label:nth-child(45):after, #c42:checked ~ .grid label:nth-child(54):after, #c42:checked ~ .grid label:nth-child(44):after, #c42:checked ~ .grid label:nth-child(45):after, #c42:checked ~ .grid label:nth-child(63):after, #c42:checked ~ .grid label:nth-child(72):after, #c42:checked ~ .grid label:nth-child(80):after, #c42:checked ~ .grid label:nth-child(81):after, #c42:checked ~ .grid label:nth-child(44):after, #c42:checked ~ .grid label:nth-child(34):after, #c42:checked ~ .grid label:nth-child(43):after, #c42:checked ~ .grid label:nth-child(25):after, #c42:checked ~ .grid label:nth-child(34):after, #c42:checked ~ .grid label:nth-child(43):after {
  pointer-events: none;
  visibility: hidden;
}

#c51:checked ~ .grid label:nth-child(33):after, #c51:checked ~ .grid label:nth-child(23):after, #c51:checked ~ .grid label:nth-child(32):after, #c51:checked ~ .grid label:nth-child(41):after, #c51:checked ~ .grid label:nth-child(24):after, #c51:checked ~ .grid label:nth-child(42):after, #c51:checked ~ .grid label:nth-child(32):after, #c51:checked ~ .grid label:nth-child(41):after, #c51:checked ~ .grid label:nth-child(50):after, #c51:checked ~ .grid label:nth-child(51):after, #c51:checked ~ .grid label:nth-child(41):after, #c51:checked ~ .grid label:nth-child(50):after, #c51:checked ~ .grid label:nth-child(59):after, #c51:checked ~ .grid label:nth-child(60):after, #c51:checked ~ .grid label:nth-child(43):after, #c51:checked ~ .grid label:nth-child(52):after, #c51:checked ~ .grid label:nth-child(60):after, #c51:checked ~ .grid label:nth-child(43):after, #c51:checked ~ .grid label:nth-child(61):after, #c51:checked ~ .grid label:nth-child(60):after, #c51:checked ~ .grid label:nth-child(69):after, #c51:checked ~ .grid label:nth-child(70):after, #c51:checked ~ .grid label:nth-child(60):after, #c51:checked ~ .grid label:nth-child(69):after, #c51:checked ~ .grid label:nth-child(78):after, #c51:checked ~ .grid label:nth-child(79):after, #c51:checked ~ .grid label:nth-child(69):after, #c51:checked ~ .grid label:nth-child(78):after, #c51:checked ~ .grid label:nth-child(71):after, #c51:checked ~ .grid label:nth-child(62):after, #c51:checked ~ .grid label:nth-child(53):after, #c51:checked ~ .grid label:nth-child(43):after, #c51:checked ~ .grid label:nth-child(44):after, #c51:checked ~ .grid label:nth-child(45):after, #c51:checked ~ .grid label:nth-child(54):after, #c51:checked ~ .grid label:nth-child(44):after, #c51:checked ~ .grid label:nth-child(45):after, #c51:checked ~ .grid label:nth-child(63):after, #c51:checked ~ .grid label:nth-child(72):after, #c51:checked ~ .grid label:nth-child(80):after, #c51:checked ~ .grid label:nth-child(81):after, #c51:checked ~ .grid label:nth-child(44):after, #c51:checked ~ .grid label:nth-child(34):after, #c51:checked ~ .grid label:nth-child(43):after, #c51:checked ~ .grid label:nth-child(25):after, #c51:checked ~ .grid label:nth-child(34):after, #c51:checked ~ .grid label:nth-child(43):after {
  pointer-events: none;
  visibility: hidden;
}

#c52:checked ~ .grid label:nth-child(33):after, #c52:checked ~ .grid label:nth-child(23):after, #c52:checked ~ .grid label:nth-child(32):after, #c52:checked ~ .grid label:nth-child(41):after, #c52:checked ~ .grid label:nth-child(24):after, #c52:checked ~ .grid label:nth-child(42):after, #c52:checked ~ .grid label:nth-child(32):after, #c52:checked ~ .grid label:nth-child(41):after, #c52:checked ~ .grid label:nth-child(50):after, #c52:checked ~ .grid label:nth-child(51):after, #c52:checked ~ .grid label:nth-child(41):after, #c52:checked ~ .grid label:nth-child(50):after, #c52:checked ~ .grid label:nth-child(59):after, #c52:checked ~ .grid label:nth-child(60):after, #c52:checked ~ .grid label:nth-child(43):after, #c52:checked ~ .grid label:nth-child(52):after, #c52:checked ~ .grid label:nth-child(60):after, #c52:checked ~ .grid label:nth-child(43):after, #c52:checked ~ .grid label:nth-child(61):after, #c52:checked ~ .grid label:nth-child(60):after, #c52:checked ~ .grid label:nth-child(69):after, #c52:checked ~ .grid label:nth-child(70):after, #c52:checked ~ .grid label:nth-child(60):after, #c52:checked ~ .grid label:nth-child(69):after, #c52:checked ~ .grid label:nth-child(78):after, #c52:checked ~ .grid label:nth-child(79):after, #c52:checked ~ .grid label:nth-child(69):after, #c52:checked ~ .grid label:nth-child(78):after, #c52:checked ~ .grid label:nth-child(71):after, #c52:checked ~ .grid label:nth-child(62):after, #c52:checked ~ .grid label:nth-child(53):after, #c52:checked ~ .grid label:nth-child(43):after, #c52:checked ~ .grid label:nth-child(44):after, #c52:checked ~ .grid label:nth-child(45):after, #c52:checked ~ .grid label:nth-child(54):after, #c52:checked ~ .grid label:nth-child(44):after, #c52:checked ~ .grid label:nth-child(45):after, #c52:checked ~ .grid label:nth-child(63):after, #c52:checked ~ .grid label:nth-child(72):after, #c52:checked ~ .grid label:nth-child(80):after, #c52:checked ~ .grid label:nth-child(81):after, #c52:checked ~ .grid label:nth-child(44):after, #c52:checked ~ .grid label:nth-child(34):after, #c52:checked ~ .grid label:nth-child(43):after, #c52:checked ~ .grid label:nth-child(25):after, #c52:checked ~ .grid label:nth-child(34):after, #c52:checked ~ .grid label:nth-child(43):after {
  pointer-events: none;
  visibility: hidden;
}

#c61:checked ~ .grid label:nth-child(33):after, #c61:checked ~ .grid label:nth-child(23):after, #c61:checked ~ .grid label:nth-child(32):after, #c61:checked ~ .grid label:nth-child(41):after, #c61:checked ~ .grid label:nth-child(24):after, #c61:checked ~ .grid label:nth-child(42):after, #c61:checked ~ .grid label:nth-child(32):after, #c61:checked ~ .grid label:nth-child(41):after, #c61:checked ~ .grid label:nth-child(50):after, #c61:checked ~ .grid label:nth-child(51):after, #c61:checked ~ .grid label:nth-child(41):after, #c61:checked ~ .grid label:nth-child(50):after, #c61:checked ~ .grid label:nth-child(59):after, #c61:checked ~ .grid label:nth-child(60):after, #c61:checked ~ .grid label:nth-child(43):after, #c61:checked ~ .grid label:nth-child(52):after, #c61:checked ~ .grid label:nth-child(60):after, #c61:checked ~ .grid label:nth-child(43):after, #c61:checked ~ .grid label:nth-child(61):after, #c61:checked ~ .grid label:nth-child(60):after, #c61:checked ~ .grid label:nth-child(69):after, #c61:checked ~ .grid label:nth-child(70):after, #c61:checked ~ .grid label:nth-child(60):after, #c61:checked ~ .grid label:nth-child(69):after, #c61:checked ~ .grid label:nth-child(78):after, #c61:checked ~ .grid label:nth-child(79):after, #c61:checked ~ .grid label:nth-child(69):after, #c61:checked ~ .grid label:nth-child(78):after, #c61:checked ~ .grid label:nth-child(71):after, #c61:checked ~ .grid label:nth-child(62):after, #c61:checked ~ .grid label:nth-child(53):after, #c61:checked ~ .grid label:nth-child(43):after, #c61:checked ~ .grid label:nth-child(44):after, #c61:checked ~ .grid label:nth-child(45):after, #c61:checked ~ .grid label:nth-child(54):after, #c61:checked ~ .grid label:nth-child(44):after, #c61:checked ~ .grid label:nth-child(45):after, #c61:checked ~ .grid label:nth-child(63):after, #c61:checked ~ .grid label:nth-child(72):after, #c61:checked ~ .grid label:nth-child(80):after, #c61:checked ~ .grid label:nth-child(81):after, #c61:checked ~ .grid label:nth-child(44):after, #c61:checked ~ .grid label:nth-child(34):after, #c61:checked ~ .grid label:nth-child(43):after, #c61:checked ~ .grid label:nth-child(25):after, #c61:checked ~ .grid label:nth-child(34):after, #c61:checked ~ .grid label:nth-child(43):after {
  pointer-events: none;
  visibility: hidden;
}

#c70:checked ~ .grid label:nth-child(33):after, #c70:checked ~ .grid label:nth-child(23):after, #c70:checked ~ .grid label:nth-child(32):after, #c70:checked ~ .grid label:nth-child(41):after, #c70:checked ~ .grid label:nth-child(24):after, #c70:checked ~ .grid label:nth-child(42):after, #c70:checked ~ .grid label:nth-child(32):after, #c70:checked ~ .grid label:nth-child(41):after, #c70:checked ~ .grid label:nth-child(50):after, #c70:checked ~ .grid label:nth-child(51):after, #c70:checked ~ .grid label:nth-child(41):after, #c70:checked ~ .grid label:nth-child(50):after, #c70:checked ~ .grid label:nth-child(59):after, #c70:checked ~ .grid label:nth-child(60):after, #c70:checked ~ .grid label:nth-child(43):after, #c70:checked ~ .grid label:nth-child(52):after, #c70:checked ~ .grid label:nth-child(60):after, #c70:checked ~ .grid label:nth-child(43):after, #c70:checked ~ .grid label:nth-child(61):after, #c70:checked ~ .grid label:nth-child(60):after, #c70:checked ~ .grid label:nth-child(69):after, #c70:checked ~ .grid label:nth-child(70):after, #c70:checked ~ .grid label:nth-child(60):after, #c70:checked ~ .grid label:nth-child(69):after, #c70:checked ~ .grid label:nth-child(78):after, #c70:checked ~ .grid label:nth-child(79):after, #c70:checked ~ .grid label:nth-child(69):after, #c70:checked ~ .grid label:nth-child(78):after, #c70:checked ~ .grid label:nth-child(71):after, #c70:checked ~ .grid label:nth-child(62):after, #c70:checked ~ .grid label:nth-child(53):after, #c70:checked ~ .grid label:nth-child(43):after, #c70:checked ~ .grid label:nth-child(44):after, #c70:checked ~ .grid label:nth-child(45):after, #c70:checked ~ .grid label:nth-child(54):after, #c70:checked ~ .grid label:nth-child(44):after, #c70:checked ~ .grid label:nth-child(45):after, #c70:checked ~ .grid label:nth-child(63):after, #c70:checked ~ .grid label:nth-child(72):after, #c70:checked ~ .grid label:nth-child(80):after, #c70:checked ~ .grid label:nth-child(81):after, #c70:checked ~ .grid label:nth-child(44):after, #c70:checked ~ .grid label:nth-child(34):after, #c70:checked ~ .grid label:nth-child(43):after, #c70:checked ~ .grid label:nth-child(25):after, #c70:checked ~ .grid label:nth-child(34):after, #c70:checked ~ .grid label:nth-child(43):after {
  pointer-events: none;
  visibility: hidden;
}

#c79:checked ~ .grid label:nth-child(33):after, #c79:checked ~ .grid label:nth-child(23):after, #c79:checked ~ .grid label:nth-child(32):after, #c79:checked ~ .grid label:nth-child(41):after, #c79:checked ~ .grid label:nth-child(24):after, #c79:checked ~ .grid label:nth-child(42):after, #c79:checked ~ .grid label:nth-child(32):after, #c79:checked ~ .grid label:nth-child(41):after, #c79:checked ~ .grid label:nth-child(50):after, #c79:checked ~ .grid label:nth-child(51):after, #c79:checked ~ .grid label:nth-child(41):after, #c79:checked ~ .grid label:nth-child(50):after, #c79:checked ~ .grid label:nth-child(59):after, #c79:checked ~ .grid label:nth-child(60):after, #c79:checked ~ .grid label:nth-child(43):after, #c79:checked ~ .grid label:nth-child(52):after, #c79:checked ~ .grid label:nth-child(60):after, #c79:checked ~ .grid label:nth-child(43):after, #c79:checked ~ .grid label:nth-child(61):after, #c79:checked ~ .grid label:nth-child(60):after, #c79:checked ~ .grid label:nth-child(69):after, #c79:checked ~ .grid label:nth-child(70):after, #c79:checked ~ .grid label:nth-child(60):after, #c79:checked ~ .grid label:nth-child(69):after, #c79:checked ~ .grid label:nth-child(78):after, #c79:checked ~ .grid label:nth-child(79):after, #c79:checked ~ .grid label:nth-child(69):after, #c79:checked ~ .grid label:nth-child(78):after, #c79:checked ~ .grid label:nth-child(71):after, #c79:checked ~ .grid label:nth-child(62):after, #c79:checked ~ .grid label:nth-child(53):after, #c79:checked ~ .grid label:nth-child(43):after, #c79:checked ~ .grid label:nth-child(44):after, #c79:checked ~ .grid label:nth-child(45):after, #c79:checked ~ .grid label:nth-child(54):after, #c79:checked ~ .grid label:nth-child(44):after, #c79:checked ~ .grid label:nth-child(45):after, #c79:checked ~ .grid label:nth-child(63):after, #c79:checked ~ .grid label:nth-child(72):after, #c79:checked ~ .grid label:nth-child(80):after, #c79:checked ~ .grid label:nth-child(81):after, #c79:checked ~ .grid label:nth-child(44):after, #c79:checked ~ .grid label:nth-child(34):after, #c79:checked ~ .grid label:nth-child(43):after, #c79:checked ~ .grid label:nth-child(25):after, #c79:checked ~ .grid label:nth-child(34):after, #c79:checked ~ .grid label:nth-child(43):after {
  pointer-events: none;
  visibility: hidden;
}

#c71:checked ~ .grid label:nth-child(33):after, #c71:checked ~ .grid label:nth-child(23):after, #c71:checked ~ .grid label:nth-child(32):after, #c71:checked ~ .grid label:nth-child(41):after, #c71:checked ~ .grid label:nth-child(24):after, #c71:checked ~ .grid label:nth-child(42):after, #c71:checked ~ .grid label:nth-child(32):after, #c71:checked ~ .grid label:nth-child(41):after, #c71:checked ~ .grid label:nth-child(50):after, #c71:checked ~ .grid label:nth-child(51):after, #c71:checked ~ .grid label:nth-child(41):after, #c71:checked ~ .grid label:nth-child(50):after, #c71:checked ~ .grid label:nth-child(59):after, #c71:checked ~ .grid label:nth-child(60):after, #c71:checked ~ .grid label:nth-child(43):after, #c71:checked ~ .grid label:nth-child(52):after, #c71:checked ~ .grid label:nth-child(60):after, #c71:checked ~ .grid label:nth-child(43):after, #c71:checked ~ .grid label:nth-child(61):after, #c71:checked ~ .grid label:nth-child(60):after, #c71:checked ~ .grid label:nth-child(69):after, #c71:checked ~ .grid label:nth-child(70):after, #c71:checked ~ .grid label:nth-child(60):after, #c71:checked ~ .grid label:nth-child(69):after, #c71:checked ~ .grid label:nth-child(78):after, #c71:checked ~ .grid label:nth-child(79):after, #c71:checked ~ .grid label:nth-child(69):after, #c71:checked ~ .grid label:nth-child(78):after, #c71:checked ~ .grid label:nth-child(71):after, #c71:checked ~ .grid label:nth-child(62):after, #c71:checked ~ .grid label:nth-child(53):after, #c71:checked ~ .grid label:nth-child(43):after, #c71:checked ~ .grid label:nth-child(44):after, #c71:checked ~ .grid label:nth-child(45):after, #c71:checked ~ .grid label:nth-child(54):after, #c71:checked ~ .grid label:nth-child(44):after, #c71:checked ~ .grid label:nth-child(45):after, #c71:checked ~ .grid label:nth-child(63):after, #c71:checked ~ .grid label:nth-child(72):after, #c71:checked ~ .grid label:nth-child(80):after, #c71:checked ~ .grid label:nth-child(81):after, #c71:checked ~ .grid label:nth-child(44):after, #c71:checked ~ .grid label:nth-child(34):after, #c71:checked ~ .grid label:nth-child(43):after, #c71:checked ~ .grid label:nth-child(25):after, #c71:checked ~ .grid label:nth-child(34):after, #c71:checked ~ .grid label:nth-child(43):after {
  pointer-events: none;
  visibility: hidden;
}

#c62:checked ~ .grid label:nth-child(33):after, #c62:checked ~ .grid label:nth-child(23):after, #c62:checked ~ .grid label:nth-child(32):after, #c62:checked ~ .grid label:nth-child(41):after, #c62:checked ~ .grid label:nth-child(24):after, #c62:checked ~ .grid label:nth-child(42):after, #c62:checked ~ .grid label:nth-child(32):after, #c62:checked ~ .grid label:nth-child(41):after, #c62:checked ~ .grid label:nth-child(50):after, #c62:checked ~ .grid label:nth-child(51):after, #c62:checked ~ .grid label:nth-child(41):after, #c62:checked ~ .grid label:nth-child(50):after, #c62:checked ~ .grid label:nth-child(59):after, #c62:checked ~ .grid label:nth-child(60):after, #c62:checked ~ .grid label:nth-child(43):after, #c62:checked ~ .grid label:nth-child(52):after, #c62:checked ~ .grid label:nth-child(60):after, #c62:checked ~ .grid label:nth-child(43):after, #c62:checked ~ .grid label:nth-child(61):after, #c62:checked ~ .grid label:nth-child(60):after, #c62:checked ~ .grid label:nth-child(69):after, #c62:checked ~ .grid label:nth-child(70):after, #c62:checked ~ .grid label:nth-child(60):after, #c62:checked ~ .grid label:nth-child(69):after, #c62:checked ~ .grid label:nth-child(78):after, #c62:checked ~ .grid label:nth-child(79):after, #c62:checked ~ .grid label:nth-child(69):after, #c62:checked ~ .grid label:nth-child(78):after, #c62:checked ~ .grid label:nth-child(71):after, #c62:checked ~ .grid label:nth-child(62):after, #c62:checked ~ .grid label:nth-child(53):after, #c62:checked ~ .grid label:nth-child(43):after, #c62:checked ~ .grid label:nth-child(44):after, #c62:checked ~ .grid label:nth-child(45):after, #c62:checked ~ .grid label:nth-child(54):after, #c62:checked ~ .grid label:nth-child(44):after, #c62:checked ~ .grid label:nth-child(45):after, #c62:checked ~ .grid label:nth-child(63):after, #c62:checked ~ .grid label:nth-child(72):after, #c62:checked ~ .grid label:nth-child(80):after, #c62:checked ~ .grid label:nth-child(81):after, #c62:checked ~ .grid label:nth-child(44):after, #c62:checked ~ .grid label:nth-child(34):after, #c62:checked ~ .grid label:nth-child(43):after, #c62:checked ~ .grid label:nth-child(25):after, #c62:checked ~ .grid label:nth-child(34):after, #c62:checked ~ .grid label:nth-child(43):after {
  pointer-events: none;
  visibility: hidden;
}

#c53:checked ~ .grid label:nth-child(33):after, #c53:checked ~ .grid label:nth-child(23):after, #c53:checked ~ .grid label:nth-child(32):after, #c53:checked ~ .grid label:nth-child(41):after, #c53:checked ~ .grid label:nth-child(24):after, #c53:checked ~ .grid label:nth-child(42):after, #c53:checked ~ .grid label:nth-child(32):after, #c53:checked ~ .grid label:nth-child(41):after, #c53:checked ~ .grid label:nth-child(50):after, #c53:checked ~ .grid label:nth-child(51):after, #c53:checked ~ .grid label:nth-child(41):after, #c53:checked ~ .grid label:nth-child(50):after, #c53:checked ~ .grid label:nth-child(59):after, #c53:checked ~ .grid label:nth-child(60):after, #c53:checked ~ .grid label:nth-child(43):after, #c53:checked ~ .grid label:nth-child(52):after, #c53:checked ~ .grid label:nth-child(60):after, #c53:checked ~ .grid label:nth-child(43):after, #c53:checked ~ .grid label:nth-child(61):after, #c53:checked ~ .grid label:nth-child(60):after, #c53:checked ~ .grid label:nth-child(69):after, #c53:checked ~ .grid label:nth-child(70):after, #c53:checked ~ .grid label:nth-child(60):after, #c53:checked ~ .grid label:nth-child(69):after, #c53:checked ~ .grid label:nth-child(78):after, #c53:checked ~ .grid label:nth-child(79):after, #c53:checked ~ .grid label:nth-child(69):after, #c53:checked ~ .grid label:nth-child(78):after, #c53:checked ~ .grid label:nth-child(71):after, #c53:checked ~ .grid label:nth-child(62):after, #c53:checked ~ .grid label:nth-child(53):after, #c53:checked ~ .grid label:nth-child(43):after, #c53:checked ~ .grid label:nth-child(44):after, #c53:checked ~ .grid label:nth-child(45):after, #c53:checked ~ .grid label:nth-child(54):after, #c53:checked ~ .grid label:nth-child(44):after, #c53:checked ~ .grid label:nth-child(45):after, #c53:checked ~ .grid label:nth-child(63):after, #c53:checked ~ .grid label:nth-child(72):after, #c53:checked ~ .grid label:nth-child(80):after, #c53:checked ~ .grid label:nth-child(81):after, #c53:checked ~ .grid label:nth-child(44):after, #c53:checked ~ .grid label:nth-child(34):after, #c53:checked ~ .grid label:nth-child(43):after, #c53:checked ~ .grid label:nth-child(25):after, #c53:checked ~ .grid label:nth-child(34):after, #c53:checked ~ .grid label:nth-child(43):after {
  pointer-events: none;
  visibility: hidden;
}

#c54:checked ~ .grid label:nth-child(33):after, #c54:checked ~ .grid label:nth-child(23):after, #c54:checked ~ .grid label:nth-child(32):after, #c54:checked ~ .grid label:nth-child(41):after, #c54:checked ~ .grid label:nth-child(24):after, #c54:checked ~ .grid label:nth-child(42):after, #c54:checked ~ .grid label:nth-child(32):after, #c54:checked ~ .grid label:nth-child(41):after, #c54:checked ~ .grid label:nth-child(50):after, #c54:checked ~ .grid label:nth-child(51):after, #c54:checked ~ .grid label:nth-child(41):after, #c54:checked ~ .grid label:nth-child(50):after, #c54:checked ~ .grid label:nth-child(59):after, #c54:checked ~ .grid label:nth-child(60):after, #c54:checked ~ .grid label:nth-child(43):after, #c54:checked ~ .grid label:nth-child(52):after, #c54:checked ~ .grid label:nth-child(60):after, #c54:checked ~ .grid label:nth-child(43):after, #c54:checked ~ .grid label:nth-child(61):after, #c54:checked ~ .grid label:nth-child(60):after, #c54:checked ~ .grid label:nth-child(69):after, #c54:checked ~ .grid label:nth-child(70):after, #c54:checked ~ .grid label:nth-child(60):after, #c54:checked ~ .grid label:nth-child(69):after, #c54:checked ~ .grid label:nth-child(78):after, #c54:checked ~ .grid label:nth-child(79):after, #c54:checked ~ .grid label:nth-child(69):after, #c54:checked ~ .grid label:nth-child(78):after, #c54:checked ~ .grid label:nth-child(71):after, #c54:checked ~ .grid label:nth-child(62):after, #c54:checked ~ .grid label:nth-child(53):after, #c54:checked ~ .grid label:nth-child(43):after, #c54:checked ~ .grid label:nth-child(44):after, #c54:checked ~ .grid label:nth-child(45):after, #c54:checked ~ .grid label:nth-child(54):after, #c54:checked ~ .grid label:nth-child(44):after, #c54:checked ~ .grid label:nth-child(45):after, #c54:checked ~ .grid label:nth-child(63):after, #c54:checked ~ .grid label:nth-child(72):after, #c54:checked ~ .grid label:nth-child(80):after, #c54:checked ~ .grid label:nth-child(81):after, #c54:checked ~ .grid label:nth-child(44):after, #c54:checked ~ .grid label:nth-child(34):after, #c54:checked ~ .grid label:nth-child(43):after, #c54:checked ~ .grid label:nth-child(25):after, #c54:checked ~ .grid label:nth-child(34):after, #c54:checked ~ .grid label:nth-child(43):after {
  pointer-events: none;
  visibility: hidden;
}

#c63:checked ~ .grid label:nth-child(33):after, #c63:checked ~ .grid label:nth-child(23):after, #c63:checked ~ .grid label:nth-child(32):after, #c63:checked ~ .grid label:nth-child(41):after, #c63:checked ~ .grid label:nth-child(24):after, #c63:checked ~ .grid label:nth-child(42):after, #c63:checked ~ .grid label:nth-child(32):after, #c63:checked ~ .grid label:nth-child(41):after, #c63:checked ~ .grid label:nth-child(50):after, #c63:checked ~ .grid label:nth-child(51):after, #c63:checked ~ .grid label:nth-child(41):after, #c63:checked ~ .grid label:nth-child(50):after, #c63:checked ~ .grid label:nth-child(59):after, #c63:checked ~ .grid label:nth-child(60):after, #c63:checked ~ .grid label:nth-child(43):after, #c63:checked ~ .grid label:nth-child(52):after, #c63:checked ~ .grid label:nth-child(60):after, #c63:checked ~ .grid label:nth-child(43):after, #c63:checked ~ .grid label:nth-child(61):after, #c63:checked ~ .grid label:nth-child(60):after, #c63:checked ~ .grid label:nth-child(69):after, #c63:checked ~ .grid label:nth-child(70):after, #c63:checked ~ .grid label:nth-child(60):after, #c63:checked ~ .grid label:nth-child(69):after, #c63:checked ~ .grid label:nth-child(78):after, #c63:checked ~ .grid label:nth-child(79):after, #c63:checked ~ .grid label:nth-child(69):after, #c63:checked ~ .grid label:nth-child(78):after, #c63:checked ~ .grid label:nth-child(71):after, #c63:checked ~ .grid label:nth-child(62):after, #c63:checked ~ .grid label:nth-child(53):after, #c63:checked ~ .grid label:nth-child(43):after, #c63:checked ~ .grid label:nth-child(44):after, #c63:checked ~ .grid label:nth-child(45):after, #c63:checked ~ .grid label:nth-child(54):after, #c63:checked ~ .grid label:nth-child(44):after, #c63:checked ~ .grid label:nth-child(45):after, #c63:checked ~ .grid label:nth-child(63):after, #c63:checked ~ .grid label:nth-child(72):after, #c63:checked ~ .grid label:nth-child(80):after, #c63:checked ~ .grid label:nth-child(81):after, #c63:checked ~ .grid label:nth-child(44):after, #c63:checked ~ .grid label:nth-child(34):after, #c63:checked ~ .grid label:nth-child(43):after, #c63:checked ~ .grid label:nth-child(25):after, #c63:checked ~ .grid label:nth-child(34):after, #c63:checked ~ .grid label:nth-child(43):after {
  pointer-events: none;
  visibility: hidden;
}

#c72:checked ~ .grid label:nth-child(33):after, #c72:checked ~ .grid label:nth-child(23):after, #c72:checked ~ .grid label:nth-child(32):after, #c72:checked ~ .grid label:nth-child(41):after, #c72:checked ~ .grid label:nth-child(24):after, #c72:checked ~ .grid label:nth-child(42):after, #c72:checked ~ .grid label:nth-child(32):after, #c72:checked ~ .grid label:nth-child(41):after, #c72:checked ~ .grid label:nth-child(50):after, #c72:checked ~ .grid label:nth-child(51):after, #c72:checked ~ .grid label:nth-child(41):after, #c72:checked ~ .grid label:nth-child(50):after, #c72:checked ~ .grid label:nth-child(59):after, #c72:checked ~ .grid label:nth-child(60):after, #c72:checked ~ .grid label:nth-child(43):after, #c72:checked ~ .grid label:nth-child(52):after, #c72:checked ~ .grid label:nth-child(60):after, #c72:checked ~ .grid label:nth-child(43):after, #c72:checked ~ .grid label:nth-child(61):after, #c72:checked ~ .grid label:nth-child(60):after, #c72:checked ~ .grid label:nth-child(69):after, #c72:checked ~ .grid label:nth-child(70):after, #c72:checked ~ .grid label:nth-child(60):after, #c72:checked ~ .grid label:nth-child(69):after, #c72:checked ~ .grid label:nth-child(78):after, #c72:checked ~ .grid label:nth-child(79):after, #c72:checked ~ .grid label:nth-child(69):after, #c72:checked ~ .grid label:nth-child(78):after, #c72:checked ~ .grid label:nth-child(71):after, #c72:checked ~ .grid label:nth-child(62):after, #c72:checked ~ .grid label:nth-child(53):after, #c72:checked ~ .grid label:nth-child(43):after, #c72:checked ~ .grid label:nth-child(44):after, #c72:checked ~ .grid label:nth-child(45):after, #c72:checked ~ .grid label:nth-child(54):after, #c72:checked ~ .grid label:nth-child(44):after, #c72:checked ~ .grid label:nth-child(45):after, #c72:checked ~ .grid label:nth-child(63):after, #c72:checked ~ .grid label:nth-child(72):after, #c72:checked ~ .grid label:nth-child(80):after, #c72:checked ~ .grid label:nth-child(81):after, #c72:checked ~ .grid label:nth-child(44):after, #c72:checked ~ .grid label:nth-child(34):after, #c72:checked ~ .grid label:nth-child(43):after, #c72:checked ~ .grid label:nth-child(25):after, #c72:checked ~ .grid label:nth-child(34):after, #c72:checked ~ .grid label:nth-child(43):after {
  pointer-events: none;
  visibility: hidden;
}

#c80:checked ~ .grid label:nth-child(33):after, #c80:checked ~ .grid label:nth-child(23):after, #c80:checked ~ .grid label:nth-child(32):after, #c80:checked ~ .grid label:nth-child(41):after, #c80:checked ~ .grid label:nth-child(24):after, #c80:checked ~ .grid label:nth-child(42):after, #c80:checked ~ .grid label:nth-child(32):after, #c80:checked ~ .grid label:nth-child(41):after, #c80:checked ~ .grid label:nth-child(50):after, #c80:checked ~ .grid label:nth-child(51):after, #c80:checked ~ .grid label:nth-child(41):after, #c80:checked ~ .grid label:nth-child(50):after, #c80:checked ~ .grid label:nth-child(59):after, #c80:checked ~ .grid label:nth-child(60):after, #c80:checked ~ .grid label:nth-child(43):after, #c80:checked ~ .grid label:nth-child(52):after, #c80:checked ~ .grid label:nth-child(60):after, #c80:checked ~ .grid label:nth-child(43):after, #c80:checked ~ .grid label:nth-child(61):after, #c80:checked ~ .grid label:nth-child(60):after, #c80:checked ~ .grid label:nth-child(69):after, #c80:checked ~ .grid label:nth-child(70):after, #c80:checked ~ .grid label:nth-child(60):after, #c80:checked ~ .grid label:nth-child(69):after, #c80:checked ~ .grid label:nth-child(78):after, #c80:checked ~ .grid label:nth-child(79):after, #c80:checked ~ .grid label:nth-child(69):after, #c80:checked ~ .grid label:nth-child(78):after, #c80:checked ~ .grid label:nth-child(71):after, #c80:checked ~ .grid label:nth-child(62):after, #c80:checked ~ .grid label:nth-child(53):after, #c80:checked ~ .grid label:nth-child(43):after, #c80:checked ~ .grid label:nth-child(44):after, #c80:checked ~ .grid label:nth-child(45):after, #c80:checked ~ .grid label:nth-child(54):after, #c80:checked ~ .grid label:nth-child(44):after, #c80:checked ~ .grid label:nth-child(45):after, #c80:checked ~ .grid label:nth-child(63):after, #c80:checked ~ .grid label:nth-child(72):after, #c80:checked ~ .grid label:nth-child(80):after, #c80:checked ~ .grid label:nth-child(81):after, #c80:checked ~ .grid label:nth-child(44):after, #c80:checked ~ .grid label:nth-child(34):after, #c80:checked ~ .grid label:nth-child(43):after, #c80:checked ~ .grid label:nth-child(25):after, #c80:checked ~ .grid label:nth-child(34):after, #c80:checked ~ .grid label:nth-child(43):after {
  pointer-events: none;
  visibility: hidden;
}

#c81:checked ~ .grid label:nth-child(33):after, #c81:checked ~ .grid label:nth-child(23):after, #c81:checked ~ .grid label:nth-child(32):after, #c81:checked ~ .grid label:nth-child(41):after, #c81:checked ~ .grid label:nth-child(24):after, #c81:checked ~ .grid label:nth-child(42):after, #c81:checked ~ .grid label:nth-child(32):after, #c81:checked ~ .grid label:nth-child(41):after, #c81:checked ~ .grid label:nth-child(50):after, #c81:checked ~ .grid label:nth-child(51):after, #c81:checked ~ .grid label:nth-child(41):after, #c81:checked ~ .grid label:nth-child(50):after, #c81:checked ~ .grid label:nth-child(59):after, #c81:checked ~ .grid label:nth-child(60):after, #c81:checked ~ .grid label:nth-child(43):after, #c81:checked ~ .grid label:nth-child(52):after, #c81:checked ~ .grid label:nth-child(60):after, #c81:checked ~ .grid label:nth-child(43):after, #c81:checked ~ .grid label:nth-child(61):after, #c81:checked ~ .grid label:nth-child(60):after, #c81:checked ~ .grid label:nth-child(69):after, #c81:checked ~ .grid label:nth-child(70):after, #c81:checked ~ .grid label:nth-child(60):after, #c81:checked ~ .grid label:nth-child(69):after, #c81:checked ~ .grid label:nth-child(78):after, #c81:checked ~ .grid label:nth-child(79):after, #c81:checked ~ .grid label:nth-child(69):after, #c81:checked ~ .grid label:nth-child(78):after, #c81:checked ~ .grid label:nth-child(71):after, #c81:checked ~ .grid label:nth-child(62):after, #c81:checked ~ .grid label:nth-child(53):after, #c81:checked ~ .grid label:nth-child(43):after, #c81:checked ~ .grid label:nth-child(44):after, #c81:checked ~ .grid label:nth-child(45):after, #c81:checked ~ .grid label:nth-child(54):after, #c81:checked ~ .grid label:nth-child(44):after, #c81:checked ~ .grid label:nth-child(45):after, #c81:checked ~ .grid label:nth-child(63):after, #c81:checked ~ .grid label:nth-child(72):after, #c81:checked ~ .grid label:nth-child(80):after, #c81:checked ~ .grid label:nth-child(81):after, #c81:checked ~ .grid label:nth-child(44):after, #c81:checked ~ .grid label:nth-child(34):after, #c81:checked ~ .grid label:nth-child(43):after, #c81:checked ~ .grid label:nth-child(25):after, #c81:checked ~ .grid label:nth-child(34):after, #c81:checked ~ .grid label:nth-child(43):after {
  pointer-events: none;
  visibility: hidden;
}

#f34:checked ~ .grid label:nth-child(34):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f34:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(34):after {
  pointer-events: auto;
}

#c34:checked ~ .grid label:nth-child(34):after {
  pointer-events: none;
  visibility: hidden;
}

#f35:checked ~ .grid label:nth-child(35):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f35:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(35):after {
  pointer-events: auto;
}

#c35:checked ~ .grid label:nth-child(35):after {
  pointer-events: none;
  visibility: hidden;
}

#f36:checked ~ .grid label:nth-child(36):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f36:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(36):after {
  pointer-events: auto;
}

#c36:checked ~ .grid label:nth-child(36):after {
  pointer-events: none;
  visibility: hidden;
}

#f37:checked ~ .grid label:nth-child(37):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f37:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(37):after {
  pointer-events: auto;
}

#f38:checked ~ .grid label:nth-child(38):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f38:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(38):after {
  pointer-events: auto;
}

#f39:checked ~ .grid label:nth-child(39):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f39:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(39):after {
  pointer-events: auto;
}

#c39:checked ~ .grid label:nth-child(39):after {
  pointer-events: none;
  visibility: hidden;
}

#f40:checked ~ .grid label:nth-child(40):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f40:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(40):after {
  pointer-events: auto;
}

#c40:checked ~ .grid label:nth-child(40):after {
  pointer-events: none;
  visibility: hidden;
}

#f41:checked ~ .grid label:nth-child(41):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f41:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(41):after {
  pointer-events: auto;
}

#c41:checked ~ .grid label:nth-child(41):after {
  pointer-events: none;
  visibility: hidden;
}

#f42:checked ~ .grid label:nth-child(42):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f42:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(42):after {
  pointer-events: auto;
}

#f43:checked ~ .grid label:nth-child(43):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f43:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(43):after {
  pointer-events: auto;
}

#c43:checked ~ .grid label:nth-child(43):after {
  pointer-events: none;
  visibility: hidden;
}

#f44:checked ~ .grid label:nth-child(44):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f44:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(44):after {
  pointer-events: auto;
}

#c44:checked ~ .grid label:nth-child(44):after {
  pointer-events: none;
  visibility: hidden;
}

#f45:checked ~ .grid label:nth-child(45):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f45:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(45):after {
  pointer-events: auto;
}

#c45:checked ~ .grid label:nth-child(45):after {
  pointer-events: none;
  visibility: hidden;
}

#f46:checked ~ .grid label:nth-child(46):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f46:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(46):after {
  pointer-events: auto;
}

#c46:checked ~ .grid label:nth-child(46):after {
  pointer-events: none;
  visibility: hidden;
}

#f47:checked ~ .grid label:nth-child(47):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f47:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(47):after {
  pointer-events: auto;
}

#c47:checked ~ .grid label:nth-child(47):after {
  pointer-events: none;
  visibility: hidden;
}

#f48:checked ~ .grid label:nth-child(48):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f48:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(48):after {
  pointer-events: auto;
}

#c48:checked ~ .grid label:nth-child(48):after {
  pointer-events: none;
  visibility: hidden;
}

#f49:checked ~ .grid label:nth-child(49):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f49:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(49):after {
  pointer-events: auto;
}

#c49:checked ~ .grid label:nth-child(49):after {
  pointer-events: none;
  visibility: hidden;
}

#f50:checked ~ .grid label:nth-child(50):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f50:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(50):after {
  pointer-events: auto;
}

#c50:checked ~ .grid label:nth-child(50):after {
  pointer-events: none;
  visibility: hidden;
}

#f51:checked ~ .grid label:nth-child(51):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f51:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(51):after {
  pointer-events: auto;
}

#f52:checked ~ .grid label:nth-child(52):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f52:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(52):after {
  pointer-events: auto;
}

#f53:checked ~ .grid label:nth-child(53):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f53:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(53):after {
  pointer-events: auto;
}

#f54:checked ~ .grid label:nth-child(54):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f54:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(54):after {
  pointer-events: auto;
}

#f55:checked ~ .grid label:nth-child(55):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f55:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(55):after {
  pointer-events: auto;
}

#c55:checked ~ .grid label:nth-child(55):after {
  pointer-events: none;
  visibility: hidden;
}

#f56:checked ~ .grid label:nth-child(56):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f56:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(56):after {
  pointer-events: auto;
}

#c56:checked ~ .grid label:nth-child(56):after {
  pointer-events: none;
  visibility: hidden;
}

#f57:checked ~ .grid label:nth-child(57):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f57:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(57):after {
  pointer-events: auto;
}

#c57:checked ~ .grid label:nth-child(57):after {
  pointer-events: none;
  visibility: hidden;
}

#f58:checked ~ .grid label:nth-child(58):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f58:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(58):after {
  pointer-events: auto;
}

#c58:checked ~ .grid label:nth-child(58):after {
  pointer-events: none;
  visibility: hidden;
}

#f59:checked ~ .grid label:nth-child(59):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f59:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(59):after {
  pointer-events: auto;
}

#c59:checked ~ .grid label:nth-child(59):after {
  pointer-events: none;
  visibility: hidden;
}

#f60:checked ~ .grid label:nth-child(60):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f60:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(60):after {
  pointer-events: auto;
}

#c60:checked ~ .grid label:nth-child(60):after {
  pointer-events: none;
  visibility: hidden;
}

#f61:checked ~ .grid label:nth-child(61):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f61:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(61):after {
  pointer-events: auto;
}

#f62:checked ~ .grid label:nth-child(62):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f62:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(62):after {
  pointer-events: auto;
}

#f63:checked ~ .grid label:nth-child(63):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f63:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(63):after {
  pointer-events: auto;
}

#f64:checked ~ .grid label:nth-child(64):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f64:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(64):after {
  pointer-events: auto;
}

#c64:checked ~ .grid label:nth-child(64):after {
  pointer-events: none;
  visibility: hidden;
}

#f65:checked ~ .grid label:nth-child(65):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f65:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(65):after {
  pointer-events: auto;
}

#c65:checked ~ .grid label:nth-child(65):after {
  pointer-events: none;
  visibility: hidden;
}

#f66:checked ~ .grid label:nth-child(66):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f66:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(66):after {
  pointer-events: auto;
}

#c66:checked ~ .grid label:nth-child(66):after {
  pointer-events: none;
  visibility: hidden;
}

#f67:checked ~ .grid label:nth-child(67):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f67:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(67):after {
  pointer-events: auto;
}

#c67:checked ~ .grid label:nth-child(67):after {
  pointer-events: none;
  visibility: hidden;
}

#f68:checked ~ .grid label:nth-child(68):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f68:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(68):after {
  pointer-events: auto;
}

#c68:checked ~ .grid label:nth-child(68):after {
  pointer-events: none;
  visibility: hidden;
}

#f69:checked ~ .grid label:nth-child(69):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f69:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(69):after {
  pointer-events: auto;
}

#c69:checked ~ .grid label:nth-child(69):after {
  pointer-events: none;
  visibility: hidden;
}

#f70:checked ~ .grid label:nth-child(70):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f70:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(70):after {
  pointer-events: auto;
}

#f71:checked ~ .grid label:nth-child(71):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f71:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(71):after {
  pointer-events: auto;
}

#f72:checked ~ .grid label:nth-child(72):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f72:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(72):after {
  pointer-events: auto;
}

#f73:checked ~ .grid label:nth-child(73):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f73:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(73):after {
  pointer-events: auto;
}

#c73:checked ~ .grid label:nth-child(73):after, #c73:checked ~ .grid label:nth-child(64):after, #c73:checked ~ .grid label:nth-child(65):after, #c73:checked ~ .grid label:nth-child(74):after, #c73:checked ~ .grid label:nth-child(64):after, #c73:checked ~ .grid label:nth-child(65):after, #c73:checked ~ .grid label:nth-child(66):after, #c73:checked ~ .grid label:nth-child(75):after {
  pointer-events: none;
  visibility: hidden;
}

#c74:checked ~ .grid label:nth-child(73):after, #c74:checked ~ .grid label:nth-child(64):after, #c74:checked ~ .grid label:nth-child(65):after, #c74:checked ~ .grid label:nth-child(74):after, #c74:checked ~ .grid label:nth-child(64):after, #c74:checked ~ .grid label:nth-child(65):after, #c74:checked ~ .grid label:nth-child(66):after, #c74:checked ~ .grid label:nth-child(75):after {
  pointer-events: none;
  visibility: hidden;
}

#f74:checked ~ .grid label:nth-child(74):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f74:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(74):after {
  pointer-events: auto;
}

#f75:checked ~ .grid label:nth-child(75):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f75:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(75):after {
  pointer-events: auto;
}

#c75:checked ~ .grid label:nth-child(75):after {
  pointer-events: none;
  visibility: hidden;
}

#f76:checked ~ .grid label:nth-child(76):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f76:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(76):after {
  pointer-events: auto;
}

#c76:checked ~ .grid label:nth-child(76):after {
  pointer-events: none;
  visibility: hidden;
}

#f77:checked ~ .grid label:nth-child(77):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f77:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(77):after {
  pointer-events: auto;
}

#c77:checked ~ .grid label:nth-child(77):after {
  pointer-events: none;
  visibility: hidden;
}

#f78:checked ~ .grid label:nth-child(78):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f78:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(78):after {
  pointer-events: auto;
}

#c78:checked ~ .grid label:nth-child(78):after {
  pointer-events: none;
  visibility: hidden;
}

#f79:checked ~ .grid label:nth-child(79):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f79:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(79):after {
  pointer-events: auto;
}

#f80:checked ~ .grid label:nth-child(80):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f80:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(80):after {
  pointer-events: auto;
}

#f81:checked ~ .grid label:nth-child(81):after {
  content: '🚩';
  pointer-events: none;
  visibility: visible !important;
}
#f81:checked ~ #modeFlag:checked ~ .grid .flags label:nth-child(81):after {
  pointer-events: auto;
}
	</style>
	<script src="js/prefixfree.min.js"></script>
</head>
<body>
	<div class="htmleaf-container">
		<!-- / Match the SCSS variables here -->
<form>
  <input id='c1' type='checkbox'>
  <input id='f1' type='checkbox'>
  <input id='c2' type='checkbox'>
  <input id='f2' type='checkbox'>
  <input id='c3' type='checkbox'>
  <input id='f3' type='checkbox'>
  <input id='c4' type='checkbox'>
  <input id='f4' type='checkbox'>
  <input id='c5' type='checkbox'>
  <input id='f5' type='checkbox'>
  <input id='c6' type='checkbox'>
  <input id='f6' type='checkbox'>
  <input id='c7' type='checkbox'>
  <input id='f7' type='checkbox'>
  <input id='c8' type='checkbox'>
  <input id='f8' type='checkbox'>
  <input id='c9' type='checkbox'>
  <input id='f9' type='checkbox'>
  <input id='c10' type='checkbox'>
  <input id='f10' type='checkbox'>
  <input id='c11' type='checkbox'>
  <input id='f11' type='checkbox'>
  <input id='c12' type='checkbox'>
  <input id='f12' type='checkbox'>
  <input id='c13' type='checkbox'>
  <input id='f13' type='checkbox'>
  <input id='c14' type='checkbox'>
  <input id='f14' type='checkbox'>
  <input id='c15' type='checkbox'>
  <input id='f15' type='checkbox'>
  <input id='c16' type='checkbox'>
  <input id='f16' type='checkbox'>
  <input id='c17' type='checkbox'>
  <input id='f17' type='checkbox'>
  <input id='c18' type='checkbox'>
  <input id='f18' type='checkbox'>
  <input id='c19' type='checkbox'>
  <input id='f19' type='checkbox'>
  <input id='c20' type='checkbox'>
  <input id='f20' type='checkbox'>
  <input id='c21' type='checkbox'>
  <input id='f21' type='checkbox'>
  <input id='c22' type='checkbox'>
  <input id='f22' type='checkbox'>
  <input id='c23' type='checkbox'>
  <input id='f23' type='checkbox'>
  <input id='c24' type='checkbox'>
  <input id='f24' type='checkbox'>
  <input id='c25' type='checkbox'>
  <input id='f25' type='checkbox'>
  <input id='c26' type='checkbox'>
  <input id='f26' type='checkbox'>
  <input id='c27' type='checkbox'>
  <input id='f27' type='checkbox'>
  <input id='c28' type='checkbox'>
  <input id='f28' type='checkbox'>
  <input id='c29' type='checkbox'>
  <input id='f29' type='checkbox'>
  <input id='c30' type='checkbox'>
  <input id='f30' type='checkbox'>
  <input id='c31' type='checkbox'>
  <input id='f31' type='checkbox'>
  <input id='c32' type='checkbox'>
  <input id='f32' type='checkbox'>
  <input id='c33' type='checkbox'>
  <input id='f33' type='checkbox'>
  <input id='c34' type='checkbox'>
  <input id='f34' type='checkbox'>
  <input id='c35' type='checkbox'>
  <input id='f35' type='checkbox'>
  <input id='c36' type='checkbox'>
  <input id='f36' type='checkbox'>
  <input id='c37' type='checkbox'>
  <input id='f37' type='checkbox'>
  <input id='c38' type='checkbox'>
  <input id='f38' type='checkbox'>
  <input id='c39' type='checkbox'>
  <input id='f39' type='checkbox'>
  <input id='c40' type='checkbox'>
  <input id='f40' type='checkbox'>
  <input id='c41' type='checkbox'>
  <input id='f41' type='checkbox'>
  <input id='c42' type='checkbox'>
  <input id='f42' type='checkbox'>
  <input id='c43' type='checkbox'>
  <input id='f43' type='checkbox'>
  <input id='c44' type='checkbox'>
  <input id='f44' type='checkbox'>
  <input id='c45' type='checkbox'>
  <input id='f45' type='checkbox'>
  <input id='c46' type='checkbox'>
  <input id='f46' type='checkbox'>
  <input id='c47' type='checkbox'>
  <input id='f47' type='checkbox'>
  <input id='c48' type='checkbox'>
  <input id='f48' type='checkbox'>
  <input id='c49' type='checkbox'>
  <input id='f49' type='checkbox'>
  <input id='c50' type='checkbox'>
  <input id='f50' type='checkbox'>
  <input id='c51' type='checkbox'>
  <input id='f51' type='checkbox'>
  <input id='c52' type='checkbox'>
  <input id='f52' type='checkbox'>
  <input id='c53' type='checkbox'>
  <input id='f53' type='checkbox'>
  <input id='c54' type='checkbox'>
  <input id='f54' type='checkbox'>
  <input id='c55' type='checkbox'>
  <input id='f55' type='checkbox'>
  <input id='c56' type='checkbox'>
  <input id='f56' type='checkbox'>
  <input id='c57' type='checkbox'>
  <input id='f57' type='checkbox'>
  <input id='c58' type='checkbox'>
  <input id='f58' type='checkbox'>
  <input id='c59' type='checkbox'>
  <input id='f59' type='checkbox'>
  <input id='c60' type='checkbox'>
  <input id='f60' type='checkbox'>
  <input id='c61' type='checkbox'>
  <input id='f61' type='checkbox'>
  <input id='c62' type='checkbox'>
  <input id='f62' type='checkbox'>
  <input id='c63' type='checkbox'>
  <input id='f63' type='checkbox'>
  <input id='c64' type='checkbox'>
  <input id='f64' type='checkbox'>
  <input id='c65' type='checkbox'>
  <input id='f65' type='checkbox'>
  <input id='c66' type='checkbox'>
  <input id='f66' type='checkbox'>
  <input id='c67' type='checkbox'>
  <input id='f67' type='checkbox'>
  <input id='c68' type='checkbox'>
  <input id='f68' type='checkbox'>
  <input id='c69' type='checkbox'>
  <input id='f69' type='checkbox'>
  <input id='c70' type='checkbox'>
  <input id='f70' type='checkbox'>
  <input id='c71' type='checkbox'>
  <input id='f71' type='checkbox'>
  <input id='c72' type='checkbox'>
  <input id='f72' type='checkbox'>
  <input id='c73' type='checkbox'>
  <input id='f73' type='checkbox'>
  <input id='c74' type='checkbox'>
  <input id='f74' type='checkbox'>
  <input id='c75' type='checkbox'>
  <input id='f75' type='checkbox'>
  <input id='c76' type='checkbox'>
  <input id='f76' type='checkbox'>
  <input id='c77' type='checkbox'>
  <input id='f77' type='checkbox'>
  <input id='c78' type='checkbox'>
  <input id='f78' type='checkbox'>
  <input id='c79' type='checkbox'>
  <input id='f79' type='checkbox'>
  <input id='c80' type='checkbox'>
  <input id='f80' type='checkbox'>
  <input id='c81' type='checkbox'>
  <input id='f81' type='checkbox'>
  <input checked id='modeMine' name='mode' type='radio'>
  <input id='modeFlag' name='mode' type='radio'>
  <div class='actionSelector'>
    <label for='modeMine'>
      ⛏
    </label>
    <label for='modeFlag'>
      🚩
    </label>
  </div>
  <div class='grid'>
    <label for='c1'></label>
    <label for='c2'></label>
    <label for='c3'></label>
    <label for='c4'></label>
    <label for='c5'></label>
    <label for='c6'></label>
    <label for='c7'></label>
    <label for='c8'></label>
    <label for='c9'></label>
    <label for='c10'></label>
    <label for='c11'></label>
    <label for='c12'></label>
    <label for='c13'></label>
    <label for='c14'></label>
    <label for='c15'></label>
    <label for='c16'></label>
    <label for='c17'></label>
    <label for='c18'></label>
    <label for='c19'></label>
    <label for='c20'></label>
    <label for='c21'></label>
    <label for='c22'></label>
    <label for='c23'></label>
    <label for='c24'></label>
    <label for='c25'></label>
    <label for='c26'></label>
    <label for='c27'></label>
    <label for='c28'></label>
    <label for='c29'></label>
    <label for='c30'></label>
    <label for='c31'></label>
    <label for='c32'></label>
    <label for='c33'></label>
    <label for='c34'></label>
    <label for='c35'></label>
    <label for='c36'></label>
    <label for='c37'></label>
    <label for='c38'></label>
    <label for='c39'></label>
    <label for='c40'></label>
    <label for='c41'></label>
    <label for='c42'></label>
    <label for='c43'></label>
    <label for='c44'></label>
    <label for='c45'></label>
    <label for='c46'></label>
    <label for='c47'></label>
    <label for='c48'></label>
    <label for='c49'></label>
    <label for='c50'></label>
    <label for='c51'></label>
    <label for='c52'></label>
    <label for='c53'></label>
    <label for='c54'></label>
    <label for='c55'></label>
    <label for='c56'></label>
    <label for='c57'></label>
    <label for='c58'></label>
    <label for='c59'></label>
    <label for='c60'></label>
    <label for='c61'></label>
    <label for='c62'></label>
    <label for='c63'></label>
    <label for='c64'></label>
    <label for='c65'></label>
    <label for='c66'></label>
    <label for='c67'></label>
    <label for='c68'></label>
    <label for='c69'></label>
    <label for='c70'></label>
    <label for='c71'></label>
    <label for='c72'></label>
    <label for='c73'></label>
    <label for='c74'></label>
    <label for='c75'></label>
    <label for='c76'></label>
    <label for='c77'></label>
    <label for='c78'></label>
    <label for='c79'></label>
    <label for='c80'></label>
    <label for='c81'></label>
    <div class='flags'>
      <label for='f1'></label>
      <label for='f2'></label>
      <label for='f3'></label>
      <label for='f4'></label>
      <label for='f5'></label>
      <label for='f6'></label>
      <label for='f7'></label>
      <label for='f8'></label>
      <label for='f9'></label>
      <label for='f10'></label>
      <label for='f11'></label>
      <label for='f12'></label>
      <label for='f13'></label>
      <label for='f14'></label>
      <label for='f15'></label>
      <label for='f16'></label>
      <label for='f17'></label>
      <label for='f18'></label>
      <label for='f19'></label>
      <label for='f20'></label>
      <label for='f21'></label>
      <label for='f22'></label>
      <label for='f23'></label>
      <label for='f24'></label>
      <label for='f25'></label>
      <label for='f26'></label>
      <label for='f27'></label>
      <label for='f28'></label>
      <label for='f29'></label>
      <label for='f30'></label>
      <label for='f31'></label>
      <label for='f32'></label>
      <label for='f33'></label>
      <label for='f34'></label>
      <label for='f35'></label>
      <label for='f36'></label>
      <label for='f37'></label>
      <label for='f38'></label>
      <label for='f39'></label>
      <label for='f40'></label>
      <label for='f41'></label>
      <label for='f42'></label>
      <label for='f43'></label>
      <label for='f44'></label>
      <label for='f45'></label>
      <label for='f46'></label>
      <label for='f47'></label>
      <label for='f48'></label>
      <label for='f49'></label>
      <label for='f50'></label>
      <label for='f51'></label>
      <label for='f52'></label>
      <label for='f53'></label>
      <label for='f54'></label>
      <label for='f55'></label>
      <label for='f56'></label>
      <label for='f57'></label>
      <label for='f58'></label>
      <label for='f59'></label>
      <label for='f60'></label>
      <label for='f61'></label>
      <label for='f62'></label>
      <label for='f63'></label>
      <label for='f64'></label>
      <label for='f65'></label>
      <label for='f66'></label>
      <label for='f67'></label>
      <label for='f68'></label>
      <label for='f69'></label>
      <label for='f70'></label>
      <label for='f71'></label>
      <label for='f72'></label>
      <label for='f73'></label>
      <label for='f74'></label>
      <label for='f75'></label>
      <label for='f76'></label>
      <label for='f77'></label>
      <label for='f78'></label>
      <label for='f79'></label>
      <label for='f80'></label>
      <label for='f81'></label>
    </div>
    <button class='error' tabindex='-1' type='reset'>
      Ooohhh 🙁
      <br>
      Click to try again
    </button>
    <button class='victory' tabindex='-1' type='reset'>
      👌👀✔💯💯💯
      <br>
      Click to restart
    </button>
  </div>
  <div class='infos'>
    <div class='counter'></div>
    <div class='timer'>
      <div class='digit'></div>
      <div class='digit'></div>
      <div class='digit'></div>
      <div class='separator'></div>
      <div class='digit'></div>
      <div class='digit'></div>
    </div>
  </div>
</form>
	</div>
</body>
</html>