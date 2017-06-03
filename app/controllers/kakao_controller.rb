require 'faker'
# Faker::Config.locale = 'ko'
class KakaoController < ApplicationController
  #defult 화면
  def keyboard
    @home ={type: :text}
    # {type: :buttons, buttons: %w(블로그)}
    render json: @home 
  end
  #응답 부분
  # def message
  #   content=params[:content].to_s
  #   if content=="블로그"
  #     @answer = {message: { text: "원노 블로그로 갑시다",photo: {url: "http://cfile25.uf.tistory.com/image/2660D04D59291C7C1B01EA", width: 640, height: 640},message_button: {label: "블로그로 가기", url: "http://wantknow.tistory.com/"}}}
  #   else
  #     lan=(1..15).to_a.sample(1).pop.to_i
  #     @answer = {message: {message_button: {label: Gif.find(lan).title, url: Gif.find(lan).link}}}
  #   end
  #   render json: @answer
  # end
  def letter_message
    content = params[:content].to_s
    content=content.split(':')
    user=User.find_or_create_by(username: content.first)
    Letter.create(content: content.last, user_id: user.id)
    @answer ={message: {text: "메세지가 잘 전달되었습니다. 자신의 것을 확인하고 싶다면 밑에 링크로 접속하세요!",message_button: {label: "편지 확인 하러 가기" , url: "https://protected-inlet-51666.herokuapp.com/index"}}}
    render json: @answer
  end
  def index
    #@user=User.find(params[:id])
    @users=User.all
  end
  def search
    @users= User.where(['username LIKE ?', "%#{params[:user]}%"])
  end
  def users
    # if params[:id]=="blank"
    #   @user=User.where(['username LIKE ?', "%#{params[:user]}%"])
    #   if @user.count==0
    #     @users=User.all
    #     render 'index'
    #   else
    #     @user=@user.take
    #     render 'users'
    #   end
    # else
      @user=User.find(params[:id])
    # end
  end
end
