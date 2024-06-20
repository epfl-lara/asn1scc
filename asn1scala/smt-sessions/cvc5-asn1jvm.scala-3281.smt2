; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74178 () Bool)

(assert start!74178)

(declare-fun mapNonEmpty!3534 () Bool)

(declare-fun mapRes!3535 () Bool)

(declare-fun tp!3534 () Bool)

(declare-fun tp_is_empty!1177 () Bool)

(assert (=> mapNonEmpty!3534 (= mapRes!3535 (and tp!3534 tp_is_empty!1177))))

(declare-datatypes ((T!66983 0))(
  ( (T!66984 (val!588 Int)) )
))
(declare-fun mapValue!3534 () T!66983)

(declare-fun mapKey!3534 () (_ BitVec 32))

(declare-fun mapRest!3535 () (Array (_ BitVec 32) T!66983))

(declare-datatypes ((array!21401 0))(
  ( (array!21402 (arr!10384 (Array (_ BitVec 32) T!66983)) (size!9292 (_ BitVec 32))) )
))
(declare-fun a2!451 () array!21401)

(assert (=> mapNonEmpty!3534 (= (arr!10384 a2!451) (store mapRest!3535 mapKey!3534 mapValue!3534))))

(declare-fun mapIsEmpty!3534 () Bool)

(assert (=> mapIsEmpty!3534 mapRes!3535))

(declare-fun b!327243 () Bool)

(declare-fun e!236396 () Bool)

(declare-fun mapRes!3534 () Bool)

(assert (=> b!327243 (= e!236396 (and tp_is_empty!1177 mapRes!3534))))

(declare-fun condMapEmpty!3535 () Bool)

(declare-fun a1!451 () array!21401)

(declare-fun mapDefault!3534 () T!66983)

