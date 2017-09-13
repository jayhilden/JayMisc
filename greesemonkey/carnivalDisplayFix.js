// ==UserScript==
// @name         Carnival Display Fix
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  Make everything fit on 1 page
// @author       Jay Hilden
// @match        https://carnaval.amazon.com/v1/viewObject.do?*
// @grant        none
// ==/UserScript==

(function() {
    //fix the problem that the page is too wide
    $('.nonwrapping').each(function() {
        $(this).removeClass('nonwrapping');
    });

    //allow everything to wrap
    $('.simple_rule').each(function() {
        $(this).css({"white-space": "unset"});
    });

    //put newlines after each rule so they are readable
    $('span .operator').each(function() {
        $(this).after("<br/>");
    });
})();
