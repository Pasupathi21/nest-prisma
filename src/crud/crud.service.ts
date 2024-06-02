import { Body, Injectable, Param } from '@nestjs/common';
import { PrismaService } from 'src/database/database.service';
import { Prisma } from '@prisma/client'

@Injectable()
export class CrudService {
    constructor(
        private readonly prisma: PrismaService
    ) {}

    async createStudent(){
        this.prisma.student
    }
    async createCourse(){}
    async enrollCourse(){}

    async createEmployee(@Body() reqBody: Record<string, unknown> | any ) {
        return new Promise(async (resolve: (value: Record<string, any>) => void, reject: (value: Record<string, any>) => void) => {
            try{
               const createRes = await this.prisma.employee.create({ data: reqBody.employee })
               resolve(createRes)
            }catch(error){
                reject(error.message)
            }
        })
    }

    async updateEmployee(@Param() id: number,  @Body() reqBody: Record<string, unknown> | any ) {
        console.log("ID >>>>>", id)
        return new Promise(async (resolve: (value: Record<string, any>) => void, reject: (value: Record<string, any>) => void) => {
            try{
               const updateRes = await this.prisma.employee.update({
                where: {
                    id: Number(id)
                },
                data: reqBody.employee
               })
               resolve({
                message: "updated successfully",
                updateRes
               })
            }catch(error){
                reject(error.message)
            }
        })
    }
    async getEmployee(id: number) {
        console.log("getEmployee ID", id)
        return new Promise(async (resolve: (value: Record<string, any>) => void, reject: (value: Record<string, any>) => void) => {
            try{
                let getEmployee;
                if(id){
                    getEmployee = await this.prisma.employee.findUnique({
                        where: {
                            id: id
                        },
                        include: {
                            EmployeeExp: {
                                include: {
                                    ExpEndorsed: true
                                }
                            }
                        }
                    })
                }else {
                    getEmployee = await this.prisma.employee.findMany()
                }
               resolve({
                message: "data fetched successfully",
                getEmployee
               })
            }catch(error){
                reject(error.message)
            }
        })
    }
    async activeDeactiveEmployee(id: number, reqBody: any) {
        return new Promise(async (resolve: (value: Record<string, any>) => void, reject: (value: Record<string, any>) => void) => {
            try{
                let activeDeactive;
                if(id){
                    activeDeactive = await this.prisma.employee.update({
                        where: {
                            id: id
                        },
                        data: {
                            isActive: reqBody?.isActive
                        }
                    })
                }
               resolve({
                message: "active/deactive is successfully",
                activeDeactive
               })
            }catch(error){
                reject(error.message)
            }
        })
    }
}
