﻿var __assign=this&&this.__assign||function(){return __assign=Object.assign||function(n){for(var t,r,i=1,u=arguments.length;i<u;i++){t=arguments[i];for(r in t)Object.prototype.hasOwnProperty.call(t,r)&&(n[r]=t[r])}return n},__assign.apply(this,arguments)},__rest=this&&this.__rest||function(n,t){var u={},r;for(var i in n)Object.prototype.hasOwnProperty.call(n,i)&&t.indexOf(i)<0&&(u[i]=n[i]);if(n!=null&&typeof Object.getOwnPropertySymbols=="function")for(r=0,i=Object.getOwnPropertySymbols(n);r<i.length;r++)t.indexOf(i[r])<0&&Object.prototype.propertyIsEnumerable.call(n,i[r])&&(u[i[r]]=n[i[r]]);return u},Router;(function(n){function a(n){return i[n]||(i[n]=new p(n))}function r(){var n=t.flows;return n[n.length-1]}function v(n){var i=t.flows;i[i.length-1]=n(i[i.length-1])}function c(){var n=r(),i=IDS.detokenizePlainText(n.params,n.pathTemplate);history.pushState(t,"","#"+i)}function y(){var n=r(),i=IDS.detokenizePlainText(n.params,n.pathTemplate);history.replaceState(t,"","#"+i)}function w(n){function a(){c();o&&(o(),o=null)}var e=n.initialPathTemplate,v=n.initiablePathTemplates,p=n.expectedRouteCount,l=location.hash,s,i;if(l!==""&&(e=l.substring(1),v.indexOf(e)<0)){location.replace(location.pathname);return}h=p;s=history.state;s?t=s:(t={flows:[{routeNumber:1,pathTemplate:e,params:{}}]},window.addEventListener("DOMContentLoaded",y));i=null;window.addEventListener("popstate",function(n){var e,s,o;if(n.state!==null){if(i){setTimeout(function(){i();i=null},0);return}if(e=n.state,e.flows.length<t.flows.length){for(s=t.flows.length-e.flows.length;s>0;s--)f(),t.flows.pop(),ft();o=r().pathTemplate===e.flows[e.flows.length-1].pathTemplate;o||f();t=e;e.flows.length===1&&e.flows[0].routeNumber===1?setTimeout(function(){a();i=function(){o||u()};history.back()},0):(i=function(){a();o||u()},history.back())}else f(),t=e,u()}})}function b(n){var u=n.route,t=__rest(n,["route"]);if(a(u.pathTemplate).register(t,u.priority),h--,h===0)i[r().pathTemplate].onEnter(r().params);t.onRouteAvailabilityChange&&t.onRouteAvailabilityChange.forEach(function(n){a(n.pathTemplate).registerAvailabilityChangeCallback(n.callback)})}function k(n){e.push(n)}function d(n){var t=e.indexOf(n);t>=0&&e.splice(t,1)}function g(n,t){t===void 0&&(t={});s(n);l(t);f();v(function(i){return{routeNumber:i.routeNumber+1,pathTemplate:n,params:t}});c();u()}function nt(n,i){i===void 0&&(i={});s(n);l(i);ut();t.flows.push({routeNumber:1,pathTemplate:n,params:i});c();u()}function tt(n,t){t===void 0&&(t={});s(n);l(t);f();v(function(i){return{routeNumber:i.routeNumber,pathTemplate:n,params:t}});y();u()}function it(n){if(n===void 0&&(n=1),t.flows.length===1)throw new Error("Can't end non-nested flow");var i=t.flows.slice(-n).reduce(function(n,t){return n+t.routeNumber},0);return history.go(-i),new Promise(function(n){o=n})}function rt(n){s(n);i[n].onRouteAvailabilityChange()}function u(){var n=r(),t=n.pathTemplate,u=n.params,f=i[t];f.onEnter(u);e.forEach(function(n){n(t,u)})}function ut(){var n=i[r().pathTemplate];n.onStartNestedFlow()}function ft(){var n=i[r().pathTemplate];n.onEndNestedFlow()}function f(){var n=i[r().pathTemplate];n.onLeave()}function s(n){if(!i[n])throw new Error(n+" is not a known route");}function l(n){if(n&&Object.getPrototypeOf(n)!==Object.prototype)throw new Error("Route parameters must be passed as an object literal so they can be saved to history");}var p=function(){function n(n){var t=this;this.variableNames=[];this.handlers=[];this.availabilityChangeCallbacks=[];this.available=!1;n.replace(/\{(\w+?)\}/g,function(n,i){return t.variableNames.push(i),"([^/]*)"})}return n.prototype.register=function(n,t){var i=this.handlers.findIndex(function(n){return n.priority>t});if(this.handlers.splice(i!==-1?i:this.handlers.length,0,__assign(__assign({},n),{priority:t})),!this.available)this.onRouteAvailabilityChange(!n.routeAvailable||n.routeAvailable())},n.prototype.registerAvailabilityChangeCallback=function(n){this.availabilityChangeCallbacks.push(n);n(this.available)},n.prototype.onEnter=function(n){for(var r,t=0,i=this.handlers;t<i.length;t++)if(r=i[t],r.onEnter&&r.onEnter(n)===!1)break},n.prototype.onStartNestedFlow=function(){this.handlers.forEach(function(n){n.onStartNestedFlow&&n.onStartNestedFlow()})},n.prototype.onEndNestedFlow=function(){this.handlers.forEach(function(n){n.onEndNestedFlow&&n.onEndNestedFlow()})},n.prototype.onLeave=function(){this.handlers.forEach(function(n){n.onLeave&&n.onLeave()})},n.prototype.onRouteAvailabilityChange=function(n){var t=this;n===undefined&&(n=this.handlers.some(function(n){return!n.routeAvailable||n.routeAvailable()}));this.available!==n&&(this.available=n,this.availabilityChangeCallbacks.forEach(function(n){n(t.available)}))},n}(),i={},e=[],h,t,o=null;n.init=w;n.register=b;n.addRouteChangeHandler=k;n.removeRouteChangeHandler=d;n.goTo=g;n.startNestedFlow=nt;n.replaceCurrentRoute=tt;n.endNestedFlow=it;n.notifyRouteAvailabilityChange=rt})(Router||(Router={}));