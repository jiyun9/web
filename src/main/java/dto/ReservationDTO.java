package dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReservationDTO {
	private int re_num,ro_num;
	private String m_email, bu_title, ro_name, checkin_date, checkout_date,
					status, payment, price, regdate, m_tel, re_people;
}