<div class="modal" id="addModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title"><i class="ti-plus"></i> 점검내용 입력</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body overflow-auto ">

                <div class="card card-outline-success">
                    <div class="card-body mb-0">
                        <i class="ti-home mr-2"></i><h4 class="card-title mb-0" id="modalApartName"></h4>
                    </div>
                    <div class="card-body pt-0">
                        <address>
                            <p class="font-weight-bold">주소</p>
                            <p id="modalAddress"></p>
                            <p id="modalArea"></p>
                        </address>
                        <div class="form-group mb-0">
                            <label for="customerName"><i class="ti-arrow-right mr-1"></i>고객명</label>
                            <input type="text" class="form-control rounded" id="modalCustomerName" placeholder="Customer name" disabled />
                        </div>
                        <div class="form-group mb-0">
                            <label for="customerPhone"><i class="ti-arrow-right mr-1"></i>전화번호</label>
                            <input type="text" class="form-control rounded" id="modalCusPhone" placeholder="Customer Phone Number" disabled />
                        </div>
                        <div class="form-group mb-0">
                            <label for="email"><i class="ti-arrow-right mr-1"></i>이메일</label>
                            <input type="text" class="form-control rounded" id="modalEmail" placeholder="Customer Email" disabled />
                        </div>
                        <div class="form-group mb-0">
                            <label for="inspectorName"><i class="ti-arrow-right mr-1"></i>점검원</label>
                            <input type="text" class="form-control rounded" id="modalUsername" placeholder="Inspector name" disabled />
                        </div>
                        <div class="form-group mb-0 mt-2">
                            <div class="card  card-outline-primary">
                                <div class="card-header mb-0">
                                    <h4 class="card-title mb-0">
                                        <i class="ti-settings"></i> 라돈 점검
                                        <button class="btn btn-sm btn-primary ml-1 p-1" id="addLadonBtn" data-toggle="modal" data-target="#addLadonModal"><i class="ti-plus"></i></button>
                                    </h4>
                                </div>
                                <div class="card-body" >
                                    <div class="row" id="ladonListDiv"></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group mb-0 mt-2">
                            <div class="card  card-outline-primary">
                                <div class="card-header mb-0">
                                    <h4 class="card-title mb-0">
                                        <i class="ti-settings"></i> 포름알데히드
                                        <button class="btn btn-sm btn-primary ml-1 p-1" id="addFormaldehydeBtn" data-toggle="modal" data-target="#addFormaldehydeModal"><i class="ti-plus"></i></button>
                                    </h4>
                                </div>
                                <div class="card-body" >
                                    <div class="row" id="formaldehydeListDiv"></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group mb-0 mt-2">
                            <div class="card  card-outline-primary">
                                <div class="card-header mb-0">
                                    <h4 class="card-title mb-0">
                                        <i class="ti-settings"></i> 열화상카메라 점검
                                        <button class="btn btn-sm btn-primary ml-1 p-1" id="addCameraBtn" data-toggle="modal" data-target="#addCameraModal"><i class="ti-plus"></i></button>
                                    </h4>
                                </div>
                                <div class="card-body" >
                                    <div class="row" id="cameraListDiv"></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group mb-0 mt-2">
                            <div class="card  card-outline-primary">
                                <div class="card-header mb-0">
                                    <h4 class="card-title mb-0">
                                        <i class="ti-settings"></i> 배관 점검
                                        <button class="btn btn-sm btn-primary ml-1 p-1" id="addPipeBtn" data-toggle="modal" data-target="#addPipeModal"><i class="ti-plus"></i></button>
                                    </h4>
                                </div>
                                <div class="card-body" >
                                    <div class="row" id="pipeListDiv"></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group mb-0 mt-2">
                            <div class="card  card-outline-primary">
                                <div class="card-header mb-0">
                                    <h4 class="card-title mb-0">
                                        <i class="ti-settings"></i> 욕실 및 발코니 바닥 타일 역물매 점검
                                        <button class="btn btn-sm btn-primary ml-1 p-1" id="addBathBtn" data-toggle="modal" data-target="#addBathModal"><i class="ti-plus"></i></button>
                                    </h4>
                                </div>
                                <div class="card-body" >
                                    <div class="row" id="bathListDiv"></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group mb-0 mt-2">
                            <div class="card  card-outline-primary">
                                <div class="card-header mb-0">
                                    <h4 class="card-title mb-0">
                                        <i class="ti-settings"></i> 마감재 점검
                                        <button class="btn btn-sm btn-primary ml-1 p-1" id="addFinalBtn" data-toggle="modal" data-target="#addFinalModal"><i class="ti-plus"></i></button>
                                    </h4>
                                </div>
                                <div class="card-body" >
                                    <div class="row" id="finalListDiv"></div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="modal-footer d-inline-block text-center">
                <button type="button" class="btn btn-primary m-0" id="addModal-ing-btn" data-dismiss="modal">진행중</button>
                <button type="button" class="btn btn-secondary  m-0" id="addModal-end-btn" data-dismiss="modal">완료</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addLadonModal" aria-hidden="true" aria-labelledby="addLadonModalLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalToggleLabel"><i class="ti-plus"></i> 라돈점검 추가</h5>
            </div>
            <div class="modal-body">
                <form action="" method="post">
                    <div class="form-group mb-0">
                        <label for="ladonRoomName"><i class="ti-pencil mr-1"></i>방이름</label>
                        <select class="form-control rounded" id="ladonRoomName">
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
                        <button type="button" class="btn start-record-icon" data-target="ladonRoomName"><i class="bi bi-mic-fill"></i></button>
                        <button type="button" class="btn btn-danger stop-record-icon" data-target="ladonRoomName" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>
                    </div>
                    <div class="form-group mb-0">
                        <label for="ladonPciInput"><i class="ti-pencil mr-1"></i>PCI/L</label>
                        <input type="text" class="form-control rounded" id="ladonPciInput" placeholder="Enter pci/L" value=""  />
                        <button type="button" class="btn start-record-icon" data-target="ladonPciInput"><i class="bi bi-mic-fill"></i></button>
                        <button type="button" class="btn btn-danger stop-record-icon" data-target="ladonPciInput" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>
                    </div>
                </form>
            </div>
            <div class="modal-footer d-inline-block text-center">
                <button type="button" class="btn btn-info m-0" data-dismiss="modal" id="addLadonSaveBtn">추가</button>
                <button type="button" class="btn btn-secondary  m-0" data-dismiss="modal">취소</button>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addFormaldehydeModal" aria-hidden="true" aria-labelledby="addFormaldehydeModalLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalToggleLabel"><i class="ti-plus"></i> 포름알데히드 추가</h5>
            </div>
            <div class="modal-body">
                <form action="" method="post">
                    <div class="form-group mb-0">
                        <label for="formaldehydeRoomName"><i class="ti-pencil mr-1"></i>방이름</label>
                        <select class="form-control rounded" id="formaldehydeRoomName">
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
                        <button type="button" class="btn start-record-icon" data-target="formaldehydeRoomName"><i class="bi bi-mic-fill"></i></button>
                        <button type="button" class="btn btn-danger stop-record-icon" data-target="formaldehydeRoomName" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>
                    </div>
                    <div class="form-group mb-0">
                        <label for="formaldehydePpmInput"><i class="ti-pencil mr-1"></i>ppm</label>
                        <input type="text" class="form-control rounded" id="formaldehydePpmInput" placeholder="ppm" value=""  />
                        <button type="button" class="btn start-record-icon" data-target="formaldehydePpmInput"><i class="bi bi-mic-fill"></i></button>
                        <button type="button" class="btn btn-danger stop-record-icon" data-target="formaldehydePpmInput" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>
                    </div>

                </form>
            </div>
            <div class="modal-footer d-inline-block text-center">
                <button type="button" class="btn btn-info m-0" data-dismiss="modal" id="addFormaldehydeSaveBtn">추가</button>
                <button type="button" class="btn btn-secondary  m-0" data-dismiss="modal">취소</button>

            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="addCameraModal" aria-hidden="true" aria-labelledby="addCameraModalLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalToggleLabel"><i class="ti-plus"></i> 열화상카메라 점검</h5>
            </div>
            <div class="modal-body">
                <form action="" method="post">
                    <div class="form-group mb-0">
                        <label for="cameraRoomName"><i class="ti-pencil mr-1"></i>방이름</label>
                        <select class="form-control rounded" id="cameraRoomName">
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
                        <button type="button" class="btn start-record-icon" data-target="cameraRoomName"><i class="bi bi-mic-fill"></i></button>
                        <button type="button" class="btn btn-danger stop-record-icon" data-target="cameraRoomName" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>
                    </div>
                    <div class="form-group mb-0">
                        <label for="CameraInput"><i class="ti-pencil mr-1"></i>Select</label>
                        <div class="custom-radio">
                            <label><input type="radio" name="cameraOption" value="정상"> 정상</label><br>
                            <label><input type="radio" name="cameraOption" value="곰팡이"> 곰팡이</label><br>
                            <label><input type="radio" name="cameraOption" value="결로"> 결로</label><br>
                            <label><input type="radio" name="cameraOption" value="단열재 누락"> 단열재 누락</label><br>
                            <label><input type="radio" name="cameraOption" value="누수"> 누수</label>
                        </div>
                        <button type="button" class="btn start-record-icon" data-target="cameraOption"><i class="bi bi-mic-fill"></i></button>
                        <button type="button" class="btn btn-danger stop-record-icon" data-target="cameraOption" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>
                    </div>
                </form>
            </div>
            <div class="modal-footer d-inline-block text-center">
                <button type="button" class="btn btn-info m-0" data-dismiss="modal" id="addCameraSaveBtn">추가</button>
                <button type="button" class="btn btn-secondary  m-0" data-dismiss="modal">취소</button>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addPipeModal" aria-hidden="true" aria-labelledby="addPipeModalLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalToggleLabel"><i class="ti-plus"></i> 배관 점검</h5>
            </div>
            <div class="modal-body">
                <form action="" method="post">
                    <div class="form-group mb-0">
                        <label for="pipeRoomName"><i class="ti-pencil mr-1"></i>방이름</label>
                        <select class="form-control rounded" id="pipeRoomName">
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
                        <button type="button" class="btn start-record-icon" data-target="pipeRoomName"><i class="bi bi-mic-fill"></i></button>
                        <button type="button" class="btn btn-danger stop-record-icon" data-target="pipeRoomName" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>
                    </div>
                    <div class="form-group mb-0">
                        <label for="PipeInput"><i class="ti-pencil mr-1"></i>Select</label>
                        <div class="custom-radio">
                            <label><input type="radio" name="pipeOption" value="정상"> 정상</label><br>
                            <label><input type="radio" name="pipeOption" value="파손"> 파손</label><br>
                            <label><input type="radio" name="pipeOption" value="폐자재"> 폐자재</label><br>
                            <label><input type="radio" name="pipeOption" value="배관 막힘"> 배관 막힘</label>
                        </div>
                        <button type="button" class="btn start-record-icon" data-target="pipeOption"><i class="bi bi-mic-fill"></i></button>
                        <button type="button" class="btn btn-danger stop-record-icon" data-target="pipeOption" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>
                    </div>
                </form>
            </div>
            <div class="modal-footer d-inline-block text-center">
                <button type="button" class="btn btn-info m-0" data-dismiss="modal" id="addPipeSaveBtn">추가</button>
                <button type="button" class="btn btn-secondary  m-0" data-dismiss="modal">취소</button>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addBathModal" aria-hidden="true" aria-labelledby="addBathModalLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalToggleLabel"><i class="ti-plus"></i> 욕실 점검</h5>
            </div>
            <div class="modal-body">
                <form action="" method="post">
                    <div class="form-group mb-0">
                        <label for="bathRoomName"><i class="ti-pencil mr-1"></i>위치이름</label>
                        <select class="form-control rounded" id="bathRoomName">
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
                        <button type="button" class="btn start-record-icon" data-target="bathRoomName"><i class="bi bi-mic-fill"></i></button>
                        <button type="button" class="btn btn-danger stop-record-icon" data-target="bathRoomName" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>
                    </div>
                    <div class="form-group mb-0">
                        <label for="BathInput"><i class="ti-pencil mr-1"></i>Check</label>
                        <div class="custom-radio">
                            <label><input type="radio" name="bathOption" value="하자"> 하자</label>
                            <label><input type="radio" name="bathOption" value="정상"> 정상</label>
                        </div>
                        <button type="button" class="btn start-record-icon" data-target="bathOption"><i class="bi bi-mic-fill"></i></button>
                        <button type="button" class="btn btn-danger stop-record-icon" data-target="bathOption" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>
                    </div>
                    <div class="form-group mb-0">
                        <label for="BathText"><i class="ti-pencil mr-1"></i>하자내용</label>
                        <input type="text" class="form-control rounded" id="bathText" placeholder="내용 입력" value=""  />
                        <button type="button" class="btn start-record-icon" data-target="BathText"><i class="bi bi-mic-fill"></i></button>
                        <button type="button" class="btn btn-danger stop-record-icon" data-target="BathText" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>
                    </div>
                </form>
            </div>
            <div class="modal-footer d-inline-block text-center">
                <button type="button" class="btn btn-info m-0" data-dismiss="modal" id="addBathSaveBtn">추가</button>
                <button type="button" class="btn btn-secondary  m-0" data-dismiss="modal">취소</button>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addFinalModal" aria-hidden="true" aria-labelledby="addFinalModalLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalToggleLabel"><i class="ti-plus"></i> 마감재 점검</h5>
            </div>
            <div class="modal-body">
                <form action="" method="post" enctype="multipart/form-data">
                    <div class="form-group mb-0">
                        <label for="finalRoomName"><i class="ti-pencil mr-1"></i>방이름</label>
                        <select class="form-control rounded" id="finalRoomName">
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
                        <button type="button" class="btn start-record-icon" data-target="finalRoomName"><i class="bi bi-mic-fill"></i></button>
                        <button type="button" class="btn btn-danger stop-record-icon" data-target="finalRoomName" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>
                    </div>
                    <div class="form-group mb-0">
                        <label for="gonzoneInput"><i class="ti-pencil mr-1"></i>공종</label>
                        <input type="text" class="form-control rounded" id="gonzoneInput" placeholder="내용" value=""  />
                        <button type="button" class="btn start-record-icon" data-target="gonzoneInput"><i class="bi bi-mic-fill"></i></button>
                        <button type="button" class="btn btn-danger stop-record-icon" data-target="gonzoneInput" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>

                    </div>
                    <div class="form-group mb-0">
                        <label for="selbuInput"><i class="ti-pencil mr-1"></i>세부공종</label>
                        <input type="text" class="form-control rounded" id="selbuInput" placeholder="내용" value=""  />
                        <button type="button" class="btn start-record-icon" data-target="selbuInput"><i class="bi bi-mic-fill"></i></button>
                        <button type="button" class="btn btn-danger stop-record-icon" data-target="selbuInput" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>

                    </div>
                    <div class="form-group mb-0">
                        <label for="hazaInput"><i class="ti-pencil mr-1"></i>하자내용</label>
                        <input type="text" class="form-control rounded" id="hazaInput" placeholder="내용" value=""  />
                        <button type="button" class="btn start-record-icon" data-target="hazaInput"><i class="bi bi-mic-fill"></i></button>
                        <button type="button" class="btn btn-danger stop-record-icon" data-target="hazaInput" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>

                    </div>
                    <div class="form-group mb-0">
                        <label for="bgoInput"><i class="ti-pencil mr-1"></i>비고</label>
                        <input type="text" class="form-control rounded" id="bgoInput" placeholder="내용" value=""  />
                        <button type="button" class="btn start-record-icon" data-target="bgoInput"><i class="bi bi-mic-fill"></i></button>
                        <button type="button" class="btn btn-danger stop-record-icon" data-target="bgoInput" style="display:none;"><i class="bi bi-mic-mute-fill"></i></button>

                    </div>
                    <div class="form-group mb-0">
                        <!-- Image input field 1 -->
                        <div class="form-group">
                            <label for="imageInput1">Image 1</label>
                            <input type="file" class="form-control-file" id="imageInput1" accept="image/*" capture="camera">
                        </div>

                        <!-- Image input field 2 -->
                        <div class="form-group">
                            <label for="imageInput2">Image 2</label>
                            <input type="file" class="form-control-file" id="imageInput2" accept="image/*" capture="camera">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer d-inline-block text-center">
                <button type="button" class="btn btn-info m-0" data-dismiss="modal" id="addFinalSaveBtn">추가</button>
                <button type="button" class="btn btn-secondary  m-0" data-dismiss="modal">취소</button>

            </div>
        </div>
    </div>
</div>

