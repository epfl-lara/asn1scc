; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27470 () Bool)

(assert start!27470)

(declare-fun b!141384 () Bool)

(declare-fun res!117932 () Bool)

(declare-fun e!94195 () Bool)

(assert (=> b!141384 (=> (not res!117932) (not e!94195))))

(declare-datatypes ((array!6485 0))(
  ( (array!6486 (arr!3643 (Array (_ BitVec 32) (_ BitVec 8))) (size!2936 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5130 0))(
  ( (BitStream!5131 (buf!3357 array!6485) (currentByte!6217 (_ BitVec 32)) (currentBit!6212 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5130)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141384 (= res!117932 (invariant!0 (currentBit!6212 thiss!1634) (currentByte!6217 thiss!1634) (size!2936 (buf!3357 thiss!1634))))))

(declare-fun res!117933 () Bool)

(assert (=> start!27470 (=> (not res!117933) (not e!94195))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6485)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!27470 (= res!117933 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2936 arr!237))))))

(assert (=> start!27470 e!94195))

(assert (=> start!27470 true))

(declare-fun array_inv!2725 (array!6485) Bool)

(assert (=> start!27470 (array_inv!2725 arr!237)))

(declare-fun e!94194 () Bool)

(declare-fun inv!12 (BitStream!5130) Bool)

(assert (=> start!27470 (and (inv!12 thiss!1634) e!94194)))

(declare-fun b!141385 () Bool)

(assert (=> b!141385 (= e!94194 (array_inv!2725 (buf!3357 thiss!1634)))))

(declare-datatypes ((tuple2!12504 0))(
  ( (tuple2!12505 (_1!6582 BitStream!5130) (_2!6582 array!6485)) )
))
(declare-fun lt!219484 () tuple2!12504)

(declare-fun e!94196 () Bool)

(declare-fun b!141386 () Bool)

(declare-fun arrayRangesEq!252 (array!6485 array!6485 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141386 (= e!94196 (not (arrayRangesEq!252 arr!237 (_2!6582 lt!219484) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!141387 () Bool)

(declare-fun res!117935 () Bool)

(assert (=> b!141387 (=> (not res!117935) (not e!94195))))

(assert (=> b!141387 (= res!117935 (bvslt from!447 to!404))))

(declare-fun e!94197 () Bool)

(declare-datatypes ((tuple2!12506 0))(
  ( (tuple2!12507 (_1!6583 BitStream!5130) (_2!6583 (_ BitVec 8))) )
))
(declare-fun lt!219481 () tuple2!12506)

(declare-fun b!141388 () Bool)

(declare-datatypes ((tuple2!12508 0))(
  ( (tuple2!12509 (_1!6584 BitStream!5130) (_2!6584 BitStream!5130)) )
))
(declare-fun lt!219485 () tuple2!12508)

(assert (=> b!141388 (= e!94197 (and (= (_2!6583 lt!219481) (select (arr!3643 arr!237) from!447)) (= (_1!6583 lt!219481) (_2!6584 lt!219485))))))

(declare-fun readBytePure!0 (BitStream!5130) tuple2!12506)

(assert (=> b!141388 (= lt!219481 (readBytePure!0 (_1!6584 lt!219485)))))

(declare-datatypes ((Unit!8854 0))(
  ( (Unit!8855) )
))
(declare-datatypes ((tuple2!12510 0))(
  ( (tuple2!12511 (_1!6585 Unit!8854) (_2!6585 BitStream!5130)) )
))
(declare-fun lt!219488 () tuple2!12510)

(declare-fun reader!0 (BitStream!5130 BitStream!5130) tuple2!12508)

(assert (=> b!141388 (= lt!219485 (reader!0 thiss!1634 (_2!6585 lt!219488)))))

(declare-fun b!141389 () Bool)

(declare-fun res!117937 () Bool)

(assert (=> b!141389 (=> (not res!117937) (not e!94195))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!141389 (= res!117937 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2936 (buf!3357 thiss!1634))) ((_ sign_extend 32) (currentByte!6217 thiss!1634)) ((_ sign_extend 32) (currentBit!6212 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!141390 () Bool)

(declare-fun res!117936 () Bool)

(declare-fun e!94191 () Bool)

(assert (=> b!141390 (=> (not res!117936) (not e!94191))))

(declare-fun lt!219479 () tuple2!12510)

(declare-fun isPrefixOf!0 (BitStream!5130 BitStream!5130) Bool)

(assert (=> b!141390 (= res!117936 (isPrefixOf!0 (_2!6585 lt!219488) (_2!6585 lt!219479)))))

(declare-fun b!141391 () Bool)

(declare-fun res!117930 () Bool)

(assert (=> b!141391 (=> (not res!117930) (not e!94197))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!141391 (= res!117930 (= (bitIndex!0 (size!2936 (buf!3357 (_2!6585 lt!219488))) (currentByte!6217 (_2!6585 lt!219488)) (currentBit!6212 (_2!6585 lt!219488))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2936 (buf!3357 thiss!1634)) (currentByte!6217 thiss!1634) (currentBit!6212 thiss!1634)))))))

(declare-fun b!141392 () Bool)

(assert (=> b!141392 (= e!94191 (not e!94196))))

(declare-fun res!117929 () Bool)

(assert (=> b!141392 (=> res!117929 e!94196)))

(declare-fun lt!219487 () tuple2!12508)

(assert (=> b!141392 (= res!117929 (or (not (= (size!2936 (_2!6582 lt!219484)) (size!2936 arr!237))) (not (= (_1!6582 lt!219484) (_2!6584 lt!219487)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5130 array!6485 (_ BitVec 32) (_ BitVec 32)) tuple2!12504)

(assert (=> b!141392 (= lt!219484 (readByteArrayLoopPure!0 (_1!6584 lt!219487) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!219483 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!141392 (validate_offset_bits!1 ((_ sign_extend 32) (size!2936 (buf!3357 (_2!6585 lt!219479)))) ((_ sign_extend 32) (currentByte!6217 (_2!6585 lt!219488))) ((_ sign_extend 32) (currentBit!6212 (_2!6585 lt!219488))) lt!219483)))

(declare-fun lt!219486 () Unit!8854)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5130 array!6485 (_ BitVec 64)) Unit!8854)

(assert (=> b!141392 (= lt!219486 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6585 lt!219488) (buf!3357 (_2!6585 lt!219479)) lt!219483))))

(assert (=> b!141392 (= lt!219487 (reader!0 (_2!6585 lt!219488) (_2!6585 lt!219479)))))

(declare-fun b!141393 () Bool)

(declare-fun res!117934 () Bool)

(assert (=> b!141393 (=> (not res!117934) (not e!94197))))

(assert (=> b!141393 (= res!117934 (isPrefixOf!0 thiss!1634 (_2!6585 lt!219488)))))

(declare-fun b!141394 () Bool)

(assert (=> b!141394 (= e!94195 (not (isPrefixOf!0 (_2!6585 lt!219488) (_2!6585 lt!219479))))))

(declare-fun lt!219480 () Bool)

(assert (=> b!141394 (= lt!219480 (isPrefixOf!0 thiss!1634 (_2!6585 lt!219488)))))

(declare-fun e!94192 () Bool)

(assert (=> b!141394 e!94192))

(declare-fun res!117931 () Bool)

(assert (=> b!141394 (=> (not res!117931) (not e!94192))))

(assert (=> b!141394 (= res!117931 (= (size!2936 (buf!3357 (_2!6585 lt!219488))) (size!2936 (buf!3357 (_2!6585 lt!219479)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5130 array!6485 (_ BitVec 32) (_ BitVec 32)) tuple2!12510)

(assert (=> b!141394 (= lt!219479 (appendByteArrayLoop!0 (_2!6585 lt!219488) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!141394 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2936 (buf!3357 (_2!6585 lt!219488)))) ((_ sign_extend 32) (currentByte!6217 (_2!6585 lt!219488))) ((_ sign_extend 32) (currentBit!6212 (_2!6585 lt!219488))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!219482 () Unit!8854)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5130 BitStream!5130 (_ BitVec 64) (_ BitVec 32)) Unit!8854)

(assert (=> b!141394 (= lt!219482 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6585 lt!219488) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!141394 e!94197))

(declare-fun res!117928 () Bool)

(assert (=> b!141394 (=> (not res!117928) (not e!94197))))

(assert (=> b!141394 (= res!117928 (= (size!2936 (buf!3357 thiss!1634)) (size!2936 (buf!3357 (_2!6585 lt!219488)))))))

(declare-fun appendByte!0 (BitStream!5130 (_ BitVec 8)) tuple2!12510)

(assert (=> b!141394 (= lt!219488 (appendByte!0 thiss!1634 (select (arr!3643 arr!237) from!447)))))

(declare-fun b!141395 () Bool)

(assert (=> b!141395 (= e!94192 e!94191)))

(declare-fun res!117927 () Bool)

(assert (=> b!141395 (=> (not res!117927) (not e!94191))))

(assert (=> b!141395 (= res!117927 (= (bitIndex!0 (size!2936 (buf!3357 (_2!6585 lt!219479))) (currentByte!6217 (_2!6585 lt!219479)) (currentBit!6212 (_2!6585 lt!219479))) (bvadd (bitIndex!0 (size!2936 (buf!3357 (_2!6585 lt!219488))) (currentByte!6217 (_2!6585 lt!219488)) (currentBit!6212 (_2!6585 lt!219488))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!219483))))))

(assert (=> b!141395 (= lt!219483 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (= (and start!27470 res!117933) b!141389))

(assert (= (and b!141389 res!117937) b!141387))

(assert (= (and b!141387 res!117935) b!141384))

(assert (= (and b!141384 res!117932) b!141394))

(assert (= (and b!141394 res!117928) b!141391))

(assert (= (and b!141391 res!117930) b!141393))

(assert (= (and b!141393 res!117934) b!141388))

(assert (= (and b!141394 res!117931) b!141395))

(assert (= (and b!141395 res!117927) b!141390))

(assert (= (and b!141390 res!117936) b!141392))

(assert (= (and b!141392 (not res!117929)) b!141386))

(assert (= start!27470 b!141385))

(declare-fun m!217249 () Bool)

(assert (=> start!27470 m!217249))

(declare-fun m!217251 () Bool)

(assert (=> start!27470 m!217251))

(declare-fun m!217253 () Bool)

(assert (=> b!141394 m!217253))

(declare-fun m!217255 () Bool)

(assert (=> b!141394 m!217255))

(declare-fun m!217257 () Bool)

(assert (=> b!141394 m!217257))

(declare-fun m!217259 () Bool)

(assert (=> b!141394 m!217259))

(declare-fun m!217261 () Bool)

(assert (=> b!141394 m!217261))

(declare-fun m!217263 () Bool)

(assert (=> b!141394 m!217263))

(declare-fun m!217265 () Bool)

(assert (=> b!141394 m!217265))

(assert (=> b!141394 m!217263))

(declare-fun m!217267 () Bool)

(assert (=> b!141384 m!217267))

(declare-fun m!217269 () Bool)

(assert (=> b!141395 m!217269))

(declare-fun m!217271 () Bool)

(assert (=> b!141395 m!217271))

(declare-fun m!217273 () Bool)

(assert (=> b!141389 m!217273))

(declare-fun m!217275 () Bool)

(assert (=> b!141392 m!217275))

(declare-fun m!217277 () Bool)

(assert (=> b!141392 m!217277))

(declare-fun m!217279 () Bool)

(assert (=> b!141392 m!217279))

(declare-fun m!217281 () Bool)

(assert (=> b!141392 m!217281))

(assert (=> b!141390 m!217261))

(assert (=> b!141393 m!217259))

(declare-fun m!217283 () Bool)

(assert (=> b!141386 m!217283))

(assert (=> b!141391 m!217271))

(declare-fun m!217285 () Bool)

(assert (=> b!141391 m!217285))

(declare-fun m!217287 () Bool)

(assert (=> b!141385 m!217287))

(assert (=> b!141388 m!217263))

(declare-fun m!217289 () Bool)

(assert (=> b!141388 m!217289))

(declare-fun m!217291 () Bool)

(assert (=> b!141388 m!217291))

(check-sat (not b!141384) (not b!141393) (not b!141388) (not start!27470) (not b!141394) (not b!141385) (not b!141389) (not b!141386) (not b!141392) (not b!141395) (not b!141391) (not b!141390))
