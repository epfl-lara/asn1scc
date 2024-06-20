; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68518 () Bool)

(assert start!68518)

(declare-fun mapNonEmpty!2561 () Bool)

(declare-fun mapRes!2561 () Bool)

(declare-fun tp!2562 () Bool)

(declare-fun tp_is_empty!799 () Bool)

(assert (=> mapNonEmpty!2561 (= mapRes!2561 (and tp!2562 tp_is_empty!799))))

(declare-fun mapKey!2562 () (_ BitVec 32))

(declare-datatypes ((T!57665 0))(
  ( (T!57666 (val!399 Int)) )
))
(declare-datatypes ((array!18663 0))(
  ( (array!18664 (arr!9169 (Array (_ BitVec 32) T!57665)) (size!8086 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18663)

(declare-fun mapRest!2561 () (Array (_ BitVec 32) T!57665))

(declare-fun mapValue!2561 () T!57665)

(assert (=> mapNonEmpty!2561 (= (arr!9169 a2!524) (store mapRest!2561 mapKey!2562 mapValue!2561))))

(declare-fun mapIsEmpty!2561 () Bool)

(declare-fun mapRes!2562 () Bool)

(assert (=> mapIsEmpty!2561 mapRes!2562))

(declare-fun b!307871 () Bool)

(declare-fun e!221776 () Bool)

(assert (=> b!307871 (= e!221776 (and tp_is_empty!799 mapRes!2562))))

(declare-fun condMapEmpty!2562 () Bool)

(declare-fun a1!524 () array!18663)

(declare-fun mapDefault!2561 () T!57665)

