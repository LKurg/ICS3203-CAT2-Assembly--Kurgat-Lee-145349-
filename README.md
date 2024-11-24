# ICS3203-CAT2-Assembly-Kurgat-Lee-145349

This project contains a series of assembly programs written for ICS3203, simulating various tasks ranging from array manipulation to control simulations. Each program demonstrates specific functionalities using system calls and low-level programming constructs.

---

## **Task Overview**

### **Task 1: Positive or Negative Number Detection**
- **Purpose**: This program reads an integer input from the user, determines if it is positive or negative, and outputs the result.
- **Features**:
  - User input validation.
  - Arithmetic comparison to classify the number.
- **Challenge**: Handling ASCII-to-integer conversion for input values.

### **Task 2: Array Reversal**
- **Purpose**: Reverses a predefined array of integers and prints the reversed array to the console.
- **Features**:
  - In-place array reversal using pointers.
  - ASCII conversion to print array elements as characters.
- **Challenge**: Managing array pointers and ensuring the correct order during reversal.

### **Task 3: Factorial Calculation**
- **Purpose**: Calculates the factorial of a user-provided number between 1 and 8 and prints the result.
- **Features**:
  - Input validation to ensure the number is within range.
  - Recursive subroutine to compute the factorial.
- **Challenge**: Handling stack operations in recursive subroutine calls.

### **Task 4: Data Monitoring and Control Simulation**
- **Purpose**: Simulates a control program that reads a "sensor value" and takes actions such as turning on/off a motor or triggering an alarm based on predefined thresholds.
- **Features**:
  - Simulated memory locations to store sensor, motor, and alarm statuses.
  - Control logic to handle various scenarios.
- **Challenge**: Designing a realistic simulation with port-based memory.

---

## **Instructions for Compiling and Running**

### **General Steps**
1. **Assemble the Code**:
   - Use the `nasm` assembler to convert the assembly code to an object file:
     ```bash
     nasm -f elf32 <filename>.s -o <filename>.o
     ```
2. **Link the Object File**:
   - Use the `ld` linker to create the executable:
     ```bash
     ld -m elf_i386 <filename>.o -o <filename>
     ```
3. **Run the Program**:
   - Execute the compiled program:
     ```bash
     ./<filename>
     ```

---

### **Task-Specific Instructions**

#### **Task 1: Positive or Negative Number Detection**
1. **Compile**:
   ```bash
   nasm -f elf32 task1.s -o task1.o
   ld -m elf_i386 task1.o -o task1
   ```
2. **Run**:
   ```bash
   ./task1
   ```
3. **Expected Behavior**:
   - Input: `5`
   - Output: `Positive`
   - Input: `-3`
   - Output: `Negative`

#### **Task 2: Array Reversal**
1. **Compile**:
   ```bash
   nasm -f elf32 task2.s -o task2.o
   ld -m elf_i386 task2.o -o task2
   ```
2. **Run**:
   ```bash
   ./task2
   ```
3. **Expected Output**:
   ```
   Reversed Array: 5 4 3 2 1
   ```

#### **Task 3: Factorial Calculation**
1. **Compile**:
   ```bash
   nasm -f elf32 task3.s -o task3.o
   ld -m elf_i386 task3.o -o task3
   ```
2. **Run**:
   ```bash
   ./task3
   ```
3. **Expected Behavior**:
   - Input: `5`
   - Output: `The factorial is: 120`

#### **Task 4: Data Monitoring and Control Simulation**
1. **Compile**:
   ```bash
   nasm -f elf32 task4.s -o task4.o
   ld -m elf_i386 task4.o -o task4
   ```
2. **Run**:
   ```bash
   ./task4
   ```
3. **Test Scenarios**:
   - Input: `8`
     - Output: `ALARM TRIGGERED!`
   - Input: `2`
     - Output: `Motor turned ON`
   - Input: `5`
     - Output: `Motor turned OFF`

---

## **Insights and Challenges**

### **Task 1**:
- **Insight**: Learned to handle user input and perform arithmetic comparisons at the assembly level.
- **Challenge**: Converting ASCII input to integers while ensuring the program handles invalid characters gracefully.

### **Task 2**:
- **Insight**: Manipulating pointers for in-place array reversal was insightful.
- **Challenge**: Ensuring array boundaries were maintained to avoid memory corruption.

### **Task 3**:
- **Insight**: Recursive subroutines demonstrated the power of modular assembly programming.
- **Challenge**: Managing stack operations correctly during recursive calls to prevent crashes.

### **Task 4**:
- **Insight**: Simulating real-world scenarios like sensor monitoring and motor control provided practical experience.
- **Challenge**: Designing an efficient control flow and correctly updating memory locations to reflect system states.

---

## **Conclusion**
This project showcases the versatility and challenges of assembly programming. It provides valuable insights into low-level system interactions, memory management, and control flow design.
