-- CreateTable
CREATE TABLE "province_available" (
    "id_province" SERIAL NOT NULL,
    "province_name" TEXT NOT NULL,
    "code_province" INTEGER NOT NULL,

    CONSTRAINT "province_available_pkey" PRIMARY KEY ("id_province")
);

-- CreateTable
CREATE TABLE "hotel" (
    "id_hotel" SERIAL NOT NULL,
    "hotel_name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "id_province" INTEGER NOT NULL,

    CONSTRAINT "hotel_pkey" PRIMARY KEY ("id_hotel")
);

-- CreateTable
CREATE TABLE "receptionist" (
    "id_employee" SERIAL NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "work_contact" INTEGER NOT NULL,
    "id_hotel" INTEGER NOT NULL,

    CONSTRAINT "receptionist_pkey" PRIMARY KEY ("id_employee")
);

-- CreateTable
CREATE TABLE "client" (
    "id_client" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "principal_contact" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "emergency_number" TEXT NOT NULL,
    "gender" TEXT NOT NULL,
    "CIN" INTEGER NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "id_employee" INTEGER NOT NULL,

    CONSTRAINT "client_pkey" PRIMARY KEY ("id_client")
);

-- CreateTable
CREATE TABLE "service" (
    "id_service" SERIAL NOT NULL,
    "service_name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "reduction" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "service_pkey" PRIMARY KEY ("id_service")
);

-- CreateTable
CREATE TABLE "buy" (
    "id_buy" SERIAL NOT NULL,
    "id_client" INTEGER NOT NULL,
    "id_service" INTEGER NOT NULL,

    CONSTRAINT "buy_pkey" PRIMARY KEY ("id_buy")
);

-- CreateTable
CREATE TABLE "feedback" (
    "id_feedback" SERIAL NOT NULL,
    "comment" TEXT NOT NULL,
    "rating" INTEGER NOT NULL,
    "id_client" INTEGER NOT NULL,

    CONSTRAINT "feedback_pkey" PRIMARY KEY ("id_feedback")
);

-- CreateTable
CREATE TABLE "status_client" (
    "id_status_client" INTEGER NOT NULL,
    "status_arrived" INTEGER NOT NULL,
    "status_missing" INTEGER NOT NULL,
    "in_fidelity" BOOLEAN NOT NULL,
    "in_blacklist" BOOLEAN NOT NULL,
    "id_client" INTEGER NOT NULL,

    CONSTRAINT "status_client_pkey" PRIMARY KEY ("id_status_client")
);

-- CreateTable
CREATE TABLE "reservation" (
    "id_reservation" INTEGER NOT NULL,
    "date_arrived" TIMESTAMP(3) NOT NULL,
    "leaving_date" TIMESTAMP(3) NOT NULL,
    "number_of_person" INTEGER NOT NULL,
    "is_canceled" BOOLEAN NOT NULL,
    "id_client" INTEGER NOT NULL,

    CONSTRAINT "reservation_pkey" PRIMARY KEY ("id_reservation")
);

-- CreateTable
CREATE TABLE "payment" (
    "id_payment" SERIAL NOT NULL,
    "payment_date" TIMESTAMP(3) NOT NULL,
    "amount_paid" DOUBLE PRECISION NOT NULL,
    "number_night" INTEGER NOT NULL,
    "room_occupied" INTEGER NOT NULL,
    "deadline_payment" TEXT NOT NULL,
    "lending_status" BOOLEAN NOT NULL,
    "total_amount_status" BOOLEAN NOT NULL,
    "id_client" INTEGER NOT NULL,
    "id_employee" INTEGER NOT NULL,

    CONSTRAINT "payment_pkey" PRIMARY KEY ("id_payment")
);

-- CreateTable
CREATE TABLE "payment_method" (
    "id_payment_method" SERIAL NOT NULL,
    "mobile_money" BOOLEAN NOT NULL,
    "credit_card" BOOLEAN NOT NULL,
    "cash" BOOLEAN NOT NULL,

    CONSTRAINT "payment_method_pkey" PRIMARY KEY ("id_payment_method")
);

-- CreateTable
CREATE TABLE "choose" (
    "id_choose" SERIAL NOT NULL,
    "id_payment" INTEGER NOT NULL,
    "id_payment_method" INTEGER NOT NULL,

    CONSTRAINT "choose_pkey" PRIMARY KEY ("id_choose")
);

-- CreateTable
CREATE TABLE "room_features" (
    "id_features" INTEGER NOT NULL,
    "sea_view" BOOLEAN NOT NULL,
    "vip_category" BOOLEAN NOT NULL,
    "hot_water" BOOLEAN NOT NULL,
    "wifi_available" BOOLEAN NOT NULL,
    "room_service" BOOLEAN NOT NULL,
    "mini_bar" BOOLEAN NOT NULL,
    "flat_screen" BOOLEAN NOT NULL,

    CONSTRAINT "room_features_pkey" PRIMARY KEY ("id_features")
);

-- CreateTable
CREATE TABLE "room" (
    "id_room" SERIAL NOT NULL,
    "number" TEXT NOT NULL,
    "room_type" TEXT NOT NULL,
    "capacity_room" INTEGER NOT NULL,
    "id_reservation" INTEGER NOT NULL,
    "id_hotel" INTEGER NOT NULL,
    "id_features" INTEGER NOT NULL,

    CONSTRAINT "room_pkey" PRIMARY KEY ("id_room")
);

-- CreateTable
CREATE TABLE "promotion" (
    "id_promotion" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "begin" TIMESTAMP(3) NOT NULL,
    "end" TIMESTAMP(3) NOT NULL,
    "percent" INTEGER NOT NULL,

    CONSTRAINT "promotion_pkey" PRIMARY KEY ("id_promotion")
);

-- CreateTable
CREATE TABLE "have" (
    "id_have" SERIAL NOT NULL,
    "id_room" INTEGER NOT NULL,
    "id_promotion" INTEGER NOT NULL,

    CONSTRAINT "have_pkey" PRIMARY KEY ("id_have")
);

-- CreateTable
CREATE TABLE "season" (
    "id_season" INTEGER NOT NULL,
    "times" TEXT NOT NULL,
    "start_date" TIMESTAMP(3) NOT NULL,
    "end_date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "season_pkey" PRIMARY KEY ("id_season")
);

-- CreateTable
CREATE TABLE "price" (
    "id_price_by_season" SERIAL NOT NULL,
    "cost_per_night" DOUBLE PRECISION NOT NULL,
    "id_room" INTEGER NOT NULL,
    "id_season" INTEGER NOT NULL,

    CONSTRAINT "price_pkey" PRIMARY KEY ("id_price_by_season")
);

-- AddForeignKey
ALTER TABLE "hotel" ADD CONSTRAINT "hotel_id_province_fkey" FOREIGN KEY ("id_province") REFERENCES "province_available"("id_province") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "receptionist" ADD CONSTRAINT "receptionist_id_hotel_fkey" FOREIGN KEY ("id_hotel") REFERENCES "hotel"("id_hotel") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "client" ADD CONSTRAINT "client_id_employee_fkey" FOREIGN KEY ("id_employee") REFERENCES "receptionist"("id_employee") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "buy" ADD CONSTRAINT "buy_id_client_fkey" FOREIGN KEY ("id_client") REFERENCES "client"("id_client") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "buy" ADD CONSTRAINT "buy_id_service_fkey" FOREIGN KEY ("id_service") REFERENCES "service"("id_service") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "feedback" ADD CONSTRAINT "feedback_id_client_fkey" FOREIGN KEY ("id_client") REFERENCES "client"("id_client") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "status_client" ADD CONSTRAINT "status_client_id_client_fkey" FOREIGN KEY ("id_client") REFERENCES "client"("id_client") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reservation" ADD CONSTRAINT "reservation_id_client_fkey" FOREIGN KEY ("id_client") REFERENCES "client"("id_client") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment" ADD CONSTRAINT "payment_id_client_fkey" FOREIGN KEY ("id_client") REFERENCES "client"("id_client") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment" ADD CONSTRAINT "payment_id_employee_fkey" FOREIGN KEY ("id_employee") REFERENCES "receptionist"("id_employee") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "choose" ADD CONSTRAINT "choose_id_payment_fkey" FOREIGN KEY ("id_payment") REFERENCES "payment"("id_payment") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "choose" ADD CONSTRAINT "choose_id_payment_method_fkey" FOREIGN KEY ("id_payment_method") REFERENCES "payment_method"("id_payment_method") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "room" ADD CONSTRAINT "room_id_reservation_fkey" FOREIGN KEY ("id_reservation") REFERENCES "reservation"("id_reservation") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "room" ADD CONSTRAINT "room_id_hotel_fkey" FOREIGN KEY ("id_hotel") REFERENCES "hotel"("id_hotel") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "room" ADD CONSTRAINT "room_id_features_fkey" FOREIGN KEY ("id_features") REFERENCES "room_features"("id_features") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "have" ADD CONSTRAINT "have_id_room_fkey" FOREIGN KEY ("id_room") REFERENCES "room"("id_room") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "have" ADD CONSTRAINT "have_id_promotion_fkey" FOREIGN KEY ("id_promotion") REFERENCES "promotion"("id_promotion") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "price" ADD CONSTRAINT "price_id_room_fkey" FOREIGN KEY ("id_room") REFERENCES "room"("id_room") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "price" ADD CONSTRAINT "price_id_season_fkey" FOREIGN KEY ("id_season") REFERENCES "season"("id_season") ON DELETE RESTRICT ON UPDATE CASCADE;
