------------------------------------------
-- Export file for user UDSP@EDWBASE    --
-- Created by PC on 2017/6/20, 14:19:34 --
------------------------------------------

set define off
spool udsp_db_structure.log

prompt
prompt Creating table COM_DATASOURCE
prompt =============================
prompt
create table COM_DATASOURCE
(
  pk_id      VARCHAR2(32) not null,
  name       VARCHAR2(64) not null,
  describe   VARCHAR2(256) not null,
  type       VARCHAR2(32) not null,
  note       VARCHAR2(4000),
  del_flg    CHAR(1) not null,
  crt_user   VARCHAR2(32) not null,
  crt_time   VARCHAR2(32) not null,
  upt_user   VARCHAR2(32) not null,
  upt_time   VARCHAR2(32) not null,
  impl_class VARCHAR2(256),
  model      VARCHAR2(32) not null
)
;
comment on column COM_DATASOURCE.pk_id
  is '����';
comment on column COM_DATASOURCE.name
  is '����((Ψһ��Ӣ��)';
comment on column COM_DATASOURCE.describe
  is '˵��';
comment on column COM_DATASOURCE.type
  is '����Դ����';
comment on column COM_DATASOURCE.note
  is '��ע';
comment on column COM_DATASOURCE.del_flg
  is 'ɾ����־��0��δɾ����1��ɾ��';
comment on column COM_DATASOURCE.crt_user
  is '������';
comment on column COM_DATASOURCE.crt_time
  is '����ʱ��';
comment on column COM_DATASOURCE.upt_user
  is '������';
comment on column COM_DATASOURCE.upt_time
  is '����ʱ��';
comment on column COM_DATASOURCE.impl_class
  is '�ӿ�ʵ����';
comment on column COM_DATASOURCE.model
  is '����ģ�飨IQ��OLQ��RTS��';
create index IDX_COM_DS_DELFLG on COM_DATASOURCE (DEL_FLG);
create index IDX_COM_DS_DELFLG_MODEL_NAME on COM_DATASOURCE (DEL_FLG, MODEL, NAME);
alter table COM_DATASOURCE
  add constraint PK_COM_DATASOURCE primary key (PK_ID);

prompt
prompt Creating table COM_OPERATION_LOG
prompt ================================
prompt
create table COM_OPERATION_LOG
(
  pk_id          VARCHAR2(32) not null,
  action_type    CHAR(1) not null,
  action_url     VARCHAR2(256) not null,
  action_user    VARCHAR2(32) not null,
  action_time    VARCHAR2(32) not null,
  action_content VARCHAR2(1024)
)
;
comment on column COM_OPERATION_LOG.pk_id
  is '����';
comment on column COM_OPERATION_LOG.action_type
  is '�������ͣ�1��� 2���� 3ɾ�� 4��ѯ��';
comment on column COM_OPERATION_LOG.action_url
  is '����URL';
comment on column COM_OPERATION_LOG.action_user
  is '�����û�';
comment on column COM_OPERATION_LOG.action_time
  is '����ʱ��';
comment on column COM_OPERATION_LOG.action_content
  is '������Ϣ';
alter table COM_OPERATION_LOG
  add constraint PK_MC_PROPERTIES_LOG primary key (PK_ID);

prompt
prompt Creating table COM_PROPERTIES
prompt =============================
prompt
create table COM_PROPERTIES
(
  pk_id    VARCHAR2(32) not null,
  fk_id    VARCHAR2(32) not null,
  name     VARCHAR2(256) not null,
  value    VARCHAR2(4000) not null,
  describe VARCHAR2(4000)
)
;
comment on column COM_PROPERTIES.pk_id
  is '����';
comment on column COM_PROPERTIES.fk_id
  is '���ID';
comment on column COM_PROPERTIES.name
  is '����';
comment on column COM_PROPERTIES.value
  is '��ֵ';
comment on column COM_PROPERTIES.describe
  is '˵��';
alter table COM_PROPERTIES
  add constraint PK_PROPERTIES primary key (PK_ID);

prompt
prompt Creating table IQ_APPLICATION
prompt =============================
prompt
create table IQ_APPLICATION
(
  pk_id    VARCHAR2(32) not null,
  md_id    VARCHAR2(32) not null,
  name     VARCHAR2(64) not null,
  describe VARCHAR2(256) not null,
  note     VARCHAR2(4000),
  max_num  NUMBER(10),
  del_flg  CHAR(1) not null,
  crt_user VARCHAR2(32) not null,
  crt_time VARCHAR2(32) not null,
  upt_user VARCHAR2(32) not null,
  upt_time VARCHAR2(32) not null
)
;
comment on table IQ_APPLICATION
  is '������ѯ-Ӧ�ñ�';
comment on column IQ_APPLICATION.pk_id
  is '����';
comment on column IQ_APPLICATION.md_id
  is 'Ԫ����ID';
comment on column IQ_APPLICATION.name
  is '����(Ψһ��Ӣ��)';
comment on column IQ_APPLICATION.describe
  is '˵��';
comment on column IQ_APPLICATION.note
  is '��ע';
comment on column IQ_APPLICATION.max_num
  is '��󷵻���';
comment on column IQ_APPLICATION.del_flg
  is 'ɾ����־��0��δɾ����1��ɾ����';
comment on column IQ_APPLICATION.crt_user
  is '������';
comment on column IQ_APPLICATION.crt_time
  is '����ʱ��';
comment on column IQ_APPLICATION.upt_user
  is '������';
comment on column IQ_APPLICATION.upt_time
  is '����ʱ��';
create index IDX_IQ_APP_DELFLG on IQ_APPLICATION (DEL_FLG);
create index IDX_IQ_APP_DELFLG_MDID on IQ_APPLICATION (DEL_FLG, MD_ID);
create index IDX_IQ_APP_DELFLG_NAME on IQ_APPLICATION (DEL_FLG, NAME);
alter table IQ_APPLICATION
  add constraint PK_IQ_APPLICATION primary key (PK_ID);

prompt
prompt Creating table IQ_APPLICATION_ORDER_COLUMN
prompt ==========================================
prompt
create table IQ_APPLICATION_ORDER_COLUMN
(
  pk_id      VARCHAR2(32) not null,
  app_id     VARCHAR2(32) not null,
  seq        NUMBER(3) not null,
  name       VARCHAR2(64) not null,
  describe   VARCHAR2(256),
  type       VARCHAR2(32) not null,
  order_type VARCHAR2(32) not null
)
;
comment on table IQ_APPLICATION_ORDER_COLUMN
  is '������ѯ-�������';
comment on column IQ_APPLICATION_ORDER_COLUMN.pk_id
  is '����';
comment on column IQ_APPLICATION_ORDER_COLUMN.app_id
  is 'Ӧ��ID';
comment on column IQ_APPLICATION_ORDER_COLUMN.seq
  is '���';
comment on column IQ_APPLICATION_ORDER_COLUMN.name
  is '����((Ӣ��)';
comment on column IQ_APPLICATION_ORDER_COLUMN.describe
  is '˵��';
comment on column IQ_APPLICATION_ORDER_COLUMN.type
  is '����';
comment on column IQ_APPLICATION_ORDER_COLUMN.order_type
  is '��������(ASC��DESC)';
create index IDX_IQ_APP_ORDER_COL_APPID on IQ_APPLICATION_ORDER_COLUMN (APP_ID);
alter table IQ_APPLICATION_ORDER_COLUMN
  add constraint PK_IQ_APPLICATION_ORDER_COLUMN primary key (PK_ID);

prompt
prompt Creating table IQ_APPLICATION_QUERY_COLUMN
prompt ==========================================
prompt
create table IQ_APPLICATION_QUERY_COLUMN
(
  pk_id        VARCHAR2(32) not null,
  app_id       VARCHAR2(32) not null,
  seq          NUMBER(3) not null,
  name         VARCHAR2(64) not null,
  describe     VARCHAR2(256) not null,
  type         VARCHAR2(32),
  length       VARCHAR2(32),
  is_need      CHAR(1) not null,
  default_val  VARCHAR2(64),
  operator     VARCHAR2(32) not null,
  label        VARCHAR2(64),
  is_offer_out CHAR(1) not null
)
;
comment on table IQ_APPLICATION_QUERY_COLUMN
  is '������ѯ-��ѯ������';
comment on column IQ_APPLICATION_QUERY_COLUMN.pk_id
  is '����';
comment on column IQ_APPLICATION_QUERY_COLUMN.app_id
  is 'Ӧ��ID';
comment on column IQ_APPLICATION_QUERY_COLUMN.seq
  is '���';
comment on column IQ_APPLICATION_QUERY_COLUMN.name
  is '����((Ӣ��)';
comment on column IQ_APPLICATION_QUERY_COLUMN.describe
  is '˵��';
comment on column IQ_APPLICATION_QUERY_COLUMN.type
  is '����';
comment on column IQ_APPLICATION_QUERY_COLUMN.length
  is '����';
comment on column IQ_APPLICATION_QUERY_COLUMN.is_need
  is '�Ƿ���䣨0���ǣ�1����';
comment on column IQ_APPLICATION_QUERY_COLUMN.default_val
  is 'Ĭ��ֵ';
comment on column IQ_APPLICATION_QUERY_COLUMN.operator
  is '������';
comment on column IQ_APPLICATION_QUERY_COLUMN.label
  is '����';
comment on column IQ_APPLICATION_QUERY_COLUMN.is_offer_out
  is '�Ƿ񿪷�(0���ǣ�1����)';
create index IDX_IQ_APP_QUERY_COL_APPID on IQ_APPLICATION_QUERY_COLUMN (APP_ID);
alter table IQ_APPLICATION_QUERY_COLUMN
  add constraint PK_IQ_APPLICATION_QUERY_COLUMN primary key (PK_ID);

prompt
prompt Creating table IQ_APPLICATION_RETURN_COLUMN
prompt ===========================================
prompt
create table IQ_APPLICATION_RETURN_COLUMN
(
  pk_id    VARCHAR2(32) not null,
  app_id   VARCHAR2(32) not null,
  name     VARCHAR2(64) not null,
  describe VARCHAR2(256) not null,
  type     VARCHAR2(32),
  stats    VARCHAR2(32) not null,
  label    VARCHAR2(64),
  seq      NUMBER(3) not null,
  length   VARCHAR2(32)
)
;
comment on table IQ_APPLICATION_RETURN_COLUMN
  is '������ѯ-���ز�����';
comment on column IQ_APPLICATION_RETURN_COLUMN.pk_id
  is '����';
comment on column IQ_APPLICATION_RETURN_COLUMN.app_id
  is 'Ӧ��ID';
comment on column IQ_APPLICATION_RETURN_COLUMN.name
  is '����((Ψһ��Ӣ��)';
comment on column IQ_APPLICATION_RETURN_COLUMN.describe
  is '˵��';
comment on column IQ_APPLICATION_RETURN_COLUMN.type
  is '����';
comment on column IQ_APPLICATION_RETURN_COLUMN.stats
  is 'ͳ�ƺ���';
comment on column IQ_APPLICATION_RETURN_COLUMN.label
  is '����';
comment on column IQ_APPLICATION_RETURN_COLUMN.seq
  is '���';
comment on column IQ_APPLICATION_RETURN_COLUMN.length
  is '����';
create index IDX_IQ_APP_RETURN_COL_APPID on IQ_APPLICATION_RETURN_COLUMN (APP_ID);
alter table IQ_APPLICATION_RETURN_COLUMN
  add constraint PK_IQ_APPLICATION_RETURN_COLUM primary key (PK_ID);

prompt
prompt Creating table IQ_METADATA
prompt ==========================
prompt
create table IQ_METADATA
(
  pk_id    VARCHAR2(32) not null,
  ds_id    VARCHAR2(32) not null,
  name     VARCHAR2(64) not null,
  describe VARCHAR2(256) not null,
  note     VARCHAR2(4000),
  del_flg  CHAR(1) not null,
  crt_user VARCHAR2(32) not null,
  crt_time VARCHAR2(32) not null,
  upt_user VARCHAR2(32) not null,
  upt_time VARCHAR2(32) not null,
  tb_name  VARCHAR2(64) not null
)
;
comment on table IQ_METADATA
  is '����ʽ��ѯ-Ԫ���ݼ�';
comment on column IQ_METADATA.pk_id
  is '����';
comment on column IQ_METADATA.ds_id
  is '����ԴID';
comment on column IQ_METADATA.name
  is '����/����((Ψһ��Ӣ��)';
comment on column IQ_METADATA.describe
  is '˵��/��˵��';
comment on column IQ_METADATA.note
  is '��ע';
comment on column IQ_METADATA.del_flg
  is 'ɾ����־��0��δɾ����1��ɾ����';
comment on column IQ_METADATA.crt_user
  is '������';
comment on column IQ_METADATA.crt_time
  is '����ʱ��';
comment on column IQ_METADATA.upt_user
  is '������';
comment on column IQ_METADATA.upt_time
  is '����ʱ��';
comment on column IQ_METADATA.tb_name
  is '����';
create index IDX_IQ_MD_DELFLG on IQ_METADATA (DEL_FLG);
create index IDX_IQ_MD_DELFLG_DSID on IQ_METADATA (DEL_FLG, DS_ID);
create index IDX_IQ_MD_DELFLG_NAME on IQ_METADATA (DEL_FLG, NAME);
alter table IQ_METADATA
  add constraint PK_IQ_MATEDATA primary key (PK_ID);

prompt
prompt Creating table IQ_METADATA_COLUMN
prompt =================================
prompt
create table IQ_METADATA_COLUMN
(
  pk_id    VARCHAR2(32) not null,
  md_id    VARCHAR2(32) not null,
  seq      NUMBER(3) not null,
  name     VARCHAR2(64) not null,
  describe VARCHAR2(256) not null,
  type     CHAR(1) not null,
  length   VARCHAR2(32),
  note     VARCHAR2(4000),
  col_type VARCHAR2(32)
)
;
comment on table IQ_METADATA_COLUMN
  is '������ѯ-Ԫ�����ֶ��б�';
comment on column IQ_METADATA_COLUMN.pk_id
  is '����';
comment on column IQ_METADATA_COLUMN.md_id
  is 'Ԫ����ID';
comment on column IQ_METADATA_COLUMN.seq
  is '��ţ�������һ��ȷ��Ψһ��';
comment on column IQ_METADATA_COLUMN.name
  is '����((Ψһ��Ӣ��)';
comment on column IQ_METADATA_COLUMN.describe
  is '˵��';
comment on column IQ_METADATA_COLUMN.type
  is '����(1����ѯ�ֶΣ�2�������ֶ�)';
comment on column IQ_METADATA_COLUMN.length
  is '����';
comment on column IQ_METADATA_COLUMN.note
  is '��ע';
comment on column IQ_METADATA_COLUMN.col_type
  is '�ֶ�����';
create index IDX_IQ_MD_COL_MDID on IQ_METADATA_COLUMN (MD_ID);
alter table IQ_METADATA_COLUMN
  add constraint PK_IQ_METADATA_COLUMN primary key (PK_ID);

prompt
prompt Creating table MC_CONSUME_LOG
prompt =============================
prompt
create table MC_CONSUME_LOG
(
  pk_id              VARCHAR2(68) not null,
  user_name          VARCHAR2(32) not null,
  service_name       VARCHAR2(64),
  request_content    VARCHAR2(4000) not null,
  request_start_time VARCHAR2(32) not null,
  request_end_time   VARCHAR2(32) not null,
  run_start_time     VARCHAR2(32),
  run_end_time       VARCHAR2(32),
  response_content   VARCHAR2(512),
  status             CHAR(1) not null,
  error_code         VARCHAR2(32),
  app_type           VARCHAR2(32),
  request_type       CHAR(1) not null,
  app_name           VARCHAR2(64),
  message            VARCHAR2(4000),
  sync_type          VARCHAR2(32)
)
;
comment on table MC_CONSUME_LOG
  is '�������-������־';
comment on column MC_CONSUME_LOG.pk_id
  is '����';
comment on column MC_CONSUME_LOG.user_name
  is '�û���';
comment on column MC_CONSUME_LOG.service_name
  is '������';
comment on column MC_CONSUME_LOG.request_content
  is '��������';
comment on column MC_CONSUME_LOG.request_start_time
  is '����ʼʱ��';
comment on column MC_CONSUME_LOG.request_end_time
  is '�������ʱ��';
comment on column MC_CONSUME_LOG.run_start_time
  is 'ִ�п�ʼʱ��';
comment on column MC_CONSUME_LOG.run_end_time
  is 'ִ�н���ʱ��';
comment on column MC_CONSUME_LOG.response_content
  is '��Ӧ���ݣ��ļ�·������������Ϣ��Ϣ��';
comment on column MC_CONSUME_LOG.status
  is '���״̬(0���ɹ�1��ʧ��)';
comment on column MC_CONSUME_LOG.error_code
  is '������룬��UDSP���������ͬ';
comment on column MC_CONSUME_LOG.app_type
  is 'Ӧ�����ͣ�IQ��OLQ��MM��RTS_PRODUCER��RTS_CONSUMER��';
comment on column MC_CONSUME_LOG.request_type
  is '�������ͣ�0���ڲ����� 1���ⲿ����';
comment on column MC_CONSUME_LOG.app_name
  is 'Ӧ����';
comment on column MC_CONSUME_LOG.message
  is '������Ϣ��������Ϣ��ʾ';
comment on column MC_CONSUME_LOG.sync_type
  is 'ͬ��/�첽';
alter table MC_CONSUME_LOG
  add constraint PK_MC_CONSUME_LOG primary key (PK_ID);

prompt
prompt Creating table MM_APPLICATION
prompt =============================
prompt
create table MM_APPLICATION
(
  pk_id    VARCHAR2(32) not null,
  model_id VARCHAR2(32) not null,
  name     VARCHAR2(64) not null,
  describe VARCHAR2(256) not null,
  max_num  NUMBER(10),
  del_flg  CHAR(1) not null,
  crt_user VARCHAR2(32) not null,
  crt_time VARCHAR2(32) not null,
  upt_user VARCHAR2(32) not null,
  upt_time VARCHAR2(32) not null,
  note     VARCHAR2(4000)
)
;
comment on table MM_APPLICATION
  is 'ģ�͹���-Ӧ�ñ�';
comment on column MM_APPLICATION.pk_id
  is '����';
comment on column MM_APPLICATION.model_id
  is 'ģ��ID';
comment on column MM_APPLICATION.name
  is '����((Ӣ�ġ�Ψһ)';
comment on column MM_APPLICATION.describe
  is '˵��';
comment on column MM_APPLICATION.max_num
  is '��󷵻���';
comment on column MM_APPLICATION.del_flg
  is 'ɾ����־(0��δɾ����1��ɾ��)';
comment on column MM_APPLICATION.crt_user
  is '������';
comment on column MM_APPLICATION.crt_time
  is '����ʱ��';
comment on column MM_APPLICATION.upt_user
  is '������';
comment on column MM_APPLICATION.upt_time
  is '����ʱ��';
comment on column MM_APPLICATION.note
  is '��ע';
create index IDX_MM_APP_DELFLG on MM_APPLICATION (DEL_FLG);
alter table MM_APPLICATION
  add constraint PK_MM_APPLICATION primary key (PK_ID);

prompt
prompt Creating table MM_APPLICATION_EXECUTE_PARAM
prompt ===========================================
prompt
create table MM_APPLICATION_EXECUTE_PARAM
(
  pk_id       VARCHAR2(32) not null,
  seq         NUMBER(3) not null,
  name        VARCHAR2(64) not null,
  describe    VARCHAR2(256) not null,
  is_need     CHAR(1) not null,
  default_val VARCHAR2(256),
  app_id      VARCHAR2(32)
)
;
comment on table MM_APPLICATION_EXECUTE_PARAM
  is 'ģ�͹���-ִ�в�����';
comment on column MM_APPLICATION_EXECUTE_PARAM.pk_id
  is '����';
comment on column MM_APPLICATION_EXECUTE_PARAM.seq
  is '���';
comment on column MM_APPLICATION_EXECUTE_PARAM.name
  is '����((Ӣ��)';
comment on column MM_APPLICATION_EXECUTE_PARAM.describe
  is '˵��';
comment on column MM_APPLICATION_EXECUTE_PARAM.is_need
  is '�Ƿ���䣨0:�ǣ�1����';
comment on column MM_APPLICATION_EXECUTE_PARAM.default_val
  is 'Ĭ��ֵ';
comment on column MM_APPLICATION_EXECUTE_PARAM.app_id
  is 'ģ��Ӧ��ID';
create index IDX_MM_APP_EXE_APPID on MM_APPLICATION_EXECUTE_PARAM (APP_ID);
alter table MM_APPLICATION_EXECUTE_PARAM
  add constraint PK_MM_APPLICATION_EXECUTE_PARA primary key (PK_ID);

prompt
prompt Creating table MM_APPLICATION_RETURN_PARAM
prompt ==========================================
prompt
create table MM_APPLICATION_RETURN_PARAM
(
  pk_id    VARCHAR2(32) not null,
  seq      NUMBER(3) not null,
  name     VARCHAR2(64) not null,
  describe VARCHAR2(256) not null,
  app_id   VARCHAR2(32)
)
;
comment on table MM_APPLICATION_RETURN_PARAM
  is 'ģ�͹���-���ز�����';
comment on column MM_APPLICATION_RETURN_PARAM.pk_id
  is '����';
comment on column MM_APPLICATION_RETURN_PARAM.seq
  is '���';
comment on column MM_APPLICATION_RETURN_PARAM.name
  is '����((Ӣ��)';
comment on column MM_APPLICATION_RETURN_PARAM.describe
  is '˵��';
comment on column MM_APPLICATION_RETURN_PARAM.app_id
  is 'ģ��Ӧ��ID';
create index IDX_MM_APP_RET_APPID on MM_APPLICATION_RETURN_PARAM (APP_ID);
alter table MM_APPLICATION_RETURN_PARAM
  add constraint PK_MM_APPLICATION_RETURN_PARAM primary key (PK_ID);

prompt
prompt Creating table MM_CONTRACTOR
prompt ============================
prompt
create table MM_CONTRACTOR
(
  pk_id         VARCHAR2(32) not null,
  name          VARCHAR2(128) not null,
  http_url      VARCHAR2(256) not null,
  principal     VARCHAR2(32) not null,
  mobile        VARCHAR2(32) not null,
  note          VARCHAR2(4000),
  del_flg       CHAR(1) not null,
  crt_user      VARCHAR2(32) not null,
  crt_time      VARCHAR2(32) not null,
  upt_user      VARCHAR2(32) not null,
  upt_time      VARCHAR2(32) not null,
  extend_field1 VARCHAR2(128),
  extend_field2 VARCHAR2(128),
  cn_name       VARCHAR2(128),
  ftp_password  VARCHAR2(60)
)
;
comment on table MM_CONTRACTOR
  is 'ģ�͹���-���̹���';
comment on column MM_CONTRACTOR.pk_id
  is '����';
comment on column MM_CONTRACTOR.name
  is 'Ӣ������';
comment on column MM_CONTRACTOR.http_url
  is 'Զ������';
comment on column MM_CONTRACTOR.principal
  is '������';
comment on column MM_CONTRACTOR.mobile
  is '����绰';
comment on column MM_CONTRACTOR.note
  is '��ע';
comment on column MM_CONTRACTOR.del_flg
  is 'ɾ����־(0��δɾ����1��ɾ��)';
comment on column MM_CONTRACTOR.crt_user
  is '������';
comment on column MM_CONTRACTOR.crt_time
  is '����ʱ��';
comment on column MM_CONTRACTOR.upt_user
  is '������';
comment on column MM_CONTRACTOR.upt_time
  is '����ʱ��';
comment on column MM_CONTRACTOR.extend_field1
  is 'Ԥ���ֶ�1';
comment on column MM_CONTRACTOR.extend_field2
  is 'Ԥ���ֶ�2';
comment on column MM_CONTRACTOR.cn_name
  is '��������';
comment on column MM_CONTRACTOR.ftp_password
  is 'ftp��½����';
create index IDX_MM_CONT_DELFLG on MM_CONTRACTOR (DEL_FLG);
create index IDX_MM_CONT_DELFLG_NAME on MM_CONTRACTOR (DEL_FLG, NAME);
alter table MM_CONTRACTOR
  add constraint MM_CONTRACTOR_ID primary key (PK_ID);

prompt
prompt Creating table MM_MODEL_FILE
prompt ============================
prompt
create table MM_MODEL_FILE
(
  pk_id      VARCHAR2(32) not null,
  model_id   VARCHAR2(32) not null,
  name       VARCHAR2(64) not null,
  describe   VARCHAR2(256),
  ver_num    VARCHAR2(32) not null,
  ver_note   VARCHAR2(256),
  path       VARCHAR2(256) not null,
  content    BLOB,
  start_time VARCHAR2(32) not null,
  end_time   VARCHAR2(32) not null,
  operation  CHAR(1) not null
)
;
comment on table MM_MODEL_FILE
  is 'ģ�͹���-�ļ�����';
comment on column MM_MODEL_FILE.pk_id
  is '����';
comment on column MM_MODEL_FILE.model_id
  is 'ģ��ID';
comment on column MM_MODEL_FILE.name
  is '����';
comment on column MM_MODEL_FILE.describe
  is '˵��';
comment on column MM_MODEL_FILE.ver_num
  is '�汾��';
comment on column MM_MODEL_FILE.ver_note
  is '�汾ע��';
comment on column MM_MODEL_FILE.path
  is '·��';
comment on column MM_MODEL_FILE.content
  is '����';
comment on column MM_MODEL_FILE.start_time
  is '��������ʼʱ��';
comment on column MM_MODEL_FILE.end_time
  is '����������ʱ��';
comment on column MM_MODEL_FILE.operation
  is '������1����ӡ����£�2��ɾ����';
create index IDX_MM_MF_MMID_STIME_ETIME on MM_MODEL_FILE (MODEL_ID, START_TIME, END_TIME);
create index IDX_MM_MF_STIME_ETIME on MM_MODEL_FILE (START_TIME, END_TIME);
alter table MM_MODEL_FILE
  add constraint PK_MM_MODEL_FILE primary key (PK_ID);

prompt
prompt Creating table MM_MODEL_INFO
prompt ============================
prompt
create table MM_MODEL_INFO
(
  pk_id      VARCHAR2(32) not null,
  name       VARCHAR2(64) not null,
  describe   VARCHAR2(256) not null,
  ver_note   VARCHAR2(4000),
  ver_num    VARCHAR2(32),
  status     CHAR(1),
  note       VARCHAR2(4000),
  del_flg    CHAR(1) not null,
  crt_user   VARCHAR2(32) not null,
  crt_time   VARCHAR2(32) not null,
  upt_user   VARCHAR2(32) not null,
  upt_time   VARCHAR2(32) not null,
  contractor VARCHAR2(32) not null,
  model_type VARCHAR2(32) not null
)
;
comment on table MM_MODEL_INFO
  is 'ģ�͹���-ģ����Ϣ��';
comment on column MM_MODEL_INFO.pk_id
  is '����';
comment on column MM_MODEL_INFO.name
  is '����((Ӣ�ġ�Ψһ)';
comment on column MM_MODEL_INFO.describe
  is '˵��';
comment on column MM_MODEL_INFO.ver_note
  is '�汾ע��';
comment on column MM_MODEL_INFO.ver_num
  is '�汾��';
comment on column MM_MODEL_INFO.status
  is '����״̬(1����������2���ѷ�����3���鵵)';
comment on column MM_MODEL_INFO.note
  is '��ע';
comment on column MM_MODEL_INFO.del_flg
  is 'ɾ����־(0��δɾ����1��ɾ��)';
comment on column MM_MODEL_INFO.crt_user
  is '������';
comment on column MM_MODEL_INFO.crt_time
  is '����ʱ��';
comment on column MM_MODEL_INFO.upt_user
  is '������';
comment on column MM_MODEL_INFO.upt_time
  is '����ʱ��';
comment on column MM_MODEL_INFO.contractor
  is 'ģ�Ϳ�������ID';
comment on column MM_MODEL_INFO.model_type
  is '1��ͬ����2���첽��3������������ö��ŷָ�';
create index IDX_MM_MODEL_INFO_DELFLG on MM_MODEL_INFO (DEL_FLG);
create index IDX_MM_MODEL_INFO_DELFLG_CONID on MM_MODEL_INFO (DEL_FLG, CONTRACTOR);
create index IDX_MM_MODEL_INFO_DELFLG_NAME on MM_MODEL_INFO (DEL_FLG, NAME);
alter table MM_MODEL_INFO
  add constraint PK_MM_MODEL_INFO primary key (PK_ID);

prompt
prompt Creating table MM_MODEL_PARAM
prompt =============================
prompt
create table MM_MODEL_PARAM
(
  pk_id    VARCHAR2(32) not null,
  mm_id    VARCHAR2(32) not null,
  seq      NUMBER(3) not null,
  name     VARCHAR2(64) not null,
  describe VARCHAR2(256) not null,
  type     CHAR(1) not null,
  length   VARCHAR2(32),
  note     VARCHAR2(4000),
  col_type VARCHAR2(32)
)
;
comment on table MM_MODEL_PARAM
  is 'ģ�͹���-ģ���ֶ��б�';
comment on column MM_MODEL_PARAM.pk_id
  is '����';
comment on column MM_MODEL_PARAM.mm_id
  is 'ģ��ID';
comment on column MM_MODEL_PARAM.seq
  is '��ţ�������һ��ȷ��Ψһ��';
comment on column MM_MODEL_PARAM.name
  is '����((Ψһ��Ӣ��)';
comment on column MM_MODEL_PARAM.describe
  is '˵��';
comment on column MM_MODEL_PARAM.type
  is '����(1����ѯ�ֶΣ�2�������ֶ�)';
comment on column MM_MODEL_PARAM.length
  is '����';
comment on column MM_MODEL_PARAM.note
  is '��ע';
comment on column MM_MODEL_PARAM.col_type
  is '�ֶ�����';
create index IDX_MM_MODEL_PARAM_MMID on MM_MODEL_PARAM (MM_ID);
alter table MM_MODEL_PARAM
  add constraint PK_MM_MODEL_PARAM primary key (PK_ID);

prompt
prompt Creating table MM_MODEL_VER
prompt ===========================
prompt
create table MM_MODEL_VER
(
  pk_id      VARCHAR2(32) not null,
  model_name VARCHAR2(256) not null,
  ver_num    NUMBER(10) not null,
  ver_note   VARCHAR2(4000),
  crt_time   VARCHAR2(20) not null,
  ver_name   VARCHAR2(256)
)
;
comment on column MM_MODEL_VER.pk_id
  is '����';
comment on column MM_MODEL_VER.model_name
  is 'ģ������';
comment on column MM_MODEL_VER.ver_num
  is '�汾��';
comment on column MM_MODEL_VER.ver_note
  is '�汾��ע';
comment on column MM_MODEL_VER.crt_time
  is '����ʱ��';
comment on column MM_MODEL_VER.ver_name
  is '�汾����';
alter table MM_MODEL_VER
  add constraint PK_MM_MODEL_VER primary key (PK_ID);

prompt
prompt Creating table RC_SERVICE
prompt =========================
prompt
create table RC_SERVICE
(
  pk_id    VARCHAR2(32) not null,
  name     VARCHAR2(64),
  describe VARCHAR2(256),
  type     VARCHAR2(32),
  app_id   VARCHAR2(32),
  del_flg  CHAR(1),
  crt_user VARCHAR2(32),
  crt_time VARCHAR2(32),
  upt_user VARCHAR2(32),
  upt_time VARCHAR2(32)
)
;
comment on table RC_SERVICE
  is 'ע������-����ע���';
comment on column RC_SERVICE.pk_id
  is '����';
comment on column RC_SERVICE.name
  is '����';
comment on column RC_SERVICE.describe
  is '˵��';
comment on column RC_SERVICE.type
  is '���ͣ�IQ��������ѯ��MM��ģ�͹���OLQ��������ѯ��RTS-CUS��ʵʱ�������ߣ�RTS-PRO��ʵʱ�������ߣ�';
comment on column RC_SERVICE.app_id
  is 'Ӧ��ID';
comment on column RC_SERVICE.del_flg
  is 'ɾ����־��0��δɾ����1��ɾ����';
comment on column RC_SERVICE.crt_user
  is '������';
comment on column RC_SERVICE.crt_time
  is '����ʱ��';
comment on column RC_SERVICE.upt_user
  is '������';
comment on column RC_SERVICE.upt_time
  is '����ʱ��';
create index IDX_RC_SERVICE_DF on RC_SERVICE (DEL_FLG);
create index IDX_RC_SERVICE_DF_NAME on RC_SERVICE (DEL_FLG, NAME);
create index IDX_RC_SERVICE_DF_TYPE on RC_SERVICE (DEL_FLG, TYPE);
create index IDX_RC_SERVICE_DF_TYPE_APPID on RC_SERVICE (DEL_FLG, TYPE, APP_ID);
alter table RC_SERVICE
  add constraint PK_RC_SERVICE primary key (PK_ID);

prompt
prompt Creating table RC_USER_SERVICE
prompt ==============================
prompt
create table RC_USER_SERVICE
(
  pk_id         VARCHAR2(32) not null,
  user_id       VARCHAR2(32) not null,
  service_id    VARCHAR2(32) not null,
  ip_section    VARCHAR2(512),
  max_sync_num  NUMBER(10) not null,
  max_async_num NUMBER(10) not null,
  del_flg       CHAR(1) not null,
  crt_user      VARCHAR2(32) not null,
  crt_time      VARCHAR2(32) not null,
  upt_user      VARCHAR2(32) not null,
  upt_time      VARCHAR2(32) not null
)
;
comment on column RC_USER_SERVICE.pk_id
  is '����';
comment on column RC_USER_SERVICE.user_id
  is '�û�ID';
comment on column RC_USER_SERVICE.service_id
  is '����ID';
comment on column RC_USER_SERVICE.ip_section
  is 'IP��';
comment on column RC_USER_SERVICE.max_sync_num
  is '���ͬ��������';
comment on column RC_USER_SERVICE.max_async_num
  is '����첽������';
comment on column RC_USER_SERVICE.del_flg
  is 'ɾ����־��0��δɾ����1��ɾ����';
comment on column RC_USER_SERVICE.crt_user
  is '������';
comment on column RC_USER_SERVICE.crt_time
  is '����ʱ��';
comment on column RC_USER_SERVICE.upt_user
  is '������';
comment on column RC_USER_SERVICE.upt_time
  is '����ʱ��';
create index IDX_RC_USER_SERVICE_DF on RC_USER_SERVICE (DEL_FLG);
create index IDX_RC_USER_SERVICE_DF_SID on RC_USER_SERVICE (DEL_FLG, SERVICE_ID);
create index IDX_RC_USER_SERVICE_DF_SID_UID on RC_USER_SERVICE (DEL_FLG, SERVICE_ID, USER_ID);
alter table RC_USER_SERVICE
  add constraint PK_RC_USER_SERVICE primary key (PK_ID);

prompt
prompt Creating table RTS_CUSTOMER_CONFIG
prompt ==================================
prompt
create table RTS_CUSTOMER_CONFIG
(
  pk_id    VARCHAR2(32) not null,
  md_id    VARCHAR2(32) not null,
  name     VARCHAR2(64) not null,
  describe VARCHAR2(256) not null,
  group_id VARCHAR2(64) not null,
  note     VARCHAR2(4000),
  del_flg  CHAR(1) not null,
  crt_user VARCHAR2(32) not null,
  crt_time VARCHAR2(32) not null,
  upt_user VARCHAR2(32) not null,
  upt_time VARCHAR2(32) not null
)
;
comment on table RTS_CUSTOMER_CONFIG
  is 'ʵʱ��-����������';
comment on column RTS_CUSTOMER_CONFIG.pk_id
  is '����';
comment on column RTS_CUSTOMER_CONFIG.md_id
  is 'Ԫ����ID';
comment on column RTS_CUSTOMER_CONFIG.name
  is '����';
comment on column RTS_CUSTOMER_CONFIG.describe
  is '˵��';
comment on column RTS_CUSTOMER_CONFIG.group_id
  is '��';
comment on column RTS_CUSTOMER_CONFIG.note
  is '��ע';
comment on column RTS_CUSTOMER_CONFIG.del_flg
  is 'ɾ����־��0��δɾ����1��ɾ����';
comment on column RTS_CUSTOMER_CONFIG.crt_user
  is '������';
comment on column RTS_CUSTOMER_CONFIG.crt_time
  is '����ʱ��';
comment on column RTS_CUSTOMER_CONFIG.upt_user
  is '������';
comment on column RTS_CUSTOMER_CONFIG.upt_time
  is '����ʱ��';
create index IDX_RTS_CER_DELFLG on RTS_CUSTOMER_CONFIG (DEL_FLG);
create index IDX_RTS_CER_DELFLG_MDID on RTS_CUSTOMER_CONFIG (DEL_FLG, MD_ID);
create index IDX_RTS_CER_DELFLG_NAME on RTS_CUSTOMER_CONFIG (DEL_FLG, NAME);
alter table RTS_CUSTOMER_CONFIG
  add constraint PK_RTS_CUSTOMER_CONFIG primary key (PK_ID);

prompt
prompt Creating table RTS_METADATA
prompt ===========================
prompt
create table RTS_METADATA
(
  pk_id    VARCHAR2(32) not null,
  ds_id    VARCHAR2(32) not null,
  name     VARCHAR2(64) not null,
  describe VARCHAR2(256),
  note     VARCHAR2(4000),
  del_flg  CHAR(1) not null,
  crt_user VARCHAR2(32) not null,
  crt_time VARCHAR2(32) not null,
  upt_user VARCHAR2(32) not null,
  upt_time VARCHAR2(32) not null,
  topic    VARCHAR2(256) not null
)
;
comment on table RTS_METADATA
  is 'ʵʱ��-Ԫ��������';
comment on column RTS_METADATA.pk_id
  is '����';
comment on column RTS_METADATA.ds_id
  is '����ԴID';
comment on column RTS_METADATA.name
  is '����(Ӣ��)';
comment on column RTS_METADATA.describe
  is '˵��';
comment on column RTS_METADATA.note
  is '��ע';
comment on column RTS_METADATA.del_flg
  is 'ɾ����־��0��δɾ����1��ɾ����';
comment on column RTS_METADATA.crt_user
  is '������';
comment on column RTS_METADATA.crt_time
  is '����ʱ��';
comment on column RTS_METADATA.upt_user
  is '������';
comment on column RTS_METADATA.upt_time
  is '����ʱ��';
comment on column RTS_METADATA.topic
  is '����';
create index IDX_RTS_MD_DELFLG on RTS_METADATA (DEL_FLG);
create index IDX_RTS_MD_DELFLG_DSID on RTS_METADATA (DEL_FLG, DS_ID);
create index IDX_RTS_MD_DELFLG_NAME on RTS_METADATA (DEL_FLG, NAME);
alter table RTS_METADATA
  add constraint PK_RTS_METADATA primary key (PK_ID);

prompt
prompt Creating table RTS_METADATA_COLUMN
prompt ==================================
prompt
create table RTS_METADATA_COLUMN
(
  pk_id    VARCHAR2(32) not null,
  md_id    VARCHAR2(32) not null,
  seq      NUMBER(3) not null,
  name     VARCHAR2(64) not null,
  describe VARCHAR2(256) not null
)
;
comment on table RTS_METADATA_COLUMN
  is 'ʵʱ��-Ԫ�����ֶα�';
comment on column RTS_METADATA_COLUMN.pk_id
  is '����';
comment on column RTS_METADATA_COLUMN.md_id
  is 'Ԫ����ID';
comment on column RTS_METADATA_COLUMN.seq
  is '���';
comment on column RTS_METADATA_COLUMN.name
  is '����((Ψһ��Ӣ��)';
comment on column RTS_METADATA_COLUMN.describe
  is '˵��';
create index IDX_RTS_MD_COL_MDID on RTS_METADATA_COLUMN (MD_ID);
alter table RTS_METADATA_COLUMN
  add constraint PK_RTS_METADATA_COLUMN primary key (PK_ID);

prompt
prompt Creating table RTS_PRODUCRER_CONFIG
prompt ===================================
prompt
create table RTS_PRODUCRER_CONFIG
(
  pk_id    VARCHAR2(32) not null,
  md_id    VARCHAR2(32) not null,
  name     VARCHAR2(64) not null,
  describe VARCHAR2(256) not null,
  note     VARCHAR2(4000),
  del_flg  CHAR(1) not null,
  crt_user VARCHAR2(32) not null,
  crt_time VARCHAR2(32) not null,
  upt_user VARCHAR2(32) not null,
  upt_time VARCHAR2(32) not null
)
;
comment on table RTS_PRODUCRER_CONFIG
  is 'ʵʱ��-����������';
comment on column RTS_PRODUCRER_CONFIG.pk_id
  is '����';
comment on column RTS_PRODUCRER_CONFIG.md_id
  is 'Ԫ����ID';
comment on column RTS_PRODUCRER_CONFIG.name
  is '���ƣ�Ӣ�ģ�';
comment on column RTS_PRODUCRER_CONFIG.describe
  is '˵��';
comment on column RTS_PRODUCRER_CONFIG.note
  is '��ע';
comment on column RTS_PRODUCRER_CONFIG.del_flg
  is 'ɾ����־��0��δɾ����1��ɾ����';
comment on column RTS_PRODUCRER_CONFIG.crt_user
  is '������';
comment on column RTS_PRODUCRER_CONFIG.crt_time
  is '����ʱ��';
comment on column RTS_PRODUCRER_CONFIG.upt_user
  is '������';
comment on column RTS_PRODUCRER_CONFIG.upt_time
  is '����ʱ��';
create index IDX_RTS_PER_DELFLG on RTS_PRODUCRER_CONFIG (DEL_FLG);
create index IDX_RTS_PER_DELFLG_MDID on RTS_PRODUCRER_CONFIG (DEL_FLG, MD_ID);
create index IDX_RTS_PER_DELFLG_NAME on RTS_PRODUCRER_CONFIG (DEL_FLG, NAME);
alter table RTS_PRODUCRER_CONFIG
  add constraint PK_RTS_PRODUCRER_CONFIG primary key (PK_ID);

prompt
prompt Creating table T_GF_APPLICATION
prompt ===============================
prompt
create table T_GF_APPLICATION
(
  app_code    VARCHAR2(32) not null,
  app_name    VARCHAR2(256),
  app_comment VARCHAR2(512),
  app_status  INTEGER
)
;
alter table T_GF_APPLICATION
  add primary key (APP_CODE);

prompt
prompt Creating table T_GF_AUTH_RIGHT
prompt ==============================
prompt
create table T_GF_AUTH_RIGHT
(
  id        VARCHAR2(32) not null,
  auth_id   VARCHAR2(32),
  user_id   VARCHAR2(32),
  auth_type VARCHAR2(32),
  app_id    VARCHAR2(32)
)
;
alter table T_GF_AUTH_RIGHT
  add primary key (ID);

prompt
prompt Creating table T_GF_DICT
prompt ========================
prompt
create table T_GF_DICT
(
  dict_type_id VARCHAR2(64) not null,
  dict_id      VARCHAR2(64) not null,
  dict_name    VARCHAR2(512),
  status       INTEGER,
  sort_no      INTEGER,
  parent_id    VARCHAR2(64),
  seqno        VARCHAR2(256),
  appid        VARCHAR2(32) not null,
  filter       VARCHAR2(512)
)
;
alter table T_GF_DICT
  add primary key (DICT_TYPE_ID, DICT_ID);

prompt
prompt Creating table T_GF_DICT_TYPE
prompt =============================
prompt
create table T_GF_DICT_TYPE
(
  dict_type_id   VARCHAR2(64) not null,
  dict_type_name VARCHAR2(64),
  appid          VARCHAR2(32) not null
)
;
alter table T_GF_DICT_TYPE
  add primary key (DICT_TYPE_ID);

prompt
prompt Creating table T_GF_EMPLOYEE
prompt ============================
prompt
create table T_GF_EMPLOYEE
(
  emp_id      VARCHAR2(32) not null,
  job_id      VARCHAR2(32) not null,
  user_name   VARCHAR2(128),
  sex         INTEGER,
  birthday    VARCHAR2(10),
  status      VARCHAR2(32),
  card_no     VARCHAR2(10),
  card_type   VARCHAR2(6),
  indate      VARCHAR2(10),
  outdate     VARCHAR2(10),
  otel        VARCHAR2(32),
  mobile_no   VARCHAR2(20),
  htel        VARCHAR2(32),
  haddress    VARCHAR2(256),
  hzipcode    VARCHAR2(6),
  pemail      VARCHAR2(32),
  create_date DATE,
  app_id      VARCHAR2(32),
  orgid       VARCHAR2(32),
  emp_comment VARCHAR2(256),
  oemail      VARCHAR2(32),
  managerid   VARCHAR2(32),
  managername VARCHAR2(128)
)
;
alter table T_GF_EMPLOYEE
  add primary key (EMP_ID);

prompt
prompt Creating table T_GF_FUNCATION
prompt =============================
prompt
create table T_GF_FUNCATION
(
  func_id        VARCHAR2(32) not null,
  func_code      VARCHAR2(32) not null,
  func_name      VARCHAR2(64),
  is_func        VARCHAR2(32),
  displayorder   INTEGER,
  url_acction    VARCHAR2(128),
  parent_func_id VARCHAR2(32),
  appid          VARCHAR2(32) not null
)
;
alter table T_GF_FUNCATION
  add primary key (FUNC_ID);

prompt
prompt Creating table T_GF_LOG
prompt =======================
prompt
create table T_GF_LOG
(
  log_id          VARCHAR2(32) not null,
  action_type     VARCHAR2(32),
  action_url      VARCHAR2(256),
  create_user_id  VARCHAR2(32),
  is_func         VARCHAR2(32),
  app_id          VARCHAR2(32) not null,
  create_date     DATE not null,
  create_username VARCHAR2(32),
  log_body        VARCHAR2(4000)
)
;
alter table T_GF_LOG
  add primary key (LOG_ID);

prompt
prompt Creating table T_GF_LOGINUSER
prompt =============================
prompt
create table T_GF_LOGINUSER
(
  id              VARCHAR2(32) not null,
  emp_id          VARCHAR2(32) not null,
  user_id         VARCHAR2(32) not null,
  user_name       VARCHAR2(128),
  password        VARCHAR2(32),
  status          VARCHAR2(32),
  menu_type       VARCHAR2(256),
  create_date     DATE,
  update_userid   VARCHAR2(32),
  app_id          VARCHAR2(32),
  user_comment    VARCHAR2(256),
  valid_startdate VARCHAR2(10),
  valid_enddate   VARCHAR2(10)
)
;
alter table T_GF_LOGINUSER
  add primary key (ID);

prompt
prompt Creating table T_GF_MENU
prompt ========================
prompt
create table T_GF_MENU
(
  menuid       VARCHAR2(32) not null,
  menuname     VARCHAR2(60) not null,
  menulabel    VARCHAR2(80),
  menucode     VARCHAR2(120),
  isleaf       CHAR(1),
  parameter    VARCHAR2(256),
  displayorder INTEGER,
  app_id       VARCHAR2(64) not null,
  menu_action  VARCHAR2(256),
  parentmenuid VARCHAR2(40),
  menu_icon    VARCHAR2(120)
)
;
alter table T_GF_MENU
  add primary key (MENUID);

prompt
prompt Creating table T_GF_NEXTID
prompt ==========================
prompt
create table T_GF_NEXTID
(
  seq_type  VARCHAR2(64) not null,
  next_id   NUMBER(19),
  last_time DATE
)
;
alter table T_GF_NEXTID
  add primary key (SEQ_TYPE);

prompt
prompt Creating table T_GF_ORG
prompt =======================
prompt
create table T_GF_ORG
(
  orgid         VARCHAR2(32) not null,
  orgname       VARCHAR2(128),
  orgcode       VARCHAR2(256),
  org_level     INTEGER,
  org_seq       VARCHAR2(256) not null,
  org_type      VARCHAR2(32),
  org_address   VARCHAR2(256),
  zipcode       VARCHAR2(6),
  linkman       VARCHAR2(32),
  linktel       VARCHAR2(32),
  create_date   DATE,
  update_date   DATE,
  display_order INTEGER,
  org_comment   VARCHAR2(256),
  app_id        VARCHAR2(32),
  parent_orgid  VARCHAR2(32)
)
;
alter table T_GF_ORG
  add primary key (ORGID);

prompt
prompt Creating table T_GF_QUARTZ
prompt ==========================
prompt
create table T_GF_QUARTZ
(
  pk_id           VARCHAR2(32) not null,
  class_name      VARCHAR2(256),
  method          VARCHAR2(64),
  start_time      TIMESTAMP(6) default sysdate,
  end_time        TIMESTAMP(6),
  has_end_time    CHAR(1),
  task_name       VARCHAR2(512),
  status          CHAR(1) default 0,
  interval_time   NUMBER,
  exec_num        NUMBER,
  trigger_model   CHAR(1),
  trigger_time    VARCHAR2(8),
  circulate_model CHAR(1),
  week_model      VARCHAR2(16),
  month           VARCHAR2(2),
  day             VARCHAR2(2),
  period          CHAR(1),
  week            CHAR(1),
  period_model    CHAR(1),
  owner_server    VARCHAR2(32)
)
;
alter table T_GF_QUARTZ
  add primary key (PK_ID);

prompt
prompt Creating table T_GF_RES_AUTH
prompt ============================
prompt
create table T_GF_RES_AUTH
(
  id        VARCHAR2(32) not null,
  auth_id   VARCHAR2(32),
  auth_type VARCHAR2(32),
  res_id    VARCHAR2(32),
  app_id    VARCHAR2(32),
  res_type  VARCHAR2(32)
)
;
alter table T_GF_RES_AUTH
  add primary key (ID);

prompt
prompt Creating table T_GF_ROLE
prompt ========================
prompt
create table T_GF_ROLE
(
  roleid    VARCHAR2(32) not null,
  app_id    VARCHAR2(32) not null,
  rolename  VARCHAR2(64) not null,
  role_desc VARCHAR2(256)
)
;
alter table T_GF_ROLE
  add primary key (ROLEID, APP_ID);

prompt
prompt Creating table T_GF_SCHD_JOB
prompt ============================
prompt
create table T_GF_SCHD_JOB
(
  job_id            VARCHAR2(32) not null,
  job_name          VARCHAR2(64) not null,
  job_type          VARCHAR2(64) not null,
  command           VARCHAR2(512) not null,
  args              VARCHAR2(4000),
  schedule_type     VARCHAR2(32) not null,
  trigger_time      VARCHAR2(128) not null,
  enabled           CHAR(1) default '1' not null,
  running           CHAR(1) default '0',
  last_elapsed_time NUMBER(18),
  error_count       INTEGER default 0,
  last_error        VARCHAR2(1024),
  owner_server      VARCHAR2(64),
  last_run_time     DATE,
  active_time       DATE,
  last_run_server   VARCHAR2(128),
  update_time       DATE not null,
  update_user       VARCHAR2(32) not null,
  start_date        TIMESTAMP(6),
  end_date          TIMESTAMP(6)
)
;
alter table T_GF_SCHD_JOB
  add primary key (JOB_ID);

prompt
prompt Creating table T_GF_TASK_POOL
prompt =============================
prompt
create table T_GF_TASK_POOL
(
  id                  VARCHAR2(32) not null,
  name                VARCHAR2(128) not null,
  max_active          INTEGER not null,
  min_idle            INTEGER not null,
  idle_timeout        INTEGER not null,
  init_count          INTEGER not null,
  daemon              INTEGER not null,
  thread_priority     INTEGER not null,
  task_producer_name  VARCHAR2(128) not null,
  fetch_batch_size    INTEGER not null,
  sleep_on_idle       INTEGER not null,
  sleep_on_work_after INTEGER not null
)
;
create unique index IX_GF_TASK_POOL_NAME on T_GF_TASK_POOL (NAME);
alter table T_GF_TASK_POOL
  add primary key (ID);

prompt
prompt Creating table T_GF_USER_SESSION
prompt ================================
prompt
create table T_GF_USER_SESSION
(
  user_id    VARCHAR2(32) not null,
  client_ip  VARCHAR2(16),
  login_time TIMESTAMP(6)
)
;
alter table T_GF_USER_SESSION
  add primary key (USER_ID);


spool off
