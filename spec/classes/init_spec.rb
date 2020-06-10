# frozen_string_literal: true

require 'spec_helper'

describe 'java_artisanal' do
  describe 'without any parameters' do
    it { is_expected.to compile.with_all_deps }

    it { is_expected.to contain_yum__install('jdk1.8') }

    %w[
      java
      javac
      javaws
      jar
      jconsole
      jstack
    ].each do |cmd|
      it do
        dest = "/usr/java/jdk1.8.0_202-amd64/bin/#{cmd}"
        is_expected.to contain_alternative_entry(dest).with(
          ensure: 'present',
          priority: 1000,
        )
      end
    end
  end
end
