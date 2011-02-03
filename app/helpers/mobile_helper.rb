module MobileHelper
  def image_to_base64(path)
    file = File.open(PUBLIC_FOLDER + path, "r")
    mime_type = "image/jpeg"
    base64_content = ActiveSupport::Base64.encode64(file.read).gsub("\n", "")
    "data:#{mime_type};base64,#{base64_content}"
  end
  
  
  def embed_css(path)
    file = File.open(PUBLIC_FOLDER + path, "r")
    '<style type="text/css" media="screen">' + file.read + "</style>"
  end
  
  
end