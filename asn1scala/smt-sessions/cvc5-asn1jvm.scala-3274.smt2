; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74130 () Bool)

(assert start!74130)

(declare-fun res!268498 () Bool)

(declare-fun e!236260 () Bool)

(assert (=> start!74130 (=> (not res!268498) (not e!236260))))

(declare-fun i!907 () (_ BitVec 32))

(declare-datatypes ((T!66801 0))(
  ( (T!66802 (val!567 Int)) )
))
(declare-datatypes ((array!21358 0))(
  ( (array!21359 (arr!10363 (Array (_ BitVec 32) T!66801)) (size!9271 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21358)

(assert (=> start!74130 (= res!268498 (and (bvsle #b00000000000000000000000000000000 i!907) (bvsle i!907 (size!9271 a!407))))))

(assert (=> start!74130 e!236260))

(assert (=> start!74130 true))

(declare-fun e!236259 () Bool)

(declare-fun array_inv!8813 (array!21358) Bool)

(assert (=> start!74130 (and (array_inv!8813 a!407) e!236259)))

(declare-fun b!327067 () Bool)

(declare-fun res!268499 () Bool)

(assert (=> b!327067 (=> (not res!268499) (not e!236260))))

(declare-fun arrayRangesEq!1877 (array!21358 array!21358 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!327067 (= res!268499 (arrayRangesEq!1877 a!407 a!407 i!907 (size!9271 a!407)))))

(declare-fun b!327068 () Bool)

(assert (=> b!327068 (= e!236260 (and (not (= i!907 #b00000000000000000000000000000000)) (not (= (bvand i!907 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand i!907 #b10000000000000000000000000000000) (bvand (bvsub i!907 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!3430 () Bool)

(declare-fun mapRes!3430 () Bool)

(assert (=> mapIsEmpty!3430 mapRes!3430))

(declare-fun mapNonEmpty!3430 () Bool)

(declare-fun tp!3430 () Bool)

(declare-fun tp_is_empty!1135 () Bool)

(assert (=> mapNonEmpty!3430 (= mapRes!3430 (and tp!3430 tp_is_empty!1135))))

(declare-fun mapValue!3430 () T!66801)

(declare-fun mapRest!3430 () (Array (_ BitVec 32) T!66801))

(declare-fun mapKey!3430 () (_ BitVec 32))

(assert (=> mapNonEmpty!3430 (= (arr!10363 a!407) (store mapRest!3430 mapKey!3430 mapValue!3430))))

(declare-fun b!327069 () Bool)

(assert (=> b!327069 (= e!236259 (and tp_is_empty!1135 mapRes!3430))))

(declare-fun condMapEmpty!3430 () Bool)

(declare-fun mapDefault!3430 () T!66801)

