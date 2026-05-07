# MIPS Assembly Project — Computer Architecture

**Author:** Mostafa Tarek Khalil 

---

## 📌 Overview

This project is a **MIPS Assembly program** that demonstrates fundamental concepts of computer architecture including:

- String/character manipulation using ASCII values
- Integer arithmetic (addition & subtraction)
- Conditional branching (user-driven operation selection)
- MIPS syscall interface for I/O
- Direct memory addressing in the data segment

The project was built alongside an equivalent **C++ implementation** to validate correctness and illustrate the mapping between high-level and low-level code.

---

## 📁 Project Structure

```
├── Arch_Project.asm        # MIPS Assembly source code
├── Arch_Project.cpp        # Equivalent C++ source code
└── Arch_Project_Executable_File.pdf     # Compiled executable breakdown (text + data segments)
```

---

## ⚙️ What the Program Does

### 1. Display Name Characters with ASCII Values
Prints the **first character of each word** in the name `"Mostafa Tarek Khalil"` along with its ASCII integer value:

| Character | Index in String | ASCII | Output |
|-----------|-----------------|-------|--------|
| `M`       | 0               | 77    | `M : 77` |
| `T`       | 8               | 84    | `T : 84` |
| `K`       | 14              | 75    | `K : 75` |

### 2. Display Section Number
Prints `Section : 24`

### 3. Read Three Integers from User
Prompts the user to enter three numbers: N1, N2, N3.

### 4. User-Driven Operation Selection
Asks: **"Enter 1 if you want sum or 2 if you want sub"**  
Uses MIPS branch instructions (`beq`/`bne`) to jump to the correct label.

| Choice | Operation | Formula |
|--------|-----------|---------|
| `1`    | Sum       | N1 + N2 + N3 |
| `2`    | Subtraction | N1 - N2 - N3 |

---

## 🖥️ Sample Output

**Test Case 1 — Sum (N1=30, N2=20, N3=5):**
```
M : 77
T : 84
K : 75
Section : 24
Enter The First Number : 30
Enter The Second Number : 20
Enter The Third Number : 5
Enter 1 if you want sum or 2 if you want sub: 1
sum (N1+N2+N3) = 55
```

**Test Case 2 — Subtraction (N1=100, N2=30, N3=15):**
```
M : 77
T : 84
K : 75
Section : 24
Enter The First Number : 100
Enter The Second Number : 30
Enter The Third Number : 15
Enter 1 if you want sum or 2 if you want sub: 2
sub (N1-N2-N3) = 55
```

---

## 🔧 MIPS Assembly — Key Concepts Used

### Registers

| Register | Usage |
|----------|-------|
| `$t0` | Base address of `name` string / section number (reused) |
| `$t1–$t3` | Stores N1, N2, N3 (user input) |
| `$t4–$t5` | Intermediate and final sum |
| `$t6–$t7` | Intermediate and final subtraction |
| `$s2` | User choice (1=sum, 2=sub) |
| `$a0` | Argument for syscall (print/read) |
| `$v0` | Syscall code selector |

### Syscall Codes

| Code | Operation |
|------|-----------|
| `1`  | Print integer |
| `4`  | Print string |
| `5`  | Read integer |
| `10` | Exit program |
| `11` | Print character (ASCII) |

### Data Segment Layout

| Label | Address | Content |
|-------|---------|---------|
| `name` | `0x10010000` | `"Mostafa Tarek Khalil"` |
| `section` | `0x10010018` | `24` (word) |
| `sec` | `0x1001001c` | `"Section"` |
| `colon` | `0x10010024` | `" : "` |
| `num1` | `0x10010028` | Prompt string |
| `num2` | `0x10010042` | Prompt string |
| `num3` | `0x1001005d` | Prompt string |
| `res1` | `0x10010077` | `"sum (N1+N2+N3)="` |
| `res2` | `0x10010089` | `"sub (N1-N2-N3)="` |

---

## 📦 Executable File Details

| Property | Value |
|----------|-------|
| Total Header Size | `0x1A0` (416 bytes) |
| Text Segment Size | `0x9D` (157 bytes) |
| Text Segment Start | `0x00400000` |
| Data Segment Start | `0x10010000` |
| Total Instructions | 41 instructions |

---

## 💻 C++ Equivalent

```cpp
#include <iostream>
using namespace std;

int main() {
    string name = "Mostafa Tarek Khalil";
    int sec = 24;

    cout << name[0]  << " : " << (int)name[0]  << "\n";  // M : 77
    cout << name[8]  << " : " << (int)name[8]  << "\n";  // T : 84
    cout << name[14] << " : " << (int)name[14] << "\n";  // K : 75

    cout << "Section : " << sec << "\n";

    int num1, num2, num3, choice;
    cout << "Enter The First Number : ";  cin >> num1;
    cout << "Enter The Second Number : "; cin >> num2;
    cout << "Enter The Third Number : ";  cin >> num3;
    cout << "Enter 1 if you want sum or 2 if you want sub: "; cin >> choice;

    if (choice == 1)
        cout << "sum (N1+N2+N3) = " << num1 + num2 + num3 << '\n';
    else
        cout << "sub (N1-N2-N3) = " << num1 - num2 - num3;

    return 0;
}
```

---

## 🚀 How to Run

### MIPS Assembly (using MARS Simulator)

1. Download [MARS MIPS Simulator](http://courses.missouristate.edu/KenVollmar/mars/)
2. Open `Project_Arch.asm`
3. Press **Assemble (F3)** then **Run (F5)**
4. Enter the three numbers when prompted, then choose `1` for sum or `2` for subtraction

### C++ Version

```bash
g++ -o project Project_Arch.cpp
./project
```

---

## 📚 Concepts Covered

- MIPS data and text segment organization
- Load byte (`lb`) and load word (`lw`) instructions
- Arithmetic instructions: `add`, `sub`
- Conditional branching: `beq`, `bne` for user-driven flow
- Syscall interface for console I/O
- Register conventions and usage
- Relationship between C++ high-level code and MIPS assembly

---

*Computer Architecture Project — Faculty of Computers & Artificial intelligence - Benha University*
