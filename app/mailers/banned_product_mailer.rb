class BannedProductMailer < ApplicationMailer
  def send_mail(name:, email_id:)
    attachments['banned_products.txt'] = { mime_type: 'text/plain', content: name.join("\n") }
    mail(to: email_id, subject: "Banned Products Alert: #{ENV['RAILS_ENV']}") do |format|
     body = "PFA #{result.count} banned/unbanned products"
     format.text { render plain: body }
   end
 end