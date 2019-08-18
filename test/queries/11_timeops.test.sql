﻿-------------------------------------------------------------------------------
-- Tests of operators that do not involved indexes for time types.
-- File TimeOps.c
-------------------------------------------------------------------------------

SELECT timestamptz '2000-01-01' -|- period '[2000-01-01, 2000-01-03]';
SELECT timestamptz '2000-01-01' -|- period '(2000-01-01, 2000-01-03]';

SELECT timestamptz '2000-01-01' -|- periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}';
SELECT timestamptz '2000-01-01' -|- periodset '{(2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}';

SELECT timestampset '{2000-01-01, 2000-01-03, 2000-01-05}' -|- period '[2000-01-01, 2000-01-03]';
SELECT timestampset '{2000-01-01, 2000-01-03, 2000-01-05}' -|- periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}';

SELECT period '[2000-01-01, 2000-01-03]' -|- timestamptz '2000-01-01';
SELECT period '[2000-01-01, 2000-01-03]' -|- timestampset '{2000-01-01, 2000-01-03, 2000-01-05}';
SELECT period '[2000-01-01, 2000-01-03]' -|- period '[2000-01-01, 2000-01-03]';
SELECT period '[2000-01-01, 2000-01-03]' -|- periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}';

SELECT periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}' -|- timestamptz '2000-01-01';
SELECT periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}' -|- timestampset '{2000-01-01, 2000-01-03, 2000-01-05}';
SELECT periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}' -|- period '[2000-01-01, 2000-01-03]';
SELECT periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}' -|- periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}';

-------------------------------------------------------------------------------

SELECT timestamptz '2000-01-01' + timestamptz '2000-01-01';
SELECT timestamptz '2000-01-01' + timestamptz '2000-01-02';
SELECT timestamptz '2000-01-01' + timestampset '{2000-01-02, 2000-01-03, 2000-01-05}';
SELECT timestamptz '2000-01-01' + timestampset '{2000-01-01, 2000-01-03, 2000-01-05}';
SELECT timestamptz '2000-01-05' + timestampset '{2000-01-01, 2000-01-03, 2000-01-05}';
SELECT timestamptz '2000-01-06' + timestampset '{2000-01-01, 2000-01-03, 2000-01-05}';
SELECT timestamptz '2000-01-01' + period '[2000-01-02, 2000-01-03]';
SELECT timestamptz '2000-01-01' + period '[2000-01-01, 2000-01-03]';
SELECT timestamptz '2000-01-01' + period '(2000-01-01, 2000-01-03]';
SELECT timestamptz '2000-01-02' + period '[2000-01-01, 2000-01-03]';
SELECT timestamptz '2000-01-03' + period '[2000-01-01, 2000-01-03]';
SELECT timestamptz '2000-01-03' + period '[2000-01-01, 2000-01-03)';
SELECT timestamptz '2000-01-05' + period '[2000-01-01, 2000-01-03]';
SELECT timestamptz '2000-01-01' + periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}';
SELECT timestamptz '2000-01-01' + periodset '{[2000-01-02, 2000-01-03],[2000-01-04, 2000-01-05]}';
SELECT timestamptz '2000-01-03' + periodset '{[2000-01-02, 2000-01-03],[2000-01-04, 2000-01-05]}';
SELECT timestamptz '2000-01-04' + periodset '{[2000-01-02, 2000-01-03],[2000-01-04, 2000-01-05]}';
SELECT timestamptz '2000-01-04' + periodset '{[2000-01-02, 2000-01-03],[2000-01-05, 2000-01-05]}';
SELECT timestamptz '2000-01-05' + periodset '{[2000-01-02, 2000-01-03],[2000-01-04, 2000-01-05]}';
SELECT timestamptz '2000-01-06' + periodset '{[2000-01-02, 2000-01-03],[2000-01-04, 2000-01-05]}';

SELECT timestampset '{2000-01-01, 2000-01-03, 2000-01-05}' + timestamptz '2000-01-01';
SELECT timestampset '{2000-01-01, 2000-01-03, 2000-01-05}' + timestampset '{2000-01-01, 2000-01-03, 2000-01-05}';
SELECT timestampset '{2000-01-01, 2000-01-03, 2000-01-05}' + timestampset '{2000-01-03, 2000-01-05, 2000-01-07}';
SELECT timestampset '{2000-01-01, 2000-01-03, 2000-01-05}' + period '[2000-01-01, 2000-01-03]';
SELECT timestampset '{2000-01-01, 2000-01-03, 2000-01-05}' + periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}';

SELECT period '[2000-01-01, 2000-01-03]' + timestamptz '2000-01-01';
SELECT period '[2000-01-01, 2000-01-03]' + timestampset '{2000-01-01, 2000-01-03, 2000-01-05}';
SELECT period '(2000-01-01, 2000-01-03]' + timestampset '{2000-01-01, 2000-01-03, 2000-01-05}';
SELECT period '[2000-01-01, 2000-01-03)' + timestampset '{2000-01-01, 2000-01-03, 2000-01-05}';
SELECT period '[2000-01-01, 2000-01-03]' + period '[2000-01-01, 2000-01-03]';
SELECT period '[2000-01-01, 2000-01-03]' + period '(2000-01-03, 2000-01-05]';
SELECT period '[2000-01-01, 2000-01-03]' + periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}';

SELECT periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}' + timestamptz '2000-01-01';
SELECT periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}' + timestampset '{2000-01-01, 2000-01-03, 2000-01-05}';
SELECT periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}' + period '[2000-01-01, 2000-01-03]';
SELECT periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}' + periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}';


select periodset '{[2000-01-03,2000-01-04],[2000-01-07,2000-01-08]}' + period '[2000-01-01,2000-01-02]';
select periodset '{[2000-01-03,2000-01-04],[2000-01-07,2000-01-08]}' + period '[2000-01-05,2000-01-06]';
select periodset '{[2000-01-03,2000-01-04],[2000-01-07,2000-01-08]}' + period '[2000-01-09,2000-01-10]';

select periodset '{[2000-01-03,2000-01-04],[2000-01-07,2000-01-08]}' + period '[2000-01-01,2000-01-03)';
select periodset '{[2000-01-03,2000-01-04],[2000-01-07,2000-01-08]}' + period '[2000-01-05,2000-01-07)';
select periodset '{[2000-01-03,2000-01-04],[2000-01-07,2000-01-08]}' + period '(2000-01-08,2000-01-10]';

select periodset '{[2000-01-03,2000-01-04],[2000-01-07,2000-01-08]}' + period '[2000-01-01,2000-01-03]';
select periodset '{[2000-01-03,2000-01-04],[2000-01-07,2000-01-08]}' + period '[2000-01-05,2000-01-07]';
select periodset '{[2000-01-03,2000-01-04],[2000-01-07,2000-01-08]}' + period '[2000-01-08,2000-01-10]';

select periodset '{[2000-01-01,2000-01-02],[2000-01-04,2000-01-05],[2000-01-07,2000-01-08]}' + period '[2000-01-03,2000-01-06]';
select periodset '{[2000-01-01,2000-01-02],[2000-01-04,2000-01-05],[2000-01-07,2000-01-08]}' + period '[2000-01-04,2000-01-06]';
select periodset '{[2000-01-01,2000-01-02],[2000-01-04,2000-01-05],[2000-01-07,2000-01-08]}' + period '[2000-01-03,2000-01-05]';

select periodset '{[2000-01-04,2000-01-05],[2000-01-07,2000-01-08]}' + period '[2000-01-01,2000-01-09]';
select periodset '{[2000-01-04,2000-01-05],[2000-01-07,2000-01-08]}' + period '[2000-01-01,2000-01-06]';
select periodset '{[2000-01-04,2000-01-05],[2000-01-07,2000-01-08]}' + period '[2000-01-06,2000-01-09]';

select periodset '{[2000-01-01,2000-01-02],[2000-01-05,2000-01-06]}' + periodset '{[2000-01-03,2000-01-04],[2000-01-07,2000-01-08]}';
select periodset '{[2000-01-01,2000-01-02],[2000-01-05,2000-01-06]}' + periodset '{[2000-01-01,2000-01-02],[2000-01-03,2000-01-04],[2000-01-07,2000-01-08]}';
SELECT periodset '{[2000-01-01, 2000-01-02],[2000-01-03, 2000-01-04], [2000-01-06, 2000-01-07]}' + periodset '{[2000-01-02, 2000-01-03],[2000-01-04, 2000-01-05]}';
SELECT periodset '{[2000-01-02, 2000-01-03],[2000-01-04, 2000-01-05]}' + periodset '{[2000-01-01, 2000-01-02],[2000-01-03, 2000-01-04], [2000-01-06, 2000-01-07]}';

-------------------------------------------------------------------------------

-- temporal_minus should be used otherwise it calls the PostgreSQL - between
-- timestamps that yields an interval
SELECT temporal_minus(timestamptz '2000-01-01', timestamptz '2000-01-01');
SELECT temporal_minus(timestamptz '2000-01-01', timestamptz '2000-01-02');
SELECT timestamptz '2000-01-01' - timestampset '{2000-01-02, 2000-01-03, 2000-01-05}';
SELECT timestamptz '2000-01-01' - timestampset '{2000-01-01, 2000-01-03, 2000-01-05}';
SELECT timestamptz '2000-01-05' - timestampset '{2000-01-01, 2000-01-03, 2000-01-05}';
SELECT timestamptz '2000-01-06' - timestampset '{2000-01-01, 2000-01-03, 2000-01-05}';
SELECT timestamptz '2000-01-01' - period '[2000-01-02, 2000-01-03]';
SELECT timestamptz '2000-01-01' - period '[2000-01-01, 2000-01-03]';
SELECT timestamptz '2000-01-01' - period '(2000-01-01, 2000-01-03]';
SELECT timestamptz '2000-01-02' - period '[2000-01-01, 2000-01-03]';
SELECT timestamptz '2000-01-03' - period '[2000-01-01, 2000-01-03]';
SELECT timestamptz '2000-01-03' - period '[2000-01-01, 2000-01-03)';
SELECT timestamptz '2000-01-05' - period '[2000-01-01, 2000-01-03]';
SELECT timestamptz '2000-01-01' - periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}';
SELECT timestamptz '2000-01-01' - periodset '{[2000-01-02, 2000-01-03],[2000-01-04, 2000-01-05]}';
SELECT timestamptz '2000-01-03' - periodset '{[2000-01-02, 2000-01-03],[2000-01-04, 2000-01-05]}';
SELECT timestamptz '2000-01-04' - periodset '{[2000-01-02, 2000-01-03],[2000-01-04, 2000-01-05]}';
SELECT timestamptz '2000-01-04' - periodset '{[2000-01-02, 2000-01-03],[2000-01-05, 2000-01-05]}';
SELECT timestamptz '2000-01-05' - periodset '{[2000-01-02, 2000-01-03],[2000-01-04, 2000-01-05]}';
SELECT timestamptz '2000-01-06' - periodset '{[2000-01-02, 2000-01-03],[2000-01-04, 2000-01-05]}';

SELECT timestampset '{2000-01-01}' - timestamptz '2000-01-01';
SELECT timestampset '{2000-01-01, 2000-01-03, 2000-01-05}' - timestamptz '2000-01-01';
SELECT timestampset '{2000-01-01, 2000-01-03, 2000-01-05}' - timestamptz '2000-01-02';
SELECT timestampset '{2000-01-01, 2000-01-03, 2000-01-05}' - timestampset '{2000-01-01, 2000-01-03, 2000-01-05}';
SELECT timestampset '{2000-01-01, 2000-01-03, 2000-01-05}' - timestampset '{2000-01-03, 2000-01-05, 2000-01-07}';
SELECT timestampset '{2000-01-01, 2000-01-03, 2000-01-05}' - period '[2000-01-01, 2000-01-03]';
SELECT timestampset '{2000-01-01, 2000-01-03, 2000-01-05}' - period '[2000-01-01, 2000-01-05]';
SELECT timestampset '{2000-01-01, 2000-01-04}' - periodset '{[2000-01-02, 2000-01-03],[2000-01-05, 2000-01-06]}';
SELECT timestampset '{2000-01-01, 2000-01-04}' - periodset '{[2000-01-02, 2000-01-03]}';
SELECT timestampset '{2000-01-01, 2000-01-03}' - periodset '{(2000-01-01, 2000-01-04)}';
SELECT timestampset '{2000-01-01, 2000-01-03, 2000-01-05}' - periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}';

SELECT period '[2000-01-01, 2000-01-01]' - timestamptz '2000-01-01';
SELECT period '[2000-01-01, 2000-01-03]' - timestamptz '2000-01-01';
SELECT period '[2000-01-01, 2000-01-01]' - timestampset '{2000-01-01, 2000-01-03, 2000-01-05}';
SELECT period '[2000-01-01, 2000-01-03]' - timestampset '{2000-01-01, 2000-01-03, 2000-01-05}';
SELECT period '(2000-01-01, 2000-01-03]' - timestampset '{2000-01-01, 2000-01-03, 2000-01-05}';
SELECT period '[2000-01-01, 2000-01-03)' - timestampset '{2000-01-01, 2000-01-03, 2000-01-05}';
SELECT period '[2000-01-01, 2000-01-03]' - timestampset '{2000-01-02, 2000-01-04}';
SELECT period '[2000-01-01, 2000-01-03]' - period '[2000-01-01, 2000-01-03]';
SELECT period '[2000-01-01, 2000-01-03]' - period '(2000-01-03, 2000-01-05]';
SELECT period '[2000-01-01, 2000-01-03]' - periodset '{[2000-01-01, 2000-01-02],[2000-01-04, 2000-01-05]}';
SELECT period '[2000-01-01, 2000-01-03]' - periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}';


select period '[2000-01-02, 2000-01-04]' - timestamptz '2000-01-01';
select period '[2000-01-02, 2000-01-04]' - timestamptz '2000-01-02';
select period '[2000-01-02, 2000-01-04]' - timestamptz '2000-01-03';
select period '[2000-01-02, 2000-01-04]' - timestamptz '2000-01-04';
select period '[2000-01-02, 2000-01-04]' - timestamptz '2000-01-05';
select period '(2000-01-02, 2000-01-04)' - timestamptz '2000-01-01';
select period '(2000-01-02, 2000-01-04)' - timestamptz '2000-01-02';
select period '(2000-01-02, 2000-01-04)' - timestamptz '2000-01-03';
select period '(2000-01-02, 2000-01-04)' - timestamptz '2000-01-04';
select period '(2000-01-02, 2000-01-04)' - timestamptz '2000-01-05';

SELECT periodset '{[2000-01-01, 2000-01-01]}' - timestamptz '2000-01-01';
SELECT periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}' - timestamptz '2000-01-01';
SELECT periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-06],[2000-01-07, 2000-01-08]}' - timestampset '{2000-01-01, 2000-01-03, 2000-01-05}';
SELECT periodset '{[2000-01-01, 2000-01-02],[2000-01-03, 2000-01-04]}' - timestampset '{2000-01-01, 2000-01-02}';
SELECT periodset '{[2000-01-01, 2000-01-02],[2000-01-04, 2000-01-05]}' - timestampset '{2000-01-03, 2000-01-06}';
SELECT periodset '{[2000-01-01, 2000-01-01],[2000-01-02, 2000-01-02]}' - timestampset '{2000-01-01, 2000-01-02, 2000-01-03}';
SELECT periodset '{[2000-01-02, 2000-01-04],[2000-01-06, 2000-01-06]}' - timestampset '{2000-01-01, 2000-01-05}';
SELECT periodset '{[2000-01-01, 2000-01-02),[2000-01-03, 2000-01-04)}' - timestampset '{2000-01-02, 2000-01-04, 2000-01-05}';
SELECT periodset '{[2000-01-01, 2000-01-02),[2000-01-03, 2000-01-04]}' - timestampset '{2000-01-02, 2000-01-04, 2000-01-05}';
SELECT periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}' - period '[2000-01-01, 2000-01-03]';
SELECT periodset '{[2000-01-01, 2000-01-03]}' - period '[2000-01-01, 2000-01-03]';
SELECT periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}' - periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}';
SELECT periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}' - periodset '{[2000-01-04, 2000-01-05]}';
SELECT periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}' - periodset '{[2000-01-01, 2000-01-03]}';

-------------------------------------------------------------------------------

SELECT timestamptz '2000-01-01' * timestamptz '2000-01-01';
SELECT timestamptz '2000-01-01' * timestamptz '2000-01-02';
SELECT timestamptz '2000-01-01' * timestampset '{2000-01-02, 2000-01-03, 2000-01-05}';
SELECT timestamptz '2000-01-01' * timestampset '{2000-01-01, 2000-01-03, 2000-01-05}';
SELECT timestamptz '2000-01-05' * timestampset '{2000-01-01, 2000-01-03, 2000-01-05}';
SELECT timestamptz '2000-01-06' * timestampset '{2000-01-01, 2000-01-03, 2000-01-05}';
SELECT timestamptz '2000-01-01' * period '[2000-01-02, 2000-01-03]';
SELECT timestamptz '2000-01-01' * period '[2000-01-01, 2000-01-03]';
SELECT timestamptz '2000-01-01' * period '(2000-01-01, 2000-01-03]';
SELECT timestamptz '2000-01-02' * period '[2000-01-01, 2000-01-03]';
SELECT timestamptz '2000-01-03' * period '[2000-01-01, 2000-01-03]';
SELECT timestamptz '2000-01-03' * period '[2000-01-01, 2000-01-03)';
SELECT timestamptz '2000-01-05' * period '[2000-01-01, 2000-01-03]';
SELECT timestamptz '2000-01-01' * periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}';
SELECT timestamptz '2000-01-01' * periodset '{[2000-01-02, 2000-01-03],[2000-01-04, 2000-01-05]}';
SELECT timestamptz '2000-01-03' * periodset '{[2000-01-02, 2000-01-03],[2000-01-04, 2000-01-05]}';
SELECT timestamptz '2000-01-04' * periodset '{[2000-01-02, 2000-01-03],[2000-01-04, 2000-01-05]}';
SELECT timestamptz '2000-01-04' * periodset '{[2000-01-02, 2000-01-03],[2000-01-05, 2000-01-05]}';
SELECT timestamptz '2000-01-05' * periodset '{[2000-01-02, 2000-01-03],[2000-01-04, 2000-01-05]}';
SELECT timestamptz '2000-01-06' * periodset '{[2000-01-02, 2000-01-03],[2000-01-04, 2000-01-05]}';

SELECT timestampset '{2000-01-01, 2000-01-03, 2000-01-05}' * timestamptz '2000-01-01';
SELECT timestampset '{2000-01-01, 2000-01-03, 2000-01-05}' * timestampset '{2000-01-01, 2000-01-03, 2000-01-05}';
SELECT timestampset '{2000-01-01, 2000-01-03, 2000-01-05}' * timestampset '{2000-01-03, 2000-01-05, 2000-01-07}';
SELECT timestampset '{2000-01-01, 2000-01-03}' * timestampset '{2000-01-02, 2000-01-04}';
SELECT timestampset '{2000-01-01, 2000-01-03, 2000-01-05}' * period '[2000-01-01, 2000-01-03]';
SELECT timestampset '{2000-01-01, 2000-01-03, 2000-01-05}' * periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}';
SELECT timestampset '{2000-01-01, 2000-01-04, 2000-01-07}' * periodset '{[2000-01-02, 2000-01-03],[2000-01-05, 2000-01-06]}';
SELECT timestampset '{2000-01-01,2000-01-03}' * periodset '{[2000-01-01,2000-01-02],[2000-01-04,2000-01-05]}';
SELECT timestampset '{2000-01-01, 2000-01-04, 2000-01-07}' * periodset '{[2000-01-02, 2000-01-03],[2000-01-05, 2000-01-06]}';
SELECT timestampset '{2000-01-03, 2000-01-06}' * periodset '{[2000-01-01, 2000-01-02],[2000-01-04, 2000-01-05]}';
SELECT timestampset '{2000-01-01, 2000-01-04}' * periodset '{(2000-01-01, 2000-01-03]}';

SELECT period '[2000-01-01, 2000-01-03]' * timestamptz '2000-01-01';
SELECT period '[2000-01-01, 2000-01-03]' * timestampset '{2000-01-01, 2000-01-03, 2000-01-05}';
SELECT period '(2000-01-01, 2000-01-03]' * timestampset '{2000-01-01, 2000-01-03, 2000-01-05}';
SELECT period '[2000-01-01, 2000-01-03)' * timestampset '{2000-01-01, 2000-01-03, 2000-01-05}';
SELECT period '[2000-01-01, 2000-01-03]' * period '[2000-01-01, 2000-01-03]';
SELECT period '[2000-01-01, 2000-01-03]' * period '(2000-01-03, 2000-01-05]';
SELECT period '[2000-01-01, 2000-01-03]' * periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}';
SELECT period '[2000-01-03, 2000-01-04]' * periodset '{[2000-01-01, 2000-01-02],[2000-01-05, 2000-01-06]}';

SELECT periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}' * timestamptz '2000-01-01';
SELECT periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}' * timestampset '{2000-01-01, 2000-01-03, 2000-01-05}';
SELECT periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}' * period '[2000-01-01, 2000-01-03]';
SELECT periodset '{[2000-01-01, 2000-01-02],[2000-01-03, 2000-01-04]}' * period '[2000-01-01, 2000-01-04]';
SELECT periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}' * periodset '{[2000-01-01, 2000-01-03],[2000-01-04, 2000-01-05]}';
SELECT periodset '{[2000-01-03, 2000-01-04],[2000-01-07, 2000-01-08]}' * periodset '{[2000-01-01, 2000-01-02],[2000-01-05, 2000-01-06]}';

-------------------------------------------------------------------------------