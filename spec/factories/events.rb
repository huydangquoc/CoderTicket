# Getting Started
# https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md

FactoryGirl.define do
  factory :event do
    name "Event Name"
    extended_html_description <<-DESC
    <p style="text-align:center"><span style="font-size:20px">VIỆT NAM THỬ THÁCH CHIẾN THẮNG 2016</span></p>
    <p style="text-align:center"><span style="font-size:20px">Giải đua xe đạp địa hình 11-13/03/2016</span></p>
    <p style="text-align:center"><span style="font-size:16px"><span style="font-family:arial,helvetica,sans-serif">Việt Nam Th</span>ử Thách Chiến Thắng là giải đua xe đạp địa hình được tổ chức như một sự tri ân, và cũng nhằm thỏa mãn lòng đam mẹ của những người yêu xe đạp địa hình nói chung, cũng như cho những ai đóng góp vào môn thể thao đua xe đạp tại thành phố Hồ Chí Minh. Cuộc đua diễn ra ở thành phố cao nguyên hùng vĩ Đà Lạt, với độ cao 1,500m (4,900ft) so với mặt nước biển. Đến với đường đua này ngoài việc tận hưởng cảnh quan nơi đây, bạn còn có cơ hội biết thêm về nền văn hóa của thành phố này. </span></p>
    <p style="text-align:center"><span style="font-size:16px">Hãy cùng với hơn 350 tay đua trải nghiệm 04 lộ trình đua tuyệt vời diễn ra trong 03 ngày tại Đà Lạt và bạn sẽ có những kỉ niệm không bao giờ quên!</span></p>
    <p style="text-align:center"><span style="font-size:16px">Để biết thêm thông tin chi tiết và tạo thêm hứng khởi cho cuộc đua 2016, vui lòng ghé thăm trang web</span></p>
    <p style="text-align:center"><span style="font-size:16px"><strong><span style="background-color:transparent; color:rgb(0, 0, 0)">www.vietnamvictorychallenge.com. </span></strong></span></p>
    DESC
    starts_at { Time.now }

    trait :upcoming do
      # Action View Date Helpers
      # http://api.rubyonrails.org/classes/ActionView/Helpers/DateHelper.html
      starts_at { 2.days.from_now }
    end

    trait :past_event do
      starts_at { 2.days.ago }
    end
  end
end
