package dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewDTO {
	private int rev_num, ro_num;
	private String m_email, content, regdate, score, content_reply, report, ro_name;
}
