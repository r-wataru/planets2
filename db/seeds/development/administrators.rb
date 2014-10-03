admin = Administrator.new(login_name: "vip", password: "password", super_user: true)
admin.setting_password = true
admin.save