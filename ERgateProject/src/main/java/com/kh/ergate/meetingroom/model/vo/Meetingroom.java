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
public class Meetingroom{


	private String mtrmCode; 			//회의실 코드
	private String mtrmName; 		//회의실 이름
	private String mtrmLocation;	//회의실위치
	private int mtrmCapacity;		//수용인원수
	private String mtrmEnrollDate;  //회의실 등록 날짜
	private String mtrmImage;		//회의실 이미지
	private String mtrmStatus;		//회의실노출여부
}
