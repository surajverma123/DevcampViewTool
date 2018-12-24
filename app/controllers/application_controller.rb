class ApplicationController < ActionController::Base
    include DeviseWhitelist
    include SetSource
    include CurrentUserConcern
    include DefaultPageContent

    before_action :set_copyright

    def set_copyright
        @copyright = DevcampViewToolToolVerma::Renderer.copyright "Suraj Verma", "All right reservered"
    end
end
