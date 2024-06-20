; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62800 () Bool)

(assert start!62800)

(declare-fun b!281167 () Bool)

(declare-fun res!233308 () Bool)

(declare-fun e!200717 () Bool)

(assert (=> b!281167 (=> (not res!233308) (not e!200717))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!281167 (= res!233308 (bvslt from!822 to!789))))

(declare-fun e!200715 () Bool)

(declare-datatypes ((tuple4!784 0))(
  ( (tuple4!785 (_1!12467 (_ BitVec 32)) (_2!12467 (_ BitVec 32)) (_3!1172 (_ BitVec 32)) (_4!392 (_ BitVec 32))) )
))
(declare-fun lt!417204 () tuple4!784)

(declare-fun b!281168 () Bool)

(declare-datatypes ((array!16241 0))(
  ( (array!16242 (arr!8013 (Array (_ BitVec 32) (_ BitVec 8))) (size!7017 (_ BitVec 32))) )
))
(declare-fun a2!699 () array!16241)

(assert (=> b!281168 (= e!200715 (not (or (= ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (and (bvsge (_4!392 lt!417204) #b00000000000000000000000000000000) (bvslt (_4!392 lt!417204) (size!7017 a2!699))))))))

(declare-fun e!200714 () Bool)

(assert (=> b!281168 e!200714))

(declare-fun res!233309 () Bool)

(assert (=> b!281168 (=> (not res!233309) (not e!200714))))

(declare-fun lt!417206 () (_ BitVec 32))

(declare-fun a1!699 () array!16241)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!281168 (= res!233309 (byteRangesEq!0 (select (arr!8013 a1!699) (_3!1172 lt!417204)) (select (arr!8013 a2!699) (_3!1172 lt!417204)) lt!417206 #b00000000000000000000000000001000))))

(declare-fun b!281169 () Bool)

(declare-datatypes ((Unit!19733 0))(
  ( (Unit!19734) )
))
(declare-fun e!200718 () Unit!19733)

(declare-fun Unit!19735 () Unit!19733)

(assert (=> b!281169 (= e!200718 Unit!19735)))

(declare-fun arrayRangesEq!1285 (array!16241 array!16241 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!281169 (arrayRangesEq!1285 a1!699 a2!699 (_1!12467 lt!417204) (_2!12467 lt!417204))))

(declare-fun lt!417205 () Unit!19733)

(declare-fun arrayRangesEqSymmetricLemma!192 (array!16241 array!16241 (_ BitVec 32) (_ BitVec 32)) Unit!19733)

(assert (=> b!281169 (= lt!417205 (arrayRangesEqSymmetricLemma!192 a1!699 a2!699 (_1!12467 lt!417204) (_2!12467 lt!417204)))))

(assert (=> b!281169 (arrayRangesEq!1285 a2!699 a1!699 (_1!12467 lt!417204) (_2!12467 lt!417204))))

(declare-fun res!233312 () Bool)

(assert (=> start!62800 (=> (not res!233312) (not e!200717))))

(assert (=> start!62800 (= res!233312 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!7017 a1!699) (size!7017 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7017 a1!699))))))))

(assert (=> start!62800 e!200717))

(assert (=> start!62800 true))

(declare-fun array_inv!6741 (array!16241) Bool)

(assert (=> start!62800 (array_inv!6741 a1!699)))

(assert (=> start!62800 (array_inv!6741 a2!699)))

(declare-fun b!281170 () Bool)

(declare-fun Unit!19736 () Unit!19733)

(assert (=> b!281170 (= e!200718 Unit!19736)))

(declare-fun b!281171 () Bool)

(declare-fun res!233311 () Bool)

(assert (=> b!281171 (=> (not res!233311) (not e!200717))))

(declare-fun arrayBitRangesEq!0 (array!16241 array!16241 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!281171 (= res!233311 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!281172 () Bool)

(assert (=> b!281172 (= e!200717 e!200715)))

(declare-fun res!233310 () Bool)

(assert (=> b!281172 (=> (not res!233310) (not e!200715))))

(assert (=> b!281172 (= res!233310 (not (= (_3!1172 lt!417204) (_4!392 lt!417204))))))

(declare-fun lt!417207 () Unit!19733)

(assert (=> b!281172 (= lt!417207 e!200718)))

(declare-fun c!13101 () Bool)

(assert (=> b!281172 (= c!13101 (bvslt (_1!12467 lt!417204) (_2!12467 lt!417204)))))

(assert (=> b!281172 (= lt!417206 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!784)

(assert (=> b!281172 (= lt!417204 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!281173 () Bool)

(assert (=> b!281173 (= e!200714 (byteRangesEq!0 (select (arr!8013 a2!699) (_3!1172 lt!417204)) (select (arr!8013 a1!699) (_3!1172 lt!417204)) lt!417206 #b00000000000000000000000000001000))))

(assert (= (and start!62800 res!233312) b!281171))

(assert (= (and b!281171 res!233311) b!281167))

(assert (= (and b!281167 res!233308) b!281172))

(assert (= (and b!281172 c!13101) b!281169))

(assert (= (and b!281172 (not c!13101)) b!281170))

(assert (= (and b!281172 res!233310) b!281168))

(assert (= (and b!281168 res!233309) b!281173))

(declare-fun m!414191 () Bool)

(assert (=> b!281172 m!414191))

(declare-fun m!414193 () Bool)

(assert (=> b!281173 m!414193))

(declare-fun m!414195 () Bool)

(assert (=> b!281173 m!414195))

(assert (=> b!281173 m!414193))

(assert (=> b!281173 m!414195))

(declare-fun m!414197 () Bool)

(assert (=> b!281173 m!414197))

(assert (=> b!281168 m!414195))

(assert (=> b!281168 m!414193))

(assert (=> b!281168 m!414195))

(assert (=> b!281168 m!414193))

(declare-fun m!414199 () Bool)

(assert (=> b!281168 m!414199))

(declare-fun m!414201 () Bool)

(assert (=> b!281169 m!414201))

(declare-fun m!414203 () Bool)

(assert (=> b!281169 m!414203))

(declare-fun m!414205 () Bool)

(assert (=> b!281169 m!414205))

(declare-fun m!414207 () Bool)

(assert (=> start!62800 m!414207))

(declare-fun m!414209 () Bool)

(assert (=> start!62800 m!414209))

(declare-fun m!414211 () Bool)

(assert (=> b!281171 m!414211))

(push 1)

(assert (not start!62800))

(assert (not b!281171))

(assert (not b!281168))

(assert (not b!281172))

(assert (not b!281173))

(assert (not b!281169))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96742 () Bool)

