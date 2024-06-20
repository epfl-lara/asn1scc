; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74112 () Bool)

(assert start!74112)

(declare-fun mapIsEmpty!3403 () Bool)

(declare-fun mapRes!3403 () Bool)

(assert (=> mapIsEmpty!3403 mapRes!3403))

(declare-fun b!326961 () Bool)

(declare-fun e!236205 () Bool)

(declare-fun tp_is_empty!1117 () Bool)

(assert (=> b!326961 (= e!236205 (and tp_is_empty!1117 mapRes!3403))))

(declare-fun condMapEmpty!3403 () Bool)

(declare-datatypes ((T!66723 0))(
  ( (T!66724 (val!558 Int)) )
))
(declare-datatypes ((array!21340 0))(
  ( (array!21341 (arr!10354 (Array (_ BitVec 32) T!66723)) (size!9262 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21340)

(declare-fun mapDefault!3403 () T!66723)

