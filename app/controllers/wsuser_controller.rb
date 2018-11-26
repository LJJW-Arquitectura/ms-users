class WsuserController < ApplicationController
  soap_service namespace: 'urn::WashOutUser', camelize_wsdl: :lower
  soap_action "soapFind",
              :args   => { :id => :integer},
              :return => :user
  def soapFind
    @user = Users.find(params[:id])
    render :soap => @user
  end
end
