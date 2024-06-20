; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57202 () Bool)

(assert start!57202)

(declare-fun b!262369 () Bool)

(declare-fun e!182646 () Bool)

(assert (=> b!262369 (= e!182646 (not true))))

(declare-datatypes ((T!45615 0))(
  ( (T!45616 (val!134 Int)) )
))
(declare-datatypes ((array!14613 0))(
  ( (array!14614 (arr!7368 (Array (_ BitVec 32) T!45615)) (size!6381 (_ BitVec 32))) )
))
(declare-fun a!416 () array!14613)

(declare-fun lt!404068 () array!14613)

(declare-fun at!218 () (_ BitVec 32))

(declare-fun arrayRangesEq!992 (array!14613 array!14613 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262369 (arrayRangesEq!992 a!416 lt!404068 #b00000000000000000000000000000000 at!218)))

(declare-datatypes ((Unit!18713 0))(
  ( (Unit!18714) )
))
(declare-fun lt!404069 () Unit!18713)

(declare-fun v!333 () T!45615)

(declare-fun i!922 () (_ BitVec 32))

(declare-fun rec!44 (array!14613 (_ BitVec 32) T!45615 (_ BitVec 32)) Unit!18713)

(assert (=> b!262369 (= lt!404069 (rec!44 a!416 at!218 v!333 (bvsub i!922 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!652 () Bool)

(declare-fun mapRes!652 () Bool)

(assert (=> mapIsEmpty!652 mapRes!652))

(declare-fun res!219567 () Bool)

(declare-fun e!182644 () Bool)

(assert (=> start!57202 (=> (not res!219567) (not e!182644))))

(assert (=> start!57202 (= res!219567 (and (bvsle #b00000000000000000000000000000000 at!218) (bvslt at!218 (size!6381 a!416)) (bvsle #b00000000000000000000000000000000 i!922) (bvsle i!922 at!218)))))

(assert (=> start!57202 e!182644))

(assert (=> start!57202 true))

(declare-fun e!182645 () Bool)

(declare-fun array_inv!6107 (array!14613) Bool)

(assert (=> start!57202 (and (array_inv!6107 a!416) e!182645)))

(declare-fun tp_is_empty!269 () Bool)

(assert (=> start!57202 tp_is_empty!269))

(declare-fun b!262370 () Bool)

(declare-fun res!219568 () Bool)

(assert (=> b!262370 (=> (not res!219568) (not e!182646))))

(assert (=> b!262370 (= res!219568 (arrayRangesEq!992 a!416 lt!404068 (bvsub i!922 #b00000000000000000000000000000001) at!218))))

(declare-fun b!262371 () Bool)

(declare-fun res!219565 () Bool)

(assert (=> b!262371 (=> (not res!219565) (not e!182646))))

(assert (=> b!262371 (= res!219565 (and (not (= i!922 #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (bvsub i!922 #b00000000000000000000000000000001)) (bvsle (bvsub i!922 #b00000000000000000000000000000001) at!218)))))

(declare-fun b!262372 () Bool)

(assert (=> b!262372 (= e!182644 e!182646)))

(declare-fun res!219566 () Bool)

(assert (=> b!262372 (=> (not res!219566) (not e!182646))))

(assert (=> b!262372 (= res!219566 (arrayRangesEq!992 a!416 lt!404068 i!922 at!218))))

(assert (=> b!262372 (= lt!404068 (array!14614 (store (arr!7368 a!416) at!218 v!333) (size!6381 a!416)))))

(declare-fun b!262373 () Bool)

(assert (=> b!262373 (= e!182645 (and tp_is_empty!269 mapRes!652))))

(declare-fun condMapEmpty!652 () Bool)

(declare-fun mapDefault!652 () T!45615)

