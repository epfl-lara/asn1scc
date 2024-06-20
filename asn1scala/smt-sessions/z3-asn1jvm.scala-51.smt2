; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1066 () Bool)

(assert start!1066)

(declare-fun b!4209 () Bool)

(declare-fun res!5599 () Bool)

(declare-fun e!2741 () Bool)

(assert (=> b!4209 (=> (not res!5599) (not e!2741))))

(declare-datatypes ((array!329 0))(
  ( (array!330 (arr!527 (Array (_ BitVec 32) (_ BitVec 8))) (size!137 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!252 0))(
  ( (BitStream!253 (buf!458 array!329) (currentByte!1437 (_ BitVec 32)) (currentBit!1432 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!252)

(declare-datatypes ((Unit!324 0))(
  ( (Unit!325) )
))
(declare-datatypes ((tuple2!466 0))(
  ( (tuple2!467 (_1!249 Unit!324) (_2!249 BitStream!252)) )
))
(declare-fun lt!5284 () tuple2!466)

(assert (=> b!4209 (= res!5599 (= (size!137 (buf!458 thiss!1486)) (size!137 (buf!458 (_2!249 lt!5284)))))))

(declare-fun b!4210 () Bool)

(declare-fun res!5601 () Bool)

(declare-fun e!2740 () Bool)

(assert (=> b!4210 (=> (not res!5601) (not e!2740))))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4210 (= res!5601 (validate_offset_bits!1 ((_ sign_extend 32) (size!137 (buf!458 thiss!1486))) ((_ sign_extend 32) (currentByte!1437 thiss!1486)) ((_ sign_extend 32) (currentBit!1432 thiss!1486)) nBits!460))))

(declare-fun res!5598 () Bool)

(assert (=> start!1066 (=> (not res!5598) (not e!2740))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!329)

(assert (=> start!1066 (= res!5598 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!137 srcBuffer!6))))))))

(assert (=> start!1066 e!2740))

(assert (=> start!1066 true))

(declare-fun array_inv!132 (array!329) Bool)

(assert (=> start!1066 (array_inv!132 srcBuffer!6)))

(declare-fun e!2737 () Bool)

(declare-fun inv!12 (BitStream!252) Bool)

(assert (=> start!1066 (and (inv!12 thiss!1486) e!2737)))

(declare-fun b!4211 () Bool)

(declare-fun res!5602 () Bool)

(assert (=> b!4211 (=> (not res!5602) (not e!2741))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4211 (= res!5602 (= (bitIndex!0 (size!137 (buf!458 (_2!249 lt!5284))) (currentByte!1437 (_2!249 lt!5284)) (currentBit!1432 (_2!249 lt!5284))) (bvadd (bitIndex!0 (size!137 (buf!458 thiss!1486)) (currentByte!1437 thiss!1486) (currentBit!1432 thiss!1486)) nBits!460)))))

(declare-fun b!4212 () Bool)

(assert (=> b!4212 (= e!2740 e!2741)))

(declare-fun res!5597 () Bool)

(assert (=> b!4212 (=> (not res!5597) (not e!2741))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4212 (= res!5597 (invariant!0 (currentBit!1432 (_2!249 lt!5284)) (currentByte!1437 (_2!249 lt!5284)) (size!137 (buf!458 (_2!249 lt!5284)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!252 array!329 (_ BitVec 64) (_ BitVec 64)) tuple2!466)

(assert (=> b!4212 (= lt!5284 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!4213 () Bool)

(assert (=> b!4213 (= e!2737 (array_inv!132 (buf!458 thiss!1486)))))

(declare-fun b!4214 () Bool)

(declare-fun res!5600 () Bool)

(assert (=> b!4214 (=> (not res!5600) (not e!2741))))

(declare-fun isPrefixOf!0 (BitStream!252 BitStream!252) Bool)

(assert (=> b!4214 (= res!5600 (isPrefixOf!0 thiss!1486 (_2!249 lt!5284)))))

(declare-fun b!4215 () Bool)

(assert (=> b!4215 (= e!2741 (not true))))

(declare-datatypes ((tuple2!468 0))(
  ( (tuple2!469 (_1!250 BitStream!252) (_2!250 BitStream!252)) )
))
(declare-fun lt!5285 () tuple2!468)

(declare-datatypes ((List!37 0))(
  ( (Nil!34) (Cons!33 (h!152 Bool) (t!787 List!37)) )
))
(declare-fun lt!5282 () List!37)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!252 BitStream!252 (_ BitVec 64)) List!37)

(assert (=> b!4215 (= lt!5282 (bitStreamReadBitsIntoList!0 (_2!249 lt!5284) (_1!250 lt!5285) nBits!460))))

(declare-datatypes ((tuple2!470 0))(
  ( (tuple2!471 (_1!251 array!329) (_2!251 BitStream!252)) )
))
(declare-fun lt!5281 () tuple2!470)

(declare-fun readBits!0 (BitStream!252 (_ BitVec 64)) tuple2!470)

(assert (=> b!4215 (= lt!5281 (readBits!0 (_1!250 lt!5285) nBits!460))))

(assert (=> b!4215 (validate_offset_bits!1 ((_ sign_extend 32) (size!137 (buf!458 (_2!249 lt!5284)))) ((_ sign_extend 32) (currentByte!1437 thiss!1486)) ((_ sign_extend 32) (currentBit!1432 thiss!1486)) nBits!460)))

(declare-fun lt!5283 () Unit!324)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!252 array!329 (_ BitVec 64)) Unit!324)

(assert (=> b!4215 (= lt!5283 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!458 (_2!249 lt!5284)) nBits!460))))

(declare-fun reader!0 (BitStream!252 BitStream!252) tuple2!468)

(assert (=> b!4215 (= lt!5285 (reader!0 thiss!1486 (_2!249 lt!5284)))))

(assert (= (and start!1066 res!5598) b!4210))

(assert (= (and b!4210 res!5601) b!4212))

(assert (= (and b!4212 res!5597) b!4209))

(assert (= (and b!4209 res!5599) b!4211))

(assert (= (and b!4211 res!5602) b!4214))

(assert (= (and b!4214 res!5600) b!4215))

(assert (= start!1066 b!4213))

(declare-fun m!4945 () Bool)

(assert (=> b!4213 m!4945))

(declare-fun m!4947 () Bool)

(assert (=> b!4211 m!4947))

(declare-fun m!4949 () Bool)

(assert (=> b!4211 m!4949))

(declare-fun m!4951 () Bool)

(assert (=> b!4210 m!4951))

(declare-fun m!4953 () Bool)

(assert (=> start!1066 m!4953))

(declare-fun m!4955 () Bool)

(assert (=> start!1066 m!4955))

(declare-fun m!4957 () Bool)

(assert (=> b!4212 m!4957))

(declare-fun m!4959 () Bool)

(assert (=> b!4212 m!4959))

(declare-fun m!4961 () Bool)

(assert (=> b!4214 m!4961))

(declare-fun m!4963 () Bool)

(assert (=> b!4215 m!4963))

(declare-fun m!4965 () Bool)

(assert (=> b!4215 m!4965))

(declare-fun m!4967 () Bool)

(assert (=> b!4215 m!4967))

(declare-fun m!4969 () Bool)

(assert (=> b!4215 m!4969))

(declare-fun m!4971 () Bool)

(assert (=> b!4215 m!4971))

(check-sat (not b!4211) (not b!4210) (not b!4212) (not start!1066) (not b!4214) (not b!4213) (not b!4215))
