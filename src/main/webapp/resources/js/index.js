// 오늘 날짜를 구하기 위한 함수
      function getTodayDate() {
        var today = new Date();
        var day = String(today.getDate()).padStart(2, "0");
        var month = String(today.getMonth() + 1).padStart(2, "0"); // January is 0!
        var year = today.getFullYear();
        return year + "-" + month + "-" + day;
      }

      // 내일 날짜를 구하기 위한 함수
      function getTomorrowDate() {
        var tomorrow = new Date();
        tomorrow.setDate(tomorrow.getDate() + 1);
        var day = String(tomorrow.getDate()).padStart(2, "0");
        var month = String(tomorrow.getMonth() + 1).padStart(2, "0"); // January is 0!
        var year = tomorrow.getFullYear();
        return year + "-" + month + "-" + day;
      }

      var checkinInput = document.getElementById("checkin");
      var checkoutInput = document.getElementById("checkout");

      var todayDate = getTodayDate();
      var tomorrowDate = getTomorrowDate();

      // Flatpickr 초기화
      flatpickr(checkinInput, {
        dateFormat: "Y-m-d",
        defaultDate: todayDate, // 오늘 날짜를 기본값으로 설정
				minDate : todayDate,
				locale: {
      // 월을 숫자로 표시하는 설정 추가
      months: {
        shorthand: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
        longhand: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12']
      }
    },
        onChange: function (selectedDates, dateStr, instance) {
          // 입실 날짜가 선택되면 퇴실 날짜의 최소 선택 가능 날짜를 변경
          flatpickr("#checkout", {
            minDate: dateStr !== "" ? dateStr : tomorrowDate,
          });
        },
      });

      flatpickr(checkoutInput, {
        dateFormat: "Y-m-d",
        defaultDate: tomorrowDate, // 내일 날짜를 기본값으로 설정
        minDate: tomorrowDate, // 퇴실 날짜의 최소 선택 가능 날짜를 내일로 설정
				locale: {
      // 월을 숫자로 표시하는 설정 추가
      months: {
        shorthand: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
        longhand: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12']
      }
    }
      });

      // 입력란의 placeholder에 오늘 날짜와 내일 날짜 설정
      checkinInput.placeholder = todayDate;
      checkoutInput.placeholder = tomorrowDate;