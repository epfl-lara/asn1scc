; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20332 () Bool)

(assert start!20332)

(declare-fun b!101951 () Bool)

(declare-fun e!66646 () Bool)

(declare-datatypes ((array!4776 0))(
  ( (array!4777 (arr!2772 (Array (_ BitVec 32) (_ BitVec 8))) (size!2179 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3832 0))(
  ( (BitStream!3833 (buf!2539 array!4776) (currentByte!5012 (_ BitVec 32)) (currentBit!5007 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8266 0))(
  ( (tuple2!8267 (_1!4388 BitStream!3832) (_2!4388 Bool)) )
))
(declare-fun lt!148340 () tuple2!8266)

(declare-fun lt!148345 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101951 (= e!66646 (= (bitIndex!0 (size!2179 (buf!2539 (_1!4388 lt!148340))) (currentByte!5012 (_1!4388 lt!148340)) (currentBit!5007 (_1!4388 lt!148340))) lt!148345))))

(declare-fun b!101952 () Bool)

(declare-fun e!66648 () Bool)

(declare-fun lt!148342 () tuple2!8266)

(declare-fun lt!148344 () tuple2!8266)

(assert (=> b!101952 (= e!66648 (= (_2!4388 lt!148342) (_2!4388 lt!148344)))))

(declare-fun b!101953 () Bool)

(declare-fun res!83795 () Bool)

(declare-fun e!66649 () Bool)

(assert (=> b!101953 (=> (not res!83795) (not e!66649))))

(declare-fun thiss!1305 () BitStream!3832)

(declare-datatypes ((Unit!6254 0))(
  ( (Unit!6255) )
))
(declare-datatypes ((tuple2!8268 0))(
  ( (tuple2!8269 (_1!4389 Unit!6254) (_2!4389 BitStream!3832)) )
))
(declare-fun lt!148339 () tuple2!8268)

(declare-fun isPrefixOf!0 (BitStream!3832 BitStream!3832) Bool)

(assert (=> b!101953 (= res!83795 (isPrefixOf!0 thiss!1305 (_2!4389 lt!148339)))))

(declare-fun res!83789 () Bool)

(declare-fun e!66651 () Bool)

(assert (=> start!20332 (=> (not res!83789) (not e!66651))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!20332 (= res!83789 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20332 e!66651))

(assert (=> start!20332 true))

(declare-fun e!66652 () Bool)

(declare-fun inv!12 (BitStream!3832) Bool)

(assert (=> start!20332 (and (inv!12 thiss!1305) e!66652)))

(declare-fun b!101954 () Bool)

(declare-fun e!66647 () Bool)

(assert (=> b!101954 (= e!66647 e!66649)))

(declare-fun res!83784 () Bool)

(assert (=> b!101954 (=> (not res!83784) (not e!66649))))

(declare-fun lt!148349 () (_ BitVec 64))

(assert (=> b!101954 (= res!83784 (= lt!148345 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!148349)))))

(assert (=> b!101954 (= lt!148345 (bitIndex!0 (size!2179 (buf!2539 (_2!4389 lt!148339))) (currentByte!5012 (_2!4389 lt!148339)) (currentBit!5007 (_2!4389 lt!148339))))))

(assert (=> b!101954 (= lt!148349 (bitIndex!0 (size!2179 (buf!2539 thiss!1305)) (currentByte!5012 thiss!1305) (currentBit!5007 thiss!1305)))))

(declare-fun b!101955 () Bool)

(declare-fun array_inv!1981 (array!4776) Bool)

(assert (=> b!101955 (= e!66652 (array_inv!1981 (buf!2539 thiss!1305)))))

(declare-fun b!101956 () Bool)

(declare-fun e!66654 () Bool)

(declare-fun e!66645 () Bool)

(assert (=> b!101956 (= e!66654 (not e!66645))))

(declare-fun res!83791 () Bool)

(assert (=> b!101956 (=> res!83791 e!66645)))

(declare-datatypes ((tuple2!8270 0))(
  ( (tuple2!8271 (_1!4390 BitStream!3832) (_2!4390 BitStream!3832)) )
))
(declare-fun lt!148351 () tuple2!8270)

(declare-fun lt!148352 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!101956 (= res!83791 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2179 (buf!2539 (_1!4390 lt!148351)))) ((_ sign_extend 32) (currentByte!5012 (_1!4390 lt!148351))) ((_ sign_extend 32) (currentBit!5007 (_1!4390 lt!148351))) lt!148352)))))

(declare-fun lt!148347 () tuple2!8268)

(assert (=> b!101956 (validate_offset_bits!1 ((_ sign_extend 32) (size!2179 (buf!2539 (_2!4389 lt!148347)))) ((_ sign_extend 32) (currentByte!5012 thiss!1305)) ((_ sign_extend 32) (currentBit!5007 thiss!1305)) lt!148352)))

(declare-fun lt!148350 () Unit!6254)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3832 array!4776 (_ BitVec 64)) Unit!6254)

(assert (=> b!101956 (= lt!148350 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2539 (_2!4389 lt!148347)) lt!148352))))

(declare-fun lt!148354 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101956 (= lt!148354 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(declare-fun lt!148341 () Bool)

(declare-fun readBitPure!0 (BitStream!3832) tuple2!8266)

(assert (=> b!101956 (= (_2!4388 (readBitPure!0 (_1!4390 lt!148351))) lt!148341)))

(declare-fun lt!148343 () tuple2!8270)

(declare-fun reader!0 (BitStream!3832 BitStream!3832) tuple2!8270)

(assert (=> b!101956 (= lt!148343 (reader!0 (_2!4389 lt!148339) (_2!4389 lt!148347)))))

(assert (=> b!101956 (= lt!148351 (reader!0 thiss!1305 (_2!4389 lt!148347)))))

(assert (=> b!101956 e!66648))

(declare-fun res!83788 () Bool)

(assert (=> b!101956 (=> (not res!83788) (not e!66648))))

(assert (=> b!101956 (= res!83788 (= (bitIndex!0 (size!2179 (buf!2539 (_1!4388 lt!148342))) (currentByte!5012 (_1!4388 lt!148342)) (currentBit!5007 (_1!4388 lt!148342))) (bitIndex!0 (size!2179 (buf!2539 (_1!4388 lt!148344))) (currentByte!5012 (_1!4388 lt!148344)) (currentBit!5007 (_1!4388 lt!148344)))))))

(declare-fun lt!148346 () Unit!6254)

(declare-fun lt!148348 () BitStream!3832)

(declare-fun readBitPrefixLemma!0 (BitStream!3832 BitStream!3832) Unit!6254)

(assert (=> b!101956 (= lt!148346 (readBitPrefixLemma!0 lt!148348 (_2!4389 lt!148347)))))

(assert (=> b!101956 (= lt!148344 (readBitPure!0 (BitStream!3833 (buf!2539 (_2!4389 lt!148347)) (currentByte!5012 thiss!1305) (currentBit!5007 thiss!1305))))))

(assert (=> b!101956 (= lt!148342 (readBitPure!0 lt!148348))))

(assert (=> b!101956 (= lt!148348 (BitStream!3833 (buf!2539 (_2!4389 lt!148339)) (currentByte!5012 thiss!1305) (currentBit!5007 thiss!1305)))))

(declare-fun e!66653 () Bool)

(assert (=> b!101956 e!66653))

(declare-fun res!83793 () Bool)

(assert (=> b!101956 (=> (not res!83793) (not e!66653))))

(assert (=> b!101956 (= res!83793 (isPrefixOf!0 thiss!1305 (_2!4389 lt!148347)))))

(declare-fun lt!148353 () Unit!6254)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3832 BitStream!3832 BitStream!3832) Unit!6254)

(assert (=> b!101956 (= lt!148353 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4389 lt!148339) (_2!4389 lt!148347)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3832 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8268)

(assert (=> b!101956 (= lt!148347 (appendNLeastSignificantBitsLoop!0 (_2!4389 lt!148339) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!101956 e!66647))

(declare-fun res!83787 () Bool)

(assert (=> b!101956 (=> (not res!83787) (not e!66647))))

(assert (=> b!101956 (= res!83787 (= (size!2179 (buf!2539 thiss!1305)) (size!2179 (buf!2539 (_2!4389 lt!148339)))))))

(declare-fun appendBit!0 (BitStream!3832 Bool) tuple2!8268)

(assert (=> b!101956 (= lt!148339 (appendBit!0 thiss!1305 lt!148341))))

(assert (=> b!101956 (= lt!148341 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101957 () Bool)

(assert (=> b!101957 (= e!66651 e!66654)))

(declare-fun res!83792 () Bool)

(assert (=> b!101957 (=> (not res!83792) (not e!66654))))

(assert (=> b!101957 (= res!83792 (validate_offset_bits!1 ((_ sign_extend 32) (size!2179 (buf!2539 thiss!1305))) ((_ sign_extend 32) (currentByte!5012 thiss!1305)) ((_ sign_extend 32) (currentBit!5007 thiss!1305)) lt!148352))))

(assert (=> b!101957 (= lt!148352 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!101958 () Bool)

(declare-fun res!83794 () Bool)

(assert (=> b!101958 (=> (not res!83794) (not e!66653))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!101958 (= res!83794 (invariant!0 (currentBit!5007 thiss!1305) (currentByte!5012 thiss!1305) (size!2179 (buf!2539 (_2!4389 lt!148339)))))))

(declare-fun b!101959 () Bool)

(assert (=> b!101959 (= e!66645 (= (bvand (bvand v!199 (bvnot lt!148354)) lt!148354) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101960 () Bool)

(declare-fun res!83786 () Bool)

(assert (=> b!101960 (=> (not res!83786) (not e!66654))))

(assert (=> b!101960 (= res!83786 (bvslt i!615 nBits!396))))

(declare-fun b!101961 () Bool)

(assert (=> b!101961 (= e!66653 (invariant!0 (currentBit!5007 thiss!1305) (currentByte!5012 thiss!1305) (size!2179 (buf!2539 (_2!4389 lt!148347)))))))

(declare-fun b!101962 () Bool)

(assert (=> b!101962 (= e!66649 e!66646)))

(declare-fun res!83790 () Bool)

(assert (=> b!101962 (=> (not res!83790) (not e!66646))))

(assert (=> b!101962 (= res!83790 (and (= (_2!4388 lt!148340) lt!148341) (= (_1!4388 lt!148340) (_2!4389 lt!148339))))))

(declare-fun readerFrom!0 (BitStream!3832 (_ BitVec 32) (_ BitVec 32)) BitStream!3832)

(assert (=> b!101962 (= lt!148340 (readBitPure!0 (readerFrom!0 (_2!4389 lt!148339) (currentBit!5007 thiss!1305) (currentByte!5012 thiss!1305))))))

(declare-fun b!101963 () Bool)

(declare-fun res!83785 () Bool)

(assert (=> b!101963 (=> (not res!83785) (not e!66654))))

(assert (=> b!101963 (= res!83785 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(assert (= (and start!20332 res!83789) b!101957))

(assert (= (and b!101957 res!83792) b!101963))

(assert (= (and b!101963 res!83785) b!101960))

(assert (= (and b!101960 res!83786) b!101956))

(assert (= (and b!101956 res!83787) b!101954))

(assert (= (and b!101954 res!83784) b!101953))

(assert (= (and b!101953 res!83795) b!101962))

(assert (= (and b!101962 res!83790) b!101951))

(assert (= (and b!101956 res!83793) b!101958))

(assert (= (and b!101958 res!83794) b!101961))

(assert (= (and b!101956 res!83788) b!101952))

(assert (= (and b!101956 (not res!83791)) b!101959))

(assert (= start!20332 b!101955))

(declare-fun m!148435 () Bool)

(assert (=> b!101958 m!148435))

(declare-fun m!148437 () Bool)

(assert (=> b!101962 m!148437))

(assert (=> b!101962 m!148437))

(declare-fun m!148439 () Bool)

(assert (=> b!101962 m!148439))

(declare-fun m!148441 () Bool)

(assert (=> b!101951 m!148441))

(declare-fun m!148443 () Bool)

(assert (=> b!101954 m!148443))

(declare-fun m!148445 () Bool)

(assert (=> b!101954 m!148445))

(declare-fun m!148447 () Bool)

(assert (=> b!101953 m!148447))

(declare-fun m!148449 () Bool)

(assert (=> b!101961 m!148449))

(declare-fun m!148451 () Bool)

(assert (=> b!101955 m!148451))

(declare-fun m!148453 () Bool)

(assert (=> start!20332 m!148453))

(declare-fun m!148455 () Bool)

(assert (=> b!101963 m!148455))

(declare-fun m!148457 () Bool)

(assert (=> b!101957 m!148457))

(declare-fun m!148459 () Bool)

(assert (=> b!101956 m!148459))

(declare-fun m!148461 () Bool)

(assert (=> b!101956 m!148461))

(declare-fun m!148463 () Bool)

(assert (=> b!101956 m!148463))

(declare-fun m!148465 () Bool)

(assert (=> b!101956 m!148465))

(declare-fun m!148467 () Bool)

(assert (=> b!101956 m!148467))

(declare-fun m!148469 () Bool)

(assert (=> b!101956 m!148469))

(declare-fun m!148471 () Bool)

(assert (=> b!101956 m!148471))

(declare-fun m!148473 () Bool)

(assert (=> b!101956 m!148473))

(declare-fun m!148475 () Bool)

(assert (=> b!101956 m!148475))

(declare-fun m!148477 () Bool)

(assert (=> b!101956 m!148477))

(declare-fun m!148479 () Bool)

(assert (=> b!101956 m!148479))

(declare-fun m!148481 () Bool)

(assert (=> b!101956 m!148481))

(declare-fun m!148483 () Bool)

(assert (=> b!101956 m!148483))

(declare-fun m!148485 () Bool)

(assert (=> b!101956 m!148485))

(declare-fun m!148487 () Bool)

(assert (=> b!101956 m!148487))

(declare-fun m!148489 () Bool)

(assert (=> b!101956 m!148489))

(push 1)

(assert (not b!101951))

(assert (not b!101962))

(assert (not b!101958))

(assert (not b!101954))

(assert (not b!101957))

(assert (not b!101961))

(assert (not b!101956))

(assert (not b!101963))

(assert (not b!101955))

(assert (not start!20332))

(assert (not b!101953))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

