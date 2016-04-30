#
# Cookbook Name:: tomcat
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'tomcat::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'installs tomcat' do
      expect { chef_run }.to install_package('tomcat')
    end
    it 'creates server.xml in conf' do
      expect(chef_run).to create_file('/usr/share/tomcat/conf/server.xml').with(
        user:   'tomcat',
        group:  'tomcat'
        )
    end 
    it 'creates server.xml in etc' do
      expect(chef_run).to create_file('/etc/tomcat/server.xml').with(
        user:   'tomcat',
        group:  'tomcat'
        )
    end 
    
    it 'enables a service tomcat action' do
      expect(chef_run).to enable_service('tomcat')
    end
    
    it 'starts a service tomcat action' do
      expect(chef_run).to start_service('tomcat')
    end
    
  end
end
