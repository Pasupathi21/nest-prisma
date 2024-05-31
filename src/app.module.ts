import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { CrudModule } from './crud/crud.module';


@Module({
  controllers: [AppController],
  providers: [AppService],
  imports: [CrudModule],
})
export class AppModule {}
