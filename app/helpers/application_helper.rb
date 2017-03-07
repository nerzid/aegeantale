module ApplicationHelper

def easy_emoji(content)
  content.to_str
      .gsub(':)', ':smiley:')
      .gsub(';D', ':joy:')
      .gsub(':D', ':smile:')
      .gsub(';)', ':wink:')
      .gsub(':(', ':cry:')
      .gsub(':@', ':rage:')
      .gsub('<3', ':heart:')
      .gsub('B)', ':sunglasses:')
      .gsub(':P', ':stuck_out_tongue_winking_eye:')
      .gsub(':p', ':stuck_out_tongue_winking_eye:')
      .gsub(':o', ':scream:')
      .gsub(':O', ':scream:')
      .gsub(':/', ':confused:')
      .gsub(/:([a-z0-9\+\-_]+):/) do |match|

    if RailsEmoji.name.include?($1)
      '<img alt="' + $1 + '" height="20" src="' + asset_path("emoji/#{$1}.png") + '" style="vertical-align:middle" width="20" />'
    else
      match
    end
  end.html_safe if content.present?
end

end
