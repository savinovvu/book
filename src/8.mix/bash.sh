#!/bin/bash

# Создаем файлы по всем темам
files=(
    # Java и JVM
    "1.Применение_профайлеров_и_опыт_использования.md"
    "2.Основные_параметры_JVM_при_старте_Xms_Xmx_Xss.md"
    "3.Reflection_для_работы_с_аннотациями.md"
    "4.Последние_тенденции_в_Java_и_следующий_релиз.md"
    "5.Профайлинг_инструменты_и_назначение.md"
    "6.Динамическая_загрузка_классов_и_загрузчики.md"
    "7.Внутреннее_устройство_коллекций_коллизии_equals_hashCode.md"
    "8.Настройка_GC_для_оптимизации_Java_приложения.md"
    "9.Логи_GC_чтение_и_использование.md"
    "10.Memory_dump_использование_и_назначение.md"
    "11.Применение_профайлеров_типы_и_влияние_на_приложение.md"

    # Design Patterns & Architecture
    "12.Принципы_SOLID.md"
    "13.Паттерны_объектно_ориентированного_программирования.md"
    "14.Статические_анализаторы_кода.md"
    "15.Princip_raboty_service_discovery.md"
    "16.Distributed_tracing.md"
    "17.Raznica_Load_balancer_i_reverse_proxy.md"
    "18.Otlichie_Weak_eventual_strong_consistency.md"
    "19.Varianty_read_write_masshtabirovaniya_dlya_DB.md"
    "20.CAP_teorema_primeri_CP_AP_sistem.md"
    "21.Patterny_integracii_API_v_mikroservisah.md"
    "22.Patterny_soglasovannosti_dannyh_2PC_Saga_Outbox_Event_sourcing_CQRS.md"
    "23.Infrastrukturnye_patterny_mikroservisov.md"
    "24.Osnovnye_koncepcii_DDD_domen_universalnyj_yazyk_ogranichennyj_kontekst.md"

    # Reactive Programming
    "25.Operacii_zip_concat_merge.md"
    "26.Testirovanie_reaktivnogo_koda_reactor_test.md"
    "27.Osnovnye_ponyatiya_Reactive_manifesto.md"
    "28.Rasparallelivanie_reaktivnogo_koda.md"
    "29.Rabota_publishOn_i_subscribeOn.md"
    "30.Vzaimodejstvie_Project_Reactor_s_Spring_WebFlux_R2DBC_WebClient.md"
    "31.Annotations_cacheable_transactional_async_ogranicheniya.md"
    "32.Spring_Cloud_komponenty_i_ispolzovanie.md"
    "33.Spring_WebFlux_komponenty_Flux_Mono_routing_handlers_clients_repositories.md"
    "34.Bean_Post_Processor_i_Bean_Factory_Post_Processor.md"
    "35.Generaciya_proksi_dlya_annotacij_Spring_Cacheable_Async_Transactional.md"

    # Kotlin
    "36.Konvertaciya_Mono_Flux_v_coroutine.md"
    "37.Izmeneniya_v_sintaksise_Kotlin_sravnenie_s_Java.md"
    "38.Sozdanie_delegata.md"
    "39.Vyzov_Java_koda_iz_Kotlin.md"
    "40.Vyzov_Kotlin_extension_funkcij_iz_Java.md"
    "41.Sealed_klassy.md"
    "42.Ekvivalent_staticheskih_metodov_Java_v_Kotlin.md"
    "43.Analog_try_with_resources_v_Kotlin.md"
    "44.Analog_stream_api_v_Kotlin_osobennosti.md"
    "45.Bezopasnyj_vyzov_i_operator_Elvisa.md"
    "46.lateinit_ispolzovanie.md"
    "47.Anonimnye_klassy_i_SAM_interfejsy.md"
    "48.Data_class_otlichie_ot_obychnogo_klassa.md"
    "49.Osnovnye_ponyatiya_coroutines.md"
    "50.Inline_funkcii_i_klassy.md"
    "51.Otlichie_Any_v_Kotlin_ot_Object_v_Java.md"
    "52.Refleksiya_v_Kotlin.md"
    "53.Ogranicheniya_zameny_sequence_na_stream.md"
    "54.Otlichie_ierarhii_kollekcji_Kotlin_ot_Java.md"
    "55.CoroutineScope_i_coroutineContext.md"
    "56.Obrabotka_isklyuchenij_v_korutinah.md"
    "57.Flow_otlichie_ot_Flux.md"
    "58.Otlichie_invoke_run_apply_also.md"
    "59.Delegaty_lazy_observable_vetoable.md"
    "60.Mono_Flux_v_coroutine.md"
    "61.Vyzov_Kotlin_coroutine_iz_Java_koda.md"
    "62.Vnutrennee_ustrojstvo_coroutines.md"
    "63.Rabota_s_generic_tipom_otlichie_ot_Java.md"
    "64.Realizaciya_suspend_funkcij_na_urovne_bajt_koda.md"
    "65.Otlichiya_virtualnyh_potokov_i_korutin.md"
    "66.Otlichie_Channel_ot_Flow.md"

    # Базы данных
    "67.Normalizaciya_baz_dannyh.md"
    "68.Principy_ACID.md"
    "69.Urovni_izolirovannosti_tranzakcij.md"
    "70.Particionirovanie_tablic.md"
    "71.Sohrannost_dannyh_replikaciya_zapis_chtenie.md"
    "72.Optimizaciya_zaprosov_plan_vypolneniya.md"
    "73.Raspredelennye_tranzakcii.md"
    "74.Write_ahead_log_transaction_log.md"

    # MongoDB
    "75.Replica_set_MongoDB.md"
    "76.Shardirovannyj_klaster_MongoDB_otkazoustojchivost.md"
    "77.Read_Write_concern_eventual_consistency.md"
    "78.Tranzakcii_v_MongoDB_garantii.md"
    "79.Vidy_indeksov_v_MongoDB.md"
    "80.Mehanizm_persistentnosti_MongoDB.md"
    "81.CAP_teorema_i_MongoDB_garantii.md"
    "82.WireTiger_i_blokirovki_v_MongoDB.md"
    "83.Mehanizm_oplog_v_MongoDB_replikaciya_i_vosstanovlenie.md"

    # Kafka
    "84.Kafka_komponenty_klastera.md"
    "85.Offset_v_Kafka_hranenie.md"
    "86.Politiki_ochistki_v_Kafka_razmer_segmenta.md"
    "87.Transaction_log_v_Kafka.md"
    "88.Particii_v_Kafka_vliyanie_zapis_soobschenij.md"
    "89.Rebalans_v_Kafka_prodjusery_konsjumery_particii.md"
    "90.Garantii_dostavki_v_Kafka_nastrojka.md"
    "91.Otkazoustojchivost_Kafka_padenie_brokerov.md"
    "92.Idempotent_producer.md"
    "93.Garantii_poryadka_v_Kafka.md"
)

# Создаем каждый файл
for file in "${files[@]}"; do
    touch "$file"
    echo "Создан файл: $file"
done

echo "Все файлы успешно созданы!"