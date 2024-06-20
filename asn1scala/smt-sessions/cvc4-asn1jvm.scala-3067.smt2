; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70866 () Bool)

(assert start!70866)

(declare-fun i!774 () (_ BitVec 32))

(declare-datatypes ((T!62575 0))(
  ( (T!62576 (val!524 Int)) )
))
(declare-datatypes ((array!20167 0))(
  ( (array!20168 (arr!9882 (Array (_ BitVec 32) T!62575)) (size!8790 (_ BitVec 32))) )
))
(declare-fun arr!330 () array!20167)

(declare-fun elem!10 () T!62575)

(assert (=> start!70866 (and (bvsle #b00000000000000000000000000000000 i!774) (bvsle i!774 (size!8790 arr!330)) (not (= i!774 (size!8790 arr!330))) (not (= (select (arr!9882 arr!330) i!774) elem!10)) (= (bvand i!774 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand i!774 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!774) #b10000000000000000000000000000000))))))

(assert (=> start!70866 true))

(declare-fun e!230664 () Bool)

(declare-fun array_inv!8342 (array!20167) Bool)

(assert (=> start!70866 (and (array_inv!8342 arr!330) e!230664)))

(declare-fun tp_is_empty!1049 () Bool)

(assert (=> start!70866 tp_is_empty!1049))

(declare-fun b!320545 () Bool)

(declare-fun mapRes!3286 () Bool)

(assert (=> b!320545 (= e!230664 (and tp_is_empty!1049 mapRes!3286))))

(declare-fun condMapEmpty!3286 () Bool)

(declare-fun mapDefault!3286 () T!62575)

