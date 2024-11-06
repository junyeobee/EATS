<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.store-menu,
.store-menu * {
  box-sizing: border-box;
}
.store-menu {
  background: #ffffff;
  height: 1024px;
  position: relative;
  overflow: hidden;
}
.div {
  color: #000000;
  text-align: left;
  font-family: "NotoSansKr-Bold", sans-serif;
  font-size: 24px;
  font-weight: 700;
  position: absolute;
  left: 251px;
  top: 111px;
}
._1-2-3-4-5-6-7 {
  color: #474758;
  text-align: left;
  font-family: "NotoSansKr-Medium", sans-serif;
  font-size: 16px;
  font-weight: 500;
  position: absolute;
  left: 748px;
  top: 966px;
}
.frame-165 {
  display: flex;
  flex-direction: row;
  gap: 18px;
  align-items: center;
  justify-content: flex-start;
  position: absolute;
  left: 252px;
  top: 199px;
}
.button {
  display: flex;
  flex-direction: column;
  gap: 0px;
  align-items: flex-start;
  justify-content: flex-start;
  flex-shrink: 0;
  width: 75px;
  position: relative;
}
.button2 {
  background: var(--storeblue2, #349ffb);
  border-radius: 100px;
  display: flex;
  flex-direction: column;
  gap: 8px;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  position: relative;
  overflow: hidden;
}
.state-layer {
  padding: 10px 24px 10px 24px;
  display: flex;
  flex-direction: row;
  gap: 8px;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  position: relative;
}
.label-text {
  color: var(--schemes-on-primary, #ffffff);
  text-align: center;
  font-family: var(--label-large-font, "Roboto-Medium", sans-serif);
  font-size: 14px;
  line-height: var(--label-large-line-height, 20px);
  letter-spacing: var(--label-large-tracking, 0.1px);
  font-weight: 500;
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
}
.group-1 {
  background: var(--schemes-on-primary, #ffffff);
  border-radius: 20px;
  border-style: solid;
  border-color: var(--storeblue2, #349ffb);
  border-width: 2px;
  padding: 10px 20px 10px 20px;
  display: flex;
  flex-direction: row;
  gap: 10px;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  position: relative;
}
.div2 {
  color: var(--storeblue2, #349ffb);
  text-align: left;
  font-family: "NotoSansKr-Medium", sans-serif;
  font-size: 14px;
  font-weight: 500;
  position: relative;
}
.group-188 {
  background: var(--schemes-on-primary, #ffffff);
  border-radius: 20px;
  border-style: solid;
  border-color: var(--storeblue2, #349ffb);
  border-width: 2px;
  padding: 10px 20px 10px 20px;
  display: flex;
  flex-direction: row;
  gap: 10px;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  position: relative;
}
.group-168 {
  width: 95px;
  height: 40px;
  position: absolute;
  left: 1249px;
  top: 254px;
}
.bt-confirm {
  width: 100%;
  height: 100%;
  position: absolute;
  right: 0%;
  left: 0%;
  bottom: 0%;
  top: 0%;
}
.rectangle-358 {
  background: var(--schemes-on-background, #1d1b20);
  border-radius: 6px;
  width: 100%;
  height: 100%;
  position: absolute;
  right: 0%;
  left: 0%;
  bottom: 0%;
  top: 0%;
}
.group-196 {
  position: absolute;
  inset: 0;
}
.div3 {
  color: #ffffff;
  text-align: center;
  font-family: "NotoSansKr-Medium", sans-serif;
  font-size: 14px;
  line-height: 20px;
  letter-spacing: 0.1px;
  font-weight: 500;
  position: absolute;
  right: 23.09%;
  left: 22.17%;
  width: 54.74%;
  bottom: 25%;
  top: 25%;
  height: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
}
.group-1882 {
  width: 95px;
  height: 40px;
  position: absolute;
  left: 1249px;
  top: 254px;
}
.frame-163 {
  display: flex;
  flex-direction: row;
  gap: 110px;
  align-items: center;
  justify-content: flex-start;
  position: absolute;
  left: 298px;
  top: 338px;
}
.group-190 {
  flex-shrink: 0;
  width: 179.21px;
  height: 275.67px;
  position: static;
}
.div4 {
  color: #000000;
  text-align: left;
  font-family: "NotoSansKr-Black", sans-serif;
  font-size: 16px;
  font-weight: 900;
  position: absolute;
  left: 0px;
  top: 201.42px;
}
.div5 {
  color: #000000;
  text-align: left;
  font-family: "NotoSansKr-Regular", sans-serif;
  font-size: 14px;
  font-weight: 400;
  position: absolute;
  left: 0px;
  top: 228.54px;
}
._20-000 {
  color: #000000;
  text-align: left;
  font-family: "NotoSansKr-Black", sans-serif;
  font-size: 14px;
  font-weight: 900;
  position: absolute;
  left: 0px;
  top: 255.67px;
}
.frame-17 {
  background: #349ffb;
  border-radius: 7.51px;
  padding: 10.17px 22.04px 10.17px 22.04px;
  display: flex;
  flex-direction: row;
  gap: 5.65px;
  align-items: center;
  justify-content: center;
  width: 55.08px;
  height: 25.87px;
  position: absolute;
  left: 115.1px;
  top: 6.89px;
}
.div6 {
  color: #ffffff;
  text-align: left;
  font-family: "NotoSansKr-Black", sans-serif;
  font-size: 11.684218406677246px;
  font-weight: 900;
  position: relative;
}
.mask-group {
  width: 178px;
  height: 185px;
  position: absolute;
  left: 1.21px;
  top: 0px;
  overflow: visible;
}
.group-191 {
  flex-shrink: 0;
  width: 179.21px;
  height: 275.67px;
  position: static;
}
.group-6 {
  width: 178px;
  height: 185px;
  position: static;
}
.rectangle-16 {
  background: #d9d9d9;
  border-radius: 12.52px;
  width: 178px;
  height: 185px;
  position: absolute;
  left: 290.43px;
  top: 0px;
}
.img {
  color: #000000;
  text-align: left;
  font-family: "NotoSansKr-Bold", sans-serif;
  font-size: 22.60405158996582px;
  font-weight: 700;
  position: absolute;
  left: 360.4px;
  top: 80.34px;
  width: 44.22px;
  height: 24.31px;
}
.div7 {
  color: #000000;
  text-align: left;
  font-family: "NotoSansKr-Black", sans-serif;
  font-size: 16px;
  font-weight: 900;
  position: absolute;
  left: 289.21px;
  top: 201.42px;
}
.div8 {
  color: #000000;
  text-align: left;
  font-family: "NotoSansKr-Regular", sans-serif;
  font-size: 14px;
  font-weight: 400;
  position: absolute;
  left: 289.21px;
  top: 228.54px;
}
._20-0002 {
  color: #000000;
  text-align: left;
  font-family: "NotoSansKr-Black", sans-serif;
  font-size: 14px;
  font-weight: 900;
  position: absolute;
  left: 289.21px;
  top: 255.67px;
}
.group-192 {
  flex-shrink: 0;
  width: 179.21px;
  height: 275.67px;
  position: static;
}
.group-7 {
  width: 178px;
  height: 185px;
  position: static;
}
.rectangle-162 {
  background: #d9d9d9;
  border-radius: 12.52px;
  width: 178px;
  height: 185px;
  position: absolute;
  left: 579.64px;
  top: 0px;
}
.img2 {
  color: #000000;
  text-align: left;
  font-family: "NotoSansKr-Bold", sans-serif;
  font-size: 22.60405158996582px;
  font-weight: 700;
  position: absolute;
  left: 649.61px;
  top: 80.34px;
  width: 44.22px;
  height: 24.31px;
}
.div9 {
  color: #000000;
  text-align: left;
  font-family: "NotoSansKr-Black", sans-serif;
  font-size: 16px;
  font-weight: 900;
  position: absolute;
  left: 578.43px;
  top: 201.42px;
}
.div10 {
  color: #000000;
  text-align: left;
  font-family: "NotoSansKr-Regular", sans-serif;
  font-size: 14px;
  font-weight: 400;
  position: absolute;
  left: 578.43px;
  top: 228.54px;
}
._20-0003 {
  color: #000000;
  text-align: left;
  font-family: "NotoSansKr-Black", sans-serif;
  font-size: 14px;
  font-weight: 900;
  position: absolute;
  left: 578.43px;
  top: 255.67px;
}
.group-193 {
  flex-shrink: 0;
  width: 179.21px;
  height: 275.67px;
  position: static;
}
.group-8 {
  width: 178px;
  height: 185px;
  position: static;
}
.rectangle-163 {
  background: #d9d9d9;
  border-radius: 12.52px;
  width: 178px;
  height: 185px;
  position: absolute;
  left: 868.85px;
  top: 0px;
}
.img3 {
  color: #000000;
  text-align: left;
  font-family: "NotoSansKr-Bold", sans-serif;
  font-size: 22.60405158996582px;
  font-weight: 700;
  position: absolute;
  left: 938.83px;
  top: 80.34px;
  width: 44.22px;
  height: 24.31px;
}
.div11 {
  color: #000000;
  text-align: left;
  font-family: "NotoSansKr-Black", sans-serif;
  font-size: 16px;
  font-weight: 900;
  position: absolute;
  left: 867.64px;
  top: 201.42px;
}
.div12 {
  color: #000000;
  text-align: left;
  font-family: "NotoSansKr-Regular", sans-serif;
  font-size: 14px;
  font-weight: 400;
  position: absolute;
  left: 867.64px;
  top: 228.54px;
}
._20-0004 {
  color: #000000;
  text-align: left;
  font-family: "NotoSansKr-Black", sans-serif;
  font-size: 14px;
  font-weight: 900;
  position: absolute;
  left: 867.64px;
  top: 255.67px;
}
.frame-20 {
  background: #349ffb;
  border-radius: 7.51px;
  padding: 10.17px 22.04px 10.17px 22.04px;
  display: flex;
  flex-direction: row;
  gap: 5.65px;
  align-items: center;
  justify-content: center;
  width: 55.08px;
  height: 25.87px;
  position: absolute;
  left: 985.79px;
  top: 6.89px;
}
.frame-164 {
  display: flex;
  flex-direction: row;
  gap: 110px;
  align-items: center;
  justify-content: flex-start;
  position: absolute;
  left: 298px;
  top: 647px;
}
.mask-group2 {
  width: 178px;
  height: 185px;
  position: absolute;
  left: 1.21px;
  top: 0px;
  overflow: visible;
}
.admin-lnb {
  position: absolute;
  inset: 0;
}
.rectangle-1 {
  background: var(--color-6, #daf0ff);
  width: 200px;
  height: 1024px;
  position: absolute;
  left: 0px;
  top: 0px;
}
.rectangle-79 {
  background: var(--storeblue2, #349ffb);
  border-radius: 10px;
  width: 200px;
  height: 50px;
  position: absolute;
  left: 0px;
  top: 563px;
}
.line-13 {
  margin-top: -1px;
  border-style: solid;
  border-color: rgba(100, 42, 2, 0.06);
  border-width: 1px 0 0 0;
  width: 200px;
  height: 0px;
  position: absolute;
  left: 0px;
  top: 329.94px;
}
.line-14 {
  margin-top: -1px;
  border-style: solid;
  border-color: rgba(100, 42, 2, 0.06);
  border-width: 1px 0 0 0;
  width: 200px;
  height: 0px;
  position: absolute;
  left: 0px;
  top: 387.86px;
}
.line-15 {
  margin-top: -1px;
  border-style: solid;
  border-color: rgba(100, 42, 2, 0.06);
  border-width: 1px 0 0 0;
  width: 200px;
  height: 0px;
  position: absolute;
  left: 0px;
  top: 445.77px;
}
.line-16 {
  margin-top: -1px;
  border-style: solid;
  border-color: rgba(100, 42, 2, 0.06);
  border-width: 1px 0 0 0;
  width: 200px;
  height: 0px;
  position: absolute;
  left: 0px;
  top: 503.69px;
}
.group-169 {
  width: 200px;
  height: 64.02px;
  position: static;
}
.line-18 {
  margin-top: -1px;
  border-style: solid;
  border-color: rgba(100, 42, 2, 0.06);
  border-width: 1px 0 0 0;
  width: 200px;
  height: 0px;
  position: absolute;
  left: 0px;
  top: 208px;
}
.line-12 {
  margin-top: -1px;
  border-style: solid;
  border-color: rgba(100, 42, 2, 0.06);
  border-width: 1px 0 0 0;
  width: 200px;
  height: 0px;
  position: absolute;
  left: 0px;
  top: 272.02px;
}
.div13 {
  color: #121212;
  text-align: left;
  font-family: "NotoSansKr-Regular", sans-serif;
  font-size: 15px;
  font-weight: 400;
  position: absolute;
  left: 42px;
  top: 228px;
  width: 56px;
  height: 25.48px;
}
.div14 {
  color: #121212;
  text-align: left;
  font-family: "NotoSansKr-Regular", sans-serif;
  font-size: 15px;
  font-weight: 400;
  position: absolute;
  left: 42px;
  top: 285.92px;
  width: 56px;
  height: 25.48px;
}
.div15 {
  color: #121212;
  text-align: left;
  font-family: "NotoSansKr-Regular", sans-serif;
  font-size: 15px;
  font-weight: 400;
  position: absolute;
  left: 42px;
  top: 343.84px;
  width: 56px;
  height: 25.48px;
}
.div16 {
  color: #121212;
  text-align: left;
  font-family: "NotoSansKr-Regular", sans-serif;
  font-size: 15px;
  font-weight: 400;
  position: absolute;
  left: 42px;
  top: 404.07px;
  width: 56px;
  height: 25.48px;
}
.div17 {
  color: #121212;
  text-align: left;
  font-family: "NotoSansKr-Regular", sans-serif;
  font-size: 15px;
  font-weight: 400;
  position: absolute;
  left: 42px;
  top: 460.83px;
  width: 56px;
  height: 25.48px;
}
.div18 {
  color: #121212;
  text-align: left;
  font-family: "NotoSansKr-Regular", sans-serif;
  font-size: 15px;
  font-weight: 400;
  position: absolute;
  left: 42px;
  top: 518.75px;
  width: 56px;
  height: 25.48px;
}
.div19 {
  color: var(--color-9, #f3f3f3);
  text-align: left;
  font-family: "NotoSansKr-Medium", sans-serif;
  font-size: 16px;
  font-weight: 500;
  position: absolute;
  left: 42px;
  top: 576.67px;
  width: 45px;
  height: 26.64px;
}
.group-187 {
  position: absolute;
  inset: 0;
}
.rectangle-77 {
  background: var(--color-6, #daf0ff);
  width: 1440px;
  height: 72px;
  position: absolute;
  left: 0px;
  top: 0px;
}
.group-185 {
  width: 94.16px;
  height: 62px;
  position: static;
}
.clip-path-group {
  width: 94.16px;
  height: 44.68px;
  position: absolute;
  left: 51px;
  top: 7px;
  overflow: visible;
}
.store {
  color: rgba(117, 117, 117, 0.58);
  text-align: left;
  font-family: "NotoSansKr-Black", sans-serif;
  font-size: 16px;
  font-weight: 900;
  position: absolute;
  left: 79px;
  top: 46px;
}
.generic-avatar {
  border-radius: 100px;
  width: 45px;
  height: 45px;
  position: absolute;
  left: 1341px;
  top: 14px;
  overflow: visible;
}
.group-200 {
  width: 193px;
  height: 286px;
  position: static;
}
.rectangle-372 {
  background: rgba(218, 240, 255, 0.53);
  border-radius: 10px;
  width: 193px;
  height: 286px;
  position: absolute;
  left: 291px;
  top: 330px;
}
.group-189 {
  width: 80px;
  height: 40px;
  position: absolute;
  left: 350px;
  top: 447px;
}
.div20 {
  color: #ffffff;
  text-align: center;
  font-family: "NotoSansKr-Medium", sans-serif;
  font-size: 14px;
  line-height: 20px;
  letter-spacing: 0.1px;
  font-weight: 500;
  position: absolute;
  right: 33.75%;
  left: 33.75%;
  width: 32.5%;
  bottom: 25%;
  top: 25%;
  height: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
}
.group-2002 {
  position: absolute;
  inset: 0;
}
.rectangle-3722 {
  border-radius: 10px;
  border-style: solid;
  border-color: #0d99ff;
  border-width: 4px;
  width: 193px;
  height: 286px;
  position: absolute;
  left: 580px;
  top: 331px;
}

</style>
</head>
<body>
<div class="store-menu">
  <div class="div">메뉴 관리</div>
  <div class="_1-2-3-4-5-6-7">1 2 3 4 5 6 7 &gt;</div>
  <div class="frame-165">
    <div class="button">
      <div class="button2">
        <div class="state-layer">
          <div class="label-text">전체</div>
        </div>
      </div>
    </div>
    <div class="group-1">
      <div class="div2">카테고리명</div>
    </div>
    <div class="group-188">
      <div class="div2">카테고리명</div>
    </div>
  </div>
  <div class="group-168">
    <div class="bt-confirm">
      <div class="rectangle-358"></div>
    </div>
    <div class="div3">선택삭제</div>
  </div>
  <div class="group-1882">
    <div class="bt-confirm">
      <div class="rectangle-358"></div>
    </div>
    <div class="div3">선택삭제</div>
  </div>
  <div class="frame-163">
    <div class="group-190">
      <div class="div4">준협이가 좋아하는피자</div>
      <div class="div5">상세설명상세설명상세설명</div>
      <div class="_20-000">20,000원</div>
      <div class="frame-17">
        <div class="div6">선주문</div>
      </div>
      <img class="mask-group" src="mask-group0.svg" />
    </div>
    <div class="group-191">
      <div class="group-6">
        <div class="rectangle-16"></div>
        <div class="img">IMG</div>
      </div>
      <div class="div7">준협이가 좋아하는피자</div>
      <div class="div8">상세설명상세설명상세설명</div>
      <div class="_20-0002">20,000원</div>
    </div>
    <div class="group-192">
      <div class="group-7">
        <div class="rectangle-162"></div>
        <div class="img2">IMG</div>
      </div>
      <div class="div9">준협이가 좋아하는피자</div>
      <div class="div10">상세설명상세설명상세설명</div>
      <div class="_20-0003">20,000원</div>
    </div>
    <div class="group-193">
      <div class="group-8">
        <div class="rectangle-163"></div>
        <div class="img3">IMG</div>
      </div>
      <div class="div11">준협이가 좋아하는피자</div>
      <div class="div12">상세설명상세설명상세설명</div>
      <div class="_20-0004">20,000원</div>
      <div class="frame-20">
        <div class="div6">선주문</div>
      </div>
    </div>
  </div>
  <div class="frame-164">
    <div class="group-190">
      <div class="div4">준협이가 좋아하는피자</div>
      <div class="div5">상세설명상세설명상세설명</div>
      <div class="_20-000">20,000원</div>
      <div class="frame-17">
        <div class="div6">선주문</div>
      </div>
      <img class="mask-group2" src="mask-group1.svg" />
    </div>
    <div class="group-191">
      <div class="group-6">
        <div class="rectangle-16"></div>
        <div class="img">IMG</div>
      </div>
      <div class="div7">준협이가 좋아하는피자</div>
      <div class="div8">상세설명상세설명상세설명</div>
      <div class="_20-0002">20,000원</div>
    </div>
    <div class="group-192">
      <div class="group-7">
        <div class="rectangle-162"></div>
        <div class="img2">IMG</div>
      </div>
      <div class="div9">준협이가 좋아하는피자</div>
      <div class="div10">상세설명상세설명상세설명</div>
      <div class="_20-0003">20,000원</div>
    </div>
    <div class="group-193">
      <div class="group-8">
        <div class="rectangle-163"></div>
        <div class="img3">IMG</div>
      </div>
      <div class="div11">준협이가 좋아하는피자</div>
      <div class="div12">상세설명상세설명상세설명</div>
      <div class="_20-0004">20,000원</div>
      <div class="frame-20">
        <div class="div6">선주문</div>
      </div>
    </div>
  </div>
  <div class="rectangle-1"></div>
  <div class="rectangle-79"></div>
  <div class="line-13"></div>
  <div class="line-14"></div>
  <div class="line-15"></div>
  <div class="line-16"></div>
  <div class="group-169">
    <div class="line-18"></div>
    <div class="line-12"></div>
    <div class="div13">매장관리</div>
  </div>
  <div class="div14">회원관리</div>
  <div class="div15">리뷰관리</div>
  <div class="div16">속성관리</div>
  <div class="div17">검색관리</div>
  <div class="div18">배너관리</div>
  <div class="div19">게시판</div>
  <div class="rectangle-77"></div>
  <div class="group-185">
    <img class="clip-path-group" src="clip-path-group0.svg" />
    <div class="store">store</div>
  </div>
  <img class="generic-avatar" src="generic-avatar0.svg" />
  <div class="group-200">
    <div class="rectangle-372"></div>
    <div class="group-189">
      <div class="bt-confirm">
        <div class="rectangle-358"></div>
      </div>
      <div class="div20">수정</div>
    </div>
  </div>
  <div class="rectangle-3722"></div>
</div>

</body>
</html>