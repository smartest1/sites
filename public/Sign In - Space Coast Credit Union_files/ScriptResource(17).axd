﻿var FocusTrap=function(){function n(t,i){if(this.container=t,n.focusTraps.push(this)===1&&(document.addEventListener("focus",n.handleFocus,!0),document.addEventListener("keydown",n.handleKeyDown,!0)),i)this.activeElement=i,this.activeElement.focus();else if(t.contains(document.activeElement))this.activeElement=document.activeElement;else{var r=this.getFocusableElements();this.activeElement=r[0];this.activeElement.focus()}}return n.prototype.remove=function(){n.focusTraps.length===1&&(document.removeEventListener("focus",n.handleFocus,!0),document.removeEventListener("keydown",n.handleKeyDown,!0));n.focusTraps.pop()},n.prototype.getFocusableElements=function(){function t(n){return n.getClientRects().length>0&&n.tabIndex>=0}var n=Array.prototype.filter.call(this.container.querySelectorAll("[tabindex], a[href], button:not(:disabled), input:not(:disabled), select:not(:disabled), textarea:not(:disabled)"),t);if(n.length>0)return n;throw new Error("No focusable elements were found in the container.");},n.handleFocus=function(t){var i=n.focusTraps[n.focusTraps.length-1];i.container.contains(t.target)?i.activeElement=t.target:i.activeElement.focus()},n.handleKeyDown=function(t){if(t.key==="Tab"||t.keyCode===9){var r=n.focusTraps[n.focusTraps.length-1],i=r.getFocusableElements();t.target!==i[i.length-1]||t.shiftKey?t.target===i[0]&&t.shiftKey&&(i[i.length-1].focus(),t.preventDefault()):(i[0].focus(),t.preventDefault())}},n.focusTraps=[],n}();