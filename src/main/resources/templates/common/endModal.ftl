<div class="modal" id="endModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title"><i class="ti-plus"></i> 점검내용 수정하기</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body overflow-auto ">
                <div class="card card-outline-success">
                    <div class="card-body mb-0">
                        <i class="ti-home mr-2"></i><h4 class="card-title mb-0" id="endModalApartName"></h4>
                    </div>
                    <div class="card-body pt-0">
                        <address>
                            <p class="font-weight-bold">주소</p>
                            <p id="endModalApartAddress"></p>
                            <p id="endModalApartArea"></p>
                        </address>
                        <div class="form-group mb-0">
                            <label for="customerName"><i class="ti-arrow-right mr-1"></i>고객명</label>
                            <input type="text" class="form-control rounded" id="endModalCustomerName" placeholder="Customer name" disabled />
                        </div>
                        <div class="form-group mb-0">
                            <label for="customerPhone"><i class="ti-arrow-right mr-1"></i>전화번호</label>
                            <input type="text" class="form-control rounded" id="endModalCusPhone" placeholder="Customer Phone Number" disabled />
                        </div>
                        <div class="form-group mb-0">
                            <label for="inspectorName"><i class="ti-arrow-right mr-1"></i>점검원</label>
                            <input type="text" class="form-control rounded" id="endModalUsername" placeholder="Inspector name" disabled />
                        </div>
                        <div class="form-group mb-0 mt-2">
                            <div class="card  card-outline-primary">
                                <div class="card-header mb-0">
                                    <h4 class="card-title mb-0">
                                        <i class="ti-settings"></i> 라돈 점검
                                        <button class="btn btn-sm btn-primary ml-1 p-1" id="addCompleteLadonBtn" data-toggle="modal" data-target="#addCompleteLadonModal"><i class="ti-plus"></i></button>
                                    </h4>
                                </div>
                                <div class="card-body" >
                                    <div class="row" id="completeLadonListDiv"></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group mb-0 mt-2">
                            <div class="card  card-outline-primary">
                                <div class="card-header mb-0">
                                    <h4 class="card-title mb-0">
                                        <i class="ti-settings"></i> 포름알데히드
                                        <button class="btn btn-sm btn-primary ml-1 p-1" id="addCompleteFormaldehydeBtn" data-toggle="modal" data-target="#addCompleteFormaldehydeModal"><i class="ti-plus"></i></button>
                                    </h4>
                                </div>
                                <div class="card-body" >
                                    <div class="row" id="completeFormaldehydeListDiv"></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group mb-0 mt-2">
                            <div class="card  card-outline-primary">
                                <div class="card-header mb-0">
                                    <h4 class="card-title mb-0">
                                        <i class="ti-settings"></i> 열화상카메라 점검
                                        <button class="btn btn-sm btn-primary ml-1 p-1" id="addCompleteCameraBtn" data-toggle="modal" data-target="#addCompleteCameraModal"><i class="ti-plus"></i></button>
                                    </h4>
                                </div>
                                <div class="card-body" >
                                    <div class="row" id="completeCameraListDiv"></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group mb-0 mt-2">
                            <div class="card  card-outline-primary">
                                <div class="card-header mb-0">
                                    <h4 class="card-title mb-0">
                                        <i class="ti-settings"></i> 배관 점검
                                        <button class="btn btn-sm btn-primary ml-1 p-1" id="addCompletePipeBtn" data-toggle="modal" data-target="#addCompletePipeModal"><i class="ti-plus"></i></button>
                                    </h4>
                                </div>
                                <div class="card-body" >
                                    <div class="row" id="completePipeListDiv"></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group mb-0 mt-2">
                            <div class="card  card-outline-primary">
                                <div class="card-header mb-0">
                                    <h4 class="card-title mb-0">
                                        <i class="ti-settings"></i> 욕실 및 발코니 바닥 타일 역물매 점검
                                        <button class="btn btn-sm btn-primary ml-1 p-1" id="addCompleteBathBtn" data-toggle="modal" data-target="#addCompleteBathModal"><i class="ti-plus"></i></button>
                                    </h4>
                                </div>
                                <div class="card-body" >
                                    <div class="row" id="completeBathListDiv"></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group mb-0 mt-2">
                            <div class="card  card-outline-primary">
                                <div class="card-header mb-0">
                                    <h4 class="card-title mb-0">
                                        <i class="ti-settings"></i> 마감재 점검
                                        <button class="btn btn-sm btn-primary ml-1 p-1" id="addCompleteFinalBtn" data-toggle="modal" data-target="#addCompleteFinalModal"><i class="ti-plus"></i></button>
                                    </h4>
                                </div>
                                <div class="card-body" >
                                    <div class="row" id="completeFinalListDiv"></div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="modal-footer d-inline-block text-center">
                <button type="button" class="btn btn-primary m-0" id="endModal-correct-btn" data-dismiss="modal">수정</button>
                <button type="button" class="btn btn-secondary  m-0" id="endModal-cancel-btn" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addCompleteLadonModal" aria-hidden="true" aria-labelledby="addLadonModalLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalToggleLabel"><i class="ti-plus"></i> 라돈점검 추가</h5>
            </div>
            <div class="modal-body">
                <div class="form-group mb-0">
                    <label for="ladonRoomName"><i class="ti-pencil mr-1"></i>방이름</label>
                    <input type="text" class="form-control rounded" id="completeLadonRoomName" placeholder="Room name" value=""  />
                </div>
                <div class="form-group mb-0">
                    <label for="ladonPciInput"><i class="ti-pencil mr-1"></i>PCI/L</label>
                    <input type="number" class="form-control rounded" id="completeLadonPciInput" placeholder="Enter pci/L" value=""  />
                </div>
            </div>
            <div class="modal-footer d-inline-block text-center">
                <button type="button" class="btn btn-info m-0" data-dismiss="modal" id="addCompleteLadonSaveBtn">추가</button>
                <button type="button" class="btn btn-secondary  m-0" data-dismiss="modal">취소</button>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addCompleteFormaldehydeModal" aria-hidden="true" aria-labelledby="addFormaldehydeModalLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalToggleLabel"><i class="ti-plus"></i> 포름알데히드 추가</h5>
            </div>
            <div class="modal-body">
                <div class="form-group mb-0">
                    <label for="formaldehydeRoomName"><i class="ti-pencil mr-1"></i>방이름</label>
                    <input type="text" class="form-control rounded" id="completeFormaldehydeRoomName" placeholder="Room name" value=""  />
                </div>
                <div class="form-group mb-0">
                    <label for="formaldehydePpmInput"><i class="ti-pencil mr-1"></i>ppm</label>
                    <input type="number" class="form-control rounded" id="completeFormaldehydePpmInput" placeholder="ppm" value=""  />
                </div>
            </div>
            <div class="modal-footer d-inline-block text-center">
                <button type="button" class="btn btn-info m-0" data-dismiss="modal" id="addCompleteFormaldehydeSaveBtn">추가</button>
                <button type="button" class="btn btn-secondary  m-0" data-dismiss="modal">취소</button>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addCompleteCameraModal" aria-hidden="true" aria-labelledby="addCameraModalLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalToggleLabel"><i class="ti-plus"></i> 열화상카메라 점검</h5>
            </div>
            <div class="modal-body">
                <div class="form-group mb-0">
                    <label for="cameraRoomName"><i class="ti-pencil mr-1"></i>방이름</label>
                    <input type="text" class="form-control rounded" id="completeCameraRoomName" placeholder="Room name" value=""  />
                </div>
                <div class="form-group mb-0">
                    <label for="CameraInput"><i class="ti-pencil mr-1"></i>Select</label>
                    <div class="custom-radio">
                        <label><input type="radio" name="completeCameraOption" value="곰판이"> 곰판이</label><br>
                        <label><input type="radio" name="completeCameraOption" value="경로"> 경로</label><br>
                        <label><input type="radio" name="completeCameraOption" value="단열재 누락"> 단열재 누락</label><br>
                        <label><input type="radio" name="completeCameraOption" value="누수"> 누수</label>
                    </div>
                </div>
            </div>
            <div class="modal-footer d-inline-block text-center">
                <button type="button" class="btn btn-info m-0" data-dismiss="modal" id="addCompleteCameraSaveBtn">추가</button>
                <button type="button" class="btn btn-secondary  m-0" data-dismiss="modal">취소</button>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addCompletePipeModal" aria-hidden="true" aria-labelledby="addPipeModalLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalToggleLabel"><i class="ti-plus"></i> 배관 점검</h5>
            </div>
            <div class="modal-body">
                <div class="form-group mb-0">
                    <label for="pipeRoomName"><i class="ti-pencil mr-1"></i>방이름</label>
                    <input type="text" class="form-control rounded" id="completePipeRoomName" placeholder="Room name" value=""  />
                </div>
                <div class="form-group mb-0">
                    <label for="PipeInput"><i class="ti-pencil mr-1"></i>Select</label>
                    <div class="custom-radio">
                        <label><input type="radio" name="completePipeOption" value="파손"> 파손</label><br>
                        <label><input type="radio" name="completePipeOption" value="페자재"> 페자재</label><br>
                        <label><input type="radio" name="completePipeOption" value="배관 막힘"> 배관 막힘</label>
                    </div>
                </div>
            </div>
            <div class="modal-footer d-inline-block text-center">
                <button type="button" class="btn btn-info m-0" data-dismiss="modal" id="addCompletePipeSaveBtn">추가</button>
                <button type="button" class="btn btn-secondary  m-0" data-dismiss="modal">취소</button>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addCompleteBathModal" aria-hidden="true" aria-labelledby="addBathModalLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalToggleLabel"><i class="ti-plus"></i> 욕실 점검</h5>
            </div>
            <div class="modal-body">
                <div class="form-group mb-0">
                    <label for="bathRoomName"><i class="ti-pencil mr-1"></i>위치이름</label>
                    <input type="text" class="form-control rounded" id="completeBathRoomName" placeholder="place name" value=""  />
                </div>
                <div class="form-group mb-0">
                    <label for="BathInput"><i class="ti-pencil mr-1"></i>Check</label>
                    <div class="custom-radio">
                        <label><input type="radio" name="completeBathOption" value="하자"> 하자</label>
                        <label><input type="radio" name="completeBathOption" value="정상"> 장상</label>

                    </div>
                </div>
                <div class="form-group mb-0">
                    <label for="BathText"><i class="ti-pencil mr-1"></i>하자내용</label>
                    <input type="text" class="form-control rounded" id="completeBathText" placeholder="내용 입력" value=""  />
                </div>

            </div>
            <div class="modal-footer d-inline-block text-center">
                <button type="button" class="btn btn-info m-0" data-dismiss="modal" id="addCompleteBathSaveBtn">추가</button>
                <button type="button" class="btn btn-secondary  m-0" data-dismiss="modal">취소</button>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addCompleteFinalModal" aria-hidden="true" aria-labelledby="addFinalModalLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalToggleLabel"><i class="ti-plus"></i> 마감재 점검</h5>
            </div>
            <div class="modal-body">
                <div class="form-group mb-0">
                    <label for="finalRoomName"><i class="ti-pencil mr-1"></i>방이름</label>
                    <input type="text" class="form-control rounded" id="completeFinalRoomName" placeholder="Room name" value=""  />
                </div>
                <div class="form-group mb-0">
                    <label for="gonzoneInput"><i class="ti-pencil mr-1"></i>공종</label>
                    <input type="text" class="form-control rounded" id="completeGonzoneInput" placeholder="내용" value=""  />
                </div>
                <div class="form-group mb-0">
                    <label for="selbuInput"><i class="ti-pencil mr-1"></i>세부공종</label>
                    <input type="text" class="form-control rounded" id="completeSelbuInput" placeholder="내용" value=""  />
                </div>
                <div class="form-group mb-0">
                    <label for="hazaInput"><i class="ti-pencil mr-1"></i>하자내용</label>
                    <input type="text" class="form-control rounded" id="completeHazaInput" placeholder="내용" value=""  />
                </div>
                <div class="form-group mb-0">
                    <label for="bgoInput"><i class="ti-pencil mr-1"></i>비고</label>
                    <input type="text" class="form-control rounded" id="completeBgoInput" placeholder="내용" value=""  />
                </div>
                <div class="form-group mb-0">
                    <!-- Image input field 1 -->
                    <div class="form-group">
                        <label for="imageInput1">Image 1</label>
                        <input type="file" class="form-control-file" id="completeImageInput1" accept="image/*" capture="camera">
                    </div>

                    <!-- Image input field 2 -->
                    <div class="form-group">
                        <label for="imageInput2">Image 2</label>
                        <input type="file" class="form-control-file" id="completeImageInput2" accept="image/*" capture="camera">
                    </div>
                </div>

            </div>
            <div class="modal-footer d-inline-block text-center">
                <button type="button" class="btn btn-info m-0" data-dismiss="modal" id="addCompleteFinalSaveBtn">추가</button>
                <button type="button" class="btn btn-secondary  m-0" data-dismiss="modal">취소</button>

            </div>
        </div>
    </div>
</div>
