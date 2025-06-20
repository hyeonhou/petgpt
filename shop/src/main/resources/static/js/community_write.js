const community_write = {
    contextPath: '',

    initSummernote: function () {
        $('#summernote').summernote({
            lang: 'ko-KR',
            height: 350,
            placeholder: '내용을 입력하세요.',
            toolbar: [
                ['style', ['style']],
                ['font', ['bold', 'underline', 'clear']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['table', ['table']],
                ['insert', ['link', 'picture']],
                ['view', ['fullscreen', 'codeview', 'help']]
            ],
            callbacks: {
                onImageUpload: (files) => {
                    for (let i = 0; i < files.length; i++) {
                        community_write.uploadImage(files[i]);
                    }
                }
            }
        });
    },

    uploadImage: function (file) {
        const formData = new FormData();
        formData.append('file', file);

        $.ajax({
            url: this.contextPath + '/community/upload/image',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function (response) {
                response.imageUrl = community_write.contextPath + response.imageUrl;
                $('#summernote').summernote('insertImage', response.imageUrl);
            },
            error: function (xhr) {
                console.error('이미지 업로드 실패:', xhr);
                alert('이미지 업로드에 실패했습니다.');
            }
        });
    },

    setupImageUpload: function () {

        const previewContainer = $('#imagePreview');
        const previewItem = previewContainer.find('.image-preview-item');
        const previewImage = $('#thumbnailImagePreviewWrite');
        const fileInput = $('#imageUpload');

        fileInput.change(function () {
            const file = this.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    previewImage.attr('src', e.target.result).attr('alt', '새 썸네일 미리보기');
                    previewItem.show();
                    console.log("새 썸네일 미리보기 표시");
                }
                reader.readAsDataURL(file);
            } else {
                previewItem.hide();
                previewImage.attr('src', '').attr('alt', '썸네일 미리보기');
                console.log("파일 선택 취소, 미리보기 숨김");
            }
        });

        $(document).on('click', '#imagePreview .remove-btn', function () {
            previewItem.hide();
            previewImage.attr('src', '').attr('alt', '썸네일 미리보기');
            fileInput.val('');
            console.log("썸네일 이미지 삭제 버튼 클릭");
        });
    },

    setupFormSubmit: function () {
        $('#postForm').submit((e) => {
            e.preventDefault();

            const formData = new FormData();
            formData.append('boardTitle', $('input[name="title"]').val());
            formData.append('category', $('#category').val());
            formData.append('boardContent', $('#summernote').summernote('code'));

            const thumbnailFile = document.getElementById('imageUpload').files[0];
            if (thumbnailFile) {
                formData.append('thumbnailImage', thumbnailFile);
            }

            $.ajax({
                url: this.contextPath + '/community/write/submit',
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                dataType: 'json',
                success: (response) => {
                    if (response && response.redirectUrl) {
                        console.log('Success response with redirectUrl:', response.redirectUrl);
                        window.location.href = response.redirectUrl;
                    } else {
                        console.log('게시글 등록 성공 (redirectUrl 없음):', response);
                        alert('게시글이 등록되었습니다.');
                        window.location.href = this.contextPath + '/community';
                    }
                },
                error: (xhr, status, error) => {
                    console.error('게시글 등록 요청 실패:', status, error, xhr);
                    let errorMessage = '게시글 등록 중 오류가 발생했습니다.';

                    if (xhr.status === 401 && xhr.responseJSON && xhr.responseJSON.redirectUrl) {
                        console.log('Unauthorized (401) detected, redirecting to:', xhr.responseJSON.redirectUrl);
                        window.location.href = xhr.responseJSON.redirectUrl;
                        return;
                    } else if (xhr.responseJSON && xhr.responseJSON.message) {
                        errorMessage = xhr.responseJSON.message;
                    } else if (xhr.status) {
                        errorMessage += ` (Status: ${xhr.status})`;
                    }

                    alert(errorMessage);
                }
            });
        });
    },

    setupTranslateButton: function() {
        if ($('#translateBtn').length === 0) {
            const translateBtn = $('<button type="button" class="btn-translate">외국어 → 한국어 번역</button>');
            translateBtn.css({
                'background-color': '#4CAF50',
                'color': 'white',
                'padding': '8px 15px',
                'border': 'none',
                'border-radius': '4px',
                'cursor': 'pointer',
                'margin-bottom': '10px',
                'font-weight': '500'
            });
            
            $('#summernote').parent().before(translateBtn);
            
            translateBtn.on('click', () => {
                const editorContent = $('#summernote').summernote('code');
                
                const tempDiv = document.createElement('div');
                tempDiv.innerHTML = editorContent;
                const textContent = tempDiv.textContent || tempDiv.innerText || '';
                
                if (!textContent.trim()) {
                    alert('번역할 텍스트가 없습니다.');
                    return;
                }
                
                translateBtn.text('번역 중...').prop('disabled', true);
                
                $.ajax({
                    url: this.contextPath + '/api/translate',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        text: textContent,
                        targetLang: 'ko'
                    }),
                    success: (response) => {
                        if (response && response.translatedText) {
                            $('#summernote').summernote('code', response.translatedText);
                            alert('번역이 완료되었습니다.');
                        } else {
                            alert('번역 결과를 가져오지 못했습니다.');
                        }
                    },
                    error: (xhr, status, error) => {
                        console.error('번역 오류:', error);
                        alert('번역 중 오류가 발생했습니다.');
                    },
                    complete: () => {
                        translateBtn.text('외국어 → 한국어 번역').prop('disabled', false);
                    }
                });
            });
        }
    },

    initElements: function () {
        this.contextPath = $('#community-write-data').data('contextPath');
        this.initSummernote();
        this.setupImageUpload();
        this.setupFormSubmit();
        this.setupTranslateButton();
    },

    init: function () {
        this.contextPath = $('#community-write-data').data('context-path') || '';
        console.log("Community Write JS Initialized. Context Path:", this.contextPath);

        this.initElements();
    }
};

$(document).ready(function () {
    community_write.init();
});