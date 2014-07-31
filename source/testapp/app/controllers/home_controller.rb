class HomeController < ApplicationController
  def charge
    @success_trans = Charge.success
    @failed_trans = Charge.failed
    @dispute_trans = Charge.disputed
  end
end
