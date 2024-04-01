package dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchDTO {
	private int ro_num, ro_count,bu_id;
	private String bu_email,bu_tel,bu_name,bu_addr,bu_title,bu_picture;
	private String ro_name, ro_price, checkin, checkout, ro_info, min_price,
					checkin_date, checkout_date, status, payment, regdate; 
}
