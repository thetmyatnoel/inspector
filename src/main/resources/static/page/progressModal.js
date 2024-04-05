(function() {
    // Prevent double initialization of progressModal
    if (window.progressModalInitialized) return;
    window.progressModalInitialized = true;

    var progressModal = {
        mediaRecorder: null,
        audioChunks: [],
        currentRecordingField: null,
        radioOptionsMappings: {
            'progressCameraOption': {
                '정상': '정상',
                '곰팡이': '곰팡이',
                '결로': '결로',
                '단열재 누락': '단열재 누락',
                '누수': '누수'
            },
            'progressPipeOption': {
                '정상': '정상',
                '파손': '파손',
                '폐자재': '폐자재',
                '배관 막힘': '배관 막힘'
            },
            'progressBathOption': {
                '하자': '하자',
                '정상': '정상'
            }
        },

        startRecording: function(field) {
            this.currentRecordingField = field;
            navigator.mediaDevices.getUserMedia({ audio: true })
                .then(stream => {
                    this.mediaRecorder = new MediaRecorder(stream);
                    this.audioChunks = [];
                    this.mediaRecorder.start();
                    console.log("Recording started for field:", field);

                    this.mediaRecorder.ondataavailable = event => {
                        this.audioChunks.push(event.data);
                    };

                    this.mediaRecorder.onstop = () => {
                        console.log("Recording stopped");
                        const audioBlob = new Blob(this.audioChunks, { type: 'audio/wav' });
                        console.log("Blob created, size:", audioBlob.size);
                        if (audioBlob.size > 0) {
                            this.sendAudioToServer(audioBlob, this.currentRecordingField);
                        } else {
                            console.error("Blob is empty. No data was captured.");
                        }
                        this.audioChunks = [];
                        stream.getTracks().forEach(track => track.stop());
                    };
                })
                .catch(error => {
                    console.error("Error accessing the microphone:", error);
                });
        },

        stopRecording: function() {
            if (this.mediaRecorder && this.mediaRecorder.state === "recording") {
                this.mediaRecorder.stop();
            }
        },

        sendAudioToServer: function(file, field) {
            const formData = new FormData();
            formData.append('file', file);

            $.ajax({
                url: '/data/transcribe',
                type: 'POST',
                data: formData,
                contentType: false,
                processData: false,
                success: (data) => {
                    console.log('Success:', data);
                    let parsedData = (typeof data === "string") ? JSON.parse(data) : data;
                    this.handleTranscriptionResult(field, parsedData.transcription);
                },
                error: (xhr, status, error) => {
                    console.error('Error:', error);
                }
            });
        },

        handleTranscriptionResult: function(field, transcription) {
            console.log(`Original Transcription: '${transcription}' for field: '${field}'`);

            // Pre-process transcription to handle specific patterns
            transcription = this.preprocessTranscription(transcription.trim(), field);
            console.log(`Processed Transcription: '${transcription}'`);

            if (field in this.radioOptionsMappings) {
                // Handling for radio button fields
                let matchedValue = this.radioOptionsMappings[field][transcription];
                console.log(`Trying to match radio value for '${transcription}': ${matchedValue ? 'Found' : 'Not Found'}`);
                if (matchedValue) {
                    $(`input[name="${field}"][value="${matchedValue}"]`).prop('checked', true);
                }
            } else {
                // Handling for dropdown menus and input fields
                let $field = $(`#${field}`);

                if ($field.is('select')) {
                    this.selectDropdownByText($field, transcription);
                } else if ($field.is('input[type="text"]') || $field.is('input[type="number"]')) {
                    // Directly set the value for input fields
                    $field.val(transcription);
                    console.log(`Input field value set to '${transcription}'`);
                }
            }
        },
        preprocessTranscription: function(transcription, field) {
            console.log(`Preprocessing transcription for '${field}' with text: '${transcription}'`);
            // Customize preprocessing based on the field
            switch (field) {
                case 'progressLadonRoomName':
                case 'progressFormaldehydeRoomName':
                case 'progressCameraRoomName':
                case 'progressPipeRoomName':
                case 'progressBathRoomName':
                case 'progressFinalRoomName':
                    return this.convertSpokenRoomNameToDropdownValue(transcription);
                case 'progressLadonPciInput':
                case 'progressFormaldehydePpmInput':
                    return this.convertSpokenNumberToNumericValue(transcription);
                default:
                    return transcription;
            }
        },
        convertSpokenRoomNameToDropdownValue: function(spokenText) {
            // Define the mapping for converting spoken room names to dropdown values
            const mapping = {
                "침실 일": "침실 1",
                "침실 이": "침실 2",
                "화장실 일": "화장실 1",
                "화장실 이": "화장실 2"
            };

            // Check if the spoken text is in the mapping and return the corresponding value
            if (spokenText in mapping) {
                return mapping[spokenText];
            }

            // Return the original spoken text if no mapping is found
            return spokenText;
        },
        convertSpokenNumberToNumericValue: function(spokenText) {
            // Define the mapping for converting spoken numbers to numeric values
            const numberMap = {
                "일": "1",
                "이": "2",
                "삼": "3",
                "사": "4",
                "오": "5",
                "육": "6",
                "칠": "7",
                "팔": "8",
                "구": "9",
                "영": "0",
                "점": "."
            };
            let numericValue = spokenText.split(/\s+/).map(word => numberMap[word] || word).join('');
            return numericValue.match(/[0-9\.]+/) ? numericValue : spokenText;

        },
        selectDropdownByText: function($dropdown, text) {
        let matched = false;
        $dropdown.find('option').each(function() {
            if ($(this).text().trim() === text.trim()) {
                $dropdown.val($(this).val());
                matched = true;
                return false; // Break the loop
            }
        });
        if (!matched) {
            console.log(`No matching option found for transcription: ${text}`);
        }
    },

        init: function() {
            $('.pstart-record-icon').off('click').on('click', (e) => {
                let field = $(e.currentTarget).attr('data-target');
                this.startRecording(field);
                $(e.currentTarget).hide();
                $(`[data-target="${field}"].pstop-record-icon`).show();
            });

            $('.pstop-record-icon').off('click').on('click', (e) => {
                let field = $(e.currentTarget).attr('data-target');
                this.stopRecording();
                $(e.currentTarget).hide();
                $(`[data-target="${field}"].pstart-record-icon`).show();
            });
        }
    };

    $(document).ready(function() {
        progressModal.init();
    });
})();