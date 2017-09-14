// ==UserScript==
// @name         Page AutoReload
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  Reload specific pages after 1 minute
// @author       Jay Hilden
// @match        https://apollo.amazon.com/r/environments/*/capacity
// @match        https://carnaval.amazon.com/v1/unifiedSearch.do*
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    var refreshEveryNSeconds = 60;
    var Runner = {
        countdown: function(secondsToReload) {
            //setTimeout (location.reload, timeout);
            //debugger;
            document.title = "reloading in " + secondsToReload;
            if (secondsToReload === 0) {
                location.reload();
            }
            else {
                setTimeout(function() { 
                    Runner.countdown(--secondsToReload);
                }, 1000);
            }
        }
    };
    Runner.countdown(refreshEveryNSeconds);
})();
