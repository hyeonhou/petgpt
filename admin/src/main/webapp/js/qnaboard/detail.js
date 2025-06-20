document.addEventListener('DOMContentLoaded', function () {
    const detailForm = document.getElementById('detail_form');
    const btnUpdate = document.getElementById('btn_update');
    const btnDelete = document.getElementById('btn_delete');

    if (btnUpdate) {
        btnUpdate.addEventListener('click', function () {
            detailForm.setAttribute('method', 'post');
            detailForm.setAttribute('action', '/qnaboard/update');
            detailForm.submit();
        });
    }

    if (btnDelete) {
        btnDelete.addEventListener('click', function () {
            const id = document.getElementById('id').value;
            if (confirm('삭제하시겠습니까?')) {
                window.location.href = `/qnaboard/delete?id=${encodeURIComponent(id)}`;
            }
        });
    }
});

document.addEventListener("DOMContentLoaded", function () {
    if (typeof snowfall !== 'undefined') {
        snowfall.start(document.body, {
            round: true,
            minSize: 2,
            maxSize: 5,
            flakeCount: 80,
            fallSpeed: 1.5
        });
    }

    const detailForm = document.getElementById('detail_form');
    const btnUpdate = document.getElementById('btn_update');
    const btnDelete = document.getElementById('btn_delete');

    if (btnUpdate) {
        btnUpdate.addEventListener('click', function () {
            detailForm.setAttribute('method', 'post');
            detailForm.setAttribute('action', '/qnaboard/update');
            detailForm.submit();
        });
    }

    if (btnDelete) {
        btnDelete.addEventListener('click', function () {
            const id = document.getElementById('id').value;
            if (confirm('삭제하시겠습니까?')) {
                window.location.href = `/qnaboard/delete?id=${encodeURIComponent(id)}`;
            }
        });
    }
});

document.addEventListener('DOMContentLoaded', () => {
    const canvas = document.getElementById('snow-canvas');
    const ctx = canvas.getContext('2d');
    let W = window.innerWidth;
    let H = window.innerHeight;
    canvas.width = W;
    canvas.height = H;

    const maxFlakes = 100;
    const flakes = [];

    function Flake() {
        this.x = Math.random() * W;
        this.y = Math.random() * H;
        this.r = Math.random() * 4 + 1;
        this.d = Math.random() * maxFlakes;
    }

    for (let i = 0; i < maxFlakes; i++) {
        flakes.push(new Flake());
    }

    let angle = 0;

    function drawFlakes() {
        ctx.clearRect(0, 0, W, H);
        ctx.fillStyle = "rgba(255, 255, 255, 0.8)";
        ctx.beginPath();
        for (let i = 0; i < maxFlakes; i++) {
            const f = flakes[i];
            ctx.moveTo(f.x, f.y);
            ctx.arc(f.x, f.y, f.r, 0, Math.PI * 2);
        }
        ctx.fill();
        moveFlakes();
    }

    function moveFlakes() {
        angle += 0.01;
        for (let i = 0; i < maxFlakes; i++) {
            const f = flakes[i];
            f.y += Math.cos(angle + f.d) + 1 + f.r / 2;
            f.x += Math.sin(angle) * 1.5;

            if (f.y > H || f.x > W || f.x < 0) {
                flakes[i] = new Flake();
                flakes[i].y = 0;
            }
        }
    }

    function animate() {
        drawFlakes();
        requestAnimationFrame(animate);
    }

    animate();

    window.addEventListener('resize', () => {
        W = window.innerWidth;
        H = window.innerHeight;
        canvas.width = W;
        canvas.height = H;
    });
});

document.addEventListener("DOMContentLoaded", function () {
    const generateBtn = document.getElementById("generateGpt");
    const copyBtn = document.getElementById("copyGpt");
    const replyBox = document.getElementById("gptReply");

    if (generateBtn) {
        generateBtn.addEventListener("click", function () {
            const boardId = document.getElementById("id").value;
            replyBox.textContent = "AI 응답을 생성 중입니다...";

            fetch(`/qnaboard/gpt-reply?id=${boardId}`)
                .then(res => res.json())
                .then(data => {
                    if (data.status === "success") {
                        replyBox.textContent = data.reply;
                    } else {
                        replyBox.textContent = "AI 응답 생성에 실패했습니다.";
                    }
                })
                .catch(() => {
                    replyBox.textContent = "서버 오류 발생";
                });
        });
    }

    if (copyBtn) {
        copyBtn.addEventListener("click", function () {
            const text = replyBox.textContent;
            if (!text || text.includes("생성 중") || text.includes("실패")) {
                alert("복사할 응답이 없습니다.");
                return;
            }
            navigator.clipboard.writeText(text).then(() => {
                copyBtn.textContent = "복사됨!";
                setTimeout(() => {
                    copyBtn.textContent = "복사";
                }, 1500);
            });
        });
    }
});
