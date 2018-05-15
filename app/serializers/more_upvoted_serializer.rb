class MoreUpvotedSerializer < ActiveModel::Serializer
    #attributes :oppinions_count
    attributes :id
    attributes :name
    attributes :yes_votes
    attributes :not_votes
end
