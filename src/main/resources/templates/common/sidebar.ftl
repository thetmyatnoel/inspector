<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
        <li class="nav-item d-inline" id="maxSizeProfileDiv">
            <div class="card card-tale" >
                <div class="card-body text-center">
                    <img src="images/user.png" />
                    <p class="mb-2">사용자 이름 :
                        <#if username?? && username != "">
                            ${username}
                        <#else>
                            User
                        </#if>
                    </p>
                    <p class="mb-2">모바일 접수 기간</p>
                    <div class="row-cols-3">
                        <div class="d-inline bg-danger text-white">진행중<label class="badge" id="sideIngCountLabel">0</label></div>
                        <div class="d-inline bg-warning text-white">대기<label class="badge" id="sideWaitCountLabel">0</label></div>
                        <div class="d-inline bg-success text-white">완료<label class="badge" id="sideEndCountLabel">0</label></div>
                    </div>
                </div>
            </div>
        </li>

        <li class="nav-item">
            <a class="nav-link"  href="/index" >
                <i class="icon-circle-check menu-icon"></i><span class="menu-title">점검리스트</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/report">
                <i class="icon-file menu-icon"></i><span class="menu-title">종합보고서 보기</span>
            </a>
        </li>

    </ul>
</nav>