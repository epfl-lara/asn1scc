; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25810 () Bool)

(assert start!25810)

(declare-fun b!131808 () Bool)

(declare-fun e!87381 () Bool)

(declare-fun e!87377 () Bool)

(assert (=> b!131808 (= e!87381 (not e!87377))))

(declare-fun res!109384 () Bool)

(assert (=> b!131808 (=> res!109384 e!87377)))

(declare-datatypes ((array!6085 0))(
  ( (array!6086 (arr!3384 (Array (_ BitVec 32) (_ BitVec 8))) (size!2755 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6085)

(declare-datatypes ((BitStream!4774 0))(
  ( (BitStream!4775 (buf!3122 array!6085) (currentByte!5901 (_ BitVec 32)) (currentBit!5896 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11410 0))(
  ( (tuple2!11411 (_1!6008 BitStream!4774) (_2!6008 BitStream!4774)) )
))
(declare-fun lt!203337 () tuple2!11410)

(declare-datatypes ((tuple2!11412 0))(
  ( (tuple2!11413 (_1!6009 BitStream!4774) (_2!6009 array!6085)) )
))
(declare-fun lt!203347 () tuple2!11412)

(assert (=> b!131808 (= res!109384 (or (not (= (size!2755 (_2!6009 lt!203347)) (size!2755 arr!237))) (not (= (_1!6009 lt!203347) (_2!6008 lt!203337)))))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4774 array!6085 (_ BitVec 32) (_ BitVec 32)) tuple2!11412)

(assert (=> b!131808 (= lt!203347 (readByteArrayLoopPure!0 (_1!6008 lt!203337) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!8133 0))(
  ( (Unit!8134) )
))
(declare-datatypes ((tuple2!11414 0))(
  ( (tuple2!11415 (_1!6010 Unit!8133) (_2!6010 BitStream!4774)) )
))
(declare-fun lt!203350 () tuple2!11414)

(declare-fun lt!203341 () tuple2!11414)

(declare-fun lt!203343 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!131808 (validate_offset_bits!1 ((_ sign_extend 32) (size!2755 (buf!3122 (_2!6010 lt!203350)))) ((_ sign_extend 32) (currentByte!5901 (_2!6010 lt!203341))) ((_ sign_extend 32) (currentBit!5896 (_2!6010 lt!203341))) lt!203343)))

(declare-fun lt!203348 () Unit!8133)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4774 array!6085 (_ BitVec 64)) Unit!8133)

(assert (=> b!131808 (= lt!203348 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6010 lt!203341) (buf!3122 (_2!6010 lt!203350)) lt!203343))))

(declare-fun reader!0 (BitStream!4774 BitStream!4774) tuple2!11410)

(assert (=> b!131808 (= lt!203337 (reader!0 (_2!6010 lt!203341) (_2!6010 lt!203350)))))

(declare-fun b!131809 () Bool)

(declare-fun e!87382 () Bool)

(declare-datatypes ((tuple2!11416 0))(
  ( (tuple2!11417 (_1!6011 BitStream!4774) (_2!6011 (_ BitVec 8))) )
))
(declare-fun lt!203333 () tuple2!11416)

(declare-fun lt!203349 () tuple2!11416)

(assert (=> b!131809 (= e!87382 (= (_2!6011 lt!203333) (_2!6011 lt!203349)))))

(declare-fun b!131810 () Bool)

(declare-fun e!87379 () Bool)

(assert (=> b!131810 (= e!87379 e!87381)))

(declare-fun res!109380 () Bool)

(assert (=> b!131810 (=> (not res!109380) (not e!87381))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!131810 (= res!109380 (= (bitIndex!0 (size!2755 (buf!3122 (_2!6010 lt!203350))) (currentByte!5901 (_2!6010 lt!203350)) (currentBit!5896 (_2!6010 lt!203350))) (bvadd (bitIndex!0 (size!2755 (buf!3122 (_2!6010 lt!203341))) (currentByte!5901 (_2!6010 lt!203341)) (currentBit!5896 (_2!6010 lt!203341))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!203343))))))

(assert (=> b!131810 (= lt!203343 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun lt!203340 () tuple2!11416)

(declare-fun lt!203336 () tuple2!11410)

(declare-fun b!131811 () Bool)

(declare-fun e!87385 () Bool)

(assert (=> b!131811 (= e!87385 (and (= (_2!6011 lt!203340) (select (arr!3384 arr!237) from!447)) (= (_1!6011 lt!203340) (_2!6008 lt!203336))))))

(declare-fun readBytePure!0 (BitStream!4774) tuple2!11416)

(assert (=> b!131811 (= lt!203340 (readBytePure!0 (_1!6008 lt!203336)))))

(declare-fun thiss!1634 () BitStream!4774)

(assert (=> b!131811 (= lt!203336 (reader!0 thiss!1634 (_2!6010 lt!203341)))))

(declare-fun b!131812 () Bool)

(declare-fun e!87384 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131812 (= e!87384 (invariant!0 (currentBit!5896 thiss!1634) (currentByte!5901 thiss!1634) (size!2755 (buf!3122 (_2!6010 lt!203341)))))))

(declare-fun b!131813 () Bool)

(declare-fun res!109383 () Bool)

(assert (=> b!131813 (=> (not res!109383) (not e!87385))))

(declare-fun isPrefixOf!0 (BitStream!4774 BitStream!4774) Bool)

(assert (=> b!131813 (= res!109383 (isPrefixOf!0 thiss!1634 (_2!6010 lt!203341)))))

(declare-fun b!131814 () Bool)

(declare-fun res!109393 () Bool)

(declare-fun e!87386 () Bool)

(assert (=> b!131814 (=> (not res!109393) (not e!87386))))

(assert (=> b!131814 (= res!109393 (invariant!0 (currentBit!5896 thiss!1634) (currentByte!5901 thiss!1634) (size!2755 (buf!3122 thiss!1634))))))

(declare-fun b!131815 () Bool)

(declare-fun res!109381 () Bool)

(assert (=> b!131815 (=> (not res!109381) (not e!87386))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!131815 (= res!109381 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2755 (buf!3122 thiss!1634))) ((_ sign_extend 32) (currentByte!5901 thiss!1634)) ((_ sign_extend 32) (currentBit!5896 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!131816 () Bool)

(declare-fun lt!203334 () tuple2!11410)

(declare-fun e!87380 () Bool)

(assert (=> b!131816 (= e!87380 (= (_1!6009 (readByteArrayLoopPure!0 (_1!6008 lt!203334) arr!237 from!447 to!404)) (_2!6008 lt!203334)))))

(declare-fun res!109382 () Bool)

(assert (=> start!25810 (=> (not res!109382) (not e!87386))))

(assert (=> start!25810 (= res!109382 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2755 arr!237))))))

(assert (=> start!25810 e!87386))

(assert (=> start!25810 true))

(declare-fun array_inv!2544 (array!6085) Bool)

(assert (=> start!25810 (array_inv!2544 arr!237)))

(declare-fun e!87376 () Bool)

(declare-fun inv!12 (BitStream!4774) Bool)

(assert (=> start!25810 (and (inv!12 thiss!1634) e!87376)))

(declare-fun b!131817 () Bool)

(declare-fun arrayRangesEq!158 (array!6085 array!6085 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131817 (= e!87377 (not (arrayRangesEq!158 arr!237 (_2!6009 lt!203347) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!131818 () Bool)

(declare-fun res!109389 () Bool)

(assert (=> b!131818 (=> (not res!109389) (not e!87385))))

(assert (=> b!131818 (= res!109389 (= (bitIndex!0 (size!2755 (buf!3122 (_2!6010 lt!203341))) (currentByte!5901 (_2!6010 lt!203341)) (currentBit!5896 (_2!6010 lt!203341))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2755 (buf!3122 thiss!1634)) (currentByte!5901 thiss!1634) (currentBit!5896 thiss!1634)))))))

(declare-fun b!131819 () Bool)

(declare-fun res!109391 () Bool)

(assert (=> b!131819 (=> (not res!109391) (not e!87381))))

(assert (=> b!131819 (= res!109391 (isPrefixOf!0 (_2!6010 lt!203341) (_2!6010 lt!203350)))))

(declare-fun b!131820 () Bool)

(assert (=> b!131820 (= e!87386 (not (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun lt!203338 () (_ BitVec 32))

(assert (=> b!131820 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2755 (buf!3122 (_2!6010 lt!203350)))) ((_ sign_extend 32) (currentByte!5901 (_2!6010 lt!203341))) ((_ sign_extend 32) (currentBit!5896 (_2!6010 lt!203341))) lt!203338)))

(declare-fun lt!203339 () Unit!8133)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4774 array!6085 (_ BitVec 32)) Unit!8133)

(assert (=> b!131820 (= lt!203339 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6010 lt!203341) (buf!3122 (_2!6010 lt!203350)) lt!203338))))

(assert (=> b!131820 e!87380))

(declare-fun res!109392 () Bool)

(assert (=> b!131820 (=> (not res!109392) (not e!87380))))

(assert (=> b!131820 (= res!109392 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2755 (buf!3122 (_2!6010 lt!203350)))) ((_ sign_extend 32) (currentByte!5901 thiss!1634)) ((_ sign_extend 32) (currentBit!5896 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!203335 () Unit!8133)

(assert (=> b!131820 (= lt!203335 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3122 (_2!6010 lt!203350)) (bvsub to!404 from!447)))))

(assert (=> b!131820 (= (_2!6011 (readBytePure!0 (_1!6008 lt!203334))) (select (arr!3384 arr!237) from!447))))

(declare-fun lt!203345 () tuple2!11410)

(assert (=> b!131820 (= lt!203345 (reader!0 (_2!6010 lt!203341) (_2!6010 lt!203350)))))

(assert (=> b!131820 (= lt!203334 (reader!0 thiss!1634 (_2!6010 lt!203350)))))

(assert (=> b!131820 e!87382))

(declare-fun res!109387 () Bool)

(assert (=> b!131820 (=> (not res!109387) (not e!87382))))

(assert (=> b!131820 (= res!109387 (= (bitIndex!0 (size!2755 (buf!3122 (_1!6011 lt!203333))) (currentByte!5901 (_1!6011 lt!203333)) (currentBit!5896 (_1!6011 lt!203333))) (bitIndex!0 (size!2755 (buf!3122 (_1!6011 lt!203349))) (currentByte!5901 (_1!6011 lt!203349)) (currentBit!5896 (_1!6011 lt!203349)))))))

(declare-fun lt!203342 () Unit!8133)

(declare-fun lt!203344 () BitStream!4774)

(declare-fun readBytePrefixLemma!0 (BitStream!4774 BitStream!4774) Unit!8133)

(assert (=> b!131820 (= lt!203342 (readBytePrefixLemma!0 lt!203344 (_2!6010 lt!203350)))))

(assert (=> b!131820 (= lt!203349 (readBytePure!0 (BitStream!4775 (buf!3122 (_2!6010 lt!203350)) (currentByte!5901 thiss!1634) (currentBit!5896 thiss!1634))))))

(assert (=> b!131820 (= lt!203333 (readBytePure!0 lt!203344))))

(assert (=> b!131820 (= lt!203344 (BitStream!4775 (buf!3122 (_2!6010 lt!203341)) (currentByte!5901 thiss!1634) (currentBit!5896 thiss!1634)))))

(assert (=> b!131820 e!87384))

(declare-fun res!109388 () Bool)

(assert (=> b!131820 (=> (not res!109388) (not e!87384))))

(assert (=> b!131820 (= res!109388 (isPrefixOf!0 thiss!1634 (_2!6010 lt!203350)))))

(declare-fun lt!203346 () Unit!8133)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4774 BitStream!4774 BitStream!4774) Unit!8133)

(assert (=> b!131820 (= lt!203346 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6010 lt!203341) (_2!6010 lt!203350)))))

(assert (=> b!131820 e!87379))

(declare-fun res!109386 () Bool)

(assert (=> b!131820 (=> (not res!109386) (not e!87379))))

(assert (=> b!131820 (= res!109386 (= (size!2755 (buf!3122 (_2!6010 lt!203341))) (size!2755 (buf!3122 (_2!6010 lt!203350)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4774 array!6085 (_ BitVec 32) (_ BitVec 32)) tuple2!11414)

(assert (=> b!131820 (= lt!203350 (appendByteArrayLoop!0 (_2!6010 lt!203341) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!131820 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2755 (buf!3122 (_2!6010 lt!203341)))) ((_ sign_extend 32) (currentByte!5901 (_2!6010 lt!203341))) ((_ sign_extend 32) (currentBit!5896 (_2!6010 lt!203341))) lt!203338)))

(assert (=> b!131820 (= lt!203338 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!203351 () Unit!8133)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4774 BitStream!4774 (_ BitVec 64) (_ BitVec 32)) Unit!8133)

(assert (=> b!131820 (= lt!203351 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6010 lt!203341) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!131820 e!87385))

(declare-fun res!109390 () Bool)

(assert (=> b!131820 (=> (not res!109390) (not e!87385))))

(assert (=> b!131820 (= res!109390 (= (size!2755 (buf!3122 thiss!1634)) (size!2755 (buf!3122 (_2!6010 lt!203341)))))))

(declare-fun appendByte!0 (BitStream!4774 (_ BitVec 8)) tuple2!11414)

(assert (=> b!131820 (= lt!203341 (appendByte!0 thiss!1634 (select (arr!3384 arr!237) from!447)))))

(declare-fun b!131821 () Bool)

(declare-fun res!109385 () Bool)

(assert (=> b!131821 (=> (not res!109385) (not e!87386))))

(assert (=> b!131821 (= res!109385 (bvslt from!447 to!404))))

(declare-fun b!131822 () Bool)

(assert (=> b!131822 (= e!87376 (array_inv!2544 (buf!3122 thiss!1634)))))

(assert (= (and start!25810 res!109382) b!131815))

(assert (= (and b!131815 res!109381) b!131821))

(assert (= (and b!131821 res!109385) b!131814))

(assert (= (and b!131814 res!109393) b!131820))

(assert (= (and b!131820 res!109390) b!131818))

(assert (= (and b!131818 res!109389) b!131813))

(assert (= (and b!131813 res!109383) b!131811))

(assert (= (and b!131820 res!109386) b!131810))

(assert (= (and b!131810 res!109380) b!131819))

(assert (= (and b!131819 res!109391) b!131808))

(assert (= (and b!131808 (not res!109384)) b!131817))

(assert (= (and b!131820 res!109388) b!131812))

(assert (= (and b!131820 res!109387) b!131809))

(assert (= (and b!131820 res!109392) b!131816))

(assert (= start!25810 b!131822))

(declare-fun m!198973 () Bool)

(assert (=> b!131819 m!198973))

(declare-fun m!198975 () Bool)

(assert (=> b!131808 m!198975))

(declare-fun m!198977 () Bool)

(assert (=> b!131808 m!198977))

(declare-fun m!198979 () Bool)

(assert (=> b!131808 m!198979))

(declare-fun m!198981 () Bool)

(assert (=> b!131808 m!198981))

(declare-fun m!198983 () Bool)

(assert (=> b!131814 m!198983))

(declare-fun m!198985 () Bool)

(assert (=> b!131810 m!198985))

(declare-fun m!198987 () Bool)

(assert (=> b!131810 m!198987))

(declare-fun m!198989 () Bool)

(assert (=> b!131813 m!198989))

(declare-fun m!198991 () Bool)

(assert (=> start!25810 m!198991))

(declare-fun m!198993 () Bool)

(assert (=> start!25810 m!198993))

(assert (=> b!131818 m!198987))

(declare-fun m!198995 () Bool)

(assert (=> b!131818 m!198995))

(declare-fun m!198997 () Bool)

(assert (=> b!131811 m!198997))

(declare-fun m!198999 () Bool)

(assert (=> b!131811 m!198999))

(declare-fun m!199001 () Bool)

(assert (=> b!131811 m!199001))

(declare-fun m!199003 () Bool)

(assert (=> b!131820 m!199003))

(declare-fun m!199005 () Bool)

(assert (=> b!131820 m!199005))

(declare-fun m!199007 () Bool)

(assert (=> b!131820 m!199007))

(declare-fun m!199009 () Bool)

(assert (=> b!131820 m!199009))

(declare-fun m!199011 () Bool)

(assert (=> b!131820 m!199011))

(declare-fun m!199013 () Bool)

(assert (=> b!131820 m!199013))

(declare-fun m!199015 () Bool)

(assert (=> b!131820 m!199015))

(declare-fun m!199017 () Bool)

(assert (=> b!131820 m!199017))

(assert (=> b!131820 m!198997))

(declare-fun m!199019 () Bool)

(assert (=> b!131820 m!199019))

(declare-fun m!199021 () Bool)

(assert (=> b!131820 m!199021))

(declare-fun m!199023 () Bool)

(assert (=> b!131820 m!199023))

(declare-fun m!199025 () Bool)

(assert (=> b!131820 m!199025))

(declare-fun m!199027 () Bool)

(assert (=> b!131820 m!199027))

(assert (=> b!131820 m!198981))

(declare-fun m!199029 () Bool)

(assert (=> b!131820 m!199029))

(declare-fun m!199031 () Bool)

(assert (=> b!131820 m!199031))

(declare-fun m!199033 () Bool)

(assert (=> b!131820 m!199033))

(declare-fun m!199035 () Bool)

(assert (=> b!131820 m!199035))

(assert (=> b!131820 m!198997))

(declare-fun m!199037 () Bool)

(assert (=> b!131822 m!199037))

(declare-fun m!199039 () Bool)

(assert (=> b!131816 m!199039))

(declare-fun m!199041 () Bool)

(assert (=> b!131812 m!199041))

(declare-fun m!199043 () Bool)

(assert (=> b!131815 m!199043))

(declare-fun m!199045 () Bool)

(assert (=> b!131817 m!199045))

(push 1)

(assert (not b!131822))

(assert (not b!131813))

(assert (not b!131815))

(assert (not b!131819))

(assert (not b!131816))

(assert (not start!25810))

(assert (not b!131812))

(assert (not b!131814))

(assert (not b!131808))

(assert (not b!131810))

(assert (not b!131817))

(assert (not b!131820))

(assert (not b!131811))

(assert (not b!131818))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

