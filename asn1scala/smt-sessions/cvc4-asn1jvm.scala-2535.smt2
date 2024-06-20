; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63980 () Bool)

(assert start!63980)

(declare-fun mapNonEmpty!1170 () Bool)

(declare-fun mapRes!1172 () Bool)

(declare-fun tp!1170 () Bool)

(declare-fun tp_is_empty!425 () Bool)

(assert (=> mapNonEmpty!1170 (= mapRes!1172 (and tp!1170 tp_is_empty!425))))

(declare-datatypes ((T!51311 0))(
  ( (T!51312 (val!212 Int)) )
))
(declare-datatypes ((array!16702 0))(
  ( (array!16703 (arr!8199 (Array (_ BitVec 32) T!51311)) (size!7203 (_ BitVec 32))) )
))
(declare-fun a2!623 () array!16702)

(declare-fun mapRest!1170 () (Array (_ BitVec 32) T!51311))

(declare-fun mapValue!1172 () T!51311)

(declare-fun mapKey!1170 () (_ BitVec 32))

(assert (=> mapNonEmpty!1170 (= (arr!8199 a2!623) (store mapRest!1170 mapKey!1170 mapValue!1172))))

(declare-fun b!284551 () Bool)

(declare-fun e!203401 () Bool)

(declare-fun mapRes!1170 () Bool)

(assert (=> b!284551 (= e!203401 (and tp_is_empty!425 mapRes!1170))))

(declare-fun condMapEmpty!1171 () Bool)

(declare-fun a3!63 () array!16702)

(declare-fun mapDefault!1172 () T!51311)

