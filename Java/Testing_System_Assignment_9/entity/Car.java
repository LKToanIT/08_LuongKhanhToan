package org.example.Testing_System_Assignment_9.entity;

public class Car {
    private String name;
    private String type;
    public Car(String name, String type) {
        this.name = name;
        this.type = type;
    }

    @Override
    public String toString() {
        return "Car{" + "name='" + name + '\'' + ", type='" + type + '\'' + '}';
    }

    public class Engine {
        private String engineType;
        public Engine(String engineType) {
            this.engineType = engineType;
        }

        @Override
        public String toString() {
            return "Engine{" + "engineType='" + engineType + '\'' + '}';
        }

        public String getEngineType() {
            return engineType;
        }

        public void setEngineType(String engineType) {
            this.engineType = engineType;
        }
    }

    public static void exercise3Question2() {
        Car car = new Car("Mazda", "8WD");
        Car.Engine engine = car.new Engine("Crysler");
        System.out.println("Thong tin xe: " + car);
        System.out.println("Thong tin dong co: " + engine);
    }
}
