# ASMtrology

This is an 8086 Assembly program that asks for your zodiac sign and provides a weekly horoscope based on your input.

## Program Description

The program displays a list of zodiac signs, prompts the user to enter their sign, and then displays a personalized horoscope message for that sign. If an invalid zodiac sign is entered, it displays an error message.

## Supported Zodiac Signs

- Aries
- Taurus
- Gemini
- Cancer
- Virgo
- Libra
- Scorpio
- Sagittarius
- Capricorn
- Aquarius
- Pisces

## Requirements

To run this program, you need:
- An 8086/8088 compatible processor or emulator
- An assembler like MASM, TASM, or NASM
- DOS or a DOS emulator (like DOSBox)

## How to Run the Program

### Step 1: Install Required Software

1. Download and install DOSBox from https://www.dosbox.com/
2. Download an assembler like MASM or TASM

### Step 2: Set Up the Environment

1. Create a directory for your assembly files (e.g., `C:\asm`)
2. Place the `main.asm` file in this directory
3. Mount this directory in DOSBox:
   ```
   mount c: c:\asm
   c:
   ```

### Step 3: Assemble the Program

Using MASM:
```
masm main.asm;
link main.obj;
```

Using TASM:
```
tasm main.asm
tlink main.obj
```

### Step 4: Run the Program

After successful assembly and linking, run the executable:
```
main.exe
```

## Program Usage

1. The program will display: "What is your zodiac sign?"
2. Type your zodiac sign (in lowercase) and press Enter
3. The program will display your weekly horoscope
4. If you enter an invalid zodiac sign, you'll see an error message

## Example Output

```
What is your zodiac sign?
taurus

Your horoscope for this week is:
Financial opportunities are coming your way; stay alert.
```

## Notes

- The program expects zodiac signs to be entered in lowercase
- The program uses BIOS interrupts for input/output operations
- The code is written for 8086 architecture and uses the small memory model

## Troubleshooting

If you encounter issues:
1. Ensure you're using a compatible assembler
2. Verify that DOSBox is properly configured
3. Check that the assembly file doesn't contain any syntax errors for your specific assembler

Enjoy discovering your weekly horoscope!
