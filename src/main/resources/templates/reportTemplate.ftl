<!DOCTYPE html>
<#include "/common/head.ftl">
<style>
    /* General Styling */
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }

    .text-center {
        background: linear-gradient(to right, #ff0000, #cc0000);
        color: #fff;
        padding: 6px;
        text-align: left;
    }

    .container {
        width: 100%;
        margin-right: auto;
        margin-left: auto;
    }

    .mt-5, .my-4, .mt-4, .mb-3 {
        margin-top: 3rem;  /* Adjust these values as needed */
    }
    .mb-3, .my-4 {
        margin-bottom: 1rem;
    }

    /* Table Styling */
    .custom-table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 1rem;
    }

    .custom-table, .custom-table th, .custom-table td {
        border: 1px solid #dee2e6;
        padding: 8px;
        text-align: center;
        background-color: #ffffff;  /* Set all cells to white background */
    }

    .custom-table th {
        background-color: #343a40;
        color: white;
        border-color: #454d55;
    }

    .custom-table tbody tr:hover {
        background-color: #f2f2f2;  /* Optional: Hover effect with light grey color */
    }

    .custom-table tbody tr:hover {
        background-color: #5e5858;
    }
    .red-text {
        color: red;
    }
    .page-break {
        display: block;
        clear: both;
        page-break-after: always;
    }
    .firstpage {
        background: url('/Users/thetmyatnoe/IdeaProjects/inspector/src/main/resources/static/images/report_bg.jpeg') no-repeat center center fixed;
        background-size: cover;
        height: 100%;
        width: 100%;
        position: relative;
        text-align: right;
    }
    .text-container {
        padding-right: 20px;   }
    /* Table details styling */
    .table-details {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 1rem;
    }

    .table-details th, .table-details td {
        padding: 8px;
        text-align: left;
        vertical-align: top;
    }

    .table-details .left-col {
        background-color: #f2f2f2; /* Light grey background */
        font-weight: bold; /* Bold text */
    }

    .table-details .right-col {
        background-color: #ffffff; /* White background */
    }


</style>

<body>
<div class="firstpage">
    <p><br><br><br></p>
    <div class="text-container">
        <#if waitingApart.apartName??>
            <p><b>아파트명  : ${waitingApart.apartName}.</b></p>
        <#else>
            <p><b>아파트명 정보가 없습니다.</b></p>
        </#if>

        <#if waitingApart.customer_name??>
            <p><b>고객명   : ${waitingApart.customer_name} 님</b></p>
        <#else>
            <p><b>고객명 정보가 없습니다.</b></p>
        </#if>
    </div>
    <p><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br></p>

</div>

<h3 class="text-center my-4">법규 안내</h3>
<h3 class="mt-4 mb-3">하자담보 책임기간</h3>
<table class="custom-table">
    <thead>
    <tr>
        <th scope="col">년수</th>
        <th scope="col">내용</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>2년</td>
        <td>마감공사(타일, 단열, 옥내가구), 잡공사(주방가구), 목공사(구조체, 바탕체) 건축공사(균열, 누수, 결로, 백화)</td>
    </tr>
    <tr>
        <td>3년</td>
        <td>창호공사(창문틀, 문짝, 창호철물), 옥외급수, 냉난방 환기, 공기조화, 설비, 위생 관련 공사 전기 및 전력설비공사, 급/배수 및 위생, 가스설비공사, 소방설비공사
            정보통신공사, 조경공사</td>
    </tr>
    <tr>
        <td>5년</td>
        <td>대지조성공사, 철근콘크리트공사, 철골공사, 조적공사, 지붕공사, 방수공사</td>
    </tr>
    <tr>
        <td>10년</td>
        <td>내력구조부별 및 지반공사</td>
    </tr>
    </tbody>
</table>
<p>※ 하자보수에 대한 법적 기준으로 참고해주세요</p>
<div class="page-break"></div>

<h3 class="text-center my-4">사전 점검 결과 보고서</h3>
<div id="reportContainer" class="container mt-5">

    <!-- Radon Eye Data -->
    <h3 class="mt-4 mb-3"><b>1. 라돈 점검(RADON EYE)</b></h3>
    <table class="custom-table">
        <thead>
        <tr>
            <th scope="col">No.</th>
            <th scope="col">항목</th>
            <th scope="col">정상</th>
            <th scope="col">기준치 초과</th>
            <th scope="col">Pci/L</th>
        </tr>
        </thead>
        <tbody>
        <#assign rowNumber = 0>
        <#list updatedAparts as updatedApart>
            <#if updatedApart.ladonRoom?? && updatedApart.ladonRoom?trim != "" && updatedApart.ladonRoom != "-" && updatedApart.ladonPcl?? && updatedApart.ladonPcl?trim != "" && updatedApart.ladonPcl != "-">
                <#assign rowNumber = rowNumber + 1>
                <tr>
                    <td>${rowNumber}</td>
                    <td>${updatedApart.ladonRoom}</td>
                    <td><input type="checkbox" <#if (updatedApart.ladonPcl?number <= 1.3)>checked</#if> disabled></td>
                    <td><input type="checkbox" <#if (updatedApart.ladonPcl?number > 1.3)>checked</#if> disabled></td>
                    <td>${updatedApart.ladonPcl} Pci/L</td>
                </tr>
            </#if>
        </#list>
        </tbody>
    </table>
    <div class="radon-info">
        <p>※ Pci/L 기준치<br>
            - 1.3Pci/L 일반 가정집 실내환경 기준치<br>
            - 2.7Pci/L WHO 다중 이용시설 실내 공기질 기준치<br>
            - 4.0Pci/L 우리나라 다중 이용시설 실내 공기질 기준치(우리집 하자 기준치)</p>
        <p>※ Bq/m³ 기준치<br>
            - 48.00 Bq/m³ 일반 가정집 실내환경 기준치<br>
            - 100.00 Bq/m³ WHO 다중 이용시설 실내 공기질 기준치<br>
            <span class="red-text">-148.00 Bq/m³ 우리나라 다중 이용시설 실내 공기질 기준치(우리집 하자 기준치)</span></p>
        <p>※ 라돈이란?<br>
            - 라돈은 무색무취의 자연방사능 물질로 세계보건기구(WHO)에서 1급 발암물질로 규정하는 흡연 다 음으로 폐암을 발생시키는 주요 원인으로 규정 하고 있습니다.
        </p>
    </div>

    <!-- Formaldehyde Data -->
    <h3 class="mt-4 mb-3"><b>2. 포름알데히드</b></h3>
    <table class="custom-table">
        <thead>
        <tr>
            <th scope="col">No.</th>
            <th scope="col">항목</th>
            <th scope="col">정상</th>
            <th scope="col">기준치 초과</th>
            <th scope="col">HCHO</th>
        </tr>
        </thead>
        <tbody>
        <#assign rowNumber = 0>
        <#list updatedAparts as updatedApart>
            <#if updatedApart.formalRoom?? && updatedApart.formalRoom?trim != "" && updatedApart.formalRoom?trim != "-" && updatedApart.formalPpm?? && updatedApart.formalPpm?trim != "" && updatedApart.formalPpm?trim != "-">
                <#assign rowNumber = rowNumber + 1>
                <tr>
                    <td>${rowNumber}</td>
                    <td>${updatedApart.formalRoom}</td>
                    <td><input type="checkbox" <#if (updatedApart.formalPpm?number <= 0.01)>checked</#if> disabled></td>
                    <td><input type="checkbox" <#if (updatedApart.formalPpm?number > 0.01)>checked</#if> disabled></td>
                    <td>${updatedApart.formalPpm} ppm</td>
                </tr>
            </#if>
        </#list>
        </tbody>
    </table>
    <div class="formal-info">
        <p>※ HCHO(포름알데히드) 기준치<br>
            - 0.01ppm 정상<br>
            - 0.08ppm 우리나라 다중 이용시설 실내 공기질 기준치(12.01.01) & WHO 기준<br>
            <span class="red-text">- 0.16ppm 우리나라 신축 공동 주택 권고 기준치</span><br>
            - 0.50ppm 독의 자극이 시작되는 최저치 산업위생학회 헝용농도(공장등의 최고치)</p>
    </div>
    <div class="page-break"></div>


    <!-- Thermal Camera Data -->
    <h3 class="mt-4 mb-3"><b>3. 열화상카메라 점검</b></h3>
    <table class="custom-table">
        <thead>
        <tr>
            <th scope="col">No.</th>
            <th scope="col">항목</th>
            <th scope="col">하자</th>
        </tr>
        </thead>
        <tbody>
        <#assign rowNumber = 0>
        <#list updatedAparts as updatedApart>
            <#if updatedApart.thermalRoom?? && updatedApart.thermalRoom?trim != "" && updatedApart.thermalRoom?trim != "-" && updatedApart.thermalStatus?? && updatedApart.thermalStatus?trim != "" && updatedApart.thermalStatus?trim != "-">
                <#assign rowNumber = rowNumber + 1>
                <tr>
                    <td>${rowNumber}</td>
                    <td>${updatedApart.thermalRoom}</td>
                    <td>
                        <input type="checkbox" <#if updatedApart.thermalStatus?contains("곰팡이")>checked</#if> disabled> 곰팡이
                        <input type="checkbox" <#if updatedApart.thermalStatus?contains("결로")>checked</#if> disabled> 결로
                        <input type="checkbox" <#if updatedApart.thermalStatus?contains("단열재 누락")>checked</#if> disabled> 단열재 누락
                        <input type="checkbox" <#if updatedApart.thermalStatus?contains("누수")>checked</#if> disabled> 누수
                    </td>
                    <td><input type="checkbox" <#if updatedApart.thermalStatus?contains("정상")>checked</#if> disabled> 정상</td>

                </tr>
            </#if>
        </#list>
        </tbody>

    </table>

    <!-- Pipeline Data -->
    <h3 class="mt-4 mb-3"><b>4. 배관점검</b></h3>
    <table class="custom-table">
        <thead>
        <tr>
            <th scope="col">No.</th>
            <th scope="col">항목</th>
            <th scope="col">하자</th>
        </tr>
        </thead>
        <tbody>
        <#assign rowNumber = 0>
        <#list updatedAparts as updatedApart>
            <#if updatedApart.pipeRoom?? && updatedApart.pipeRoom?trim != "" && updatedApart.pipeRoom?trim != "-" && updatedApart.pipeStatus?? && updatedApart.pipeStatus?trim != "" && updatedApart.pipeStatus?trim != "-">
                <#assign rowNumber = rowNumber + 1>
                <tr>
                    <td>${rowNumber}</td>
                    <td>${updatedApart.pipeRoom}</td>
                    <td>
                        <input type="checkbox" <#if updatedApart.pipeStatus?contains("파손")>checked</#if> disabled> 파손
                        <input type="checkbox" <#if updatedApart.pipeStatus?contains("폐자재")>checked</#if> disabled> 폐자재
                        <input type="checkbox" <#if updatedApart.pipeStatus?contains("배관 막힘")>checked</#if> disabled> 배관 막힘
                    </td>
                    <td>
                        <input type="checkbox" <#if updatedApart.pipeStatus?contains("정상")>checked</#if> disabled> 정상
                    </td>
                </tr>
            </#if>
        </#list>
        </tbody>
    </table>

    <!-- Bathroom Data -->
    <h3 class="mt-4 mb-3"><b>5. 욕실 및 발코니 바닥 타일 배수 역물매 점검</b></h3>
    <table class="custom-table">
        <thead>
        <tr>
            <th scope="col">No.</th>
            <th scope="col">항목</th>
            <th scope="col">정상</th>
            <th scope="col">하자</th>
            <th scope="col">세부내용(하자내용)</th>
        </tr>
        </thead>
        <tbody>
        <#assign rowNumber = 0>
        <#list updatedAparts as updatedApart>
            <#if updatedApart.bathRoom?? && updatedApart.bathRoom?trim != "" && updatedApart.bathRoom?trim != "-" && updatedApart.bathStatus?? && updatedApart.bathStatus?trim != "" && updatedApart.bathStatus?trim != "-" && updatedApart.bathContent?? && updatedApart.bathContent?trim != "">
                <#assign rowNumber = rowNumber + 1>
                <tr>
                    <td>${rowNumber}</td>
                    <td>${updatedApart.bathRoom}</td>
                    <td><input type="checkbox" <#if updatedApart.bathStatus == "정상">checked</#if> disabled></td>
                    <td><input type="checkbox" <#if updatedApart.bathStatus == "하자">checked</#if> disabled></td>
                    <td>${updatedApart.bathContent}</td>
                </tr>
            </#if>
        </#list>
        </tbody>
    </table>
    <div class="page-break"></div>

    <!-- Final Inspect Data -->
    <h3 class="mt-4 mb-3"><b>6.  마감재 점검</b></h3>
    <table class="custom-table">
        <thead>
        <tr>
            <th scope="col">Image 1</th>
            <th scope="col">Image 2</th>
            <th scope="col">Details</th>
        </tr>
        </thead>
        <tbody>
        <#assign rowNumber = 0>
        <#list updatedAparts as updatedApart>
            <#if updatedApart.finalRoom?? && updatedApart.finalRoom?trim != "" && updatedApart.finalRoom?trim != "-">
                <#assign rowNumber = rowNumber + 1>
                <tr>
                    <!-- Image 1 Column -->
                    <#if updatedApart.finalImage1Base64?? && updatedApart.finalImage1Base64 != "">
                        <td><img src="data:image/jpeg;base64,${updatedApart.finalImage1Base64}" alt="Image 1" style="width:200px; height:150px; transform: rotate(90deg);"></td>
                    <#else>
                        <td>No Image</td>
                    </#if>

                    <!-- Image 2 Column -->
                    <#if updatedApart.finalImage2Base64?? && updatedApart.finalImage2Base64 != "">
                        <td><img src="data:image/jpeg;base64,${updatedApart.finalImage2Base64}" alt="Image 2" style="width:200px; height:150px; transform: rotate(90deg);"></td>
                    <#else>
                        <td>No Image</td>
                    </#if>

                    <!-- Details Column -->
                    <!-- Details Column -->
                    <td>
                        <table class="table-details">
                            <tr>
                                <td class="left-col">No.</td>
                                <td class="right-col">${rowNumber}</td>
                            </tr>
                            <tr>
                                <td class="left-col">점검 위치</td>
                                <td class="right-col">${updatedApart.finalRoom}</td>
                            </tr>
                            <tr>
                                <td class="left-col">점검 종류</td>
                                <td class="right-col">${updatedApart.finalGonzone!'-'} </td>
                            </tr>
                            <tr>
                                <td class="left-col">세부 점검 종류</td>
                                <td class="right-col">${updatedApart.finalSelbu!'-'} </td>
                            </tr>
                            <tr>
                                <td class="left-col">점검 결과 내용</td>
                                <td class="right-col">${updatedApart.finalHaza!'-'} </td>
                            </tr>
                            <tr>
                                <td class="left-col">비고</td>
                                <td class="right-col">${updatedApart.finalBgo!'-'} </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </#if>
        </#list>
        </tbody>
    </table>

</div>
<#include "/common/js.ftl">
<script src="/page/index.js"></script>
</body>
</html>