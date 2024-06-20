; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74146 () Bool)

(assert start!74146)

(declare-fun b!327147 () Bool)

(declare-fun res!268555 () Bool)

(declare-fun e!236307 () Bool)

(assert (=> b!327147 (=> (not res!268555) (not e!236307))))

(declare-datatypes ((T!66857 0))(
  ( (T!66858 (val!575 Int)) )
))
(declare-datatypes ((array!21374 0))(
  ( (array!21375 (arr!10371 (Array (_ BitVec 32) T!66857)) (size!9279 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21374)

(declare-fun i!907 () (_ BitVec 32))

(declare-fun arrayRangesEq!1883 (array!21374 array!21374 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!327147 (= res!268555 (arrayRangesEq!1883 a!407 a!407 i!907 (size!9279 a!407)))))

(declare-fun res!268556 () Bool)

(assert (=> start!74146 (=> (not res!268556) (not e!236307))))

(assert (=> start!74146 (= res!268556 (and (bvsle #b00000000000000000000000000000000 i!907) (bvsle i!907 (size!9279 a!407))))))

(assert (=> start!74146 e!236307))

(assert (=> start!74146 true))

(declare-fun e!236308 () Bool)

(declare-fun array_inv!8819 (array!21374) Bool)

(assert (=> start!74146 (and (array_inv!8819 a!407) e!236308)))

(declare-fun b!327148 () Bool)

(declare-fun res!268554 () Bool)

(assert (=> b!327148 (=> (not res!268554) (not e!236307))))

(assert (=> b!327148 (= res!268554 (not (= i!907 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!3454 () Bool)

(declare-fun mapRes!3454 () Bool)

(declare-fun tp!3454 () Bool)

(declare-fun tp_is_empty!1151 () Bool)

(assert (=> mapNonEmpty!3454 (= mapRes!3454 (and tp!3454 tp_is_empty!1151))))

(declare-fun mapValue!3454 () T!66857)

(declare-fun mapRest!3454 () (Array (_ BitVec 32) T!66857))

(declare-fun mapKey!3454 () (_ BitVec 32))

(assert (=> mapNonEmpty!3454 (= (arr!10371 a!407) (store mapRest!3454 mapKey!3454 mapValue!3454))))

(declare-fun mapIsEmpty!3454 () Bool)

(assert (=> mapIsEmpty!3454 mapRes!3454))

(declare-fun b!327149 () Bool)

(assert (=> b!327149 (= e!236307 (not (arrayRangesEq!1883 a!407 a!407 #b00000000000000000000000000000000 (size!9279 a!407))))))

(declare-datatypes ((Unit!22170 0))(
  ( (Unit!22171) )
))
(declare-fun lt!448700 () Unit!22170)

(declare-fun rec!131 (array!21374 (_ BitVec 32)) Unit!22170)

(assert (=> b!327149 (= lt!448700 (rec!131 a!407 (bvsub i!907 #b00000000000000000000000000000001)))))

(declare-fun b!327150 () Bool)

(assert (=> b!327150 (= e!236308 (and tp_is_empty!1151 mapRes!3454))))

(declare-fun condMapEmpty!3454 () Bool)

(declare-fun mapDefault!3454 () T!66857)

