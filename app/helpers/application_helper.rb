module ApplicationHelper

    def gravatar_for(user)
        if user.email
            email_address = user.email.downcase
            hash = Digest::MD5.hexdigest(email_address)
            gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=180"
            image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto d-block")
        end
    end
    


end
 