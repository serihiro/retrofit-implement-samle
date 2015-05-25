class TodoSerializer < ActiveModel::Serializer
  attributes :id, :todo, :done
end
