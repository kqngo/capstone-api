# frozen_string_literal: true

class MessageSerializer < ActiveModel::Serializer
  attributes :id, :body, :read, :conversation, :user
  has_one :user

  def conversation
    object.conversation_id
  end

  def user
    object.user_id
  end

  def editable
    scope == object.user
  end
end
