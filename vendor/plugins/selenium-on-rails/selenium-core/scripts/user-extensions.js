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

    Selenium.prototype.doWatchHide = function() {
        var window = selenium.browserbot.getCurrentWindow();
        window.hjq.bindHideCallback(function() { 
            Selenium.HideRequestFinished = true
        });
    }

    Selenium.prototype.doWaitHide = function(timeout) {
        return Selenium.decorateFunctionWithTimeout(function() {
            if (Selenium.HideRequestFinished) {
                Selenium.HideRequestFinished = false;
                return true;
            }
            return false;
        }, timeout);
    }
    Selenium.HideRequestFinished = false;

    Selenium.prototype.doWatchShow = function() {
        var window = selenium.browserbot.getCurrentWindow();
        window.hjq.bindShowCallback(function() { 
            Selenium.ShowRequestFinished = true
        });
    }

    Selenium.prototype.doWaitShow = function(timeout) {
        return Selenium.decorateFunctionWithTimeout(function() {
            if (Selenium.ShowRequestFinished) {
                Selenium.ShowRequestFinished = false;
                return true;
            }
            return false;
        }, timeout);
    }
    Selenium.ShowRequestFinished = false;
}

/**
 * Finds an input element whose label has text matching the expression supplied. Expressions must
 * begin with "jquery=".
 */
PageBot.prototype.locateElementByJQuery = function(query, inDocument) {
    var q = selenium.browserbot.getCurrentWindow().jQuery(query);
    if(q.length) {
        return q.get(0);
    } 
    
    //We couldn't find it
    throw new SeleniumError("Unable to jQuery '" + query + "'");
};
