class HomesController < ApplicationController

  def qr

    # qrcode = RQRCode::QRCode.new("https://twitter.com/jerome_ilu")
    qrcode = RQRCode::QRCode.new("http://evolve.casewise.com")

    # With default options specified explicitly
    # render image: @qr.as_png
    png = qrcode.as_png(
      resize_gte_to: false,
      resize_exactly_to: false,
      fill: 'white',
      color: 'black',
      size: 240,
      border_modules: 0,
      module_px_size: 0,
      file: nil # path to write
    )
    response.headers['Content-Type'] = 'image/png'
    response.headers['Content-Disposition'] = 'inline'
    render :text => png
  end
end
