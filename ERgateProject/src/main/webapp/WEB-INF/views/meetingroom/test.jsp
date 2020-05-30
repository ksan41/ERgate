<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglibs prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.search_btn {
    position: fixed;
    z-index: 2;
    width: 100%;
    height: 78px;
    padding: 0 30px;
    background: #f9f9f9;
    border-bottom: 2px solid #f0f0f0;
}
.contents {
    width: 980px;
    padding: 30px;
}
.tab_resource {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-pack: center;
    justify-content: center;
    padding-bottom: 30px;
}
.resource_layout {
    display: -ms-flexbox;
    display: flex;
}
.table_time {
    border-collapse: separate;
    border-top: 2px solid #8c8c8c;
    border-left: 1px solid #ccc;
}

.table_resource_box {
    overflow: auto;
    width: 980px;
}

.table_resource {
    table-layout: fixed;
    border-collapse: separate;
    border-top: 2px solid #8c8c8c;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}

tr{
    margin: 0;
    padding: 0;
    border: 0;
    font-weight: 400;
    font-size: 12px;
    font-family: NanumSquareR;
    color: #000;
    vertical-align: baseline;
    text-decoration: none;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}
}
</style>
</head>
<body>
	<section class="">
		<section data-v-f796b846="">
			<div class="search_btn" style="top: 118px;">
				<p class="btn_draft">회의실 예약</p>
				<p class="date">
					<span>이전</span> <strong id="btnSearch">2020년 5월 11일 (월)</strong>
				<div class="datepicker_box">
					<div class="datepicker active">
						<div id="r41101059a-73107-r5010-830b-9d87aa4a7109d-wrapper"
							class="date-time-picker">
							<div data-v-74507c40=""
								class="field flex align-center has-value no-label">
								<input data-v-74507c40=""
									id="r41101059a-73107-r5010-830b-9d87aa4a7109d-input"
									placeholder="" type="text" readonly="readonly"
									class="field-input no-clear-button">
								<!---->
								<!---->
							</div>
							<!---->
							<div data-v-6e81f291="" class="datetimepicker flex"
								style="display: none; top: 100%; margin-bottom: 10px;">
								<div data-v-6e81f291=""
									class="datepicker flex flex-direction-column"
									style="width: 260px; max-width: 260px; min-width: 260px; top: 100%; margin-bottom: 10px;">
									<!---->
									<div data-v-6e81f291="" class="pickers-container flex">
										<div data-v-628b1b6b="" data-v-6e81f291=""
											id="r41101059a-73107-r5010-830b-9d87aa4a7109d-picker-container-DatePicker"
											class="datepicker-container flex flex-fixed">
											<!---->
											<div data-v-628b1b6b="" class="calendar lm-w-100">
												<div data-v-628b1b6b=""
													class="datepicker-controls flex align-center justify-content-center">
													<div data-v-628b1b6b="" class="arrow-month h-100">
														<button data-v-628b1b6b="" type="button" tabindex="-1"
															class="datepicker-button datepicker-prev text-center h-100 flex align-center">
															<svg data-v-628b1b6b="" viewBox="0 0 1000 1000">
																<path data-v-628b1b6b=""
																	d="M336.2 274.5l-210.1 210h805.4c13 0 23 10 23 23s-10 23-23 23H126.1l210.1 210.1c11 11 11 21 0 32-5 5-10 7-16 7s-11-2-16-7l-249.1-249c-11-11-11-21 0-32l249.1-249.1c21-21.1 53 10.9 32 32z"></path></svg>
														</button>
													</div>
													<div data-v-628b1b6b=""
														class="datepicker-container-label flex-1 flex justify-content-center">
														<span data-v-628b1b6b=""
															class="h-100 flex align-center flex-1 flex justify-content-right"><button
																data-v-651b7c9a="" data-v-628b1b6b="" tabindex="-1"
																type="button"
																class="custom-button flex align-center justify-content-center date-buttons lm-fs-16 padding-button">
																<span data-v-651b7c9a="" class="custom-button-effect"
																	style="background-color: rgb(1, 183, 176);"></span><span
																	data-v-651b7c9a=""
																	class="custom-button-content flex align-center justify-content-center flex-1"
																	style="color: rgb(1, 183, 176); fill: rgb(1, 183, 176);">
																	5월 </span>
															</button></span><span data-v-628b1b6b=""
															class="h-100 flex align-center flex-1 flex"><button
																data-v-651b7c9a="" data-v-628b1b6b="" tabindex="-1"
																type="button"
																class="custom-button flex align-center justify-content-center date-buttons lm-fs-16 padding-button">
																<span data-v-651b7c9a="" class="custom-button-effect"
																	style="background-color: rgb(1, 183, 176);"></span><span
																	data-v-651b7c9a=""
																	class="custom-button-content flex align-center justify-content-center flex-1"
																	style="color: rgb(1, 183, 176); fill: rgb(1, 183, 176);">
																	2020 </span>
															</button></span>
													</div>
													<div data-v-628b1b6b=""
														class="arrow-month h-100 text-right">
														<button data-v-628b1b6b="" type="button" tabindex="-1"
															class="datepicker-button datepicker-next text-center h-100 flex align-center justify-content-right">
															<svg data-v-628b1b6b="" viewBox="0 0 1000 1000">
																<path data-v-628b1b6b=""
																	d="M694.4 242.4l249.1 249.1c11 11 11 21 0 32L694.4 772.7c-5 5-10 7-16 7s-11-2-16-7c-11-11-11-21 0-32l210.1-210.1H67.1c-13 0-23-10-23-23s10-23 23-23h805.4L662.4 274.5c-21-21.1 11-53.1 32-32.1z"></path></svg>
														</button>
													</div>
												</div>
												<div data-v-a5a27e8c="" data-v-628b1b6b=""
													class="week-days flex">
													<div data-v-a5a27e8c=""
														class="flex-1 text-muted lm-fs-12 flex justify-content-center align-center week-days-container">
														일</div>
													<div data-v-a5a27e8c=""
														class="flex-1 text-muted lm-fs-12 flex justify-content-center align-center week-days-container">
														월</div>
													<div data-v-a5a27e8c=""
														class="flex-1 text-muted lm-fs-12 flex justify-content-center align-center week-days-container">
														화</div>
													<div data-v-a5a27e8c=""
														class="flex-1 text-muted lm-fs-12 flex justify-content-center align-center week-days-container">
														수</div>
													<div data-v-a5a27e8c=""
														class="flex-1 text-muted lm-fs-12 flex justify-content-center align-center week-days-container">
														목</div>
													<div data-v-a5a27e8c=""
														class="flex-1 text-muted lm-fs-12 flex justify-content-center align-center week-days-container">
														금</div>
													<div data-v-a5a27e8c=""
														class="flex-1 text-muted lm-fs-12 flex justify-content-center align-center week-days-container">
														토</div>
												</div>
												<div data-v-628b1b6b="" class="month-container"
													style="height: 250px;">
													<span data-v-628b1b6b=""><div data-v-628b1b6b=""
															class="datepicker-days flex">
															<div data-v-628b1b6b=""
																class="datepicker-day align-center justify-content-center"></div>
															<div data-v-628b1b6b=""
																class="datepicker-day align-center justify-content-center"></div>
															<div data-v-628b1b6b=""
																class="datepicker-day align-center justify-content-center"></div>
															<div data-v-628b1b6b=""
																class="datepicker-day align-center justify-content-center"></div>
															<div data-v-628b1b6b=""
																class="datepicker-day align-center justify-content-center"></div>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 1 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 2 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 3 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 4 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 5 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 6 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 7 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 8 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 9 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 10 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center selected enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 11 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 12 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 13 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 14 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 15 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 16 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 17 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 18 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 19 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 20 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 21 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 22 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 23 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 24 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 25 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 26 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 27 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<span data-v-628b1b6b="" class="datepicker-today"></span><span
																	data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 28 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 29 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 30 </span>
															</button>
															<button data-v-628b1b6b="" type="button" tabindex="-1"
																class="datepicker-day flex align-center justify-content-center enable">
																<!---->
																<span data-v-628b1b6b="" class="datepicker-day-effect"
																	style="background-color: rgb(1, 183, 176);"></span>
																<!---->
																<span data-v-628b1b6b=""
																	class="datepicker-day-text flex-1"> 31 </span>
															</button>
															<div data-v-628b1b6b=""
																class="datepicker-day flex align-center justify-content-center"></div>
															<div data-v-628b1b6b=""
																class="datepicker-day flex align-center justify-content-center"></div>
															<div data-v-628b1b6b=""
																class="datepicker-day flex align-center justify-content-center"></div>
															<div data-v-628b1b6b=""
																class="datepicker-day flex align-center justify-content-center"></div>
															<div data-v-628b1b6b=""
																class="datepicker-day flex align-center justify-content-center"></div>
															<div data-v-628b1b6b=""
																class="datepicker-day flex align-center justify-content-center"></div>
														</div></span>
												</div>
												<!---->
											</div>
										</div>
										<!---->
									</div>
									<!---->
								</div>
							</div>
						</div>
					</div>
				</div>
				<span>다음</span>
				</p>
				<p class="btn_reservation">
					<button>나의 예약현황</button>
				</p>
			</div>
			<article class="contents" style="margin-top: 198px;">
				<ul class="tab_resource">
					<li class="active"><button>5층</button></li>
					<li class=""><button>6층</button></li>
				</ul>
				<p class="resource_guide active">*오른쪽으로 스크롤해서 남은 #회의실을 확인하세요.</p>
				<div class="resource_layout">
					<div>
						<table class="table_time">
							<tr>
								<th>시간</th>
							</tr>
						
						</table>
					</div>
					<div class="table_resource_box">
						<table class="table_resource">
							<tr>
								<th><p></p></th>
								<th><p></p></th>
								<th><p></p></th>
								<th><p></p></th>
								<th><p></p></th>
								<th><p></p></th>
							</tr>
							<tr id="00:00" class="">
								<td name="000006"><p></p></td>
								<td name="000007"><p></p></td>
								<td name="000008"><p></p></td>
								<td name="000009"><p></p></td>
								<td name="roomc0"><p></p></td>
								<td name="roomd0"><p></p></td>
							</tr>
							
						</table>
					</div>
				</div>
			</article>
			<!---->
		</section>
	</section>
</body>
</html>