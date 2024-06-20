; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70850 () Bool)

(assert start!70850)

(declare-fun i!774 () (_ BitVec 32))

(declare-datatypes ((T!62519 0))(
  ( (T!62520 (val!516 Int)) )
))
(declare-datatypes ((array!20151 0))(
  ( (array!20152 (arr!9874 (Array (_ BitVec 32) T!62519)) (size!8782 (_ BitVec 32))) )
))
(declare-fun arr!330 () array!20151)

(assert (=> start!70850 (and (bvsle #b00000000000000000000000000000000 i!774) (bvsle i!774 (size!8782 arr!330)) (not (= (bvand (size!8782 arr!330) #b10000000000000000000000000000000) (bvand i!774 #b10000000000000000000000000000000))) (not (= (bvand (size!8782 arr!330) #b10000000000000000000000000000000) (bvand (bvsub (size!8782 arr!330) i!774) #b10000000000000000000000000000000))))))

(assert (=> start!70850 true))

(declare-fun e!230640 () Bool)

(declare-fun array_inv!8334 (array!20151) Bool)

(assert (=> start!70850 (and (array_inv!8334 arr!330) e!230640)))

(declare-fun b!320521 () Bool)

(declare-fun tp_is_empty!1033 () Bool)

(declare-fun mapRes!3262 () Bool)

(assert (=> b!320521 (= e!230640 (and tp_is_empty!1033 mapRes!3262))))

(declare-fun condMapEmpty!3262 () Bool)

(declare-fun mapDefault!3262 () T!62519)

