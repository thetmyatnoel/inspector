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
                        <h4 class="card-title mb-0"><i class="ti-home mr-2"></i>Lottle Castle</h4>
                    </div>
                    <div class="card-body pt-0">
                        <address>
                            <p class="font-weight-bold">주소</p>
                            <p>서울시 강남구 신사로32 101동 102호</p>
                            <p>34평 / 방 3, 욕실 2</p>
                        </address>
                        <div class="form-group mb-0">
                            <label for="customerName"><i class="ti-arrow-right mr-1"></i>고객명</label>
                            <input type="text" class="form-control rounded" id="customerName" placeholder="Customer name" value="김노엘" disabled />
                        </div>
                        <div class="form-group mb-0">
                            <label for="customerPhone"><i class="ti-arrow-right mr-1"></i>전화번호</label>
                            <input type="text" class="form-control rounded" id="customerPhone" placeholder="Customer Phone Number" value="010-0000-0000" disabled />
                        </div>
                        <div class="form-group mb-0">
                            <label for="inspectorName"><i class="ti-arrow-right mr-1"></i>점검원</label>
                            <input type="text" class="form-control rounded" id="inspectorName" placeholder="Inspector name" value="점검원" disabled />
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
                <button type="button" class="btn btn-primary m-0" id="progressModal-ing-btn" data-dismiss="modal">진행중</button>
                <button type="button" class="btn btn-secondary  m-0" id="progressModal-end-btn" data-dismiss="modal">완료</button>
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
                <div class="form-group mb-0">
                    <label for="ladonRoomName"><i class="ti-pencil mr-1"></i>방이름</label>
                    <input type="text" class="form-control rounded" id="ladonRoomName" placeholder="Room name" value=""  />
                </div>
                <div class="form-group mb-0">
                    <label for="ladonPciInput"><i class="ti-pencil mr-1"></i>PCI/L</label>
                    <input type="number" class="form-control rounded" id="ladonPciInput" placeholder="Enter pci/L" value=""  />
                </div>
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
                <div class="form-group mb-0">
                    <label for="formaldehydeRoomName"><i class="ti-pencil mr-1"></i>방이름</label>
                    <input type="text" class="form-control rounded" id="formaldehydeRoomName" placeholder="Room name" value=""  />
                </div>
                <div class="form-group mb-0">
                    <label for="formaldehydePpmInput"><i class="ti-pencil mr-1"></i>ppm</label>
                    <input type="number" class="form-control rounded" id="formaldehydePpmInput" placeholder="ppm" value=""  />
                </div>
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
                <div class="form-group mb-0">
                    <label for="cameraRoomName"><i class="ti-pencil mr-1"></i>방이름</label>
                    <input type="text" class="form-control rounded" id="cameraRoomName" placeholder="Room name" value=""  />
                </div>
                <div class="form-group mb-0">
                    <label for="CameraInput"><i class="ti-pencil mr-1"></i>Select</label>
                    <div class="custom-radio">
                        <label><input type="radio" name="cameraOption" value="곰판이"> 곰판이</label><br>
                        <label><input type="radio" name="cameraOption" value="경로"> 경로</label><br>
                        <label><input type="radio" name="cameraOption" value="단열재 누락"> 단열재 누락</label><br>
                        <label><input type="radio" name="cameraOption" value="누수"> 누수</label>
                    </div>
                </div>
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
                <div class="form-group mb-0">
                    <label for="pipeRoomName"><i class="ti-pencil mr-1"></i>방이름</label>
                    <input type="text" class="form-control rounded" id="pipeRoomName" placeholder="Room name" value=""  />
                </div>
                <div class="form-group mb-0">
                    <label for="PipeInput"><i class="ti-pencil mr-1"></i>Select</label>
                    <div class="custom-radio">
                        <label><input type="radio" name="pipeOption" value="파손"> 파손</label><br>
                        <label><input type="radio" name="pipeOption" value="페자재"> 페자재</label><br>
                        <label><input type="radio" name="pipeOption" value="배관 막힘"> 배관 막힘</label>
                    </div>
                </div>
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
                <div class="form-group mb-0">
                    <label for="bathRoomName"><i class="ti-pencil mr-1"></i>위치이름</label>
                    <input type="text" class="form-control rounded" id="bathRoomName" placeholder="place name" value=""  />
                </div>
                <div class="form-group mb-0">
                    <label for="BathInput"><i class="ti-pencil mr-1"></i>Check</label>
                    <div class="custom-radio">
                        <label><input type="radio" name="bathOption" value="하자"> 하자</label>
                        <label><input type="radio" name="bathOption" value="정상"> 장상</label>

                    </div>
                </div>
                <div class="form-group mb-0">
                    <label for="BathText"><i class="ti-pencil mr-1"></i>하자내용</label>
                    <input type="text" class="form-control rounded" id="bathText" placeholder="내용 입력" value=""  />
                </div>

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
                <div class="form-group mb-0">
                    <label for="finalRoomName"><i class="ti-pencil mr-1"></i>방이름</label>
                    <input type="text" class="form-control rounded" id="finalRoomName" placeholder="Room name" value=""  />
                </div>
                <div class="form-group mb-0">
                    <label for="gonzoneInput"><i class="ti-pencil mr-1"></i>공종</label>
                    <input type="text" class="form-control rounded" id="gonzoneInput" placeholder="내용" value=""  />
                </div>
                <div class="form-group mb-0">
                    <label for="selbuInput"><i class="ti-pencil mr-1"></i>세부공종</label>
                    <input type="text" class="form-control rounded" id="selbuInput" placeholder="내용" value=""  />
                </div>
                <div class="form-group mb-0">
                    <label for="hazaInput"><i class="ti-pencil mr-1"></i>하자내용</label>
                    <input type="text" class="form-control rounded" id="hazaInput" placeholder="내용" value=""  />
                </div>
                <div class="form-group mb-0">
                    <label for="bgoInput"><i class="ti-pencil mr-1"></i>비고</label>
                    <input type="text" class="form-control rounded" id="bgoInput" placeholder="내용" value=""  />
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

            </div>
            <div class="modal-footer d-inline-block text-center">
                <button type="button" class="btn btn-info m-0" data-dismiss="modal" id="addFinalSaveBtn">추가</button>
                <button type="button" class="btn btn-secondary  m-0" data-dismiss="modal">취소</button>

            </div>
        </div>
    </div>
</div>
