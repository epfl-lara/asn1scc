; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62712 () Bool)

(assert start!62712)

(declare-fun b!280832 () Bool)

(declare-datatypes ((Unit!19701 0))(
  ( (Unit!19702) )
))
(declare-fun e!200422 () Unit!19701)

(declare-fun Unit!19703 () Unit!19701)

(assert (=> b!280832 (= e!200422 Unit!19703)))

(declare-datatypes ((array!16219 0))(
  ( (array!16220 (arr!8005 (Array (_ BitVec 32) (_ BitVec 8))) (size!7009 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16219)

(declare-fun a2!699 () array!16219)

(declare-datatypes ((tuple4!768 0))(
  ( (tuple4!769 (_1!12459 (_ BitVec 32)) (_2!12459 (_ BitVec 32)) (_3!1164 (_ BitVec 32)) (_4!384 (_ BitVec 32))) )
))
(declare-fun lt!417038 () tuple4!768)

(declare-fun arrayRangesEq!1277 (array!16219 array!16219 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280832 (arrayRangesEq!1277 a1!699 a2!699 (_1!12459 lt!417038) (_2!12459 lt!417038))))

(declare-fun lt!417036 () Unit!19701)

(declare-fun arrayRangesEqSymmetricLemma!184 (array!16219 array!16219 (_ BitVec 32) (_ BitVec 32)) Unit!19701)

(assert (=> b!280832 (= lt!417036 (arrayRangesEqSymmetricLemma!184 a1!699 a2!699 (_1!12459 lt!417038) (_2!12459 lt!417038)))))

(assert (=> b!280832 (arrayRangesEq!1277 a2!699 a1!699 (_1!12459 lt!417038) (_2!12459 lt!417038))))

(declare-fun b!280834 () Bool)

(declare-fun res!233060 () Bool)

(declare-fun e!200423 () Bool)

(assert (=> b!280834 (=> (not res!233060) (not e!200423))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!16219 array!16219 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!280834 (= res!233060 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!280835 () Bool)

(declare-fun Unit!19704 () Unit!19701)

(assert (=> b!280835 (= e!200422 Unit!19704)))

(declare-fun b!280836 () Bool)

(declare-fun res!233057 () Bool)

(assert (=> b!280836 (=> (not res!233057) (not e!200423))))

(assert (=> b!280836 (= res!233057 (bvslt from!822 to!789))))

(declare-fun b!280837 () Bool)

(declare-fun lt!417039 () (_ BitVec 32))

(declare-fun e!200420 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280837 (= e!200420 (not (byteRangesEq!0 (select (arr!8005 a2!699) (_3!1164 lt!417038)) (select (arr!8005 a1!699) (_3!1164 lt!417038)) lt!417039 #b00000000000000000000000000001000)))))

(assert (=> b!280837 (byteRangesEq!0 (select (arr!8005 a1!699) (_3!1164 lt!417038)) (select (arr!8005 a2!699) (_3!1164 lt!417038)) lt!417039 #b00000000000000000000000000001000)))

(declare-fun res!233058 () Bool)

(assert (=> start!62712 (=> (not res!233058) (not e!200423))))

(assert (=> start!62712 (= res!233058 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!7009 a1!699) (size!7009 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7009 a1!699))))))))

(assert (=> start!62712 e!200423))

(assert (=> start!62712 true))

(declare-fun array_inv!6733 (array!16219) Bool)

(assert (=> start!62712 (array_inv!6733 a1!699)))

(assert (=> start!62712 (array_inv!6733 a2!699)))

(declare-fun b!280833 () Bool)

(assert (=> b!280833 (= e!200423 e!200420)))

(declare-fun res!233059 () Bool)

(assert (=> b!280833 (=> (not res!233059) (not e!200420))))

(assert (=> b!280833 (= res!233059 (not (= (_3!1164 lt!417038) (_4!384 lt!417038))))))

(declare-fun lt!417037 () Unit!19701)

(assert (=> b!280833 (= lt!417037 e!200422)))

(declare-fun c!13059 () Bool)

(assert (=> b!280833 (= c!13059 (bvslt (_1!12459 lt!417038) (_2!12459 lt!417038)))))

(assert (=> b!280833 (= lt!417039 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!768)

(assert (=> b!280833 (= lt!417038 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and start!62712 res!233058) b!280834))

(assert (= (and b!280834 res!233060) b!280836))

(assert (= (and b!280836 res!233057) b!280833))

(assert (= (and b!280833 c!13059) b!280832))

(assert (= (and b!280833 (not c!13059)) b!280835))

(assert (= (and b!280833 res!233059) b!280837))

(declare-fun m!413847 () Bool)

(assert (=> b!280833 m!413847))

(declare-fun m!413849 () Bool)

(assert (=> b!280834 m!413849))

(declare-fun m!413851 () Bool)

(assert (=> start!62712 m!413851))

(declare-fun m!413853 () Bool)

(assert (=> start!62712 m!413853))

(declare-fun m!413855 () Bool)

(assert (=> b!280832 m!413855))

(declare-fun m!413857 () Bool)

(assert (=> b!280832 m!413857))

(declare-fun m!413859 () Bool)

(assert (=> b!280832 m!413859))

(declare-fun m!413861 () Bool)

(assert (=> b!280837 m!413861))

(declare-fun m!413863 () Bool)

(assert (=> b!280837 m!413863))

(assert (=> b!280837 m!413861))

(assert (=> b!280837 m!413863))

(declare-fun m!413865 () Bool)

(assert (=> b!280837 m!413865))

(assert (=> b!280837 m!413863))

(assert (=> b!280837 m!413861))

(declare-fun m!413867 () Bool)

(assert (=> b!280837 m!413867))

(push 1)

(assert (not b!280833))

(assert (not b!280834))

(assert (not b!280837))

(assert (not start!62712))

(assert (not b!280832))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

