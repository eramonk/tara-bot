require 'telegram/bot'
token = '1340428402:AAGBUx1MqQ36YndzKb1-lRd3Mbay0Nr14Cg'
Telegram::Bot::Client.run(token) do |bot|
#   bot.listen do |message|
#   case message.text
#   when '/start'
#     question = 'London is a capital of which country?'
#     # See more: https://core.telegram.org/bots/api#replykeyboardmarkup
#     answers =
#       Telegram::Bot::Types::ReplyKeyboardMarkup
#       .new(keyboard: [%w(A B), %w(C D)], one_time_keyboard: true)
#     bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)
#   when '/stop'
#     # See more: https://core.telegram.org/bots/api#replykeyboardremove
#     kb = Telegram::Bot::Types::ReplyKeyboardRemove.new(remove_keyboard: true)
#     bot.api.send_message(chat_id: message.chat.id, text: 'Sorry to see you go :(', reply_markup: kb)
#   end
# end
#   bot.listen do |message|
#   kb = [
#     Telegram::Bot::Types::KeyboardButton.new(text: 'Give me your phone number', request_contact: true),
#     Telegram::Bot::Types::KeyboardButton.new(text: 'Show me your location', request_location: true)
#   ]
#   markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: kb)
#   bot.api.send_message(chat_id: message.chat.id, text: 'Hey!', reply_markup: markup)
# end

bot.listen do |message|
  case message
  when Telegram::Bot::Types::CallbackQuery
    # Here you can handle your callbacks from inline buttons
    if message.data == 'touch'
      bot.api.send_message(chat_id: message.from.id, text: "Don't touch me!")
    end
  when Telegram::Bot::Types::Message
    kb = [
      Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Go to Google', url: 'https://google.com'),
      Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Touch me', callback_data: 'touch'),
      Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Switch to inline', switch_inline_query: 'some text')
    ]
    markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)
    bot.api.send_message(chat_id: message.chat.id, text: 'Make a choice', reply_markup: markup)
  end
end
end
