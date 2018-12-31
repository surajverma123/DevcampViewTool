module ApplicationHelper
    def login_helper style
        if current_user.is_a?(GuestUser)
            (link_to 'Log In', new_user_session_path, class: style) +
            " ".html_safe +
        (link_to 'Registration', new_user_registration_path, class: style)
      else
        link_to "Log Out", destroy_user_session_path, method: :delete, class: style
      end
    end

    def source_helper(style)
        if session[:source]
            greeting = "Thank you for visiting us form #{session[:source]}. Please fell free to #{link_to 'contact me', contact_path} if you'd like to work together?" 
            content_tag(:div, greeting.html_safe, class: style)
        end
    end

    def copyright_generator
        DevcampViewToolToolVerma::Renderer.copyright "Suraj Verma", "All right reservered"
    end

    def nav_items
        [
            {
                url: root_path,
                title: "Home"
            },
            {
                url: about_me_path,
                title: "About me"
            },
            {
                url: contact_path,
                title: "Contact"
            },
            {
                url: blogs_path,
                title: "Blog"
            },
            {
                url: portfolios_path,
                title: "Portfolios"
            },
            {
                url: tech_news_path,
                title: "Tech news"
            },
            {
                url: topics_path,
                title: "Topics"
            },
        ]
    end

    def skills_utilized_option
        [
            {value: 10},
            {value: 20},
            {value: 30},
            {value: 40},
            {value: 50},
            {value: 60},
            {value: 70},
            {value: 80},
            {value: 90},
            {value: 100},
        ]
    end

    def nav_helper style, tag_type
        nav_links = ''
        nav_items.each do |item|
            nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active?item[:url]}'> #{item[:title]} </a></#{tag_type}>"
        end
        nav_links.html_safe
    end
end

def active? path
    "active" if current_page? path
end

def alerts
    alert = (flash[:notice] || flash[:error] || flash[:alert])
    if alert
        alert_generator alert
    end
end

def alert_generator msg
    js add_gritter(msg, title: "Pay attention!", sticky: false)
end