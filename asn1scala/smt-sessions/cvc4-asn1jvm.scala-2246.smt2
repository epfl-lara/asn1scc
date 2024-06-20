; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57126 () Bool)

(assert start!57126)

(declare-fun b!261947 () Bool)

(declare-fun e!182357 () Bool)

(declare-fun tp_is_empty!197 () Bool)

(declare-fun mapRes!541 () Bool)

(assert (=> b!261947 (= e!182357 (and tp_is_empty!197 mapRes!541))))

(declare-fun condMapEmpty!541 () Bool)

(declare-datatypes ((T!45303 0))(
  ( (T!45304 (val!98 Int)) )
))
(declare-datatypes ((array!14540 0))(
  ( (array!14541 (arr!7332 (Array (_ BitVec 32) T!45303)) (size!6345 (_ BitVec 32))) )
))
(declare-fun a!411 () array!14540)

(declare-fun mapDefault!541 () T!45303)

