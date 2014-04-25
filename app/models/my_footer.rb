class MyFooter < ActiveAdmin::Component
  def build
    super(id: "footer")
    para "Copyright #{Date.today.year} #{ link_to("MDRyT", "http://www.agrobolivia.gob.bo") } - #{ link_to("OAP", "http://observatorio.agrobolivia.gob.bo/") }".html_safe
  end
end
