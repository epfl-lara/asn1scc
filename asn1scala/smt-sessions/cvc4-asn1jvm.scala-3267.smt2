; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74088 () Bool)

(assert start!74088)

(declare-fun b!326841 () Bool)

(declare-fun e!236137 () Bool)

(declare-fun tp_is_empty!1097 () Bool)

(declare-fun mapRes!3370 () Bool)

(assert (=> b!326841 (= e!236137 (and tp_is_empty!1097 mapRes!3370))))

(declare-fun condMapEmpty!3370 () Bool)

(declare-datatypes ((T!66623 0))(
  ( (T!66624 (val!548 Int)) )
))
(declare-datatypes ((array!21319 0))(
  ( (array!21320 (arr!10344 (Array (_ BitVec 32) T!66623)) (size!9252 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21319)

(declare-fun mapDefault!3370 () T!66623)

