/*
  Warnings:

  - Made the column `employee_id` on table `EmployeeExp` required. This step will fail if there are existing NULL values in that column.
  - Made the column `emp_exp` on table `ExpEndorsed` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "EmployeeExp" DROP CONSTRAINT "EmployeeExp_employee_id_fkey";

-- DropForeignKey
ALTER TABLE "ExpEndorsed" DROP CONSTRAINT "ExpEndorsed_emp_exp_fkey";

-- AlterTable
ALTER TABLE "EmployeeExp" ALTER COLUMN "company" DROP NOT NULL,
ALTER COLUMN "year_of_exp" DROP NOT NULL,
ALTER COLUMN "emp_id" DROP NOT NULL,
ALTER COLUMN "employee_id" SET NOT NULL;

-- AlterTable
ALTER TABLE "ExpEndorsed" ALTER COLUMN "emp_exp" SET NOT NULL,
ALTER COLUMN "endoresedBy" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "EmployeeExp" ADD CONSTRAINT "EmployeeExp_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "Employee"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExpEndorsed" ADD CONSTRAINT "ExpEndorsed_emp_exp_fkey" FOREIGN KEY ("emp_exp") REFERENCES "EmployeeExp"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
