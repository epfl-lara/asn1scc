; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74188 () Bool)

(assert start!74188)

(declare-fun mapNonEmpty!3564 () Bool)

(declare-fun mapRes!3564 () Bool)

(declare-fun tp!3564 () Bool)

(declare-fun tp_is_empty!1187 () Bool)

(assert (=> mapNonEmpty!3564 (= mapRes!3564 (and tp!3564 tp_is_empty!1187))))

(declare-datatypes ((T!67013 0))(
  ( (T!67014 (val!593 Int)) )
))
(declare-datatypes ((array!21411 0))(
  ( (array!21412 (arr!10389 (Array (_ BitVec 32) T!67013)) (size!9297 (_ BitVec 32))) )
))
(declare-fun a2!451 () array!21411)

(declare-fun mapValue!3565 () T!67013)

(declare-fun mapRest!3564 () (Array (_ BitVec 32) T!67013))

(declare-fun mapKey!3564 () (_ BitVec 32))

(assert (=> mapNonEmpty!3564 (= (arr!10389 a2!451) (store mapRest!3564 mapKey!3564 mapValue!3565))))

(declare-fun b!327273 () Bool)

(declare-fun e!236426 () Bool)

(declare-fun mapRes!3565 () Bool)

(assert (=> b!327273 (= e!236426 (and tp_is_empty!1187 mapRes!3565))))

(declare-fun condMapEmpty!3564 () Bool)

(declare-fun a1!451 () array!21411)

(declare-fun mapDefault!3565 () T!67013)

