module V1
    class  UpdatePersonalProfileApi < Grape::API
        resource :update_personal_profile do
            params do
                requires :account, type: String
                requires :height, type: Integer
                requires :weight, type: Integer
                requires :age, type: Integer
                requires :gender, type: String
            end
            
            
            post do  #get personal info.
                info_ident = InfoIdentification.new()
                user = User.find_by(account: params[:account])
                if (user.nil?)   #testify the existance of the account
                    return {
                        context: '帳戶不存在'
                    }
                else  #personal info. delivery
                    user.update!(height: params[:height],weight: params[:weight],age: params[:age],gender: params[:gender])
                    return {
                        height: info_ident.height_testify(user.height),
                        weight: info_ident.weight_testify(user.weight),
                        age:    info_ident.age_testify(user.age),
                        name:   user.name,
                        gender: user.gender
                    }
                end
            end
        end
    end
end