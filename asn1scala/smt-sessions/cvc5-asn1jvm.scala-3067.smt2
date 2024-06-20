; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70862 () Bool)

(assert start!70862)

(declare-fun i!774 () (_ BitVec 32))

(declare-datatypes ((T!62571 0))(
  ( (T!62572 (val!522 Int)) )
))
(declare-datatypes ((array!20163 0))(
  ( (array!20164 (arr!9880 (Array (_ BitVec 32) T!62571)) (size!8788 (_ BitVec 32))) )
))
(declare-fun arr!330 () array!20163)

(declare-fun elem!10 () T!62571)

(assert (=> start!70862 (and (bvsle #b00000000000000000000000000000000 i!774) (bvsle i!774 (size!8788 arr!330)) (not (= i!774 (size!8788 arr!330))) (not (= (select (arr!9880 arr!330) i!774) elem!10)) (= (bvand i!774 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand i!774 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!774) #b10000000000000000000000000000000))))))

(assert (=> start!70862 true))

(declare-fun e!230658 () Bool)

(declare-fun array_inv!8340 (array!20163) Bool)

(assert (=> start!70862 (and (array_inv!8340 arr!330) e!230658)))

(declare-fun tp_is_empty!1045 () Bool)

(assert (=> start!70862 tp_is_empty!1045))

(declare-fun b!320539 () Bool)

(declare-fun mapRes!3280 () Bool)

(assert (=> b!320539 (= e!230658 (and tp_is_empty!1045 mapRes!3280))))

(declare-fun condMapEmpty!3280 () Bool)

(declare-fun mapDefault!3280 () T!62571)

