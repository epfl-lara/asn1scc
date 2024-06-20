; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68730 () Bool)

(assert start!68730)

(declare-fun b!310254 () Bool)

(declare-fun e!222963 () Bool)

(declare-fun tp_is_empty!995 () Bool)

(declare-fun mapRes!3161 () Bool)

(assert (=> b!310254 (= e!222963 (and tp_is_empty!995 mapRes!3161))))

(declare-fun condMapEmpty!3162 () Bool)

(declare-datatypes ((T!58501 0))(
  ( (T!58502 (val!497 Int)) )
))
(declare-datatypes ((array!18862 0))(
  ( (array!18863 (arr!9267 (Array (_ BitVec 32) T!58501)) (size!8184 (_ BitVec 32))) )
))
(declare-fun a1!566 () array!18862)

(declare-fun mapDefault!3161 () T!58501)

