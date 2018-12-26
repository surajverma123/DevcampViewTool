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

    def source_helper(layout_name)
        if session[:source]
            greeting = "Thank you for visiting us form #{session[:source]} and we are on #{layout_name} layout"
            content_tag(:p, greeting, class: "source-greeting")
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
