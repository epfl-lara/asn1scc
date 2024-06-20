; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62716 () Bool)

(assert start!62716)

(declare-fun lt!417060 () (_ BitVec 32))

(declare-fun e!200453 () Bool)

(declare-datatypes ((array!16223 0))(
  ( (array!16224 (arr!8007 (Array (_ BitVec 32) (_ BitVec 8))) (size!7011 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16223)

(declare-fun a2!699 () array!16223)

(declare-fun b!280869 () Bool)

(declare-datatypes ((tuple4!772 0))(
  ( (tuple4!773 (_1!12461 (_ BitVec 32)) (_2!12461 (_ BitVec 32)) (_3!1166 (_ BitVec 32)) (_4!386 (_ BitVec 32))) )
))
(declare-fun lt!417062 () tuple4!772)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280869 (= e!200453 (not (byteRangesEq!0 (select (arr!8007 a2!699) (_3!1166 lt!417062)) (select (arr!8007 a1!699) (_3!1166 lt!417062)) lt!417060 #b00000000000000000000000000001000)))))

(assert (=> b!280869 (byteRangesEq!0 (select (arr!8007 a1!699) (_3!1166 lt!417062)) (select (arr!8007 a2!699) (_3!1166 lt!417062)) lt!417060 #b00000000000000000000000000001000)))

(declare-fun b!280870 () Bool)

(declare-datatypes ((Unit!19709 0))(
  ( (Unit!19710) )
))
(declare-fun e!200452 () Unit!19709)

(declare-fun Unit!19711 () Unit!19709)

(assert (=> b!280870 (= e!200452 Unit!19711)))

(declare-fun b!280871 () Bool)

(declare-fun e!200454 () Bool)

(assert (=> b!280871 (= e!200454 e!200453)))

(declare-fun res!233082 () Bool)

(assert (=> b!280871 (=> (not res!233082) (not e!200453))))

(assert (=> b!280871 (= res!233082 (not (= (_3!1166 lt!417062) (_4!386 lt!417062))))))

(declare-fun lt!417061 () Unit!19709)

(assert (=> b!280871 (= lt!417061 e!200452)))

(declare-fun c!13065 () Bool)

(assert (=> b!280871 (= c!13065 (bvslt (_1!12461 lt!417062) (_2!12461 lt!417062)))))

(declare-fun from!822 () (_ BitVec 64))

(assert (=> b!280871 (= lt!417060 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!772)

(assert (=> b!280871 (= lt!417062 (arrayBitIndices!0 from!822 to!789))))

(declare-fun res!233083 () Bool)

(assert (=> start!62716 (=> (not res!233083) (not e!200454))))

(assert (=> start!62716 (= res!233083 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!7011 a1!699) (size!7011 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7011 a1!699))))))))

(assert (=> start!62716 e!200454))

(assert (=> start!62716 true))

(declare-fun array_inv!6735 (array!16223) Bool)

(assert (=> start!62716 (array_inv!6735 a1!699)))

(assert (=> start!62716 (array_inv!6735 a2!699)))

(declare-fun b!280868 () Bool)

(declare-fun res!233084 () Bool)

(assert (=> b!280868 (=> (not res!233084) (not e!200454))))

(declare-fun arrayBitRangesEq!0 (array!16223 array!16223 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!280868 (= res!233084 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!280872 () Bool)

(declare-fun res!233081 () Bool)

(assert (=> b!280872 (=> (not res!233081) (not e!200454))))

(assert (=> b!280872 (= res!233081 (bvslt from!822 to!789))))

(declare-fun b!280873 () Bool)

(declare-fun Unit!19712 () Unit!19709)

(assert (=> b!280873 (= e!200452 Unit!19712)))

(declare-fun arrayRangesEq!1279 (array!16223 array!16223 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280873 (arrayRangesEq!1279 a1!699 a2!699 (_1!12461 lt!417062) (_2!12461 lt!417062))))

(declare-fun lt!417063 () Unit!19709)

(declare-fun arrayRangesEqSymmetricLemma!186 (array!16223 array!16223 (_ BitVec 32) (_ BitVec 32)) Unit!19709)

(assert (=> b!280873 (= lt!417063 (arrayRangesEqSymmetricLemma!186 a1!699 a2!699 (_1!12461 lt!417062) (_2!12461 lt!417062)))))

(assert (=> b!280873 (arrayRangesEq!1279 a2!699 a1!699 (_1!12461 lt!417062) (_2!12461 lt!417062))))

(assert (= (and start!62716 res!233083) b!280868))

(assert (= (and b!280868 res!233084) b!280872))

(assert (= (and b!280872 res!233081) b!280871))

(assert (= (and b!280871 c!13065) b!280873))

(assert (= (and b!280871 (not c!13065)) b!280870))

(assert (= (and b!280871 res!233082) b!280869))

(declare-fun m!413891 () Bool)

(assert (=> start!62716 m!413891))

(declare-fun m!413893 () Bool)

(assert (=> start!62716 m!413893))

(declare-fun m!413895 () Bool)

(assert (=> b!280871 m!413895))

(declare-fun m!413897 () Bool)

(assert (=> b!280868 m!413897))

(declare-fun m!413899 () Bool)

(assert (=> b!280869 m!413899))

(declare-fun m!413901 () Bool)

(assert (=> b!280869 m!413901))

(assert (=> b!280869 m!413899))

(assert (=> b!280869 m!413901))

(declare-fun m!413903 () Bool)

(assert (=> b!280869 m!413903))

(assert (=> b!280869 m!413901))

(assert (=> b!280869 m!413899))

(declare-fun m!413905 () Bool)

(assert (=> b!280869 m!413905))

(declare-fun m!413907 () Bool)

(assert (=> b!280873 m!413907))

(declare-fun m!413909 () Bool)

(assert (=> b!280873 m!413909))

(declare-fun m!413911 () Bool)

(assert (=> b!280873 m!413911))

(push 1)

(assert (not b!280873))

(assert (not start!62716))

(assert (not b!280869))

(assert (not b!280868))

(assert (not b!280871))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96614 () Bool)

(assert (=> d!96614 (= (arrayBitIndices!0 from!822 to!789) (tuple4!773 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

