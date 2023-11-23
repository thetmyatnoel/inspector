<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
        <li class="nav-item d-inline" id="maxSizeProfileDiv">
            <div class="card card-tale" >
                <div class="card-body text-center">
                    <img src="images/user.png" />
                    <p class="mb-2">사용자 이름(XXX)</p>
                    <p class="mb-2">모바일 접수 기간</p>
                    <div class="btn-group" role="group" aria-label="Basic example">
                        <button type="button" class="btn btn-sm btn-danger">진행중<br/>1</button>
                        <button type="button" class="btn btn-sm btn-warning">대기<br/>2</button>
                        <button type="button" class="btn btn-sm btn-success">완료<br/>3</button>
                    </div>
                </div>
            </div>
        </li>
        <li class="nav-item d-none" id="minSizeProfileDiv">
            <div class="card card-tale">
                <div class="card-body text-center">
                    <img src="images/user.png" width="35px;"/>
                    <button type="button" class="btn btn-sm btn-danger">1</button>
                    <button type="button" class="btn btn-sm btn-warning">2</button>
                    <button type="button" class="btn btn-sm btn-success">3</button>

                </div>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="/index" aria-expanded="false" aria-controls="ui-basic">
                <i class="icon-circle-check menu-icon"></i><span class="menu-title">점검리스트</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="/report" aria-expanded="false" aria-controls="ui-basic">
                <i class="icon-file menu-icon"></i><span class="menu-title">총합보고서 보기</span>
            </a>
        </li>

    </ul>
</nav>