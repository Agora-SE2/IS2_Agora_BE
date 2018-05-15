class MoreCommentedSerializer < ActiveModel::Serializer
    attributes :opinions_count
    attributes :id
    attributes :name
    attributes :yes_votes
    attributes :not_votes
end
