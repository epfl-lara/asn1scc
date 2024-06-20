; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74134 () Bool)

(assert start!74134)

(declare-fun b!327085 () Bool)

(declare-fun e!236272 () Bool)

(declare-fun tp_is_empty!1139 () Bool)

(declare-fun mapRes!3436 () Bool)

(assert (=> b!327085 (= e!236272 (and tp_is_empty!1139 mapRes!3436))))

(declare-fun condMapEmpty!3436 () Bool)

(declare-datatypes ((T!66805 0))(
  ( (T!66806 (val!569 Int)) )
))
(declare-datatypes ((array!21362 0))(
  ( (array!21363 (arr!10365 (Array (_ BitVec 32) T!66805)) (size!9273 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21362)

(declare-fun mapDefault!3436 () T!66805)

