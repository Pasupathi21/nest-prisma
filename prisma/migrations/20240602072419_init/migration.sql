-- DropForeignKey
ALTER TABLE "EmployeeExp" DROP CONSTRAINT "EmployeeExp_employee_id_fkey";

-- DropForeignKey
ALTER TABLE "ExpEndorsed" DROP CONSTRAINT "ExpEndorsed_emp_exp_fkey";

-- AlterTable
ALTER TABLE "EmployeeExp" ALTER COLUMN "employee_id" DROP NOT NULL;

-- AlterTable
ALTER TABLE "ExpEndorsed" ALTER COLUMN "emp_exp" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "EmployeeExp" ADD CONSTRAINT "EmployeeExp_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "Employee"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExpEndorsed" ADD CONSTRAINT "ExpEndorsed_emp_exp_fkey" FOREIGN KEY ("emp_exp") REFERENCES "EmployeeExp"("id") ON DELETE SET NULL ON UPDATE CASCADE;
