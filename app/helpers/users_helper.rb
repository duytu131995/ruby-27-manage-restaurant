module UsersHelper
  def gender val
    val == "man" ? t(".man") : t(".women")
  end

  def active val
    val == "active" ? t(".active") : t(".unactive")
  end
end
