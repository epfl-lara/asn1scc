; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63164 () Bool)

(assert start!63164)

(declare-fun mapNonEmpty!812 () Bool)

(declare-fun mapRes!812 () Bool)

(declare-fun tp!813 () Bool)

(declare-fun tp_is_empty!323 () Bool)

(assert (=> mapNonEmpty!812 (= mapRes!812 (and tp!813 tp_is_empty!323))))

(declare-fun mapKey!813 () (_ BitVec 32))

(declare-datatypes ((T!50209 0))(
  ( (T!50210 (val!161 Int)) )
))
(declare-fun mapValue!813 () T!50209)

(declare-datatypes ((array!16357 0))(
  ( (array!16358 (arr!8058 (Array (_ BitVec 32) T!50209)) (size!7062 (_ BitVec 32))) )
))
(declare-fun a1!471 () array!16357)

(declare-fun mapRest!813 () (Array (_ BitVec 32) T!50209))

(assert (=> mapNonEmpty!812 (= (arr!8058 a1!471) (store mapRest!813 mapKey!813 mapValue!813))))

(declare-fun b!282758 () Bool)

(declare-fun e!202029 () Bool)

(assert (=> b!282758 (= e!202029 (and tp_is_empty!323 mapRes!812))))

(declare-fun condMapEmpty!813 () Bool)

(declare-fun mapDefault!812 () T!50209)

