; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68660 () Bool)

(assert start!68660)

(declare-fun mapNonEmpty!2959 () Bool)

(declare-fun mapRes!2960 () Bool)

(declare-fun tp!2960 () Bool)

(declare-fun tp_is_empty!929 () Bool)

(assert (=> mapNonEmpty!2959 (= mapRes!2960 (and tp!2960 tp_is_empty!929))))

(declare-fun mapKey!2960 () (_ BitVec 32))

(declare-datatypes ((T!58215 0))(
  ( (T!58216 (val!464 Int)) )
))
(declare-fun mapRest!2960 () (Array (_ BitVec 32) T!58215))

(declare-datatypes ((array!18795 0))(
  ( (array!18796 (arr!9234 (Array (_ BitVec 32) T!58215)) (size!8151 (_ BitVec 32))) )
))
(declare-fun a1!555 () array!18795)

(declare-fun mapValue!2960 () T!58215)

(assert (=> mapNonEmpty!2959 (= (arr!9234 a1!555) (store mapRest!2960 mapKey!2960 mapValue!2960))))

(declare-fun b!309698 () Bool)

(declare-fun e!222657 () Bool)

(declare-fun mapRes!2959 () Bool)

(assert (=> b!309698 (= e!222657 (and tp_is_empty!929 mapRes!2959))))

(declare-fun condMapEmpty!2960 () Bool)

(declare-fun a2!555 () array!18795)

(declare-fun mapDefault!2960 () T!58215)

