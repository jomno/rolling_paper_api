class KakaoController < ApplicationController
  #defult 화면
  def keyboard
    @home ={type: :text}
    # {type: :buttons, buttons: %w(블로그)}
    render json: @home 
  end
  #응답 부분
  def message
    content=params[:content].to_s
    if content=="블로그"
      @answer = {message: { text: "원노 블로그로 갑시다",photo: {url: "http://cfile25.uf.tistory.com/image/2660D04D59291C7C1B01EA", width: 640, height: 640},message_button: {label: "블로그로 가기", url: "http://wantknow.tistory.com/"}}}
    else
      lan=(1..15).to_a.sample(1).pop.to_i
      @answer = {message: {message_button: {label: Gif.find(lan).title, url: Gif.find(lan).link}}}
    end
    render json: @answer
  end
end
