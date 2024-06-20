; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57196 () Bool)

(assert start!57196)

(declare-fun mapNonEmpty!643 () Bool)

(declare-fun mapRes!643 () Bool)

(declare-fun tp!643 () Bool)

(declare-fun tp_is_empty!263 () Bool)

(assert (=> mapNonEmpty!643 (= mapRes!643 (and tp!643 tp_is_empty!263))))

(declare-datatypes ((T!45589 0))(
  ( (T!45590 (val!131 Int)) )
))
(declare-fun mapRest!643 () (Array (_ BitVec 32) T!45589))

(declare-datatypes ((array!14607 0))(
  ( (array!14608 (arr!7365 (Array (_ BitVec 32) T!45589)) (size!6378 (_ BitVec 32))) )
))
(declare-fun a!416 () array!14607)

(declare-fun mapValue!643 () T!45589)

(declare-fun mapKey!643 () (_ BitVec 32))

(assert (=> mapNonEmpty!643 (= (arr!7365 a!416) (store mapRest!643 mapKey!643 mapValue!643))))

(declare-fun b!262324 () Bool)

(declare-fun e!182619 () Bool)

(assert (=> b!262324 (= e!182619 (and tp_is_empty!263 mapRes!643))))

(declare-fun condMapEmpty!643 () Bool)

(declare-fun mapDefault!643 () T!45589)

