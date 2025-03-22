# วิธีใช้งาน Branches ใน GitHub

Git Branches เป็นฟีเจอร์ที่ช่วยให้คุณสามารถพัฒนาฟีเจอร์ต่างๆ แก้ไขบั๊ก หรือทดลองโค้ดโดยไม่กระทบกับโค้ดหลัก (`main` หรือ `master`)  

---

## 🔹 1. ตรวจสอบ Branch ปัจจุบัน
```sh
git branch
```
คำสั่งนี้จะแสดงรายการ branch ทั้งหมดใน repo และมี `*` ข้างหน้าชื่อ branch ที่คุณอยู่ตอนนี้

---

## 🔹 2. สร้าง Branch ใหม่
```sh
git branch ชื่อ-branch
```
ใช้เพื่อสร้าง branch ใหม่ แต่ยังไม่ได้สลับไป branch นั้น

---

## 🔹 3. สลับไปยัง Branch ใหม่
```sh
git checkout ชื่อ-branch
```
เปลี่ยนไปทำงานที่ branch ที่สร้างไว้  

หรือใช้คำสั่งแบบย่อ (สร้างและสลับไป branch ใหม่ในคำสั่งเดียว)
```sh
git checkout -b ชื่อ-branch
```

---

## 🔹 4. รวมโค้ดจาก Branch อื่น (Merge)
```sh
git checkout main
git merge ชื่อ-branch
```
สลับไป branch `main` ก่อน จากนั้นรวมโค้ดจาก `ชื่อ-branch` เข้ามา

---

## 🔹 5. ลบ Branch ที่ไม่ใช้แล้ว
```sh
git branch -d ชื่อ-branch
```
ใช้ลบ branch ที่ merge เข้ากับ `main` แล้ว  

หาก branch ยังไม่ถูก merge แต่ต้องการลบจริงๆ ให้ใช้ `-D`
```sh
git branch -D ชื่อ-branch
```

---

## 🔹 6. อัปโหลด Branch ไปยัง Remote Repository (GitHub)
```sh
git push origin ชื่อ-branch
```
ใช้เมื่อสร้าง branch ใหม่ และต้องการให้ branch นี้ไปอยู่บน GitHub  

---

## 🔹 7. ดึง Branch จาก GitHub ลงมาในเครื่อง
```sh
git fetch origin
git checkout ชื่อ-branch
```
ใช้เมื่อ branch นั้นยังไม่มีในเครื่องของคุณ

---

## 🔹 8. รวม Branch โดยใช้ Pull Request (PR) บน GitHub
1. Push branch ขึ้น GitHub → `git push origin ชื่อ-branch`
2. เข้าไปที่ GitHub → ไปที่ repo ของคุณ
3. เลือก `Pull Requests` → คลิก `New Pull Request`
4. เลือก branch ที่ต้องการ merge
5. กด `Create Pull Request` → รอให้โค้ดได้รับการตรวจสอบ
6. เมื่อโค้ดผ่านการตรวจสอบ กด `Merge`

---

## ✨ สรุป
- ใช้ `git branch` เพื่อดู branch ทั้งหมด
- ใช้ `git checkout -b` เพื่อสร้างและสลับไป branch ใหม่
- ใช้ `git merge` เพื่อรวมโค้ดจาก branch อื่น
- ใช้ `git push origin` เพื่ออัปโหลด branch ไปยัง GitHub
- ใช้ Pull Request บน GitHub เพื่อรวม branch อย่างปลอดภัย
