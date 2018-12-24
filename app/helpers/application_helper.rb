module ApplicationHelper
    def login_helper
        if current_user.is_a?(GuestUser)
            (link_to 'Log In', new_user_session_path) +
            "<br />".html_safe +
        (link_to 'Registration', new_user_registration_path)
      else
        link_to "Log Out", destroy_user_session_path, method: :delete
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
end
