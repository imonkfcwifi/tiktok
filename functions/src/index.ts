import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp();
export const onVideoCreated = functions.firestore
  .document("videos/{videoId}")
  .onCreate(async (snapshot, context) => {
    snapshot.ref.update({ hello: "from functions" });
  });
// 중괄호를 쓰면 변수처럼 작동
//  배포 firebase deploy --only functions
