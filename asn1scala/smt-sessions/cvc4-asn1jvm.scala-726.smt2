; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20336 () Bool)

(assert start!20336)

(declare-fun b!102029 () Bool)

(declare-fun e!66708 () Bool)

(declare-fun e!66710 () Bool)

(assert (=> b!102029 (= e!66708 e!66710)))

(declare-fun res!83864 () Bool)

(assert (=> b!102029 (=> (not res!83864) (not e!66710))))

(declare-fun lt!148446 () Bool)

(declare-datatypes ((array!4780 0))(
  ( (array!4781 (arr!2774 (Array (_ BitVec 32) (_ BitVec 8))) (size!2181 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3836 0))(
  ( (BitStream!3837 (buf!2541 array!4780) (currentByte!5014 (_ BitVec 32)) (currentBit!5009 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8278 0))(
  ( (tuple2!8279 (_1!4394 BitStream!3836) (_2!4394 Bool)) )
))
(declare-fun lt!148449 () tuple2!8278)

(declare-datatypes ((Unit!6258 0))(
  ( (Unit!6259) )
))
(declare-datatypes ((tuple2!8280 0))(
  ( (tuple2!8281 (_1!4395 Unit!6258) (_2!4395 BitStream!3836)) )
))
(declare-fun lt!148448 () tuple2!8280)

(assert (=> b!102029 (= res!83864 (and (= (_2!4394 lt!148449) lt!148446) (= (_1!4394 lt!148449) (_2!4395 lt!148448))))))

(declare-fun thiss!1305 () BitStream!3836)

(declare-fun readBitPure!0 (BitStream!3836) tuple2!8278)

(declare-fun readerFrom!0 (BitStream!3836 (_ BitVec 32) (_ BitVec 32)) BitStream!3836)

(assert (=> b!102029 (= lt!148449 (readBitPure!0 (readerFrom!0 (_2!4395 lt!148448) (currentBit!5009 thiss!1305) (currentByte!5014 thiss!1305))))))

(declare-fun b!102030 () Bool)

(declare-fun e!66711 () Bool)

(declare-fun lt!148444 () tuple2!8278)

(declare-fun lt!148440 () tuple2!8278)

(assert (=> b!102030 (= e!66711 (= (_2!4394 lt!148444) (_2!4394 lt!148440)))))

(declare-fun b!102031 () Bool)

(declare-fun e!66712 () Bool)

(declare-fun v!199 () (_ BitVec 64))

(declare-fun lt!148436 () (_ BitVec 64))

(assert (=> b!102031 (= e!66712 (= (bvand (bvand v!199 (bvnot lt!148436)) lt!148436) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!102032 () Bool)

(declare-fun e!66706 () Bool)

(declare-fun lt!148443 () tuple2!8280)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!102032 (= e!66706 (invariant!0 (currentBit!5009 thiss!1305) (currentByte!5014 thiss!1305) (size!2181 (buf!2541 (_2!4395 lt!148443)))))))

(declare-fun b!102033 () Bool)

(declare-fun e!66705 () Bool)

(assert (=> b!102033 (= e!66705 (not e!66712))))

(declare-fun res!83866 () Bool)

(assert (=> b!102033 (=> res!83866 e!66712)))

(declare-datatypes ((tuple2!8282 0))(
  ( (tuple2!8283 (_1!4396 BitStream!3836) (_2!4396 BitStream!3836)) )
))
(declare-fun lt!148438 () tuple2!8282)

(declare-fun lt!148442 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!102033 (= res!83866 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2181 (buf!2541 (_1!4396 lt!148438)))) ((_ sign_extend 32) (currentByte!5014 (_1!4396 lt!148438))) ((_ sign_extend 32) (currentBit!5009 (_1!4396 lt!148438))) lt!148442)))))

(assert (=> b!102033 (validate_offset_bits!1 ((_ sign_extend 32) (size!2181 (buf!2541 (_2!4395 lt!148443)))) ((_ sign_extend 32) (currentByte!5014 thiss!1305)) ((_ sign_extend 32) (currentBit!5009 thiss!1305)) lt!148442)))

(declare-fun lt!148439 () Unit!6258)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3836 array!4780 (_ BitVec 64)) Unit!6258)

(assert (=> b!102033 (= lt!148439 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2541 (_2!4395 lt!148443)) lt!148442))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102033 (= lt!148436 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(assert (=> b!102033 (= (_2!4394 (readBitPure!0 (_1!4396 lt!148438))) lt!148446)))

(declare-fun lt!148435 () tuple2!8282)

(declare-fun reader!0 (BitStream!3836 BitStream!3836) tuple2!8282)

(assert (=> b!102033 (= lt!148435 (reader!0 (_2!4395 lt!148448) (_2!4395 lt!148443)))))

(assert (=> b!102033 (= lt!148438 (reader!0 thiss!1305 (_2!4395 lt!148443)))))

(assert (=> b!102033 e!66711))

(declare-fun res!83862 () Bool)

(assert (=> b!102033 (=> (not res!83862) (not e!66711))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102033 (= res!83862 (= (bitIndex!0 (size!2181 (buf!2541 (_1!4394 lt!148444))) (currentByte!5014 (_1!4394 lt!148444)) (currentBit!5009 (_1!4394 lt!148444))) (bitIndex!0 (size!2181 (buf!2541 (_1!4394 lt!148440))) (currentByte!5014 (_1!4394 lt!148440)) (currentBit!5009 (_1!4394 lt!148440)))))))

(declare-fun lt!148450 () Unit!6258)

(declare-fun lt!148445 () BitStream!3836)

(declare-fun readBitPrefixLemma!0 (BitStream!3836 BitStream!3836) Unit!6258)

(assert (=> b!102033 (= lt!148450 (readBitPrefixLemma!0 lt!148445 (_2!4395 lt!148443)))))

(assert (=> b!102033 (= lt!148440 (readBitPure!0 (BitStream!3837 (buf!2541 (_2!4395 lt!148443)) (currentByte!5014 thiss!1305) (currentBit!5009 thiss!1305))))))

(assert (=> b!102033 (= lt!148444 (readBitPure!0 lt!148445))))

(assert (=> b!102033 (= lt!148445 (BitStream!3837 (buf!2541 (_2!4395 lt!148448)) (currentByte!5014 thiss!1305) (currentBit!5009 thiss!1305)))))

(assert (=> b!102033 e!66706))

(declare-fun res!83860 () Bool)

(assert (=> b!102033 (=> (not res!83860) (not e!66706))))

(declare-fun isPrefixOf!0 (BitStream!3836 BitStream!3836) Bool)

(assert (=> b!102033 (= res!83860 (isPrefixOf!0 thiss!1305 (_2!4395 lt!148443)))))

(declare-fun lt!148441 () Unit!6258)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3836 BitStream!3836 BitStream!3836) Unit!6258)

(assert (=> b!102033 (= lt!148441 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4395 lt!148448) (_2!4395 lt!148443)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3836 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8280)

(assert (=> b!102033 (= lt!148443 (appendNLeastSignificantBitsLoop!0 (_2!4395 lt!148448) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!66709 () Bool)

(assert (=> b!102033 e!66709))

(declare-fun res!83867 () Bool)

(assert (=> b!102033 (=> (not res!83867) (not e!66709))))

(assert (=> b!102033 (= res!83867 (= (size!2181 (buf!2541 thiss!1305)) (size!2181 (buf!2541 (_2!4395 lt!148448)))))))

(declare-fun appendBit!0 (BitStream!3836 Bool) tuple2!8280)

(assert (=> b!102033 (= lt!148448 (appendBit!0 thiss!1305 lt!148446))))

(assert (=> b!102033 (= lt!148446 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!102034 () Bool)

(declare-fun res!83865 () Bool)

(assert (=> b!102034 (=> (not res!83865) (not e!66705))))

(assert (=> b!102034 (= res!83865 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!102035 () Bool)

(declare-fun res!83857 () Bool)

(assert (=> b!102035 (=> (not res!83857) (not e!66706))))

(assert (=> b!102035 (= res!83857 (invariant!0 (currentBit!5009 thiss!1305) (currentByte!5014 thiss!1305) (size!2181 (buf!2541 (_2!4395 lt!148448)))))))

(declare-fun b!102037 () Bool)

(assert (=> b!102037 (= e!66709 e!66708)))

(declare-fun res!83863 () Bool)

(assert (=> b!102037 (=> (not res!83863) (not e!66708))))

(declare-fun lt!148437 () (_ BitVec 64))

(declare-fun lt!148447 () (_ BitVec 64))

(assert (=> b!102037 (= res!83863 (= lt!148437 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!148447)))))

(assert (=> b!102037 (= lt!148437 (bitIndex!0 (size!2181 (buf!2541 (_2!4395 lt!148448))) (currentByte!5014 (_2!4395 lt!148448)) (currentBit!5009 (_2!4395 lt!148448))))))

(assert (=> b!102037 (= lt!148447 (bitIndex!0 (size!2181 (buf!2541 thiss!1305)) (currentByte!5014 thiss!1305) (currentBit!5009 thiss!1305)))))

(declare-fun b!102038 () Bool)

(declare-fun res!83858 () Bool)

(assert (=> b!102038 (=> (not res!83858) (not e!66705))))

(assert (=> b!102038 (= res!83858 (bvslt i!615 nBits!396))))

(declare-fun b!102039 () Bool)

(assert (=> b!102039 (= e!66710 (= (bitIndex!0 (size!2181 (buf!2541 (_1!4394 lt!148449))) (currentByte!5014 (_1!4394 lt!148449)) (currentBit!5009 (_1!4394 lt!148449))) lt!148437))))

(declare-fun res!83859 () Bool)

(declare-fun e!66714 () Bool)

(assert (=> start!20336 (=> (not res!83859) (not e!66714))))

(assert (=> start!20336 (= res!83859 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20336 e!66714))

(assert (=> start!20336 true))

(declare-fun e!66713 () Bool)

(declare-fun inv!12 (BitStream!3836) Bool)

(assert (=> start!20336 (and (inv!12 thiss!1305) e!66713)))

(declare-fun b!102036 () Bool)

(declare-fun array_inv!1983 (array!4780) Bool)

(assert (=> b!102036 (= e!66713 (array_inv!1983 (buf!2541 thiss!1305)))))

(declare-fun b!102040 () Bool)

(declare-fun res!83861 () Bool)

(assert (=> b!102040 (=> (not res!83861) (not e!66708))))

(assert (=> b!102040 (= res!83861 (isPrefixOf!0 thiss!1305 (_2!4395 lt!148448)))))

(declare-fun b!102041 () Bool)

(assert (=> b!102041 (= e!66714 e!66705)))

(declare-fun res!83856 () Bool)

(assert (=> b!102041 (=> (not res!83856) (not e!66705))))

(assert (=> b!102041 (= res!83856 (validate_offset_bits!1 ((_ sign_extend 32) (size!2181 (buf!2541 thiss!1305))) ((_ sign_extend 32) (currentByte!5014 thiss!1305)) ((_ sign_extend 32) (currentBit!5009 thiss!1305)) lt!148442))))

(assert (=> b!102041 (= lt!148442 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (= (and start!20336 res!83859) b!102041))

(assert (= (and b!102041 res!83856) b!102034))

(assert (= (and b!102034 res!83865) b!102038))

(assert (= (and b!102038 res!83858) b!102033))

(assert (= (and b!102033 res!83867) b!102037))

(assert (= (and b!102037 res!83863) b!102040))

(assert (= (and b!102040 res!83861) b!102029))

(assert (= (and b!102029 res!83864) b!102039))

(assert (= (and b!102033 res!83860) b!102035))

(assert (= (and b!102035 res!83857) b!102032))

(assert (= (and b!102033 res!83862) b!102030))

(assert (= (and b!102033 (not res!83866)) b!102031))

(assert (= start!20336 b!102036))

(declare-fun m!148547 () Bool)

(assert (=> b!102036 m!148547))

(declare-fun m!148549 () Bool)

(assert (=> b!102033 m!148549))

(declare-fun m!148551 () Bool)

(assert (=> b!102033 m!148551))

(declare-fun m!148553 () Bool)

(assert (=> b!102033 m!148553))

(declare-fun m!148555 () Bool)

(assert (=> b!102033 m!148555))

(declare-fun m!148557 () Bool)

(assert (=> b!102033 m!148557))

(declare-fun m!148559 () Bool)

(assert (=> b!102033 m!148559))

(declare-fun m!148561 () Bool)

(assert (=> b!102033 m!148561))

(declare-fun m!148563 () Bool)

(assert (=> b!102033 m!148563))

(declare-fun m!148565 () Bool)

(assert (=> b!102033 m!148565))

(declare-fun m!148567 () Bool)

(assert (=> b!102033 m!148567))

(declare-fun m!148569 () Bool)

(assert (=> b!102033 m!148569))

(declare-fun m!148571 () Bool)

(assert (=> b!102033 m!148571))

(declare-fun m!148573 () Bool)

(assert (=> b!102033 m!148573))

(declare-fun m!148575 () Bool)

(assert (=> b!102033 m!148575))

(declare-fun m!148577 () Bool)

(assert (=> b!102033 m!148577))

(declare-fun m!148579 () Bool)

(assert (=> b!102033 m!148579))

(declare-fun m!148581 () Bool)

(assert (=> start!20336 m!148581))

(declare-fun m!148583 () Bool)

(assert (=> b!102040 m!148583))

(declare-fun m!148585 () Bool)

(assert (=> b!102029 m!148585))

(assert (=> b!102029 m!148585))

(declare-fun m!148587 () Bool)

(assert (=> b!102029 m!148587))

(declare-fun m!148589 () Bool)

(assert (=> b!102037 m!148589))

(declare-fun m!148591 () Bool)

(assert (=> b!102037 m!148591))

(declare-fun m!148593 () Bool)

(assert (=> b!102039 m!148593))

(declare-fun m!148595 () Bool)

(assert (=> b!102032 m!148595))

(declare-fun m!148597 () Bool)

(assert (=> b!102035 m!148597))

(declare-fun m!148599 () Bool)

(assert (=> b!102041 m!148599))

(declare-fun m!148601 () Bool)

(assert (=> b!102034 m!148601))

(push 1)

