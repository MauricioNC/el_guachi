require "rqrcode"

module ReservationsHelper
  def print_qr(reservation)
    qrcode = RQRCode::QRCode.new(reservation.qr_token)

    qrcode.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 11,
      standalone: true,
      use_path: true
    ).html_safe
  end
end
