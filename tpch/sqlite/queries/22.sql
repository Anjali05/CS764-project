-- $ID$
-- TPC-H/TPC-R Global Sales Opportunity Query (Q22)
-- Functional Query Definition
-- Approved February 1998
select
  cntrycode,
  count(*) as numcust,
  sum(c_acctbal) as totacctbal
from
  (
    select
      substr(
        c_phone, 1, 2) as cntrycode,
      c_acctbal
    from
      CUSTOMER
    where
      substr( c_phone, 1,  2) in (
        '13', '31', '23', '29', '30', '18', '17'
      )
      and c_acctbal > (
        select
          avg(c_acctbal)
        from
          CUSTOMER
        where
          c_acctbal > 0.00
          and substr(
            c_phone, 1, 2
          ) in (
            '13', '31', '23', '29', '30', '18', '17'
          )
      )
      and not exists (
        select
          *
        from
          ORDERS
        where
          o_custkey = c_custkey
      )
  ) as custsale
group by
  cntrycode
order by
  cntrycode;
