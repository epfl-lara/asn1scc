; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70840 () Bool)

(assert start!70840)

(declare-datatypes ((T!62471 0))(
  ( (T!62472 (val!512 Int)) )
))
(declare-datatypes ((array!20142 0))(
  ( (array!20143 (arr!9870 (Array (_ BitVec 32) T!62471)) (size!8778 (_ BitVec 32))) )
))
(declare-fun arr!327 () array!20142)

(assert (=> start!70840 (bvsgt #b00000000000000000000000000000000 (size!8778 arr!327))))

(declare-fun e!230628 () Bool)

(declare-fun array_inv!8330 (array!20142) Bool)

(assert (=> start!70840 (and (array_inv!8330 arr!327) e!230628)))

(declare-fun b!320507 () Bool)

(declare-fun tp_is_empty!1025 () Bool)

(declare-fun mapRes!3247 () Bool)

(assert (=> b!320507 (= e!230628 (and tp_is_empty!1025 mapRes!3247))))

(declare-fun condMapEmpty!3247 () Bool)

(declare-fun mapDefault!3247 () T!62471)

