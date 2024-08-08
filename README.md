# 19.5 Облачная инфраструктура. Terraform.  Никулин Александр
# Домашнее задание к занятию «Использование Terraform в команде»

<details>
  <summary>Исходники задания</summary>

  # hw-05
  https://github.com/netology-code/ter-homeworks/blob/main/05/hw-05.md
</details>

### Цели задания

1. Научиться использовать remote state с блокировками.
2. Освоить приёмы командной работы.


### Чек-лист готовности к домашнему заданию
<details>
  <summary>Исходники задания</summary>
  
  1. Зарегистрирован аккаунт в Yandex Cloud. Использован промокод на грант.
  2. Установлен инструмент Yandex CLI.
  3. Любые ВМ, использованные при выполнении задания, должны быть прерываемыми, для экономии средств.
</details>


### Задание 1
<details>
  <summary>Исходники задания</summary>
  
  1. Возьмите код:
     - из [ДЗ к лекции 4](https://github.com/netology-code/ter-homeworks/tree/main/04/src),
     - из [демо к лекции 4](https://github.com/netology-code/ter-homeworks/tree/main/04/demonstration1).
     > Сделал клон 4й задания и подготовил 5й репозиторий https://github.com/ADNikulin/hw-05/
  2. Проверьте код с помощью tflint и checkov. Вам не нужно инициализировать этот проект.
     > Установил и выполнил tflint \
     > ![image](https://github.com/user-attachments/assets/8daed30a-e18a-42e4-9bd7-84d156178479)

  3. Перечислите, какие **типы** ошибок обнаружены в проекте (без дублей).
     > - [terraform_module_pinned_source](https://github.com/terraform-linters/tflint-ruleset-terraform/blob/v0.8.0/docs/rules/terraform_required_providers.md)
     > - [terraform_unused_declarations](https://github.com/terraform-linters/tflint-ruleset-terraform/blob/v0.8.0/docs/rules/terraform_unused_declarations.md)
     > - [terraform_deprecated_interpolation](https://github.com/terraform-linters/tflint-ruleset-terraform/blob/v0.8.0/docs/rules/terraform_deprecated_interpolation.md)
     > - [terraform_module_pinned_source](https://github.com/terraform-linters/tflint-ruleset-terraform/blob/v0.8.0/docs/rules/terraform_module_pinned_source.md)
    
</details>

------

### Задание 2

<details>
  <summary>Исходники задания</summary>
  
  1. Возьмите ваш GitHub-репозиторий с **выполненным ДЗ 4** в ветке 'terraform-04' и сделайте из него ветку 'terraform-05'.
     > Подготовил ветку: https://github.com/ADNikulin/hw-05/tree/terraform-05
  2. Повторите демонстрацию лекции: настройте YDB, S3 bucket, yandex service account, права доступа и мигрируйте state проекта в S3 с блокировками. Предоставьте скриншоты процесса в качестве ответа.
     - Настроил бакет: ![image](https://github.com/user-attachments/assets/b66e0f8c-df49-4d09-89d4-e0572f06c7f4)
     - Настроил YMDB: ![image](https://github.com/user-attachments/assets/314e768b-97a5-41a1-b1f6-c03510d97848)
     - создал аккаунт: ![image](https://github.com/user-attachments/assets/1f99304c-7004-4e6e-afed-4a6d0990d1ed) \
     - ![image](https://github.com/user-attachments/assets/891b3cf2-e356-4a4a-81cf-81c4614696ab)

     - ![image](https://github.com/user-attachments/assets/12070b56-9f5c-4434-bbc5-5ff0d91c1994)
     - ![image](https://github.com/user-attachments/assets/1933f714-4a0d-44ec-b8ad-d9dcd3f3f9d8)
     - ![image](https://github.com/user-attachments/assets/83ce7055-2051-4ce2-a836-20dad4d57240)

  3. Закоммитьте в ветку 'terraform-05' все изменения.
     - https://github.com/ADNikulin/hw-05/commit/3c1d6b0f7c722e22e1808e5388ea53ea3b85de9c
  4. Откройте в проекте terraform console, а в другом окне из этой же директории попробуйте запустить terraform apply.
     - ![image](https://github.com/user-attachments/assets/0f14f0bf-b3fa-40d7-82be-c7930e25b59d)
     - ![image](https://github.com/user-attachments/assets/3daaf893-c888-4825-b3e1-a1aed14d87f4)

  5. Пришлите ответ об ошибке доступа к state.
     - ![image](https://github.com/user-attachments/assets/9e6fa316-a9be-4656-9282-a6d461401e98)

  7. Принудительно разблокируйте state. Пришлите команду и вывод.
     - ![image](https://github.com/user-attachments/assets/85a548a6-57d1-4e8b-9340-0f6e8f5ec4e8)

</details>

------
### Задание 3  
<details>
  <summary>Исходники задания</summary>
  
  1. Сделайте в GitHub из ветки 'terraform-05' новую ветку 'terraform-hotfix'.
  2. Проверье код с помощью tflint и checkov, исправьте все предупреждения и ошибки в 'terraform-hotfix', сделайте коммит.
  3. Откройте новый pull request 'terraform-hotfix' --> 'terraform-05'. 
  4. Вставьте в комментарий PR результат анализа tflint и checkov, план изменений инфраструктуры из вывода команды terraform plan.
  5. Пришлите ссылку на PR для ревью. Вливать код в 'terraform-05' не нужно.

  > [Пул реквест](https://github.com/ADNikulin/hw-05/pull/1)
</details>

------
### Задание 4
<details>
  <summary>Исходники задания</summary>
  
  1. Напишите переменные с валидацией и протестируйте их, заполнив default верными и неверными значениями. Предоставьте скриншоты проверок из terraform console. 
  
  - type=string, description="ip-адрес" — проверка, что значение переменной содержит верный IP-адрес с помощью функций cidrhost() или regex(). Тесты:  "192.168.0.1" и "1920.1680.0.1";
  - type=list(string), description="список ip-адресов" — проверка, что все адреса верны. Тесты:  ["192.168.0.1", "1.1.1.1", "127.0.0.1"] и ["192.168.0.1", "1.1.1.1", "1270.0.0.1"].

  > Как пример с кривыми названиями: 
  ```
  variable "ip_address" {
    description = "ip-адрес"
    type        = string
    default = "19200.168.0.1"
    validation {
      condition     = can(regex("^((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])\\.){3}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])$", var.ip_address))
      error_message = "Неправильный ip-адрес"
    }
  }
  
  variable "ip_address_list" {
    description = "список ip-адресов"
    type        = list(string)
    default     = ["192.16800.0.1", "1.1.1.1", "127.0.0.1"]
    validation {
      condition = alltrue([for ip in var.ip_address_list: can(regex("^((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])\\.){3}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])$", ip))])
      error_message = "Неправильный список ip-адресов"
    }
  }
  ```

  Далее если открываем terraform console в варианте выше: ![image](https://github.com/user-attachments/assets/a71879b9-c1db-404b-bb57-b552eac7a156)\
  И в случае когда результаты корректные: ![image](https://github.com/user-attachments/assets/a50c7421-cac0-4cc9-8bb7-216369130fea) \

  Можно ещё такой вариант: \
  ![image](https://github.com/user-attachments/assets/4e4478fa-72e7-46af-bb21-24ce52341cd3) \
  ![image](https://github.com/user-attachments/assets/1d2f22da-3f43-4998-b8ba-7f13fb558dbc) \

  ```
  variable "ip_address" {
    description = "ip-адрес"
    type        = string
    default = "192.1680.0.1"
    validation {
      condition     = can(cidrhost("${var.ip_address}/32", 0))
      error_message = "Неправильный ip-адрес"
    }
  }
  ```

  [Код|https://github.com/ADNikulin/hw-05/blob/terraform-hotfix/variables.tf]

</details>

## Дополнительные задания (со звёздочкой*)
  
**Настоятельно рекомендуем выполнять все задания со звёздочкой.** Их выполнение поможет глубже разобраться в материале.   
Задания со звёздочкой дополнительные, не обязательные к выполнению и никак не повлияют на получение вами зачёта по этому домашнему заданию. 
------
### Задание 5*

<details>
  <summary>Исходники задания</summary>
  
  1. Напишите переменные с валидацией:
    - type=string, description="любая строка" — проверка, что строка не содержит символов верхнего регистра;
    - type=object — проверка, что одно из значений равно true, а второе false, т. е. не допускается false false и true true:
      ```
      variable "in_the_end_there_can_be_only_one" {
          description="Who is better Connor or Duncan?"
          type = object({
              Dunkan = optional(bool)
              Connor = optional(bool)
          })
      
          default = {
              Dunkan = true
              Connor = false
          }
      
          validation {
              error_message = "There can be only one MacLeod"
              condition = <проверка>
          }
      }
      ```
</details>

------
### Задание 6*
<details>
  <summary>Исходники задания</summary>
  
  1. Настройте любую известную вам CI/CD-систему. Если вы ещё не знакомы с CI/CD-системами, настоятельно рекомендуем вернуться к этому заданию после изучения Jenkins/Teamcity/Gitlab.
  2. Скачайте с её помощью ваш репозиторий с кодом и инициализируйте инфраструктуру.
  3. Уничтожьте инфраструктуру тем же способом.
</details>

------
### Задание 7*
<details>
  <summary>Исходники задания</summary>
  
  1. Настройте отдельный terraform root модуль, который будет создавать YDB, s3 bucket для tfstate и сервисный аккаунт с необходимыми правами.
 
</details>
