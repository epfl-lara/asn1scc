; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70868 () Bool)

(assert start!70868)

(declare-fun i!774 () (_ BitVec 32))

(declare-datatypes ((T!62597 0))(
  ( (T!62598 (val!525 Int)) )
))
(declare-datatypes ((array!20169 0))(
  ( (array!20170 (arr!9883 (Array (_ BitVec 32) T!62597)) (size!8791 (_ BitVec 32))) )
))
(declare-fun arr!330 () array!20169)

(declare-fun elem!10 () T!62597)

(assert (=> start!70868 (and (bvsle #b00000000000000000000000000000000 i!774) (bvsle i!774 (size!8791 arr!330)) (not (= i!774 (size!8791 arr!330))) (not (= (select (arr!9883 arr!330) i!774) elem!10)) (bvsge (bvsub (size!8791 arr!330) (bvadd #b00000000000000000000000000000001 i!774)) (bvsub (size!8791 arr!330) i!774)))))

(assert (=> start!70868 true))

(declare-fun e!230667 () Bool)

(declare-fun array_inv!8343 (array!20169) Bool)

(assert (=> start!70868 (and (array_inv!8343 arr!330) e!230667)))

(declare-fun tp_is_empty!1051 () Bool)

(assert (=> start!70868 tp_is_empty!1051))

(declare-fun b!320548 () Bool)

(declare-fun mapRes!3289 () Bool)

(assert (=> b!320548 (= e!230667 (and tp_is_empty!1051 mapRes!3289))))

(declare-fun condMapEmpty!3289 () Bool)

(declare-fun mapDefault!3289 () T!62597)

