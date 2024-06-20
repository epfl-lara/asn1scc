; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74166 () Bool)

(assert start!74166)

(declare-fun b!327207 () Bool)

(declare-fun e!236360 () Bool)

(declare-fun tp_is_empty!1165 () Bool)

(declare-fun mapRes!3499 () Bool)

(assert (=> b!327207 (= e!236360 (and tp_is_empty!1165 mapRes!3499))))

(declare-fun condMapEmpty!3498 () Bool)

(declare-datatypes ((T!66931 0))(
  ( (T!66932 (val!582 Int)) )
))
(declare-datatypes ((array!21389 0))(
  ( (array!21390 (arr!10378 (Array (_ BitVec 32) T!66931)) (size!9286 (_ BitVec 32))) )
))
(declare-fun a2!451 () array!21389)

(declare-fun mapDefault!3499 () T!66931)

