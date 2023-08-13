require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
      context '新規登録できるとき(正常系)' do
        it 'nicknameとemail、passwordとpassword_confirmation、family_name_zenkaku、first_name_zenkaku、family_name_kana、first_name_kana,birth_dateが存在すれば登録できる' do
          expect(@user).to be_valid
        end
      end

      context '新規登録できないとき(異常系)' do
        it 'nicknameが空では登録できない' do
      @user.nickname = ''  # nicknameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

        it 'emailが空では登録できない' do
      @user.email = ''  # emailの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'passwordが空では登録できない' do
        @user.password = ''  # passwordの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
        end

        
        it 'Date_of_birthが空では登録できない' do
          @user.date_of_birth = ''  # Date_of_birthの値を空にする
          @user.valid?
          expect(@user.errors.full_messages).to include "Date of birth can't be blank"
        end

     
    it 'first_name_zenkakuが空では登録できない' do 
      @user.first_name_zenkaku = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name zenkaku can't be blank"
    end


    it 'family_name_zenkakuが空では登録できない' do
      @user.family_name_zenkaku = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name zenkaku can't be blank"
     end

    
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end


    it 'family_name_kanaが空では登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana can't be blank"
    end


        it 'passwordとpassword_confirmationが不一致では登録できない' do
          @user.password = '123456'
          @user.password_confirmation = '1234567'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      

      it 'passwordが5文字以下は登録できない' do
        @user.password = 'abc00'  # 6文字未満のパスワードを設定
        @user.password_confirmation = 'abc00'  # パスワード確認を同じに設定
        @user.valid?  # バリデーションチェックを実行
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

    it 'family_name_kanaが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.family_name_zenkaku = 'ｱｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name zenkaku is invalid. Input full-width characters"
    end

    

    it 'first_name_kanaが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.first_name_zenkaku = 'ｱｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name zenkaku is invalid. Input full-width characters"
    end



    it 'first_name_kanaが全角（カタカナ）でないと登録できない' do
      @user.first_name_kana = 'ｱｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid. Input full-width katakana characters"
    end

   
    it 'family_name_kanaが全角（カタカナ）でないと登録できない' do
      @user.family_name_kana = 'ｱｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana is invalid. Input full-width katakana characters"
    end

    
    it 'passwordが数字のみでは登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid. Include both letters and numbers"
    end

    it '全角文字を含むパスワードでは登録できない' do
      @user.password = 'Ａ太郎'
      @user.password_confirmation = 'Ａ太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid. Include both letters and numbers"
    end


  end
end
end
