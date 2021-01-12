# frozen_string_literal: true

class MeuImportJob < ImportJob
  def initialize
    super
    @name = "MEU"
  end
end
