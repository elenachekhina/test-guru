# frozen_string_literal: true

class TestsResult < ApplicationRecord
  belongs_to :test
  belongs_to :user
end
