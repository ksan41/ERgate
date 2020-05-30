package com.kh.ergate.meetingroom.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MeetingroomPeople {

	private int mtrmReservNo;		// 예약 번호
	private String empId;			// 아이디
	private String empName;			// 사원이름
	
	
}
