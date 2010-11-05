module ApplicationHelper
  def paragraphs(text)
    output = Array.new
    text.split("\n").each do |p|
      output.push "<p>#{p}</p>" if p.scan(/^[\s]+$/) == []
    end
  end
end
