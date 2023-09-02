


enum GenerationStatus {
  none,
  instrumental,
  lyrics,
  vocal,
  mix,
  done
}

class StatusResponse{
  GenerationStatus status;
  String? songId;

  StatusResponse(this.status, this.songId);

}