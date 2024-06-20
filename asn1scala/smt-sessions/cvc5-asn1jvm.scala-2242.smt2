; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57094 () Bool)

(assert start!57094)

(declare-fun b!261822 () Bool)

(declare-fun e!182236 () Bool)

(declare-fun tp_is_empty!169 () Bool)

(declare-fun mapRes!496 () Bool)

(assert (=> b!261822 (= e!182236 (and tp_is_empty!169 mapRes!496))))

(declare-fun condMapEmpty!496 () Bool)

(declare-datatypes ((T!45195 0))(
  ( (T!45196 (val!84 Int)) )
))
(declare-datatypes ((array!14511 0))(
  ( (array!14512 (arr!7318 (Array (_ BitVec 32) T!45195)) (size!6331 (_ BitVec 32))) )
))
(declare-fun a!411 () array!14511)

(declare-fun mapDefault!496 () T!45195)

