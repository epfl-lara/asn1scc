; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70854 () Bool)

(assert start!70854)

(declare-fun i!774 () (_ BitVec 32))

(declare-datatypes ((T!62523 0))(
  ( (T!62524 (val!518 Int)) )
))
(declare-datatypes ((array!20155 0))(
  ( (array!20156 (arr!9876 (Array (_ BitVec 32) T!62523)) (size!8784 (_ BitVec 32))) )
))
(declare-fun arr!330 () array!20155)

(assert (=> start!70854 (and (bvsle #b00000000000000000000000000000000 i!774) (bvsle i!774 (size!8784 arr!330)) (not (= (bvand (size!8784 arr!330) #b10000000000000000000000000000000) (bvand i!774 #b10000000000000000000000000000000))) (not (= (bvand (size!8784 arr!330) #b10000000000000000000000000000000) (bvand (bvsub (size!8784 arr!330) i!774) #b10000000000000000000000000000000))))))

(assert (=> start!70854 true))

(declare-fun e!230646 () Bool)

(declare-fun array_inv!8336 (array!20155) Bool)

(assert (=> start!70854 (and (array_inv!8336 arr!330) e!230646)))

(declare-fun b!320527 () Bool)

(declare-fun tp_is_empty!1037 () Bool)

(declare-fun mapRes!3268 () Bool)

(assert (=> b!320527 (= e!230646 (and tp_is_empty!1037 mapRes!3268))))

(declare-fun condMapEmpty!3268 () Bool)

(declare-fun mapDefault!3268 () T!62523)

