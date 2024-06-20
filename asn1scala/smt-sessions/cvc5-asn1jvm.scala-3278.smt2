; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74160 () Bool)

(assert start!74160)

(declare-fun b!327189 () Bool)

(declare-fun e!236342 () Bool)

(declare-fun tp_is_empty!1159 () Bool)

(declare-fun mapRes!3480 () Bool)

(assert (=> b!327189 (= e!236342 (and tp_is_empty!1159 mapRes!3480))))

(declare-fun condMapEmpty!3480 () Bool)

(declare-datatypes ((T!66905 0))(
  ( (T!66906 (val!579 Int)) )
))
(declare-datatypes ((array!21383 0))(
  ( (array!21384 (arr!10375 (Array (_ BitVec 32) T!66905)) (size!9283 (_ BitVec 32))) )
))
(declare-fun a2!451 () array!21383)

(declare-fun mapDefault!3480 () T!66905)

