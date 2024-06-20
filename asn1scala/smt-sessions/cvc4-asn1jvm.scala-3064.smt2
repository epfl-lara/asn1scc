; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70848 () Bool)

(assert start!70848)

(declare-fun i!774 () (_ BitVec 32))

(declare-datatypes ((T!62497 0))(
  ( (T!62498 (val!515 Int)) )
))
(declare-datatypes ((array!20149 0))(
  ( (array!20150 (arr!9873 (Array (_ BitVec 32) T!62497)) (size!8781 (_ BitVec 32))) )
))
(declare-fun arr!330 () array!20149)

(declare-fun elem!10 () T!62497)

(assert (=> start!70848 (and (bvsle #b00000000000000000000000000000000 i!774) (bvsle i!774 (size!8781 arr!330)) (not (= i!774 (size!8781 arr!330))) (not (= (select (arr!9873 arr!330) i!774) elem!10)) (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!774)) (bvsgt (bvadd #b00000000000000000000000000000001 i!774) (size!8781 arr!330))))))

(assert (=> start!70848 true))

(declare-fun e!230637 () Bool)

(declare-fun array_inv!8333 (array!20149) Bool)

(assert (=> start!70848 (and (array_inv!8333 arr!330) e!230637)))

(declare-fun tp_is_empty!1031 () Bool)

(assert (=> start!70848 tp_is_empty!1031))

(declare-fun b!320518 () Bool)

(declare-fun mapRes!3259 () Bool)

(assert (=> b!320518 (= e!230637 (and tp_is_empty!1031 mapRes!3259))))

(declare-fun condMapEmpty!3259 () Bool)

(declare-fun mapDefault!3259 () T!62497)

