; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70200 () Bool)

(assert start!70200)

(declare-fun b!317860 () Bool)

(declare-fun res!260943 () Bool)

(declare-fun e!228303 () Bool)

(assert (=> b!317860 (=> (not res!260943) (not e!228303))))

(declare-datatypes ((array!19698 0))(
  ( (array!19699 (arr!9656 (Array (_ BitVec 32) (_ BitVec 8))) (size!8570 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19698)

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19698)

(declare-fun i!999 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19698 array!19698 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317860 (= res!260943 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317861 () Bool)

(declare-fun res!260945 () Bool)

(assert (=> b!317861 (=> (not res!260945) (not e!228303))))

(declare-fun from!855 () (_ BitVec 64))

(assert (=> b!317861 (= res!260945 (not (= i!999 from!855)))))

(declare-fun res!260940 () Bool)

(assert (=> start!70200 (=> (not res!260940) (not e!228303))))

(assert (=> start!70200 (= res!260940 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8570 a1!748) (size!8570 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8570 a1!748))))))))

(assert (=> start!70200 e!228303))

(assert (=> start!70200 true))

(declare-fun array_inv!8122 (array!19698) Bool)

(assert (=> start!70200 (array_inv!8122 a2!748)))

(assert (=> start!70200 (array_inv!8122 a1!748)))

(declare-fun b!317862 () Bool)

(assert (=> b!317862 (= e!228303 (not (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 i!999) (bvsle i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))))

(declare-fun bitAt!0 (array!19698 (_ BitVec 64)) Bool)

(assert (=> b!317862 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((Unit!21811 0))(
  ( (Unit!21812) )
))
(declare-fun lt!443219 () Unit!21811)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19698 array!19698 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21811)

(assert (=> b!317862 (= lt!443219 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!317863 () Bool)

(declare-fun res!260941 () Bool)

(assert (=> b!317863 (=> (not res!260941) (not e!228303))))

(assert (=> b!317863 (= res!260941 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317864 () Bool)

(declare-fun res!260942 () Bool)

(assert (=> b!317864 (=> (not res!260942) (not e!228303))))

(assert (=> b!317864 (= res!260942 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317865 () Bool)

(declare-fun res!260944 () Bool)

(assert (=> b!317865 (=> (not res!260944) (not e!228303))))

(assert (=> b!317865 (= res!260944 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(assert (= (and start!70200 res!260940) b!317863))

(assert (= (and b!317863 res!260941) b!317864))

(assert (= (and b!317864 res!260942) b!317865))

(assert (= (and b!317865 res!260944) b!317860))

(assert (= (and b!317860 res!260943) b!317861))

(assert (= (and b!317861 res!260945) b!317862))

(declare-fun m!455855 () Bool)

(assert (=> start!70200 m!455855))

(declare-fun m!455857 () Bool)

(assert (=> start!70200 m!455857))

(declare-fun m!455859 () Bool)

(assert (=> b!317862 m!455859))

(declare-fun m!455861 () Bool)

(assert (=> b!317862 m!455861))

(declare-fun m!455863 () Bool)

(assert (=> b!317862 m!455863))

(declare-fun m!455865 () Bool)

(assert (=> b!317864 m!455865))

(declare-fun m!455867 () Bool)

(assert (=> b!317864 m!455867))

(declare-fun m!455869 () Bool)

(assert (=> b!317860 m!455869))

(declare-fun m!455871 () Bool)

(assert (=> b!317863 m!455871))

(check-sat (not b!317862) (not b!317860) (not b!317864) (not start!70200) (not b!317863))
(check-sat)
