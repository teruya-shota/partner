module Admin::UsersHelper
  def status(aaa)
    if aaa
      '有効'
    else
      '無効'
    end
  end
end
