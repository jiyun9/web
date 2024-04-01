package dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RoomDTO {
	private String ro_name, ro_price, checkin, checkout, ro_info, bu_email, ro_picture;
	private int ro_num, ro_count;
	private int picture_count;
	private MultipartFile ropicture[];
}
