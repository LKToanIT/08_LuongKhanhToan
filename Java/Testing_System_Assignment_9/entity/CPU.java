package org.example.Testing_System_Assignment_9.entity;

public class CPU {
    private float price;
    public CPU(float price) {
        this.price = price;
        System.out.println("Outer class CPU");
    }

    public class Processor {
        private int coreAmount;
        private String menufacturer;
        public Processor(int coreAmount, String menufacturer) {
            this.coreAmount = coreAmount;
            this.menufacturer = menufacturer;
            System.out.println("Inner class Processor");
        }
        public double getCache() {
            return 4.3;
        }
    }

    public class RAM {
        private int memory;
        private String menufacturer;
        public RAM(int memory, String menufacturer) {
            super();
            this.memory = memory;
            this.menufacturer = menufacturer;
            System.out.println("Inner class RAM");
        }

        public double getClockSpeed() {
            return 5.5;
        }
    }

    public static void exercise3Question1() {
        CPU cpu = new CPU(11);
        CPU.Processor processor = cpu.new Processor(8, "day la processor");
        CPU.RAM ram = cpu.new RAM(16,"day la ram");
        System.out.println("Cache Processor: " + processor.getCache());
        System.out.println("Clock Speed RAM: " + ram.getClockSpeed());
    }
}
