; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57186 () Bool)

(assert start!57186)

(declare-fun b!262270 () Bool)

(declare-fun e!182583 () Bool)

(declare-fun tp_is_empty!257 () Bool)

(declare-fun mapRes!631 () Bool)

(assert (=> b!262270 (= e!182583 (and tp_is_empty!257 mapRes!631))))

(declare-fun condMapEmpty!631 () Bool)

(declare-datatypes ((T!45563 0))(
  ( (T!45564 (val!128 Int)) )
))
(declare-datatypes ((array!14600 0))(
  ( (array!14601 (arr!7362 (Array (_ BitVec 32) T!45563)) (size!6375 (_ BitVec 32))) )
))
(declare-fun a!416 () array!14600)

(declare-fun mapDefault!631 () T!45563)

