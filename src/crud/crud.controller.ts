import { Controller, Get, Post, Put, Patch,Delete, Body, Param } from '@nestjs/common';
import { Request, Response } from '@nestjs/common';
import { CrudService } from './crud.service';


@Controller('crud')
export class CrudController {
    constructor(
        private readonly crudService: CrudService
    ){}

    @Post('employee')
    async createEmployeeExp(@Body() body: Record<string, unknown>) {
        return this.crudService.createEmployee(body)

    }

    @Put('employee/:id')
    async updateEmployeeExp(@Param() params: any, @Body() body: Record<string, unknown>) {
        return this.crudService.updateEmployee(Number(params?.id), body)

    }
    @Get('employee/:id')
    async getEmployee(@Param() params: any) {
        return this.crudService.getEmployee(Number(params?.id))

    }

    @Delete('employee/:id')
    async activeDeacgtiveEmployee(@Param() params: any, @Body() body: any) {
        return this.crudService.activeDeactiveEmployee(Number(params?.id), body)

    }

}
