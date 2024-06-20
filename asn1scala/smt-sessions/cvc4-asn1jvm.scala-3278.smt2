; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74164 () Bool)

(assert start!74164)

(declare-fun mapNonEmpty!3492 () Bool)

(declare-fun mapRes!3493 () Bool)

(declare-fun tp!3493 () Bool)

(declare-fun tp_is_empty!1163 () Bool)

(assert (=> mapNonEmpty!3492 (= mapRes!3493 (and tp!3493 tp_is_empty!1163))))

(declare-datatypes ((T!66909 0))(
  ( (T!66910 (val!581 Int)) )
))
(declare-fun mapValue!3493 () T!66909)

(declare-fun mapRest!3493 () (Array (_ BitVec 32) T!66909))

(declare-datatypes ((array!21387 0))(
  ( (array!21388 (arr!10377 (Array (_ BitVec 32) T!66909)) (size!9285 (_ BitVec 32))) )
))
(declare-fun a2!451 () array!21387)

(declare-fun mapKey!3492 () (_ BitVec 32))

(assert (=> mapNonEmpty!3492 (= (arr!10377 a2!451) (store mapRest!3493 mapKey!3492 mapValue!3493))))

(declare-fun mapIsEmpty!3492 () Bool)

(declare-fun mapRes!3492 () Bool)

(assert (=> mapIsEmpty!3492 mapRes!3492))

(declare-fun b!327201 () Bool)

(declare-fun e!236354 () Bool)

(assert (=> b!327201 (= e!236354 (and tp_is_empty!1163 mapRes!3492))))

(declare-fun condMapEmpty!3492 () Bool)

(declare-fun a1!451 () array!21387)

(declare-fun mapDefault!3492 () T!66909)

