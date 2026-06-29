module LoginHelpers
  def login_user(user, password: "password")
    post login_path, params: {
      user: {
        email: user.email,
        password: password
      }
    }
  end
end
