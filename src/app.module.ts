import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { CrudModule } from './crud/crud.module';
import { LibModule } from './lib/lib.module';
import { DatabaseModule } from './database/database.module';

// *************** | middlewares | ******************


@Module({
  controllers: [AppController],
  providers: [AppService],
  imports: [
    CrudModule, 
    LibModule, 
    DatabaseModule
  ],
  exports: [DatabaseModule]
})
export class AppModule {}
