require 'aws-sdk-ses';

class AuthMailer < ApplicationMailer
  def send (email, code, is_signup)
    puts 'AuthMailer, send'
    charset = 'UTF-8'

    ses = Aws::SES::Client.new(
      region: ENV['REGION'],
      access_key_id: ENV['ACCESS_KEY_ID'],
      secret_access_key: ENV['SECRET_ACCESS_KEY']
    );

    sender = 'verify@debook.me'
    button_text = is_signup ? '회원가입하기' : '로그인하기';
    redirect_url = "#{ENV['CLIENT_BASE_URL']}/v1/auth/check?code=#{code}";
    email_title = is_signup ? '회원가입' : '로그인';

    begin
      ses.send_email({
        destination: {
          to_addresses: [email]
        },
        source: sender,
        message: {
          subject: {
            charset: charset,
            data: email_title
          },
          body: {
            html: {
              charset: charset,
              data: "<div style='width: 600px; height: 400px;
              border: 1px solid #e6e6e6; 
              border-radius: 12px; '>
        
              <h1 style='width: fit-content;display: block; margin: 0 auto; margin-top: 20px;'>Debook</h1>
              
              <div style='text-align: center; margin-top: 20px; width: 600px;'>
                <span style='color: gray'><strong>안녕하세요!</strong> 혹시 본인이 보낸 요청이 아니라면,</br> 이 메일을 무시해주세요</span>
              </div>
          
              <a href=\"#{redirect_url}\" style='
                display: block;
                width: 600px;
                text-align: center;
                font-size: 1rem;
                padding: 1rem 0;
                background: #009AFE;
                color: whitesmoke;
                font-weight: bold;
                cursor: pointer;
                border-radius: 12px;
                margin-top: 20px;
                text-decoration: none;
              '>#{button_text}</a>
        
              <div style='margin-top: 20px; text-align: center;'>
                <p style='margin-top: 20px;'>위 버튼이 눌리지 않으면 <a href='#{redirect_url}'>여기</a>를 클릭해주세요 </p>
                <p>이 링크는 한시간동안 유효합니다</p>
              </div>
            </div>"
            }
          }
        }
      })
      rescue => error
        raise error; 
      end
  end
end