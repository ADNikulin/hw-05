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
     - ![image](https://github.com/user-attachments/assets/bf8848e3-9e81-468f-85d0-1d26ef79922e)
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
  2. Повторите демонстрацию лекции: настройте YDB, S3 bucket, yandex service account, права доступа и мигрируйте state проекта в S3 с блокировками. Предоставьте скриншоты процесса в качестве ответа.
  3. Закоммитьте в ветку 'terraform-05' все изменения.
  4. Откройте в проекте terraform console, а в другом окне из этой же директории попробуйте запустить terraform apply.
  5. Пришлите ответ об ошибке доступа к state.
  6. Принудительно разблокируйте state. Пришлите команду и вывод.
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
</details>

------
### Задание 4
<details>
  <summary>Исходники задания</summary>
  
  1. Напишите переменные с валидацией и протестируйте их, заполнив default верными и неверными значениями. Предоставьте скриншоты проверок из terraform console. 
  
  - type=string, description="ip-адрес" — проверка, что значение переменной содержит верный IP-адрес с помощью функций cidrhost() или regex(). Тесты:  "192.168.0.1" и "1920.1680.0.1";
  - type=list(string), description="список ip-адресов" — проверка, что все адреса верны. Тесты:  ["192.168.0.1", "1.1.1.1", "127.0.0.1"] и ["192.168.0.1", "1.1.1.1", "1270.0.0.1"].
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
