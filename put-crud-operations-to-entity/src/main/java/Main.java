import com.tanerdiler.aspectj.persistence.Repository;
import com.tanerdiler.aspectj.persistence.Student;



public class Main {
	public static void main (String[] args) {
		Student helloWorld = new Student();
		helloWorld.setId(5);
        helloWorld.save();
        System.out.println(Repository.get(Student.class, 5).getId());
	}
}
