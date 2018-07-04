class Collaborator < ApplicationRecord
  attr_accessor :temp_user_email 
  belongs_to :user
  belongs_to :wiki
end
