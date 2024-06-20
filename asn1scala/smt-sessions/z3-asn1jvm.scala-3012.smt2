; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70308 () Bool)

(assert start!70308)

(declare-fun res!261645 () Bool)

(declare-fun e!228797 () Bool)

(assert (=> start!70308 (=> (not res!261645) (not e!228797))))

(declare-datatypes ((array!19806 0))(
  ( (array!19807 (arr!9710 (Array (_ BitVec 32) (_ BitVec 8))) (size!8624 (_ BitVec 32))) )
))
(declare-fun a2!721 () array!19806)

(declare-fun to!813 () (_ BitVec 64))

(declare-fun a1!721 () array!19806)

(declare-fun from!846 () (_ BitVec 64))

(assert (=> start!70308 (= res!261645 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 from!846) (bvsle from!846 to!813) (= (size!8624 a1!721) (size!8624 a2!721)) (bvsle to!813 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8624 a1!721))))))))

(assert (=> start!70308 e!228797))

(assert (=> start!70308 true))

(declare-fun array_inv!8176 (array!19806) Bool)

(assert (=> start!70308 (array_inv!8176 a1!721)))

(assert (=> start!70308 (array_inv!8176 a2!721)))

(declare-fun b!318565 () Bool)

(declare-fun res!261646 () Bool)

(assert (=> b!318565 (=> (not res!261646) (not e!228797))))

(declare-fun arrayBitRangesEq!0 (array!19806 array!19806 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318565 (= res!261646 (arrayBitRangesEq!0 a1!721 a2!721 from!846 to!813))))

(declare-fun b!318566 () Bool)

(declare-fun res!261647 () Bool)

(assert (=> b!318566 (=> (not res!261647) (not e!228797))))

(declare-fun bitAt!0 (array!19806 (_ BitVec 64)) Bool)

(assert (=> b!318566 (= res!261647 (= (bitAt!0 a1!721 (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!721 (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!318567 () Bool)

(assert (=> b!318567 (= e!228797 (and (not (= (bvand from!846 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand from!846 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!70308 res!261645) b!318565))

(assert (= (and b!318565 res!261646) b!318566))

(assert (= (and b!318566 res!261647) b!318567))

(declare-fun m!456663 () Bool)

(assert (=> start!70308 m!456663))

(declare-fun m!456665 () Bool)

(assert (=> start!70308 m!456665))

(declare-fun m!456667 () Bool)

(assert (=> b!318565 m!456667))

(declare-fun m!456669 () Bool)

(assert (=> b!318566 m!456669))

(declare-fun m!456671 () Bool)

(assert (=> b!318566 m!456671))

(check-sat (not b!318566) (not start!70308) (not b!318565))
(check-sat)
