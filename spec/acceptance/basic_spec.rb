# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'java_artisanal class' do
  context 'without parameters' do
    let(:pp) do
      <<-PP
      class{ 'java_artisanal': }
      PP
    end

    it_behaves_like 'an idempotent resource'

    %w[
      java
      javac
      javaws
      jar
      jconsole
      jstack
    ].each do |cmd|
      describe file("/usr/bin/#{cmd}") do
        it { is_expected.to be_symlink }
        it { is_expected.to be_linked_to "/etc/alternatives/#{cmd}" }
        it { is_expected.to be_owned_by 'root' }
        it { is_expected.to be_grouped_into 'root' }
      end
    end

    describe package('jdk1.8') do
      it { is_expected.to be_installed }
    end
  end
end
