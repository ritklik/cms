require 'spec_helper'

describe Kaminari::Helpers::Tag do
  subject { Kaminari::Helpers::Tag.new(template, options) }

  let(:template) { double(params: {}) }
  let(:scope)    { double(url_for: '') }

  describe '#page_url_for' do
    context "with scope option given" do
      let(:options) { {scope: scope} }

      it "calls url_for on that url proxy scope." do
        template.should_not_receive(:url_for)
        scope.should_receive(:url_for)
        subject.page_url_for(1)
      end
    end

    context "with no scope option given" do
      let(:options) { {} }

      it "calls url_for on the template." do
        template.should_receive(:url_for)
        scope.should_not_receive(:url_for)
        subject.page_url_for(1)
      end
    end
  end
end
