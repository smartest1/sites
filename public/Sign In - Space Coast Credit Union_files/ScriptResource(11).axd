﻿/*!
 * jQuery UI Touch Punch 0.2.3
 *
 * Copyright 2011�2014, Dave Furfero
 * Dual licensed under the MIT or GPL Version 2 licenses.
 *
 * Depends:
 *  jquery.ui.widget.js
 *  jquery.ui.mouse.js
 */
(function(n){function i(n,t){if(!(n.originalEvent.touches.length>1)){n.preventDefault();var i=n.originalEvent.changedTouches[0],r=document.createEvent("MouseEvents");r.initMouseEvent(t,!0,!0,window,1,i.screenX,i.screenY,i.clientX,i.clientY,!1,!1,!1,!1,0,null);n.target.dispatchEvent(r)}}if(n.support.touch="ontouchend"in document,n.support.touch){var t=n.ui.mouse.prototype,u=t._mouseInit,f=t._mouseDestroy,r;t._touchStart=function(n){var t=this;!r&&t._mouseCapture(n.originalEvent.changedTouches[0])&&(r=!0,t._touchMoved=!1,i(n,"mouseover"),i(n,"mousemove"),i(n,"mousedown"))};t._touchMove=function(n){r&&(this._touchMoved=!0,i(n,"mousemove"))};t._touchEnd=function(n){r&&(i(n,"mouseup"),i(n,"mouseout"),this._touchMoved||i(n,"click"),r=!1)};t._mouseInit=function(){var t=this;t.element.bind({touchstart:n.proxy(t,"_touchStart"),touchmove:n.proxy(t,"_touchMove"),touchend:n.proxy(t,"_touchEnd")});u.call(t)};t._mouseDestroy=function(){var t=this;t.element.unbind({touchstart:n.proxy(t,"_touchStart"),touchmove:n.proxy(t,"_touchMove"),touchend:n.proxy(t,"_touchEnd")});f.call(t)}}})(jQuery);