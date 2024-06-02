-- CreateTable
CREATE TABLE "Employee" (
    "id" SERIAL NOT NULL,
    "employee_name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "Employee_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EmployeeExp" (
    "id" SERIAL NOT NULL,
    "company" TEXT NOT NULL,
    "year_of_exp" DOUBLE PRECISION NOT NULL,
    "emp_id" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "employee_id" INTEGER NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "EmployeeExp_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ExpEndorsed" (
    "id" SERIAL NOT NULL,
    "emp_exp" INTEGER NOT NULL,
    "endoresedBy" TEXT NOT NULL,
    "endorsed" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "ExpEndorsed_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "EmployeeExp" ADD CONSTRAINT "EmployeeExp_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "Employee"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExpEndorsed" ADD CONSTRAINT "ExpEndorsed_emp_exp_fkey" FOREIGN KEY ("emp_exp") REFERENCES "EmployeeExp"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
