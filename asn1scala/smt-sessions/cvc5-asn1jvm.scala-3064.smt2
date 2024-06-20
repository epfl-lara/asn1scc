; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70844 () Bool)

(assert start!70844)

(declare-fun i!774 () (_ BitVec 32))

(declare-datatypes ((T!62493 0))(
  ( (T!62494 (val!513 Int)) )
))
(declare-datatypes ((array!20145 0))(
  ( (array!20146 (arr!9871 (Array (_ BitVec 32) T!62493)) (size!8779 (_ BitVec 32))) )
))
(declare-fun arr!330 () array!20145)

(declare-fun elem!10 () T!62493)

(assert (=> start!70844 (and (bvsle #b00000000000000000000000000000000 i!774) (bvsle i!774 (size!8779 arr!330)) (not (= i!774 (size!8779 arr!330))) (not (= (select (arr!9871 arr!330) i!774) elem!10)) (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!774)) (bvsgt (bvadd #b00000000000000000000000000000001 i!774) (size!8779 arr!330))))))

(assert (=> start!70844 true))

(declare-fun e!230631 () Bool)

(declare-fun array_inv!8331 (array!20145) Bool)

(assert (=> start!70844 (and (array_inv!8331 arr!330) e!230631)))

(declare-fun tp_is_empty!1027 () Bool)

(assert (=> start!70844 tp_is_empty!1027))

(declare-fun b!320512 () Bool)

(declare-fun mapRes!3253 () Bool)

(assert (=> b!320512 (= e!230631 (and tp_is_empty!1027 mapRes!3253))))

(declare-fun condMapEmpty!3253 () Bool)

(declare-fun mapDefault!3253 () T!62493)

