module SplashPayments
  module Resource
    class Txns < Base

      include Mixin::DeleteDisabled
      def initialize(params)
        super(params, ATTRS)

        @resource_name = 'txns'
      end

      ATTRS = [:id, :created, :modified, :creator, :modifier, 
               :ipCreated, :ipModified, :merchant, :token, :fortxn, 
               :fromtxn, :batch, :subscription, :type, :expiration, 
               :currency, :authDate, :authCode, :captured, :settled, 
               :settledCurrency, :settledTotal, :allowPartial, :order, :description, 
               :descriptor, :terminal, :terminalCapability, :entryMode, :origin, 
               :tax, :total, :cashback, :authorization, :approved, 
               :cvv, :swiped, :emv, :signature, :unattended, 
               :clientIp, :first, :middle, :last, :company, 
               :email, :address1, :address2, :city, :state, 
               :zip, :country, :phone, :status, :refunded, 
               :reserved, :misused, :imported, :inactive, :frozen, 
               :discount, :shipping, :duty, :pin, :traceNumber, 
               :cvvStatus, :unauthReason, :fee, :fundingCurrency, :authentication, 
               :authenticationId, :cofType, :copyReason, :payment]

      attr_accessor *ATTRS

    end
  end
end
