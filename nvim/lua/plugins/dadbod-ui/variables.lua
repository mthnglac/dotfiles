Variable.g({
  dbs = {
    ['kirajs_dev'] = os.getenv('KIRAJS_DEV_DB_URL'),
    ['kirajs_test'] = os.getenv('KIRAJS_TEST_DB_URL'),
    ['billing_dev'] = os.getenv('BILLING_DEV_DB_URL'),
    ['billing_test'] = os.getenv('BILLING_TEST_DB_URL'),
    ['parasut_dev'] = os.getenv('PARASUT_DEV_DB_URL'),
    ['parasut_test'] = os.getenv('PARASUT_TEST_DB_URL'),
    ['parasut_activities_dev'] = os.getenv('PARASUT_ACTIVITIES_DEV_DB_URL'),
    ['parasut_activities_test'] = os.getenv('PARASUT_ACTIVITIES_TEST_DB_URL'),
    ['e_doc_broker_dev'] = os.getenv('E_DOC_BROKER_DEV_DB_URL'),
    ['e_doc_broker_test'] = os.getenv('E_DOC_BROKER_TEST_DB_URL'),
    ['post_office_dev'] = os.getenv('POST_OFFICE_DEV_DB_URL'),
    ['post_office_test'] = os.getenv('POST_OFFICE_TEST_DB_URL'),
  },
})
