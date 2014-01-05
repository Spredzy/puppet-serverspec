require 'spec_helper'

describe 'serverspec' do

    it 'installs the serverspec gem' do
      should contain_package('serverspec')
    end

    it 'installs the rubygem-rake package' do
      should contain_package('rubygem-rake')
    end


end
