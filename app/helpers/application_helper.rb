class Array
    def swap!(a,b)
         self[a], self[b] = self[b], self[a]
    self
    end
end

module ApplicationHelper
  
  def full_title(page_title)
    base_title = "Internet Bank"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def load_rates
    doc = Nokogiri::XML(open("https://www.mtbank.by/currxml.php"))
    @information = doc.xpath("//currency")
    @cr_from = []
    @cr_to = []
     @information.each do |inf|
       @cr_from.push(inf.xpath("code").text)
       @cr_to.push(inf.xpath("codeTo").text)
     end
     @cr_to.swap!(0,3)
  end
 
end
