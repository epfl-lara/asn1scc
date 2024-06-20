; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70836 () Bool)

(assert start!70836)

(declare-datatypes ((T!62467 0))(
  ( (T!62468 (val!510 Int)) )
))
(declare-datatypes ((array!20138 0))(
  ( (array!20139 (arr!9868 (Array (_ BitVec 32) T!62467)) (size!8776 (_ BitVec 32))) )
))
(declare-fun arr!327 () array!20138)

(assert (=> start!70836 (bvsgt #b00000000000000000000000000000000 (size!8776 arr!327))))

(declare-fun e!230622 () Bool)

(declare-fun array_inv!8328 (array!20138) Bool)

(assert (=> start!70836 (and (array_inv!8328 arr!327) e!230622)))

(declare-fun b!320501 () Bool)

(declare-fun tp_is_empty!1021 () Bool)

(declare-fun mapRes!3241 () Bool)

(assert (=> b!320501 (= e!230622 (and tp_is_empty!1021 mapRes!3241))))

(declare-fun condMapEmpty!3241 () Bool)

(declare-fun mapDefault!3241 () T!62467)

