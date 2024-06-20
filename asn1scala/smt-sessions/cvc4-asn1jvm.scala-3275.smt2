; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74140 () Bool)

(assert start!74140)

(declare-fun b!327112 () Bool)

(declare-fun e!236289 () Bool)

(declare-fun i!907 () (_ BitVec 32))

(assert (=> b!327112 (= e!236289 (and (not (= i!907 #b00000000000000000000000000000000)) (bvsge (bvsub i!907 #b00000000000000000000000000000001) i!907)))))

(declare-fun mapIsEmpty!3445 () Bool)

(declare-fun mapRes!3445 () Bool)

(assert (=> mapIsEmpty!3445 mapRes!3445))

(declare-fun mapNonEmpty!3445 () Bool)

(declare-fun tp!3445 () Bool)

(declare-fun tp_is_empty!1145 () Bool)

(assert (=> mapNonEmpty!3445 (= mapRes!3445 (and tp!3445 tp_is_empty!1145))))

(declare-datatypes ((T!66831 0))(
  ( (T!66832 (val!572 Int)) )
))
(declare-fun mapValue!3445 () T!66831)

(declare-datatypes ((array!21368 0))(
  ( (array!21369 (arr!10368 (Array (_ BitVec 32) T!66831)) (size!9276 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21368)

(declare-fun mapRest!3445 () (Array (_ BitVec 32) T!66831))

(declare-fun mapKey!3445 () (_ BitVec 32))

(assert (=> mapNonEmpty!3445 (= (arr!10368 a!407) (store mapRest!3445 mapKey!3445 mapValue!3445))))

(declare-fun b!327113 () Bool)

(declare-fun e!236290 () Bool)

(assert (=> b!327113 (= e!236290 (and tp_is_empty!1145 mapRes!3445))))

(declare-fun condMapEmpty!3445 () Bool)

(declare-fun mapDefault!3445 () T!66831)

