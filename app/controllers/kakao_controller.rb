class KakaoController < ApplicationController
  #defult 화면
  def keyboard
    @home = {type: :buttons, buttons: %w(김성준 김은식 임규산)}
    render json: @home 
  end
  #응답 부분
  def message
    @answer = {message: { text: params[:content].to_s+" 안녕", message_button: {label: "블로그로 가기", url: "http://wantknow.tistory.com/"}}, keyboard: {type: :buttons , buttons: %w(김성준 김은식 임규산)}}
    render json: @answer
  end
end
