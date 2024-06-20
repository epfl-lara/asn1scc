; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52496 () Bool)

(assert start!52496)

(declare-fun b!242431 () Bool)

(declare-fun e!168080 () Bool)

(declare-datatypes ((array!13307 0))(
  ( (array!13308 (arr!6820 (Array (_ BitVec 32) (_ BitVec 8))) (size!5833 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10588 0))(
  ( (BitStream!10589 (buf!6299 array!13307) (currentByte!11662 (_ BitVec 32)) (currentBit!11657 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20748 0))(
  ( (tuple2!20749 (_1!11296 BitStream!10588) (_2!11296 Bool)) )
))
(declare-fun lt!377860 () tuple2!20748)

(declare-fun lt!377850 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!242431 (= e!168080 (= (bitIndex!0 (size!5833 (buf!6299 (_1!11296 lt!377860))) (currentByte!11662 (_1!11296 lt!377860)) (currentBit!11657 (_1!11296 lt!377860))) lt!377850))))

(declare-fun b!242432 () Bool)

(declare-fun e!168074 () Bool)

(declare-fun lt!377852 () tuple2!20748)

(declare-datatypes ((tuple2!20750 0))(
  ( (tuple2!20751 (_1!11297 BitStream!10588) (_2!11297 BitStream!10588)) )
))
(declare-fun lt!377853 () tuple2!20750)

(assert (=> b!242432 (= e!168074 (not (or (not (_2!11296 lt!377852)) (not (= (_1!11296 lt!377852) (_2!11297 lt!377853))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10588 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20748)

(assert (=> b!242432 (= lt!377852 (checkBitsLoopPure!0 (_1!11297 lt!377853) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-datatypes ((Unit!17749 0))(
  ( (Unit!17750) )
))
(declare-datatypes ((tuple2!20752 0))(
  ( (tuple2!20753 (_1!11298 Unit!17749) (_2!11298 BitStream!10588)) )
))
(declare-fun lt!377865 () tuple2!20752)

(declare-fun lt!377863 () tuple2!20752)

(declare-fun lt!377854 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242432 (validate_offset_bits!1 ((_ sign_extend 32) (size!5833 (buf!6299 (_2!11298 lt!377865)))) ((_ sign_extend 32) (currentByte!11662 (_2!11298 lt!377863))) ((_ sign_extend 32) (currentBit!11657 (_2!11298 lt!377863))) lt!377854)))

(declare-fun lt!377858 () Unit!17749)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10588 array!13307 (_ BitVec 64)) Unit!17749)

(assert (=> b!242432 (= lt!377858 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11298 lt!377863) (buf!6299 (_2!11298 lt!377865)) lt!377854))))

(declare-fun reader!0 (BitStream!10588 BitStream!10588) tuple2!20750)

(assert (=> b!242432 (= lt!377853 (reader!0 (_2!11298 lt!377863) (_2!11298 lt!377865)))))

(declare-fun b!242433 () Bool)

(declare-fun res!202455 () Bool)

(declare-fun e!168072 () Bool)

(assert (=> b!242433 (=> (not res!202455) (not e!168072))))

(declare-fun thiss!1005 () BitStream!10588)

(declare-fun isPrefixOf!0 (BitStream!10588 BitStream!10588) Bool)

(assert (=> b!242433 (= res!202455 (isPrefixOf!0 thiss!1005 (_2!11298 lt!377863)))))

(declare-fun b!242434 () Bool)

(declare-fun res!202462 () Bool)

(assert (=> b!242434 (=> (not res!202462) (not e!168074))))

(assert (=> b!242434 (= res!202462 (isPrefixOf!0 (_2!11298 lt!377863) (_2!11298 lt!377865)))))

(declare-fun b!242435 () Bool)

(declare-fun res!202456 () Bool)

(declare-fun e!168071 () Bool)

(assert (=> b!242435 (=> (not res!202456) (not e!168071))))

(assert (=> b!242435 (= res!202456 (bvslt from!289 nBits!297))))

(declare-fun b!242436 () Bool)

(declare-fun e!168079 () Bool)

(declare-fun array_inv!5574 (array!13307) Bool)

(assert (=> b!242436 (= e!168079 (array_inv!5574 (buf!6299 thiss!1005)))))

(declare-fun b!242437 () Bool)

(assert (=> b!242437 (= e!168072 e!168080)))

(declare-fun res!202463 () Bool)

(assert (=> b!242437 (=> (not res!202463) (not e!168080))))

(assert (=> b!242437 (= res!202463 (and (= (_2!11296 lt!377860) bit!26) (= (_1!11296 lt!377860) (_2!11298 lt!377863))))))

(declare-fun readBitPure!0 (BitStream!10588) tuple2!20748)

(declare-fun readerFrom!0 (BitStream!10588 (_ BitVec 32) (_ BitVec 32)) BitStream!10588)

(assert (=> b!242437 (= lt!377860 (readBitPure!0 (readerFrom!0 (_2!11298 lt!377863) (currentBit!11657 thiss!1005) (currentByte!11662 thiss!1005))))))

(declare-fun b!242438 () Bool)

(declare-fun res!202454 () Bool)

(assert (=> b!242438 (=> (not res!202454) (not e!168071))))

(assert (=> b!242438 (= res!202454 (validate_offset_bits!1 ((_ sign_extend 32) (size!5833 (buf!6299 thiss!1005))) ((_ sign_extend 32) (currentByte!11662 thiss!1005)) ((_ sign_extend 32) (currentBit!11657 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!242439 () Bool)

(declare-fun res!202460 () Bool)

(declare-fun e!168076 () Bool)

(assert (=> b!242439 (=> (not res!202460) (not e!168076))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!242439 (= res!202460 (invariant!0 (currentBit!11657 thiss!1005) (currentByte!11662 thiss!1005) (size!5833 (buf!6299 (_2!11298 lt!377863)))))))

(declare-fun b!242440 () Bool)

(declare-fun e!168078 () Bool)

(declare-fun lt!377861 () tuple2!20748)

(declare-fun lt!377857 () tuple2!20748)

(assert (=> b!242440 (= e!168078 (= (_2!11296 lt!377861) (_2!11296 lt!377857)))))

(declare-fun res!202452 () Bool)

(assert (=> start!52496 (=> (not res!202452) (not e!168071))))

(assert (=> start!52496 (= res!202452 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52496 e!168071))

(assert (=> start!52496 true))

(declare-fun inv!12 (BitStream!10588) Bool)

(assert (=> start!52496 (and (inv!12 thiss!1005) e!168079)))

(declare-fun b!242441 () Bool)

(declare-fun e!168073 () Bool)

(assert (=> b!242441 (= e!168073 e!168072)))

(declare-fun res!202459 () Bool)

(assert (=> b!242441 (=> (not res!202459) (not e!168072))))

(declare-fun lt!377859 () (_ BitVec 64))

(assert (=> b!242441 (= res!202459 (= lt!377850 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377859)))))

(assert (=> b!242441 (= lt!377850 (bitIndex!0 (size!5833 (buf!6299 (_2!11298 lt!377863))) (currentByte!11662 (_2!11298 lt!377863)) (currentBit!11657 (_2!11298 lt!377863))))))

(assert (=> b!242441 (= lt!377859 (bitIndex!0 (size!5833 (buf!6299 thiss!1005)) (currentByte!11662 thiss!1005) (currentBit!11657 thiss!1005)))))

(declare-fun b!242442 () Bool)

(declare-fun e!168077 () Bool)

(assert (=> b!242442 (= e!168077 e!168074)))

(declare-fun res!202453 () Bool)

(assert (=> b!242442 (=> (not res!202453) (not e!168074))))

(assert (=> b!242442 (= res!202453 (= (bitIndex!0 (size!5833 (buf!6299 (_2!11298 lt!377865))) (currentByte!11662 (_2!11298 lt!377865)) (currentBit!11657 (_2!11298 lt!377865))) (bvadd (bitIndex!0 (size!5833 (buf!6299 (_2!11298 lt!377863))) (currentByte!11662 (_2!11298 lt!377863)) (currentBit!11657 (_2!11298 lt!377863))) lt!377854)))))

(assert (=> b!242442 (= lt!377854 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!242443 () Bool)

(assert (=> b!242443 (= e!168071 (not (isPrefixOf!0 (_2!11298 lt!377863) (_2!11298 lt!377865))))))

(declare-fun lt!377856 () tuple2!20750)

(assert (=> b!242443 (= lt!377856 (reader!0 thiss!1005 (_2!11298 lt!377865)))))

(assert (=> b!242443 e!168078))

(declare-fun res!202461 () Bool)

(assert (=> b!242443 (=> (not res!202461) (not e!168078))))

(assert (=> b!242443 (= res!202461 (= (bitIndex!0 (size!5833 (buf!6299 (_1!11296 lt!377861))) (currentByte!11662 (_1!11296 lt!377861)) (currentBit!11657 (_1!11296 lt!377861))) (bitIndex!0 (size!5833 (buf!6299 (_1!11296 lt!377857))) (currentByte!11662 (_1!11296 lt!377857)) (currentBit!11657 (_1!11296 lt!377857)))))))

(declare-fun lt!377864 () Unit!17749)

(declare-fun lt!377855 () BitStream!10588)

(declare-fun readBitPrefixLemma!0 (BitStream!10588 BitStream!10588) Unit!17749)

(assert (=> b!242443 (= lt!377864 (readBitPrefixLemma!0 lt!377855 (_2!11298 lt!377865)))))

(assert (=> b!242443 (= lt!377857 (readBitPure!0 (BitStream!10589 (buf!6299 (_2!11298 lt!377865)) (currentByte!11662 thiss!1005) (currentBit!11657 thiss!1005))))))

(assert (=> b!242443 (= lt!377861 (readBitPure!0 lt!377855))))

(assert (=> b!242443 (= lt!377855 (BitStream!10589 (buf!6299 (_2!11298 lt!377863)) (currentByte!11662 thiss!1005) (currentBit!11657 thiss!1005)))))

(assert (=> b!242443 e!168076))

(declare-fun res!202464 () Bool)

(assert (=> b!242443 (=> (not res!202464) (not e!168076))))

(assert (=> b!242443 (= res!202464 (isPrefixOf!0 thiss!1005 (_2!11298 lt!377865)))))

(declare-fun lt!377851 () Unit!17749)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10588 BitStream!10588 BitStream!10588) Unit!17749)

(assert (=> b!242443 (= lt!377851 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11298 lt!377863) (_2!11298 lt!377865)))))

(assert (=> b!242443 e!168077))

(declare-fun res!202458 () Bool)

(assert (=> b!242443 (=> (not res!202458) (not e!168077))))

(assert (=> b!242443 (= res!202458 (= (size!5833 (buf!6299 (_2!11298 lt!377863))) (size!5833 (buf!6299 (_2!11298 lt!377865)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10588 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20752)

(assert (=> b!242443 (= lt!377865 (appendNBitsLoop!0 (_2!11298 lt!377863) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!242443 (validate_offset_bits!1 ((_ sign_extend 32) (size!5833 (buf!6299 (_2!11298 lt!377863)))) ((_ sign_extend 32) (currentByte!11662 (_2!11298 lt!377863))) ((_ sign_extend 32) (currentBit!11657 (_2!11298 lt!377863))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!377862 () Unit!17749)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10588 BitStream!10588 (_ BitVec 64) (_ BitVec 64)) Unit!17749)

(assert (=> b!242443 (= lt!377862 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11298 lt!377863) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!242443 e!168073))

(declare-fun res!202457 () Bool)

(assert (=> b!242443 (=> (not res!202457) (not e!168073))))

(assert (=> b!242443 (= res!202457 (= (size!5833 (buf!6299 thiss!1005)) (size!5833 (buf!6299 (_2!11298 lt!377863)))))))

(declare-fun appendBit!0 (BitStream!10588 Bool) tuple2!20752)

(assert (=> b!242443 (= lt!377863 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!242444 () Bool)

(assert (=> b!242444 (= e!168076 (invariant!0 (currentBit!11657 thiss!1005) (currentByte!11662 thiss!1005) (size!5833 (buf!6299 (_2!11298 lt!377865)))))))

(assert (= (and start!52496 res!202452) b!242438))

(assert (= (and b!242438 res!202454) b!242435))

(assert (= (and b!242435 res!202456) b!242443))

(assert (= (and b!242443 res!202457) b!242441))

(assert (= (and b!242441 res!202459) b!242433))

(assert (= (and b!242433 res!202455) b!242437))

(assert (= (and b!242437 res!202463) b!242431))

(assert (= (and b!242443 res!202458) b!242442))

(assert (= (and b!242442 res!202453) b!242434))

(assert (= (and b!242434 res!202462) b!242432))

(assert (= (and b!242443 res!202464) b!242439))

(assert (= (and b!242439 res!202460) b!242444))

(assert (= (and b!242443 res!202461) b!242440))

(assert (= start!52496 b!242436))

(declare-fun m!365267 () Bool)

(assert (=> b!242441 m!365267))

(declare-fun m!365269 () Bool)

(assert (=> b!242441 m!365269))

(declare-fun m!365271 () Bool)

(assert (=> b!242442 m!365271))

(assert (=> b!242442 m!365267))

(declare-fun m!365273 () Bool)

(assert (=> b!242434 m!365273))

(declare-fun m!365275 () Bool)

(assert (=> b!242443 m!365275))

(assert (=> b!242443 m!365273))

(declare-fun m!365277 () Bool)

(assert (=> b!242443 m!365277))

(declare-fun m!365279 () Bool)

(assert (=> b!242443 m!365279))

(declare-fun m!365281 () Bool)

(assert (=> b!242443 m!365281))

(declare-fun m!365283 () Bool)

(assert (=> b!242443 m!365283))

(declare-fun m!365285 () Bool)

(assert (=> b!242443 m!365285))

(declare-fun m!365287 () Bool)

(assert (=> b!242443 m!365287))

(declare-fun m!365289 () Bool)

(assert (=> b!242443 m!365289))

(declare-fun m!365291 () Bool)

(assert (=> b!242443 m!365291))

(declare-fun m!365293 () Bool)

(assert (=> b!242443 m!365293))

(declare-fun m!365295 () Bool)

(assert (=> b!242443 m!365295))

(declare-fun m!365297 () Bool)

(assert (=> b!242443 m!365297))

(declare-fun m!365299 () Bool)

(assert (=> b!242431 m!365299))

(declare-fun m!365301 () Bool)

(assert (=> start!52496 m!365301))

(declare-fun m!365303 () Bool)

(assert (=> b!242432 m!365303))

(declare-fun m!365305 () Bool)

(assert (=> b!242432 m!365305))

(declare-fun m!365307 () Bool)

(assert (=> b!242432 m!365307))

(declare-fun m!365309 () Bool)

(assert (=> b!242432 m!365309))

(declare-fun m!365311 () Bool)

(assert (=> b!242437 m!365311))

(assert (=> b!242437 m!365311))

(declare-fun m!365313 () Bool)

(assert (=> b!242437 m!365313))

(declare-fun m!365315 () Bool)

(assert (=> b!242433 m!365315))

(declare-fun m!365317 () Bool)

(assert (=> b!242436 m!365317))

(declare-fun m!365319 () Bool)

(assert (=> b!242438 m!365319))

(declare-fun m!365321 () Bool)

(assert (=> b!242444 m!365321))

(declare-fun m!365323 () Bool)

(assert (=> b!242439 m!365323))

(push 1)

(assert (not b!242434))

(assert (not b!242441))

(assert (not b!242438))

(assert (not b!242431))

