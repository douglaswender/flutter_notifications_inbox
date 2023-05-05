import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp();

export const pushNotification = functions.firestore.document("notifications/{docId}").onCreate((snapshot, context) => {
    admin.firestore().collection('deviceTokens').get().then(
        result => {
            let registrationTokens: any[] = [];
            result.docs.forEach(tokenDocument => {

                if (tokenDocument.data().userId == snapshot.data().userId) {
                    registrationTokens.push(tokenDocument.data().token);
                }

            });

            admin.messaging().sendMulticast({
                tokens: registrationTokens,
                notification: {
                    title: snapshot.data().title,
                    body: snapshot.data().body,
                }
            });
            
            admin.messaging().sendToTopic('all_notification', {
                notification: {
                    title: snapshot.data().title,
                    body: snapshot.data().body,
                }
            });

        });
});

