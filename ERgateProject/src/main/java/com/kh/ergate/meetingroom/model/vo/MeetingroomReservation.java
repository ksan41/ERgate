package com.kh.ergate.meetingroom.model.vo;

import java.sql.Date;

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
public class MeetingroomReservation {

	
	private int mtrmReservNo;			// 예약번호
	private String empId;				// 아이디
	private int mtrmCode;				// 회의실코드
	private String mtrmName;			// 회의실이름
	private Date mtrmReservDate;		// 예약일자
	private String mtrmDeptTitle;		// 예약자 부서명
	private String mtrmStartDate;		// 사용 시작일
	private String mtrmStartTime;		// 사용 시작시간
	private String mtrmEndDate;			// 사용 종료일
	private String mtrmEndTime;			// 사용종료시간
	private String mtrmPurpose;			// 사용목적
	private String mtrmReservStatus;
	
	
}
