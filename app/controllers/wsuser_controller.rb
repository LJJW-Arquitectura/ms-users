class WsuserController < ApplicationController
  soap_service namespace: 'urn::WashOutUser', camelize_wsdl: :lower
  soap_action "soapFind",
              :args   => { :id => :integer},
              :return => {:user => [{:username => :string, :email => :string}]}
  def soapFind
    @user = User.find(params[:id])
    render :soap => {:user => [{:username => @user.username, :email => @user.email}]}
  end
end
