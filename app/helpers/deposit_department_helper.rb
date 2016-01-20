module DepositDepartmentHelper
  def DepositDepartment.deposit_type_belongs(deposit_type)
    belongs = false
    Deposit.all.each do |deposit|
      if deposit.deposit_type_id == deposit_type.id
        belongs = true
        break
      end
    end
    belongs
  end
end
