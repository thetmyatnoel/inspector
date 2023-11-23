<div class="modal" id="addModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title"><i class="ti-plus"></i> 점검 추가</h4>
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
                    </div>
                </div>
            </div>
            <div class="modal-footer d-inline-block text-center">
                <button type="button" class="btn btn-primary m-0">저장</button>
                <button type="button" class="btn btn-secondary  m-0" data-dismiss="modal">취소</button>
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
