; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74154 () Bool)

(assert start!74154)

(declare-fun mapIsEmpty!3462 () Bool)

(declare-fun mapRes!3463 () Bool)

(assert (=> mapIsEmpty!3462 mapRes!3463))

(declare-fun mapNonEmpty!3462 () Bool)

(declare-fun mapRes!3462 () Bool)

(declare-fun tp!3463 () Bool)

(declare-fun tp_is_empty!1153 () Bool)

(assert (=> mapNonEmpty!3462 (= mapRes!3462 (and tp!3463 tp_is_empty!1153))))

(declare-datatypes ((T!66879 0))(
  ( (T!66880 (val!576 Int)) )
))
(declare-fun mapRest!3463 () (Array (_ BitVec 32) T!66879))

(declare-fun mapValue!3462 () T!66879)

(declare-fun mapKey!3462 () (_ BitVec 32))

(declare-datatypes ((array!21377 0))(
  ( (array!21378 (arr!10372 (Array (_ BitVec 32) T!66879)) (size!9280 (_ BitVec 32))) )
))
(declare-fun a2!451 () array!21377)

(assert (=> mapNonEmpty!3462 (= (arr!10372 a2!451) (store mapRest!3463 mapKey!3462 mapValue!3462))))

(declare-fun b!327171 () Bool)

(declare-fun e!236325 () Bool)

(assert (=> b!327171 (= e!236325 (and tp_is_empty!1153 mapRes!3462))))

(declare-fun condMapEmpty!3463 () Bool)

(declare-fun mapDefault!3462 () T!66879)

