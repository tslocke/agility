// User extensions can be added here.
//
// Keep this file to avoid  mystifying "Invalid Character" error in IE

// http://codelevy.com/articles/2007/11/05/selenium-and-ajax-requests

if(Selenium.prototype) {
    /**
 * Registers with the Prototype library to record when an Ajax request finishes.
 * Call this after the most recent page load but before any Ajax requests.
 *
 * Once you've called this for a page, you should call waitForAjaxRequest at
 * every opportunity, to make sure the AjaxRequestFinished flag is consumed.
 */
    Selenium.prototype.doWatchAjaxRequests = function() {
        selenium.browserbot.getCurrentWindow().Ajax.Responders.register({
            onComplete: function() { Selenium.AjaxRequestFinished = true}
        });
    }
    /**
 * If you've set up with watchAjaxRequests, this routine will wait until
 * an Ajax request has finished and then return.
 */
    Selenium.prototype.doWaitForAjaxRequest = function(timeout) {
        return Selenium.decorateFunctionWithTimeout(function() {
            if (Selenium.AjaxRequestFinished) {
                Selenium.AjaxRequestFinished = false;
                return true;
            }
            return false;
        }, timeout);
    }
    Selenium.AjaxRequestFinished = false;


    Selenium.prototype.doWatchJQueryAjax = function() {
        var window = selenium.browserbot.getCurrentWindow();
        window.jQuery(window).bind("ajaxComplete", function() { 
            Selenium.AjaxRequestFinished = true
        });
    }
}
