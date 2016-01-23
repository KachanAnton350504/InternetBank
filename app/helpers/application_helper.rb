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
    @doc = Nokogiri::XML(open("https://www.mtbank.by/currxml.php"))
    @gg = 20
  end

  def exchange_purchase(form, to)
    information = @doc.xpath("//currency")
    information.each do |inf|
      currency_form = inf.xpath("code").text
      currency_to = inf.xpath("codeTo").text
      if currency_form == form && currency_to == to
        @purchase = inf.xpath("purchase").text
        @sale = inf.xpath("sale").text  
        break
      end
    end
    @purchase
  end
  
  
end
