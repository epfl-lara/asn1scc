; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68746 () Bool)

(assert start!68746)

(declare-fun b!310409 () Bool)

(declare-fun e!223027 () Bool)

(declare-fun tp_is_empty!1007 () Bool)

(declare-fun mapRes!3201 () Bool)

(assert (=> b!310409 (= e!223027 (and tp_is_empty!1007 mapRes!3201))))

(declare-fun condMapEmpty!3202 () Bool)

(declare-datatypes ((T!58553 0))(
  ( (T!58554 (val!503 Int)) )
))
(declare-datatypes ((array!18875 0))(
  ( (array!18876 (arr!9273 (Array (_ BitVec 32) T!58553)) (size!8190 (_ BitVec 32))) )
))
(declare-fun a1!566 () array!18875)

(declare-fun mapDefault!3201 () T!58553)

