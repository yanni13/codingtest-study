def solution(video_len, pos, op_start, op_end, commands):
    def time_to_seconds(time_str):
        mm, ss = map(int, time_str.split(':'))
        return mm * 60 + ss

    def seconds_to_time(seconds):
        mm = seconds // 60
        ss = seconds % 60
        return f"{mm:02d}:{ss:02d}"

    # 시간을 초 단위로 변환
    video_len_sec = time_to_seconds(video_len)
    pos_sec = time_to_seconds(pos)
    op_start_sec = time_to_seconds(op_start)
    op_end_sec = time_to_seconds(op_end)

    # 오프닝 구간 체크
    if op_start_sec <= pos_sec <= op_end_sec:
        pos_sec = op_end_sec

    # 명령어 처리
    for command in commands:
        if command == "next":
            pos_sec += 10
            if pos_sec > video_len_sec:
                pos_sec = video_len_sec
        elif command == "prev":
            pos_sec -= 10
            if pos_sec < 0:
                pos_sec = 0

        # 명령 실행 후 오프닝 구간 체크
        if op_start_sec <= pos_sec <= op_end_sec:
            pos_sec = op_end_sec

    # 결과를 다시 "mm:ss" 형식으로 변환
    return seconds_to_time(pos_sec)
