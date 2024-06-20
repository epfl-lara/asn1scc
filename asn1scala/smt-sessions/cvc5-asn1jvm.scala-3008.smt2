; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70282 () Bool)

(assert start!70282)

(declare-fun res!261573 () Bool)

(declare-fun e!228691 () Bool)

(assert (=> start!70282 (=> (not res!261573) (not e!228691))))

(declare-datatypes ((array!19780 0))(
  ( (array!19781 (arr!9697 (Array (_ BitVec 32) (_ BitVec 8))) (size!8611 (_ BitVec 32))) )
))
(declare-fun a2!721 () array!19780)

(declare-fun to!813 () (_ BitVec 64))

(declare-fun a1!721 () array!19780)

(declare-fun from!846 () (_ BitVec 64))

(assert (=> start!70282 (= res!261573 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 from!846) (bvsle from!846 to!813) (= (size!8611 a1!721) (size!8611 a2!721)) (bvsle to!813 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8611 a1!721))))))))

(assert (=> start!70282 e!228691))

(assert (=> start!70282 true))

(declare-fun array_inv!8163 (array!19780) Bool)

(assert (=> start!70282 (array_inv!8163 a1!721)))

(assert (=> start!70282 (array_inv!8163 a2!721)))

(declare-fun b!318493 () Bool)

(declare-fun res!261574 () Bool)

(assert (=> b!318493 (=> (not res!261574) (not e!228691))))

(declare-fun arrayBitRangesEq!0 (array!19780 array!19780 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318493 (= res!261574 (arrayBitRangesEq!0 a1!721 a2!721 from!846 to!813))))

(declare-fun b!318494 () Bool)

(declare-fun res!261575 () Bool)

(assert (=> b!318494 (=> (not res!261575) (not e!228691))))

(declare-fun bitAt!0 (array!19780 (_ BitVec 64)) Bool)

(assert (=> b!318494 (= res!261575 (= (bitAt!0 a1!721 (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!721 (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!318495 () Bool)

(assert (=> b!318495 (= e!228691 (bvsgt (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) to!813))))

(assert (= (and start!70282 res!261573) b!318493))

(assert (= (and b!318493 res!261574) b!318494))

(assert (= (and b!318494 res!261575) b!318495))

(declare-fun m!456575 () Bool)

(assert (=> start!70282 m!456575))

(declare-fun m!456577 () Bool)

(assert (=> start!70282 m!456577))

(declare-fun m!456579 () Bool)

(assert (=> b!318493 m!456579))

(declare-fun m!456581 () Bool)

(assert (=> b!318494 m!456581))

(declare-fun m!456583 () Bool)

(assert (=> b!318494 m!456583))

(push 1)

(assert (not start!70282))

(assert (not b!318494))

(assert (not b!318493))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

