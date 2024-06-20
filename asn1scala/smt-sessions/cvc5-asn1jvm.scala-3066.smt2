; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70856 () Bool)

(assert start!70856)

(declare-fun i!774 () (_ BitVec 32))

(declare-datatypes ((T!62545 0))(
  ( (T!62546 (val!519 Int)) )
))
(declare-datatypes ((array!20157 0))(
  ( (array!20158 (arr!9877 (Array (_ BitVec 32) T!62545)) (size!8785 (_ BitVec 32))) )
))
(declare-fun arr!330 () array!20157)

(assert (=> start!70856 (and (bvsle #b00000000000000000000000000000000 i!774) (bvsle i!774 (size!8785 arr!330)) (not (= i!774 (size!8785 arr!330))) (bvsge i!774 (size!8785 arr!330)))))

(assert (=> start!70856 true))

(declare-fun e!230649 () Bool)

(declare-fun array_inv!8337 (array!20157) Bool)

(assert (=> start!70856 (and (array_inv!8337 arr!330) e!230649)))

(declare-fun b!320530 () Bool)

(declare-fun tp_is_empty!1039 () Bool)

(declare-fun mapRes!3271 () Bool)

(assert (=> b!320530 (= e!230649 (and tp_is_empty!1039 mapRes!3271))))

(declare-fun condMapEmpty!3271 () Bool)

(declare-fun mapDefault!3271 () T!62545)

