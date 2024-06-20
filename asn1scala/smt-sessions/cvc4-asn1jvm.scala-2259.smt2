; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57208 () Bool)

(assert start!57208)

(declare-fun b!262414 () Bool)

(declare-fun e!182671 () Bool)

(declare-fun tp_is_empty!275 () Bool)

(declare-fun mapRes!661 () Bool)

(assert (=> b!262414 (= e!182671 (and tp_is_empty!275 mapRes!661))))

(declare-fun condMapEmpty!661 () Bool)

(declare-datatypes ((T!45641 0))(
  ( (T!45642 (val!137 Int)) )
))
(declare-datatypes ((array!14619 0))(
  ( (array!14620 (arr!7371 (Array (_ BitVec 32) T!45641)) (size!6384 (_ BitVec 32))) )
))
(declare-fun a!416 () array!14619)

(declare-fun mapDefault!661 () T!45641)

