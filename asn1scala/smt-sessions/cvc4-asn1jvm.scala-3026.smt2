; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70466 () Bool)

(assert start!70466)

(declare-fun b!319238 () Bool)

(declare-fun res!262272 () Bool)

(declare-fun e!229384 () Bool)

(assert (=> b!319238 (=> (not res!262272) (not e!229384))))

(declare-datatypes ((array!19898 0))(
  ( (array!19899 (arr!9759 (Array (_ BitVec 32) (_ BitVec 8))) (size!8667 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19898)

(declare-fun a2!909 () array!19898)

(declare-fun from!902 () (_ BitVec 64))

(declare-fun to!869 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19898 array!19898 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319238 (= res!262272 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(declare-fun res!262273 () Bool)

(assert (=> start!70466 (=> (not res!262273) (not e!229384))))

(declare-fun at!309 () (_ BitVec 64))

(assert (=> start!70466 (= res!262273 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8667 a1!909) (size!8667 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8667 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70466 e!229384))

(assert (=> start!70466 true))

(declare-fun array_inv!8219 (array!19898) Bool)

(assert (=> start!70466 (array_inv!8219 a1!909)))

(assert (=> start!70466 (array_inv!8219 a2!909)))

(declare-fun b!319239 () Bool)

(declare-fun res!262271 () Bool)

(assert (=> b!319239 (=> (not res!262271) (not e!229384))))

(declare-fun i!1041 () (_ BitVec 64))

(assert (=> b!319239 (= res!262271 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(declare-fun b!319240 () Bool)

(declare-fun res!262270 () Bool)

(assert (=> b!319240 (=> (not res!262270) (not e!229384))))

(assert (=> b!319240 (= res!262270 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(declare-fun b!319241 () Bool)

(assert (=> b!319241 (= e!229384 (and (not (= i!1041 at!309)) (= (bvand i!1041 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand i!1041 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!70466 res!262273) b!319238))

(assert (= (and b!319238 res!262272) b!319239))

(assert (= (and b!319239 res!262271) b!319240))

(assert (= (and b!319240 res!262270) b!319241))

(declare-fun m!457509 () Bool)

(assert (=> b!319238 m!457509))

(declare-fun m!457511 () Bool)

(assert (=> start!70466 m!457511))

(declare-fun m!457513 () Bool)

(assert (=> start!70466 m!457513))

(declare-fun m!457515 () Bool)

(assert (=> b!319240 m!457515))

(push 1)

(assert (not start!70466))

(assert (not b!319240))

(assert (not b!319238))

(check-sat)

(pop 1)

(push 1)

(check-sat)

