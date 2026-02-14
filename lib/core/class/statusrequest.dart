enum StatusRequest {
  none,
  loading,           // /// جاري التحميل من الـ server
  success,           // /// الطلب نجح والبيانات صحيحة
  failure,           // /// فشل في البيانات (البيانات المدخلة خاطئة)
  serverFailure,     // /// الـ server أرسل خطأ (status code ليس 200/201)
  serverException,   // /// حدثت مشكلة في الـ server (timeout/connection error)
  offlineFailure     // /// لا يوجد internet connection
}
