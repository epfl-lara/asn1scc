; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68752 () Bool)

(assert start!68752)

(declare-fun mapNonEmpty!3219 () Bool)

(declare-fun mapRes!3220 () Bool)

(declare-fun tp!3219 () Bool)

(declare-fun tp_is_empty!1013 () Bool)

(assert (=> mapNonEmpty!3219 (= mapRes!3220 (and tp!3219 tp_is_empty!1013))))

(declare-datatypes ((T!58579 0))(
  ( (T!58580 (val!506 Int)) )
))
(declare-fun mapRest!3220 () (Array (_ BitVec 32) T!58579))

(declare-fun mapKey!3219 () (_ BitVec 32))

(declare-fun mapValue!3220 () T!58579)

(declare-datatypes ((array!18881 0))(
  ( (array!18882 (arr!9276 (Array (_ BitVec 32) T!58579)) (size!8193 (_ BitVec 32))) )
))
(declare-fun a2!566 () array!18881)

(assert (=> mapNonEmpty!3219 (= (arr!9276 a2!566) (store mapRest!3220 mapKey!3219 mapValue!3220))))

(declare-fun b!310481 () Bool)

(declare-fun e!223054 () Bool)

(assert (=> b!310481 (= e!223054 (and tp_is_empty!1013 mapRes!3220))))

(declare-fun condMapEmpty!3219 () Bool)

(declare-fun mapDefault!3220 () T!58579)

