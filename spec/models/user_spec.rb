require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'それぞれ正しい値ならば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかない時' do
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it '確認用パスワードがパスワードと一致しなければ登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'teamnameが空だと登録できない' do
        @user.teamname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Teamname can't be blank")
      end
      it 'teamnameが重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.teamname = @user.teamname
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Teamname has already been taken')
      end
      it 'toprank_idが空だと登録できない' do
        @user.toprank_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Toprank can't be blank")
      end
      it 'jgrank_idが空だと登録できない' do
        @user.jgrank_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Jgrank can't be blank")
      end
      it 'midrank_idが空だと登録できない' do
        @user.midrank_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Midrank can't be blank")
      end
      it 'suprank_idが空だと登録できない' do
        @user.suprank_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Suprank can't be blank")
      end
      it 'botrank_idが空だと登録できない' do
        @user.botrank_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Botrank can't be blank")
      end
      it 'weekday_idが空だと登録できない' do
        @user.weekday_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Weekday can't be blank")
      end
      it 'stime_idが空だと登録できない' do
        @user.stime_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Stime can't be blank")
      end
      it 'detailが空だと登録できない' do
        @user.detail = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Detail can't be blank")
      end
    end
  end
end
