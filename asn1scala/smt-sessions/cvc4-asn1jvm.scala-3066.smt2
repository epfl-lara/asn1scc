; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70860 () Bool)

(assert start!70860)

(declare-fun i!774 () (_ BitVec 32))

(declare-datatypes ((T!62549 0))(
  ( (T!62550 (val!521 Int)) )
))
(declare-datatypes ((array!20161 0))(
  ( (array!20162 (arr!9879 (Array (_ BitVec 32) T!62549)) (size!8787 (_ BitVec 32))) )
))
(declare-fun arr!330 () array!20161)

(assert (=> start!70860 (and (bvsle #b00000000000000000000000000000000 i!774) (bvsle i!774 (size!8787 arr!330)) (not (= i!774 (size!8787 arr!330))) (bvsge i!774 (size!8787 arr!330)))))

(assert (=> start!70860 true))

(declare-fun e!230655 () Bool)

(declare-fun array_inv!8339 (array!20161) Bool)

(assert (=> start!70860 (and (array_inv!8339 arr!330) e!230655)))

(declare-fun b!320536 () Bool)

(declare-fun tp_is_empty!1043 () Bool)

(declare-fun mapRes!3277 () Bool)

(assert (=> b!320536 (= e!230655 (and tp_is_empty!1043 mapRes!3277))))

(declare-fun condMapEmpty!3277 () Bool)

(declare-fun mapDefault!3277 () T!62549)

