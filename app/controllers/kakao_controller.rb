class KakaoController < ApplicationController
  #defult 화면
  def keyboard
    @home = {type: :buttons, buttons: %w(블로그)}
    render json: @home 
  end
  #응답 부분
  def message
    @answer = {message: { text: params[:content].to_s+" 갑시다",photo: {url: "http://cfile25.uf.tistory.com/image/2660D04D59291C7C1B01EA", width: 640, height: 640},message_button: {label: "블로그로 가기", url: "http://wantknow.tistory.com/"}}, keyboard: {type: :buttons , buttons: %w(블로그)}}
    render json: @answer
  end
end
