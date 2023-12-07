﻿var HttpCache;(function(n){function f(n){var t=n.indexOf("?"),i=t<0?n:n.substr(0,t);return u[i]||(u[i]=[])}function t(n){var u=HttpService.resolveRoute(n),t=i[u];return t||(t=new r(n),i[u]=t,f(u).push(t)),t}function e(n){var t=HttpService.resolveRoute(n);return t in i}function o(n){return t(n).get()}function s(n,i){t(n).publish(i)}function h(n){t(n).refresh()}function c(n){var t=HttpService.resolveRoute(n);r.refreshAll(f(t))}function l(n,i,r){r===void 0&&(r=!1);t(n).subscribe(i);r&&i()}function a(n,i){t(n).unsubscribe(i)}var r=function(){function n(n){this.endpoint=n;this.promise=null;this.callbacks=[]}return n.prototype.get=function(){return this.promise||(this.promise=HttpService.get(this.endpoint).then(function(n){return n.data}))},n.prototype.publish=function(n){this.promise=Promise.resolve(n);this.notifySubscribers()},n.prototype.refresh=function(){this.promise=null;this.notifySubscribers()},n.refreshAll=function(n){n.forEach(function(n){n.promise=null});n.forEach(function(n){n.notifySubscribers()})},n.prototype.subscribe=function(n){this.callbacks.push(n)},n.prototype.unsubscribe=function(n){var t=this.callbacks.indexOf(n);t>=0&&this.callbacks.splice(t,1)},n.prototype.notifySubscribers=function(){this.callbacks.forEach(function(n){n()})},n}(),i={},u={};n.contains=e;n.get=o;n.publish=s;n.refresh=h;n.refreshAll=c;n.subscribe=l;n.unsubscribe=a})(HttpCache||(HttpCache={}));