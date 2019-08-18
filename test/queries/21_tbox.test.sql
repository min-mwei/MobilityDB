﻿/*****************************************************************************
 * Tbox
 *****************************************************************************/

SELECT tbox 'TBOX((1.0, 2.0), (1.0, 2.0))'; -- Both X and T dimensions
SELECT tbox 'TBOX((1.0,), (1.0,))'; -- Only X dimension
SELECT tbox 'TBOX((, 2.0), (, 2.0))'; -- Only T dimension

SELECT tbox 'TBOX((4,3),(2,1))';

/* Errors */
SELECT tbox 'STBOX(1, 2)';
SELECT tbox 'TBOX(1, 2)';
SELECT tbox 'TBOX((AA, 2))';
SELECT tbox 'TBOX((1, AA))';
SELECT tbox 'TBOX((1, 2, 3))';
SELECT tbox 'TBOX((1, 2),3, 4))';
SELECT tbox 'TBOX((1, 2),(AA, 4))';
SELECT tbox 'TBOX((1, 2),(3, AA))';
SELECT tbox 'TBOX((1, 2),(3, 4)';

SELECT tbox(1,2,3,4);
SELECT tbox(4,3,2,1);
SELECT tbox(1,2);
SELECT tbox(2,1);
SELECT tboxt(1,2);
SELECT tboxt(2,1);

SELECT tbox_cmp(tbox 'TBOX((1.0, 2.0), (1.0, 2.0))', tbox 'TBOX((2.0, 2.0), (1.0, 2.0))'); 
SELECT tbox_cmp(tbox 'TBOX((2.0, 2.0), (1.0, 2.0))', tbox 'TBOX((1.0, 2.0), (1.0, 2.0))'); 
SELECT tbox_cmp(tbox 'TBOX((1.0, 2.0), (1.0, 2.0))', tbox 'TBOX((1.0, 3.0), (1.0, 2.0))'); 
SELECT tbox_cmp(tbox 'TBOX((1.0, 3.0), (1.0, 2.0))', tbox 'TBOX((1.0, 2.0), (1.0, 2.0))'); 
SELECT tbox_cmp(tbox 'TBOX((1.0, 2.0), (1.0, 2.0))', tbox 'TBOX((1.0, 2.0), (2.0, 2.0))'); 
SELECT tbox_cmp(tbox 'TBOX((1.0, 2.0), (2.0, 2.0))', tbox 'TBOX((1.0, 2.0), (1.0, 2.0))'); 
SELECT tbox_cmp(tbox 'TBOX((1.0, 2.0), (1.0, 2.0))', tbox 'TBOX((1.0, 2.0), (1.0, 3.0))'); 
SELECT tbox_cmp(tbox 'TBOX((1.0, 2.0), (1.0, 3.0))', tbox 'TBOX((1.0, 2.0), (1.0, 2.0))'); 

SELECT tbox_cmp(tbox 'TBOX((1.0, 2.0), (1.0, 2.0))', tbox 'TBOX((1.0, 2.0), (1.0, 2.0))'); 

SELECT tbox 'TBOX((1.0, 2.0), (1.0, 2.0))' = floatrange '[1, 2]'::tbox; 

-------------------------------------------------------------------------------

SELECT count(*) FROM tbl_tbox t1, tbl_tbox t2 where t1.b = t2.b;
SELECT count(*) FROM tbl_tbox t1, tbl_tbox t2 where t1.b <> t2.b;
SELECT count(*) FROM tbl_tbox t1, tbl_tbox t2 where t1.b < t2.b;
SELECT count(*) FROM tbl_tbox t1, tbl_tbox t2 where t1.b <= t2.b;
SELECT count(*) FROM tbl_tbox t1, tbl_tbox t2 where t1.b > t2.b;
SELECT count(*) FROM tbl_tbox t1, tbl_tbox t2 where t1.b >= t2.b;

SELECT count(*) FROM tbl_tfloat WHERE temp::tbox IS NOT NULL;
SELECT count(*) FROM tbl_tfloat WHERE temp::tbox IS NOT NULL;

SELECT count(*) FROM tbl_tbox t1, tbl_tbox t2 where t1.b && t2.b;
SELECT count(*) FROM tbl_tbox t1, tbl_tbox t2 where t1.b @> t2.b;
SELECT count(*) FROM tbl_tbox t1, tbl_tbox t2 where t1.b <@ t2.b;
SELECT count(*) FROM tbl_tbox t1, tbl_tbox t2 where t1.b ~= t2.b;

/*****************************************************************************/