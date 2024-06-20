; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70872 () Bool)

(assert start!70872)

(declare-fun i!774 () (_ BitVec 32))

(declare-datatypes ((T!62601 0))(
  ( (T!62602 (val!527 Int)) )
))
(declare-datatypes ((array!20173 0))(
  ( (array!20174 (arr!9885 (Array (_ BitVec 32) T!62601)) (size!8793 (_ BitVec 32))) )
))
(declare-fun arr!330 () array!20173)

(declare-fun elem!10 () T!62601)

(assert (=> start!70872 (and (bvsle #b00000000000000000000000000000000 i!774) (bvsle i!774 (size!8793 arr!330)) (not (= i!774 (size!8793 arr!330))) (not (= (select (arr!9885 arr!330) i!774) elem!10)) (bvsge (bvsub (size!8793 arr!330) (bvadd #b00000000000000000000000000000001 i!774)) (bvsub (size!8793 arr!330) i!774)))))

(assert (=> start!70872 true))

(declare-fun e!230673 () Bool)

(declare-fun array_inv!8345 (array!20173) Bool)

(assert (=> start!70872 (and (array_inv!8345 arr!330) e!230673)))

(declare-fun tp_is_empty!1055 () Bool)

(assert (=> start!70872 tp_is_empty!1055))

(declare-fun b!320554 () Bool)

(declare-fun mapRes!3295 () Bool)

(assert (=> b!320554 (= e!230673 (and tp_is_empty!1055 mapRes!3295))))

(declare-fun condMapEmpty!3295 () Bool)

(declare-fun mapDefault!3295 () T!62601)

