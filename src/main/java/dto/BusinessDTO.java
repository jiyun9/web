package dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BusinessDTO {
	
	private String bu_email, bu_password, bu_tel, bu_name, bu_addr, bu_title, approval, bu_picture;
	private int bu_id, picture_count;
	private String min_price;
	private MultipartFile bupicture[];

}
