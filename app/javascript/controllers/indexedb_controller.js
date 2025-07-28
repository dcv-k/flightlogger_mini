import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["name"];

    connect() {
        this.dbPromise = this.openDatabase();
    }

    openDatabase() {
        return new Promise((resolve, reject) => {
            const request = indexedDB.open("ExercisesDB", 1);
            request.onupgradeneeded = event => {
                const db = event.target.result;
                db.createObjectStore("subExercises", { keyPath: "id" });
            };
            request.onsuccess = event => resolve(event.target.result);
            request.onerror = event => reject(event.target.error);
        });
    }

    logAll() {
        this.dbPromise.then(db => {
            const tx = db.transaction("subExercises", "readonly");
            const store = tx.objectStore("subExercises");
            const getAllRequest = store.getAll();

            getAllRequest.onsuccess = () => {
                console.log("Contents", getAllRequest.result);
            };

            getAllRequest.onerror = () => {
                console.error("Failed fetch");
            };
        }).catch(error => {
            console.error("Failed to open database", error);
        });
    }


    save(event) {
        console.log("test on type event");
        const textarea = event.target;
        const id = parseInt(textarea.dataset.id, 10);
        const content = textarea.value;

        const record = { id, content, updatedAt: new Date().toISOString() };

        this.dbPromise.then(db => {
            const tx = db.transaction("subExercises", "readwrite");
            const store = tx.objectStore("subExercises");
            store.put(record);
        }).catch(error => {
            console.error("Failed to save", error);
        });
    }
    populate() {
        this.dbPromise.then(db => {
            const tx = db.transaction("subExercises", "readonly");
            const store = tx.objectStore("subExercises");
            this.nameTargets.forEach(textarea => {
                const id = parseInt(textarea.dataset.id, 10);
                const request = store.get(id);
                request.onsuccess = () => {
                    if (request.result) {
                        textarea.value = request.result.content;
                    }
                };
            });
        });
    }
}
