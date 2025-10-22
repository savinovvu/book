#!/bin/bash

# Создаем файлы по всем темам
files=(
    # Java и JVM
    "1.Применение_профайлеров_и_опыт_использования.md" Java jvm Senior
    "2.Основные_параметры_JVM_при_старте_Xms_Xmx_Xss.md" Java jvm Senior
    "3.Reflection_для_работы_с_аннотациями.md" Java jvm Senior
    "4.Последние_тенденции_в_Java_и_следующий_релиз.md" Java jvm Senior
    "5.Профайлинг_инструменты_и_назначение.md" Java jvm Senior
    "6.Динамическая_загрузка_классов_и_загрузчики.md" Java jvm Senior
    "7.Внутреннее_устройство_коллекций_коллизии_equals_hashCode.md" Java jvm Senior
    "8.Настройка_GC_для_оптимизации_Java_приложения.md" Java jvm Senior
    "9.Логи_GC_чтение_и_использование.md" Java jvm Senior
    "10.Memory_dump_использование_и_назначение.md" Java jvm Senior
    "11.Применение_профайлеров_типы_и_влияние_на_приложение.md" Java jvm Senior

    # Design Patterns & Architecture
    "12.Принципы_SOLID.md" Senior java developer
    "13.Паттерны_объектно_ориентированного_программирования.md" Senior java developer
    "14.Статические_анализаторы_кода.md" Senior java developer
    "15.Princip_raboty_service_discovery.md" Senior java developer
    "16.Distributed_tracing.md" Senior java developer
    "17.Raznica_Load_balancer_i_reverse_proxy.md" Senior java developer
    "18.Otlichie_Weak_eventual_strong_consistency.md" Senior java developer
    "19.Varianty_read_write_masshtabirovaniya_dlya_DB.md" Senior java developer
    "20.CAP_teorema_primeri_CP_AP_sistem.md" Senior java developer
    "21.Patterny_integracii_API_v_mikroservisah.md" Senior java developer
    "22.Patterny_soglasovannosti_dannyh_2PC_Saga_Outbox_Event_sourcing_CQRS.md" Senior java developer
    "23.Infrastrukturnye_patterny_mikroservisov.md" Senior java developer
    "24.Osnovnye_koncepcii_DDD_domen_universalnyj_yazyk_ogranichennyj_kontekst.md" Senior java developer

    # Reactive Programming
    "25.Operacii_zip_concat_merge.md" Senior Java Reactor расскажи
    "26.Testirovanie_reaktivnogo_koda_reactor_test.md" Senior Java Reactor расскажи
    "27.Osnovnye_ponyatiya_Reactive_manifesto.md" Senior Java Reactor расскажи
    "28.Rasparallelivanie_reaktivnogo_koda.md" Senior Java Reactor расскажи
    "29.Rabota_publishOn_i_subscribeOn.md" Senior Java Reactor расскажи

    # Spring
    "30.Vzaimodejstvie_Project_Reactor_s_Spring_WebFlux_R2DBC_WebClient.md" Senior Java расскажи
    "31.Annotations_cacheable_transactional_async_ogranicheniya.md" Senior Java расскажи
    "32.Spring_Cloud_komponenty_i_ispolzovanie.md" Senior Java расскажи
    "33.Spring_WebFlux_komponenty_Flux_Mono_routing_handlers_clients_repositories.md" Senior Java расскажи
    "34.Bean_Post_Processor_i_Bean_Factory_Post_Processor.md" Senior Java расскажи
    "35.Generaciya_proksi_dlya_annotacij_Spring_Cacheable_Async_Transactional.md" Senior Java расскажи

    # Kotlin
    "36.Konvertaciya_Mono_Flux_v_coroutine.md"  Senior backend Kotlin расскажи
    "37.Izmeneniya_v_sintaksise_Kotlin_sravnenie_s_Java.md"  Senior backend Kotlin расскажи
    "38.Sozdanie_delegata.md"  Senior backend Kotlin расскажи
    "39.Vyzov_Java_koda_iz_Kotlin.md"  Senior backend Kotlin расскажи
    "40.Vyzov_Kotlin_extension_funkcij_iz_Java.md"  Senior backend Kotlin расскажи
    "41.Sealed_klassy.md"  Senior backend Kotlin расскажи
    "42.Ekvivalent_staticheskih_metodov_Java_v_Kotlin.md"  Senior backend Kotlin расскажи
    "43.Analog_try_with_resources_v_Kotlin.md"  Senior backend Kotlin расскажи
    "44.Analog_stream_api_v_Kotlin_osobennosti.md"  Senior backend Kotlin расскажи
    "45.Bezopasnyj_vyzov_i_operator_Elvisa.md"  Senior backend Kotlin расскажи
    "46.lateinit_ispolzovanie.md"  Senior backend Kotlin расскажи
    "47.Anonimnye_klassy_i_SAM_interfejsy.md"  Senior backend Kotlin расскажи
    "48.Data_class_otlichie_ot_obychnogo_klassa.md"  Senior backend Kotlin расскажи
    "49.Osnovnye_ponyatiya_coroutines.md"  Senior backend Kotlin расскажи
    "50.Inline_funkcii_i_klassy.md"  Senior backend Kotlin расскажи
    "51.Otlichie_Any_v_Kotlin_ot_Object_v_Java.md"  Senior backend Kotlin расскажи
    "52.Refleksiya_v_Kotlin.md"  Senior backend Kotlin расскажи
    "53.Ogranicheniya_zameny_sequence_na_stream.md"  Senior backend Kotlin расскажи
    "54.Otlichie_ierarhii_kollekcji_Kotlin_ot_Java.md"  Senior backend Kotlin расскажи
    "55.CoroutineScope_i_coroutineContext.md"  Senior backend Kotlin расскажи
    "56.Obrabotka_isklyuchenij_v_korutinah.md"  Senior backend Kotlin расскажи
    "57.Flow_otlichie_ot_Flux.md"  Senior backend Kotlin расскажи
    "58.Otlichie_invoke_run_apply_also.md"  Senior backend Kotlin расскажи
    "61.Vyzov_Kotlin_coroutine_iz_Java_koda.md"  Senior backend Kotlin расскажи
    "62.Vnutrennee_ustrojstvo_coroutines.md"  Senior backend Kotlin расскажи
    "63.Rabota_s_generic_tipom_otlichie_ot_Java.md"  Senior backend Kotlin расскажи
    "64.Realizaciya_suspend_funkcij_na_urovne_bajt_koda.md"  Senior backend Kotlin расскажи
    "65.Otlichiya_virtualnyh_potokov_i_korutin.md"  Senior backend Kotlin расскажи
    "66.Otlichie_Channel_ot_Flow.md"  Senior backend Kotlin расскажи

    # Базы данных
    "67.Normalizaciya_baz_dannyh.md" Senior java developer расскажи
    "69.Urovni_izolirovannosti_tranzakcij.md" Senior java developer расскажи
    "70.Particionirovanie_tablic.md" Senior java developer расскажи
    "71.Sohrannost_dannyh_replikaciya_zapis_chtenie.md" Senior java developer расскажи
    "72.Optimizaciya_zaprosov_plan_vypolneniya.md" Senior java developer расскажи
    "73.Raspredelennye_tranzakcii.md" Senior java developer расскажи
    "74.Write_ahead_log_transaction_log.md" Senior java developer расскажи

    # MongoDB
    "75.Replica_set_MongoDB.md" Senior java developer расскажи
    "76.Shardirovannyj_klaster_MongoDB_otkazoustojchivost.md" Senior java developer расскажи
    "77.Read_Write_concern_eventual_consistency.md" Senior java developer расскажи
    "78.Tranzakcii_v_MongoDB_garantii.md" Senior java developer расскажи
    "79.Vidy_indeksov_v_MongoDB.md" Senior java developer расскажи
    "80.Mehanizm_persistentnosti_MongoDB.md" Senior java developer расскажи
    "81.CAP_teorema_i_MongoDB_garantii.md" Senior java developer расскажи
    "82.WireTiger_i_blokirovki_v_MongoDB.md" Senior java developer расскажи
    "83.Mehanizm_oplog_v_MongoDB_replikaciya_i_vosstanovlenie.md" Senior java developer расскажи

    # Kafka
    "84.Kafka_komponenty_klastera.md" Senior developer расскажи
    "85.Offset_v_Kafka_hranenie.md" Senior developer расскажи
    "86.Politiki_ochistki_v_Kafka_razmer_segmenta.md" Senior developer расскажи
    "87.Transaction_log_v_Kafka.md" Senior developer расскажи
    "88.Particii_v_Kafka_vliyanie_zapis_soobschenij.md" Senior developer расскажи
    "89.Rebalans_v_Kafka_prodjusery_konsjumery_particii.md" Senior developer расскажи
    "90.Garantii_dostavki_v_Kafka_nastrojka.md" Senior developer расскажи
    "91.Otkazoustojchivost_Kafka_padenie_brokerov.md" Senior developer расскажи
    "92.Idempotent_producer.md" Senior developer расскажи
    "93.Garantii_poryadka_v_Kafka.md" Senior developer расскажи
)

# Создаем каждый файл
for file in "${files[@]}"; do
    touch "$file"
    echo "Создан файл: $file"
done

echo "Все файлы успешно созданы!"