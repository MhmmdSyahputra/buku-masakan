String cutText(String text) {
  if (text.length >= 20) {
    return text.substring(0, 110) + '...';
  }
  return text;
}
