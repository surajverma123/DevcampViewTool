module PortfoliosHelper
    def image_generatore(height:, width:)
        "https://placehold.it/#{height}x#{width}"
    end

    def portfolio_img img, type
        if img.model.main_image? || img.model.thumb_image?
            img.url
        elsif type == "thumb"
            image_generatore(height: '350', width: '200')
        elsif type == "main"
            image_generatore(height: '600', width: '400')
        end

    end
end