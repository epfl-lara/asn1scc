; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70462 () Bool)

(assert start!70462)

(declare-fun b!319214 () Bool)

(declare-fun res!262248 () Bool)

(declare-fun e!229367 () Bool)

(assert (=> b!319214 (=> (not res!262248) (not e!229367))))

(declare-datatypes ((array!19894 0))(
  ( (array!19895 (arr!9757 (Array (_ BitVec 32) (_ BitVec 8))) (size!8665 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19894)

(declare-fun a2!909 () array!19894)

(declare-fun from!902 () (_ BitVec 64))

(declare-fun to!869 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19894 array!19894 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319214 (= res!262248 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(declare-fun b!319217 () Bool)

(declare-fun i!1041 () (_ BitVec 64))

(declare-fun at!309 () (_ BitVec 64))

(assert (=> b!319217 (= e!229367 (and (not (= i!1041 at!309)) (= (bvand i!1041 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand i!1041 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!262249 () Bool)

(assert (=> start!70462 (=> (not res!262249) (not e!229367))))

(assert (=> start!70462 (= res!262249 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8665 a1!909) (size!8665 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8665 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70462 e!229367))

(assert (=> start!70462 true))

(declare-fun array_inv!8217 (array!19894) Bool)

(assert (=> start!70462 (array_inv!8217 a1!909)))

(assert (=> start!70462 (array_inv!8217 a2!909)))

(declare-fun b!319215 () Bool)

(declare-fun res!262246 () Bool)

(assert (=> b!319215 (=> (not res!262246) (not e!229367))))

(assert (=> b!319215 (= res!262246 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(declare-fun b!319216 () Bool)

(declare-fun res!262247 () Bool)

(assert (=> b!319216 (=> (not res!262247) (not e!229367))))

(assert (=> b!319216 (= res!262247 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(assert (= (and start!70462 res!262249) b!319214))

(assert (= (and b!319214 res!262248) b!319215))

(assert (= (and b!319215 res!262246) b!319216))

(assert (= (and b!319216 res!262247) b!319217))

(declare-fun m!457493 () Bool)

(assert (=> b!319214 m!457493))

(declare-fun m!457495 () Bool)

(assert (=> start!70462 m!457495))

(declare-fun m!457497 () Bool)

(assert (=> start!70462 m!457497))

(declare-fun m!457499 () Bool)

(assert (=> b!319216 m!457499))

(push 1)

(assert (not b!319216))

(assert (not start!70462))

(assert (not b!319214))

(check-sat)

(pop 1)

(push 1)

(check-sat)

