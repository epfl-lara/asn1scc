; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68690 () Bool)

(assert start!68690)

(declare-fun b!309912 () Bool)

(declare-fun e!222792 () Bool)

(declare-fun tp_is_empty!959 () Bool)

(declare-fun mapRes!3049 () Bool)

(assert (=> b!309912 (= e!222792 (and tp_is_empty!959 mapRes!3049))))

(declare-fun condMapEmpty!3049 () Bool)

(declare-datatypes ((T!58345 0))(
  ( (T!58346 (val!479 Int)) )
))
(declare-datatypes ((array!18825 0))(
  ( (array!18826 (arr!9249 (Array (_ BitVec 32) T!58345)) (size!8166 (_ BitVec 32))) )
))
(declare-fun a2!566 () array!18825)

(declare-fun mapDefault!3049 () T!58345)

