require 'elephrame'

CowSay = Elephrame::Bots::Reply.new

# the formatting for this looks weird, but it's to
#  make it look nice on masto
Cow = %(
         \\   ^__^
          \\  (oo)_______
             (___)            \)\\/\\
               | |-----------w |
               | |             | | )

def generate_cow(text)
  "\n   #{'_' * text.length}
< #{text} >
   #{'-' * ((text.length * 2) - 3)}" + Cow
end

CowSay.run do |bot, post|
  message = post.content.gsub("@#{bot.username}", '')
  bot.reply_with_mentions(generate_cow(message))
end
