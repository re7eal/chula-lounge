json.array!(@trade_messages) do |trade_message|
  json.extract! trade_message, :content, :user_id, :trade_id
  json.url trade_message_url(trade_message, format: :json)
end
