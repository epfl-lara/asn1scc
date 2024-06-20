; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74136 () Bool)

(assert start!74136)

(declare-fun mapNonEmpty!3439 () Bool)

(declare-fun mapRes!3439 () Bool)

(declare-fun tp!3439 () Bool)

(declare-fun tp_is_empty!1141 () Bool)

(assert (=> mapNonEmpty!3439 (= mapRes!3439 (and tp!3439 tp_is_empty!1141))))

(declare-datatypes ((T!66827 0))(
  ( (T!66828 (val!570 Int)) )
))
(declare-fun mapRest!3439 () (Array (_ BitVec 32) T!66827))

(declare-fun mapValue!3439 () T!66827)

(declare-datatypes ((array!21364 0))(
  ( (array!21365 (arr!10366 (Array (_ BitVec 32) T!66827)) (size!9274 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21364)

(declare-fun mapKey!3439 () (_ BitVec 32))

(assert (=> mapNonEmpty!3439 (= (arr!10366 a!407) (store mapRest!3439 mapKey!3439 mapValue!3439))))

(declare-fun b!327094 () Bool)

(declare-fun e!236278 () Bool)

(declare-fun i!907 () (_ BitVec 32))

(assert (=> b!327094 (= e!236278 (and (not (= i!907 #b00000000000000000000000000000000)) (bvsge (bvsub i!907 #b00000000000000000000000000000001) i!907)))))

(declare-fun b!327095 () Bool)

(declare-fun res!268516 () Bool)

(assert (=> b!327095 (=> (not res!268516) (not e!236278))))

(declare-fun arrayRangesEq!1879 (array!21364 array!21364 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!327095 (= res!268516 (arrayRangesEq!1879 a!407 a!407 i!907 (size!9274 a!407)))))

(declare-fun mapIsEmpty!3439 () Bool)

(assert (=> mapIsEmpty!3439 mapRes!3439))

(declare-fun res!268517 () Bool)

(assert (=> start!74136 (=> (not res!268517) (not e!236278))))

(assert (=> start!74136 (= res!268517 (and (bvsle #b00000000000000000000000000000000 i!907) (bvsle i!907 (size!9274 a!407))))))

(assert (=> start!74136 e!236278))

(assert (=> start!74136 true))

(declare-fun e!236277 () Bool)

(declare-fun array_inv!8815 (array!21364) Bool)

(assert (=> start!74136 (and (array_inv!8815 a!407) e!236277)))

(declare-fun b!327096 () Bool)

(assert (=> b!327096 (= e!236277 (and tp_is_empty!1141 mapRes!3439))))

(declare-fun condMapEmpty!3439 () Bool)

(declare-fun mapDefault!3439 () T!66827)

