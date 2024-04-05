<div class="modal" id="progressModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title"><i class="ti-plus"></i> 점검내용 계속입력</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body overflow-auto ">
                <div class="card card-outline-success">
                    <div class="card-body mb-0">
                        <i class="ti-home mr-2"></i><h4 class="card-title mb-0" id="progressModalApartName"></h4>
                    </div>
                    <div class="card-body pt-0">
                        <address>
                            <p class="font-weight-bold">주소</p>
                            <p id="progressModalAddress"></p>
                            <p id="progressModalArea"></p>
                        </address>
                        <div class="form-group mb-0">
                            <label for="customerName"><i class="ti-arrow-right mr-1"></i>고객명</label>
                            <input type="text" class="form-control rounded" id="progressModalCustomerName" placeholder="Customer name" disabled />
                        </div>
                        <div class="form-group mb-0">
                            <label for="customerPhone"><i class="ti-arrow-right mr-1"></i>전화번호</label>
                            <input type="text" class="form-control rounded" id="progressModalCusPhone" placeholder="Customer Phone Number" disabled />
                        </div>
                        <div class="form-group mb-0">
                            <label for="email"><i class="ti-arrow-right mr-1"></i>이메일</label>
                            <input type="text" class="form-control rounded" id="progressModalEmail" placeholder="Customer Email" disabled />
                        </div>
                        <div class="form-group mb-0">
                            <label for="inspectorName"><i class="ti-arrow-right mr-1"></i>점검원</label>
                            <input type="text" class="form-control rounded" id="progressModalUsername" placeholder="Inspector name" disabled />
                        </div>
                        <div class="form-group mb-0 mt-2">
                            <div class="card  card-outline-primary">
                                <div class="card-header mb-0">
                                    <h4 class="card-title mb-0">
                                        <i class="ti-settings"></i> 라돈 점검
                                        <button class="btn btn-sm btn-primary ml-1 p-1" id="addProgressLadonBtn" data-toggle="modal" data-target="#addProgressLadonModal"><i class="ti-plus"></i></button>
                                    </h4>
                                </div>
                                <div class="card-body" >
                                    <div class="row" id="progressLadonListDiv">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group mb-0 mt-2">
                            <div class="card  card-outline-primary">
                                <div class="card-header mb-0">
                                    <h4 class="card-title mb-0">
                                        <i class="ti-settings"></i> 포름알데히드
                                        <button class="btn btn-sm btn-primary ml-1 p-1" id="addProgressFormaldehydeBtn" data-toggle="modal" data-target="#addProgressFormaldehydeModal"><i class="ti-plus"></i></button>
                                    </h4>
                                </div>
                                <div class="card-body" >
                                    <div class="row" id="progressFormaldehydeListDiv">

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group mb-0 mt-2">
                            <div class="card  card-outline-primary">
                                <div class="card-header mb-0">
                                    <h4 class="card-title mb-0">
                                        <i class="ti-settings"></i> 열화상카메라 점검
                                        <button class="btn btn-sm btn-primary ml-1 p-1" id="addProgressCameraBtn" data-toggle="modal" data-target="#addProgressCameraModal"><i class="ti-plus"></i></button>
                                    </h4>
                                </div>
                                <div class="card-body" >
                                    <div class="row" id="progressCameraListDiv">

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group mb-0 mt-2">
                            <div class="card  card-outline-primary">
                                <div class="card-header mb-0">
                                    <h4 class="card-title mb-0">
                                        <i class="ti-settings"></i> 배관 점검
                                        <button class="btn btn-sm btn-primary ml-1 p-1" id="addProgressPipeBtn" data-toggle="modal" data-target="#addProgressPipeModal"><i class="ti-plus"></i></button>
                                    </h4>
                                </div>
                                <div class="card-body" >
                                    <div class="row" id="progressPipeListDiv">

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group mb-0 mt-2">
                            <div class="card  card-outline-primary">
                                <div class="card-header mb-0">
                                    <h4 class="card-title mb-0">
                                        <i class="ti-settings"></i> 욕실 및 발코니 바닥 타일 역물매 점검
                                        <button class="btn btn-sm btn-primary ml-1 p-1" id="addProgressBathBtn" data-toggle="modal" data-target="#addProgressBathModal"><i class="ti-plus"></i></button>
                                    </h4>
                                </div>
                                <div class="card-body" >
                                    <div class="row" id="progressBathListDiv"></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group mb-0 mt-2">
                            <div class="card  card-outline-primary">
                                <div class="card-header mb-0">
                                    <h4 class="card-title mb-0">
                                        <i class="ti-settings"></i> 마감재 점검
                                        <button class="btn btn-sm btn-primary ml-1 p-1" id="addProgressFinalBtn" data-toggle="modal" data-target="#addProgressFinalModal"><i class="ti-plus"></i></button>
                                    </h4>
                                </div>
                                <div class="card-body" >
                                    <div class="row" id="progressFinalListDiv"></div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="modal-footer d-inline-block text-center">
                <button type="button" class="btn btn-primary m-0" id="progressModal-ing-btn" data-dismiss="modal">진행중</button>
                <button type="button" class="btn btn-secondary  m-0" id="progressModal-end-btn" data-dismiss="modal">완료</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addProgressLadonModal" aria-hidden="true" aria-labelledby="addLadonModalLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalToggleLabel"><i class="ti-plus"></i> 라돈점검 추가</h5>
            </div>
            <div class="modal-body">
                <div class="form-group mb-0">
                    <label for="progressLadonRoomName"><i class="ti-pencil mr-1"></i>방이름</label>
                    <select class="form-control rounded" id="progressLadonRoomName">
                        <option value="침실 1">침실 1</option>
                        <option value="침실 2">침실 2</option>
                        <option value="화장실 1">화장실 1</option>
                        <option value="화장실 2">화장실 2</option>
                        <option value="주방">주방</option>
                        <option value="현관">현관</option>
                        <option value="거실">거실</option>
                        <option value="다용도실">다용도실</option>
                        <option value="대피 공간">대피 공간</option>
                        <option value="드레스룸">드레스룸</option>
                        <option value="발코니">발코니</option>
                        <option value="베란다">베란다</option>
                        <option value="복도">복도</option>
                        <option value="실외기실">실외기실</option>
                        <option value="안방">안방</option>
                    </select>
                    <button type="button" class="btn pstart-record-icon" data-target="progressLadonRoomName"><i class="bi bi-mic-fill"></i></button>
                    <button type="button" class="btn btn-danger pstop-record-icon" data-target="progressLadonRoomName" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>
                </div>
                <div class="form-group mb-0">
                    <label for="progressLadonPciInput"><i class="ti-pencil mr-1"></i>PCI/L</label>
                    <input type="text" class="form-control rounded" id="progressLadonPciInput" placeholder="Enter pci/L" value=""  />
                    <button type="button" class="btn pstart-record-icon" data-target="progressLadonPciInput"><i class="bi bi-mic-fill"></i></button>
                    <button type="button" class="btn btn-danger pstop-record-icon" data-target="progressLadonPciInput" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>
                </div>
            </div>
            <div class="modal-footer d-inline-block text-center">
                <button type="button" class="btn btn-info m-0" data-dismiss="modal" id="addProgressLadonSaveBtn">추가</button>
                <button type="button" class="btn btn-secondary  m-0" data-dismiss="modal">취소</button>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addProgressFormaldehydeModal" aria-hidden="true" aria-labelledby="addFormaldehydeModalLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalToggleLabel"><i class="ti-plus"></i> 포름알데히드 추가</h5>
            </div>
            <div class="modal-body">
                <div class="form-group mb-0">
                    <label for="progressFormaldehydeRoomName"><i class="ti-pencil mr-1"></i>방이름</label>
                    <select class="form-control rounded" id="progressFormaldehydeRoomName">
                        <option value="거실">거실</option>
                        <option value="화장실 1">화장실 1</option>
                        <option value="화장실 2">화장실 2</option>
                        <option value="침실 1">침실 1</option>
                        <option value="침실 2">침실 2</option>
                        <option value="주방">주방</option>
                        <option value="현관">현관</option>
                        <option value="다용도실">다용도실</option>
                        <option value="대피 공간">대피 공간</option>
                        <option value="드레스룸">드레스룸</option>
                        <option value="발코니">발코니</option>
                        <option value="복도">복도</option>
                        <option value="베란다">베란다</option>
                        <option value="실외기실">실외기실</option>
                        <option value="안방">안방</option>
                    </select>
                    <button type="button" class="btn pstart-record-icon" data-target="progressFormaldehydeRoomName"><i class="bi bi-mic-fill"></i></button>
                    <button type="button" class="btn btn-danger pstop-record-icon" data-target="progressFormaldehydeRoomName" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>
                </div>
                <div class="form-group mb-0">
                    <label for="progressFormaldehydePpmInput"><i class="ti-pencil mr-1"></i>ppm</label>
                    <input type="text" class="form-control rounded" id="progressFormaldehydePpmInput" placeholder="ppm" value=""  />
                    <button type="button" class="btn pstart-record-icon" data-target="progressFormaldehydePpmInput"><i class="bi bi-mic-fill"></i></button>
                    <button type="button" class="btn btn-danger pstop-record-icon" data-target="progressFormaldehydePpmInput" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>
                </div>
            </div>
            <div class="modal-footer d-inline-block text-center">
                <button type="button" class="btn btn-info m-0" data-dismiss="modal" id="addProgressFormaldehydeSaveBtn">추가</button>
                <button type="button" class="btn btn-secondary  m-0" data-dismiss="modal">취소</button>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addProgressCameraModal" aria-hidden="true" aria-labelledby="addCameraModalLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalToggleLabel"><i class="ti-plus"></i> 열화상카메라 점검</h5>
            </div>
            <div class="modal-body">
                <div class="form-group mb-0">
                    <label for="progressCameraRoomName"><i class="ti-pencil mr-1"></i>방이름</label>
                    <select class="form-control rounded" id="progressCameraRoomName">
                        <option value="거실">거실</option>
                        <option value="화장실 1">화장실 1</option>
                        <option value="화장실 2">화장실 2</option>
                        <option value="침실 1">침실 1</option>
                        <option value="침실 2">침실 2</option>
                        <option value="주방">주방</option>
                        <option value="현관">현관</option>
                        <option value="다용도실">다용도실</option>
                        <option value="대피 공간">대피 공간</option>
                        <option value="드레스룸">드레스룸</option>
                        <option value="발코니">발코니</option>
                        <option value="복도">복도</option>
                        <option value="베란다">베란다</option>
                        <option value="실외기실">실외기실</option>
                        <option value="안방">안방</option>
                    </select>
                    <button type="button" class="btn pstart-record-icon" data-target="progressCameraRoomName"><i class="bi bi-mic-fill"></i></button>
                    <button type="button" class="btn btn-danger pstop-record-icon" data-target="progressCameraRoomName" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>
                </div>
                <div class="form-group mb-0">
                    <label for="progressCameraInput"><i class="ti-pencil mr-1"></i>Select</label>
                    <div class="custom-radio">
                        <label><input type="radio" name="progressCameraOption" value="정상"> 정상</label><br>
                        <label><input type="radio" name="progressCameraOption" value="곰팡이"> 곰팡이</label><br>
                        <label><input type="radio" name="progressCameraOption" value="결로"> 결로</label><br>
                        <label><input type="radio" name="progressCameraOption" value="단열재 누락"> 단열재 누락</label><br>
                        <label><input type="radio" name="progressCameraOption" value="누수"> 누수</label>
                    </div>
                    <button type="button" class="btn pstart-record-icon" data-target="progressCameraOption"><i class="bi bi-mic-fill"></i></button>
                    <button type="button" class="btn btn-danger pstop-record-icon" data-target="progressCameraOption" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>
                </div>
            </div>
            <div class="modal-footer d-inline-block text-center">
                <button type="button" class="btn btn-info m-0" data-dismiss="modal" id="addProgressCameraSaveBtn">추가</button>
                <button type="button" class="btn btn-secondary  m-0" data-dismiss="modal">취소</button>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addProgressPipeModal" aria-hidden="true" aria-labelledby="addPipeModalLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalToggleLabel"><i class="ti-plus"></i> 배관 점검</h5>
            </div>
            <div class="modal-body">
                <div class="form-group mb-0">
                    <label for="progressPipeRoomName"><i class="ti-pencil mr-1"></i>방이름</label>
                    <select class="form-control rounded" id="progressPipeRoomName">
                        <option value="거실">거실</option>
                        <option value="화장실 1">화장실 1</option>
                        <option value="화장실 2">화장실 2</option>
                        <option value="침실 1">침실 1</option>
                        <option value="침실 2">침실 2</option>
                        <option value="주방">주방</option>
                        <option value="현관">현관</option>
                        <option value="다용도실">다용도실</option>
                        <option value="대피 공간">대피 공간</option>
                        <option value="드레스룸">드레스룸</option>
                        <option value="발코니">발코니</option>
                        <option value="복도">복도</option>
                        <option value="베란다">베란다</option>
                        <option value="실외기실">실외기실</option>
                        <option value="안방">안방</option>
                    </select>
                    <button type="button" class="btn pstart-record-icon" data-target="progressPipeRoomName"><i class="bi bi-mic-fill"></i></button>
                    <button type="button" class="btn btn-danger pstop-record-icon" data-target="progressPipeRoomName" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>
                </div>
                <div class="form-group mb-0">
                    <label for="progressPipeInput"><i class="ti-pencil mr-1"></i>Select</label>
                    <div class="custom-radio">
                        <label><input type="radio" name="progressPipeOption" value="정상"> 정상</label><br>
                        <label><input type="radio" name="progressPipeOption" value="파손"> 파손</label><br>
                        <label><input type="radio" name="progressPipeOption" value="폐자재"> 폐자재</label><br>
                        <label><input type="radio" name="progressPipeOption" value="배관 막힘"> 배관 막힘</label>
                    </div>
                    <button type="button" class="btn pstart-record-icon" data-target="progressPipeOption"><i class="bi bi-mic-fill"></i></button>
                    <button type="button" class="btn btn-danger pstop-record-icon" data-target="progressPipeOption" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>
                </div>
            </div>
            <div class="modal-footer d-inline-block text-center">
                <button type="button" class="btn btn-info m-0" data-dismiss="modal" id="addProgressPipeSaveBtn">추가</button>
                <button type="button" class="btn btn-secondary  m-0" data-dismiss="modal">취소</button>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addProgressBathModal" aria-hidden="true" aria-labelledby="addBathModalLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalToggleLabel"><i class="ti-plus"></i> 욕실 점검</h5>
            </div>
            <div class="modal-body">
                <div class="form-group mb-0">
                    <label for="progressBathRoomName"><i class="ti-pencil mr-1"></i>위치이름</label>
                    <select class="form-control rounded" id="progressBathRoomName">
                        <option value="거실">거실</option>
                        <option value="화장실 1">화장실 1</option>
                        <option value="화장실 2">화장실 2</option>
                        <option value="침실 1">침실 1</option>
                        <option value="침실 2">침실 2</option>
                        <option value="주방">주방</option>
                        <option value="현관">현관</option>
                        <option value="다용도실">다용도실</option>
                        <option value="대피 공간">대피 공간</option>
                        <option value="드레스룸">드레스룸</option>
                        <option value="발코니">발코니</option>
                        <option value="복도">복도</option>
                        <option value="베란다">베란다</option>
                        <option value="실외기실">실외기실</option>
                        <option value="안방">안방</option>
                    </select>
                    <button type="button" class="btn pstart-record-icon" data-target="progressBathRoomName"><i class="bi bi-mic-fill"></i></button>
                    <button type="button" class="btn btn-danger pstop-record-icon" data-target="progressBathRoomName" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>
                </div>
                <div class="form-group mb-0">
                    <label for="progressBathInput"><i class="ti-pencil mr-1"></i>Check</label>
                    <div class="custom-radio">
                        <label><input type="radio" name="progressBathOption" value="하자"> 하자</label>
                        <label><input type="radio" name="progressBathOption" value="정상"> 정상</label>
                    </div>
                    <button type="button" class="btn pstart-record-icon" data-target="progressBathOption"><i class="bi bi-mic-fill"></i></button>
                    <button type="button" class="btn btn-danger pstop-record-icon" data-target="progressBathOption" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>
                </div>
                <div class="form-group mb-0">
                    <label for="progressBathText"><i class="ti-pencil mr-1"></i>하자내용</label>
                    <input type="text" class="form-control rounded" id="progressBathText" placeholder="내용 입력" value=""  />
                    <button type="button" class="btn pstart-record-icon" data-target="progressBathText"><i class="bi bi-mic-fill"></i></button>
                    <button type="button" class="btn btn-danger pstop-record-icon" data-target="progressBathText" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>
                </div>

            </div>
            <div class="modal-footer d-inline-block text-center">
                <button type="button" class="btn btn-info m-0" data-dismiss="modal" id="addProgressBathSaveBtn">추가</button>
                <button type="button" class="btn btn-secondary  m-0" data-dismiss="modal">취소</button>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addProgressFinalModal" aria-hidden="true" aria-labelledby="addFinalModalLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalToggleLabel"><i class="ti-plus"></i> 마감재 점검</h5>
            </div>
            <div class="modal-body">
                <div class="form-group mb-0">
                    <label for="progressFinalRoomName"><i class="ti-pencil mr-1"></i>방이름</label>
                    <select class="form-control rounded" id="progressFinalRoomName">
                        <option value="거실">거실</option>
                        <option value="화장실 1">화장실 1</option>
                        <option value="화장실 2">화장실 2</option>
                        <option value="침실 1">침실 1</option>
                        <option value="침실 2">침실 2</option>
                        <option value="주방">주방</option>
                        <option value="현관">현관</option>
                        <option value="다용도실">다용도실</option>
                        <option value="대피 공간">대피 공간</option>
                        <option value="드레스룸">드레스룸</option>
                        <option value="발코니">발코니</option>
                        <option value="복도">복도</option>
                        <option value="베란다">베란다</option>
                        <option value="실외기실">실외기실</option>
                        <option value="안방">안방</option>
                    </select>
                    <button type="button" class="btn pstart-record-icon" data-target="progressFinalRoomName"><i class="bi bi-mic-fill"></i></button>
                    <button type="button" class="btn btn-danger pstop-record-icon" data-target="progressFinalRoomName" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>
                </div>
                <div class="form-group mb-0">
                    <label for="progressGonzoneInput"><i class="ti-pencil mr-1"></i>공종</label>
                    <input type="text" class="form-control rounded" id="progressGonzoneInput" placeholder="내용" value=""  />
                    <button type="button" class="btn pstart-record-icon" data-target="progressGonzoneInput"><i class="bi bi-mic-fill"></i></button>
                    <button type="button" class="btn btn-danger pstop-record-icon" data-target="progressGonzoneInput" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>
                </div>
                <div class="form-group mb-0">
                    <label for="progressSelbuInput"><i class="ti-pencil mr-1"></i>세부공종</label>
                    <input type="text" class="form-control rounded" id="progressSelbuInput" placeholder="내용" value=""  />
                    <button type="button" class="btn pstart-record-icon" data-target="progressSelbuInput"><i class="bi bi-mic-fill"></i></button>
                    <button type="button" class="btn btn-danger pstop-record-icon" data-target="progressSelbuInput" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>
                </div>
                <div class="form-group mb-0">
                    <label for="progressHazaInput"><i class="ti-pencil mr-1"></i>하자내용</label>
                    <input type="text" class="form-control rounded" id="progressHazaInput" placeholder="내용" value=""  />
                    <button type="button" class="btn pstart-record-icon" data-target="progressHazaInput"><i class="bi bi-mic-fill"></i></button>
                    <button type="button" class="btn btn-danger pstop-record-icon" data-target="progressHazaInput" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>
                </div>
                <div class="form-group mb-0">
                    <label for="progressBgoInput"><i class="ti-pencil mr-1"></i>비고</label>
                    <input type="text" class="form-control rounded" id="progressBgoInput" placeholder="내용" value=""  />
                    <button type="button" class="btn pstart-record-icon" data-target="progressBgoInput"><i class="bi bi-mic-fill"></i></button>
                    <button type="button" class="btn btn-danger pstop-record-icon" data-target="progressBgoInput" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>
                </div>
                <div class="form-group mb-0">
                    <!-- Image input field 1 -->
                    <div class="form-group">
                        <label for="imageInput1">Image 1</label>
                        <input type="file" class="form-control-file" id="progressImageInput1" accept="image/*" capture="camera">
                    </div>

                    <!-- Image input field 2 -->
                    <div class="form-group">
                        <label for="imageInput2">Image 2</label>
                        <input type="file" class="form-control-file" id="progressImageInput2" accept="image/*" capture="camera">
                    </div>
                </div>

            </div>
            <div class="modal-footer d-inline-block text-center">
                <button type="button" class="btn btn-info m-0" data-dismiss="modal" id="addProgressFinalSaveBtn">추가</button>
                <button type="button" class="btn btn-secondary  m-0" data-dismiss="modal">취소</button>

            </div>
        </div>
    </div>
</div>
