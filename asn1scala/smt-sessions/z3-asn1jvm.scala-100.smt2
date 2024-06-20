; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2362 () Bool)

(assert start!2362)

(declare-fun b!11122 () Bool)

(declare-fun res!10953 () Bool)

(declare-fun e!6795 () Bool)

(assert (=> b!11122 (=> res!10953 e!6795)))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((List!160 0))(
  ( (Nil!157) (Cons!156 (h!275 Bool) (t!910 List!160)) )
))
(declare-fun lt!17594 () List!160)

(declare-datatypes ((array!653 0))(
  ( (array!654 (arr!701 (Array (_ BitVec 32) (_ BitVec 8))) (size!281 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!653)

(declare-datatypes ((BitStream!528 0))(
  ( (BitStream!529 (buf!626 array!653) (currentByte!1698 (_ BitVec 32)) (currentBit!1693 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!958 0))(
  ( (Unit!959) )
))
(declare-datatypes ((tuple2!1360 0))(
  ( (tuple2!1361 (_1!726 Unit!958) (_2!726 BitStream!528)) )
))
(declare-fun lt!17593 () tuple2!1360)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun byteArrayBitContentToList!0 (BitStream!528 array!653 (_ BitVec 64) (_ BitVec 64)) List!160)

(assert (=> b!11122 (= res!10953 (not (= lt!17594 (byteArrayBitContentToList!0 (_2!726 lt!17593) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!11123 () Bool)

(declare-fun res!10955 () Bool)

(declare-fun e!6794 () Bool)

(assert (=> b!11123 (=> (not res!10955) (not e!6794))))

(declare-fun thiss!1486 () BitStream!528)

(declare-fun isPrefixOf!0 (BitStream!528 BitStream!528) Bool)

(assert (=> b!11123 (= res!10955 (isPrefixOf!0 thiss!1486 (_2!726 lt!17593)))))

(declare-fun res!10956 () Bool)

(declare-fun e!6792 () Bool)

(assert (=> start!2362 (=> (not res!10956) (not e!6792))))

(assert (=> start!2362 (= res!10956 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!281 srcBuffer!6))))))))

(assert (=> start!2362 e!6792))

(assert (=> start!2362 true))

(declare-fun array_inv!273 (array!653) Bool)

(assert (=> start!2362 (array_inv!273 srcBuffer!6)))

(declare-fun e!6797 () Bool)

(declare-fun inv!12 (BitStream!528) Bool)

(assert (=> start!2362 (and (inv!12 thiss!1486) e!6797)))

(declare-fun b!11124 () Bool)

(assert (=> b!11124 (= e!6795 true)))

(declare-fun lt!17591 () Unit!958)

(declare-datatypes ((tuple2!1362 0))(
  ( (tuple2!1363 (_1!727 array!653) (_2!727 BitStream!528)) )
))
(declare-fun lt!17592 () tuple2!1362)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!528 array!653 array!653 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!958)

(assert (=> b!11124 (= lt!17591 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!726 lt!17593) srcBuffer!6 (_1!727 lt!17592) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!11125 () Bool)

(declare-fun res!10959 () Bool)

(assert (=> b!11125 (=> (not res!10959) (not e!6792))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!11125 (= res!10959 (validate_offset_bits!1 ((_ sign_extend 32) (size!281 (buf!626 thiss!1486))) ((_ sign_extend 32) (currentByte!1698 thiss!1486)) ((_ sign_extend 32) (currentBit!1693 thiss!1486)) nBits!460))))

(declare-fun b!11126 () Bool)

(declare-fun res!10954 () Bool)

(assert (=> b!11126 (=> (not res!10954) (not e!6794))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!11126 (= res!10954 (= (bitIndex!0 (size!281 (buf!626 (_2!726 lt!17593))) (currentByte!1698 (_2!726 lt!17593)) (currentBit!1693 (_2!726 lt!17593))) (bvadd (bitIndex!0 (size!281 (buf!626 thiss!1486)) (currentByte!1698 thiss!1486) (currentBit!1693 thiss!1486)) nBits!460)))))

(declare-fun b!11127 () Bool)

(assert (=> b!11127 (= e!6794 (not e!6795))))

(declare-fun res!10958 () Bool)

(assert (=> b!11127 (=> res!10958 e!6795)))

(assert (=> b!11127 (= res!10958 (not (= (byteArrayBitContentToList!0 (_2!726 lt!17593) (_1!727 lt!17592) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!17594)))))

(declare-datatypes ((tuple2!1364 0))(
  ( (tuple2!1365 (_1!728 BitStream!528) (_2!728 BitStream!528)) )
))
(declare-fun lt!17589 () tuple2!1364)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!528 BitStream!528 (_ BitVec 64)) List!160)

(assert (=> b!11127 (= lt!17594 (bitStreamReadBitsIntoList!0 (_2!726 lt!17593) (_1!728 lt!17589) nBits!460))))

(declare-fun readBits!0 (BitStream!528 (_ BitVec 64)) tuple2!1362)

(assert (=> b!11127 (= lt!17592 (readBits!0 (_1!728 lt!17589) nBits!460))))

(assert (=> b!11127 (validate_offset_bits!1 ((_ sign_extend 32) (size!281 (buf!626 (_2!726 lt!17593)))) ((_ sign_extend 32) (currentByte!1698 thiss!1486)) ((_ sign_extend 32) (currentBit!1693 thiss!1486)) nBits!460)))

(declare-fun lt!17590 () Unit!958)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!528 array!653 (_ BitVec 64)) Unit!958)

(assert (=> b!11127 (= lt!17590 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!626 (_2!726 lt!17593)) nBits!460))))

(declare-fun reader!0 (BitStream!528 BitStream!528) tuple2!1364)

(assert (=> b!11127 (= lt!17589 (reader!0 thiss!1486 (_2!726 lt!17593)))))

(declare-fun b!11128 () Bool)

(declare-fun res!10960 () Bool)

(assert (=> b!11128 (=> (not res!10960) (not e!6794))))

(assert (=> b!11128 (= res!10960 (= (size!281 (buf!626 thiss!1486)) (size!281 (buf!626 (_2!726 lt!17593)))))))

(declare-fun b!11129 () Bool)

(assert (=> b!11129 (= e!6792 e!6794)))

(declare-fun res!10957 () Bool)

(assert (=> b!11129 (=> (not res!10957) (not e!6794))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!11129 (= res!10957 (invariant!0 (currentBit!1693 (_2!726 lt!17593)) (currentByte!1698 (_2!726 lt!17593)) (size!281 (buf!626 (_2!726 lt!17593)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!528 array!653 (_ BitVec 64) (_ BitVec 64)) tuple2!1360)

(assert (=> b!11129 (= lt!17593 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!11130 () Bool)

(assert (=> b!11130 (= e!6797 (array_inv!273 (buf!626 thiss!1486)))))

(assert (= (and start!2362 res!10956) b!11125))

(assert (= (and b!11125 res!10959) b!11129))

(assert (= (and b!11129 res!10957) b!11128))

(assert (= (and b!11128 res!10960) b!11126))

(assert (= (and b!11126 res!10954) b!11123))

(assert (= (and b!11123 res!10955) b!11127))

(assert (= (and b!11127 (not res!10958)) b!11122))

(assert (= (and b!11122 (not res!10953)) b!11124))

(assert (= start!2362 b!11130))

(declare-fun m!16263 () Bool)

(assert (=> b!11129 m!16263))

(declare-fun m!16265 () Bool)

(assert (=> b!11129 m!16265))

(declare-fun m!16267 () Bool)

(assert (=> b!11126 m!16267))

(declare-fun m!16269 () Bool)

(assert (=> b!11126 m!16269))

(declare-fun m!16271 () Bool)

(assert (=> b!11124 m!16271))

(declare-fun m!16273 () Bool)

(assert (=> b!11122 m!16273))

(declare-fun m!16275 () Bool)

(assert (=> start!2362 m!16275))

(declare-fun m!16277 () Bool)

(assert (=> start!2362 m!16277))

(declare-fun m!16279 () Bool)

(assert (=> b!11130 m!16279))

(declare-fun m!16281 () Bool)

(assert (=> b!11125 m!16281))

(declare-fun m!16283 () Bool)

(assert (=> b!11127 m!16283))

(declare-fun m!16285 () Bool)

(assert (=> b!11127 m!16285))

(declare-fun m!16287 () Bool)

(assert (=> b!11127 m!16287))

(declare-fun m!16289 () Bool)

(assert (=> b!11127 m!16289))

(declare-fun m!16291 () Bool)

(assert (=> b!11127 m!16291))

(declare-fun m!16293 () Bool)

(assert (=> b!11127 m!16293))

(declare-fun m!16295 () Bool)

(assert (=> b!11123 m!16295))

(check-sat (not b!11126) (not b!11127) (not b!11130) (not b!11129) (not start!2362) (not b!11122) (not b!11125) (not b!11124) (not b!11123))
