class ApplicationController < ActionController::Base
    def redirect_later(url, msg, delay = 1)
        flash[:redirect_later] = {
            url: url,
            delay: delay,
            msg: msg,
        }
    end
end
