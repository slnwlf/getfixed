module ApplicationHelper

def flash_messages(opts = {})
  flash.each do |msg_type, message|
    concat(content_tag(:div, message, class: "alert #{flash_type.to_sym(msg_type)} fade in") do 
            concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
            concat content_tag(:i, nil, class: "glyphicon glyphicon-#{bootstrap_icon_for(type)}")
            concat message 
          end)
  end
end
 
  nil
end

