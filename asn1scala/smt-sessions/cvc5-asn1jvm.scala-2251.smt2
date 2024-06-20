; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57152 () Bool)

(assert start!57152)

(declare-fun b!262068 () Bool)

(declare-fun res!219338 () Bool)

(declare-fun e!182448 () Bool)

(assert (=> b!262068 (=> (not res!219338) (not e!182448))))

(declare-fun i!922 () (_ BitVec 32))

(declare-fun at!218 () (_ BitVec 32))

(assert (=> b!262068 (= res!219338 (and (not (= i!922 #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (bvsub i!922 #b00000000000000000000000000000001)) (bvsle (bvsub i!922 #b00000000000000000000000000000001) at!218)))))

(declare-fun res!219337 () Bool)

(declare-fun e!182447 () Bool)

(assert (=> start!57152 (=> (not res!219337) (not e!182447))))

(declare-datatypes ((T!45429 0))(
  ( (T!45430 (val!111 Int)) )
))
(declare-datatypes ((array!14566 0))(
  ( (array!14567 (arr!7345 (Array (_ BitVec 32) T!45429)) (size!6358 (_ BitVec 32))) )
))
(declare-fun a!416 () array!14566)

(assert (=> start!57152 (= res!219337 (and (bvsle #b00000000000000000000000000000000 at!218) (bvslt at!218 (size!6358 a!416)) (bvsle #b00000000000000000000000000000000 i!922) (bvsle i!922 at!218)))))

(assert (=> start!57152 e!182447))

(assert (=> start!57152 true))

(declare-fun e!182449 () Bool)

(declare-fun array_inv!6090 (array!14566) Bool)

(assert (=> start!57152 (and (array_inv!6090 a!416) e!182449)))

(declare-fun tp_is_empty!223 () Bool)

(assert (=> start!57152 tp_is_empty!223))

(declare-fun b!262069 () Bool)

(declare-fun res!219335 () Bool)

(assert (=> b!262069 (=> (not res!219335) (not e!182448))))

(declare-fun lt!403994 () array!14566)

(declare-fun arrayRangesEq!975 (array!14566 array!14566 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262069 (= res!219335 (arrayRangesEq!975 a!416 lt!403994 (bvsub i!922 #b00000000000000000000000000000001) at!218))))

(declare-fun b!262070 () Bool)

(assert (=> b!262070 (= e!182448 (not true))))

(assert (=> b!262070 (arrayRangesEq!975 a!416 lt!403994 #b00000000000000000000000000000000 at!218)))

(declare-datatypes ((Unit!18699 0))(
  ( (Unit!18700) )
))
(declare-fun lt!403993 () Unit!18699)

(declare-fun v!333 () T!45429)

(declare-fun rec!37 (array!14566 (_ BitVec 32) T!45429 (_ BitVec 32)) Unit!18699)

(assert (=> b!262070 (= lt!403993 (rec!37 a!416 at!218 v!333 (bvsub i!922 #b00000000000000000000000000000001)))))

(declare-fun mapNonEmpty!580 () Bool)

(declare-fun mapRes!580 () Bool)

(declare-fun tp!580 () Bool)

(assert (=> mapNonEmpty!580 (= mapRes!580 (and tp!580 tp_is_empty!223))))

(declare-fun mapKey!580 () (_ BitVec 32))

(declare-fun mapRest!580 () (Array (_ BitVec 32) T!45429))

(declare-fun mapValue!580 () T!45429)

(assert (=> mapNonEmpty!580 (= (arr!7345 a!416) (store mapRest!580 mapKey!580 mapValue!580))))

(declare-fun b!262071 () Bool)

(assert (=> b!262071 (= e!182447 e!182448)))

(declare-fun res!219336 () Bool)

(assert (=> b!262071 (=> (not res!219336) (not e!182448))))

(assert (=> b!262071 (= res!219336 (arrayRangesEq!975 a!416 lt!403994 i!922 at!218))))

(assert (=> b!262071 (= lt!403994 (array!14567 (store (arr!7345 a!416) at!218 v!333) (size!6358 a!416)))))

(declare-fun b!262072 () Bool)

(assert (=> b!262072 (= e!182449 (and tp_is_empty!223 mapRes!580))))

(declare-fun condMapEmpty!580 () Bool)

(declare-fun mapDefault!580 () T!45429)

