# frozen_string_literal: true

require_relative "spec_helper"

RSpec.describe Frampt do
  it "has a version number" do
    expect(Frampt::VERSION).not_to be nil
  end
end
