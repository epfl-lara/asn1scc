; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74176 () Bool)

(assert start!74176)

(declare-fun b!327237 () Bool)

(declare-fun e!236390 () Bool)

(declare-fun tp_is_empty!1175 () Bool)

(declare-fun mapRes!3528 () Bool)

(assert (=> b!327237 (= e!236390 (and tp_is_empty!1175 mapRes!3528))))

(declare-fun condMapEmpty!3528 () Bool)

(declare-datatypes ((T!66961 0))(
  ( (T!66962 (val!587 Int)) )
))
(declare-datatypes ((array!21399 0))(
  ( (array!21400 (arr!10383 (Array (_ BitVec 32) T!66961)) (size!9291 (_ BitVec 32))) )
))
(declare-fun a1!451 () array!21399)

(declare-fun mapDefault!3529 () T!66961)

