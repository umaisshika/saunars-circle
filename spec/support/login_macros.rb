module LoginMacros
  def login(user)
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
    expect(page).to have_content 'ログインしました。'
  end

  def logout
    click_link 'ログアウト'
    expect(page).to have_content 'ログアウトしました。'
  end

  def login_admin(admin)
    visit new_admin_session_path
    fill_in 'admin[email]', with: admin.email
    fill_in 'admin[password]', with: admin.password
    click_button 'ログイン'
    expect(page).to have_content 'ログインしました。'
  end
end
