; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24174 () Bool)

(assert start!24174)

(declare-fun b!122574 () Bool)

(declare-fun e!80334 () Bool)

(declare-datatypes ((array!5424 0))(
  ( (array!5425 (arr!3047 (Array (_ BitVec 32) (_ BitVec 8))) (size!2454 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4382 0))(
  ( (BitStream!4383 (buf!2894 array!5424) (currentByte!5591 (_ BitVec 32)) (currentBit!5586 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4382)

(declare-datatypes ((Unit!7547 0))(
  ( (Unit!7548) )
))
(declare-datatypes ((tuple2!10352 0))(
  ( (tuple2!10353 (_1!5441 Unit!7547) (_2!5441 BitStream!4382)) )
))
(declare-fun lt!192871 () tuple2!10352)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!122574 (= e!80334 (invariant!0 (currentBit!5586 thiss!1305) (currentByte!5591 thiss!1305) (size!2454 (buf!2894 (_2!5441 lt!192871)))))))

(declare-fun b!122575 () Bool)

(declare-fun e!80333 () Bool)

(declare-fun array_inv!2256 (array!5424) Bool)

(assert (=> b!122575 (= e!80333 (array_inv!2256 (buf!2894 thiss!1305)))))

(declare-fun e!80338 () Bool)

(declare-fun lt!192882 () BitStream!4382)

(declare-datatypes ((tuple2!10354 0))(
  ( (tuple2!10355 (_1!5442 BitStream!4382) (_2!5442 BitStream!4382)) )
))
(declare-fun lt!192860 () tuple2!10354)

(declare-fun lt!192873 () (_ BitVec 64))

(declare-fun lt!192888 () (_ BitVec 64))

(declare-fun lt!192870 () (_ BitVec 64))

(declare-fun b!122576 () Bool)

(assert (=> b!122576 (= e!80338 (or (not (= (_1!5442 lt!192860) lt!192882)) (not (= (size!2454 (buf!2894 thiss!1305)) (size!2454 (buf!2894 (_2!5441 lt!192871))))) (not (= lt!192888 (bvadd lt!192870 lt!192873))) (bvsge lt!192873 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!80339 () Bool)

(assert (=> b!122576 e!80339))

(declare-fun res!101589 () Bool)

(assert (=> b!122576 (=> (not res!101589) (not e!80339))))

(declare-fun lt!192878 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4382 (_ BitVec 64)) BitStream!4382)

(assert (=> b!122576 (= res!101589 (= (_1!5442 lt!192860) (withMovedBitIndex!0 (_2!5442 lt!192860) (bvsub lt!192878 lt!192888))))))

(declare-fun lt!192872 () tuple2!10352)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122576 (= lt!192878 (bitIndex!0 (size!2454 (buf!2894 (_2!5441 lt!192872))) (currentByte!5591 (_2!5441 lt!192872)) (currentBit!5586 (_2!5441 lt!192872))))))

(declare-fun lt!192869 () tuple2!10354)

(assert (=> b!122576 (= (_1!5442 lt!192869) (withMovedBitIndex!0 (_2!5442 lt!192869) (bvsub lt!192870 lt!192888)))))

(assert (=> b!122576 (= lt!192888 (bitIndex!0 (size!2454 (buf!2894 (_2!5441 lt!192871))) (currentByte!5591 (_2!5441 lt!192871)) (currentBit!5586 (_2!5441 lt!192871))))))

(assert (=> b!122576 (= lt!192870 (bitIndex!0 (size!2454 (buf!2894 thiss!1305)) (currentByte!5591 thiss!1305) (currentBit!5586 thiss!1305)))))

(declare-datatypes ((tuple2!10356 0))(
  ( (tuple2!10357 (_1!5443 BitStream!4382) (_2!5443 (_ BitVec 64))) )
))
(declare-fun lt!192863 () tuple2!10356)

(declare-fun lt!192868 () tuple2!10356)

(assert (=> b!122576 (and (= (_2!5443 lt!192863) (_2!5443 lt!192868)) (= (_1!5443 lt!192863) (_1!5443 lt!192868)))))

(declare-fun lt!192876 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun lt!192865 () Unit!7547)

(declare-fun i!615 () (_ BitVec 32))

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4382 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7547)

(assert (=> b!122576 (= lt!192865 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5442 lt!192869) nBits!396 i!615 lt!192876))))

(declare-fun lt!192862 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4382 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10356)

(assert (=> b!122576 (= lt!192868 (readNLeastSignificantBitsLoopPure!0 lt!192882 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!192862))))

(assert (=> b!122576 (= lt!192882 (withMovedBitIndex!0 (_1!5442 lt!192869) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!122577 () Bool)

(declare-fun e!80340 () Bool)

(assert (=> b!122577 (= e!80340 (not e!80338))))

(declare-fun res!101594 () Bool)

(assert (=> b!122577 (=> res!101594 e!80338)))

(declare-fun lt!192884 () tuple2!10356)

(assert (=> b!122577 (= res!101594 (not (= (_1!5443 lt!192884) (_2!5442 lt!192860))))))

(assert (=> b!122577 (= lt!192884 (readNLeastSignificantBitsLoopPure!0 (_1!5442 lt!192860) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!192862))))

(declare-fun lt!192864 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!122577 (validate_offset_bits!1 ((_ sign_extend 32) (size!2454 (buf!2894 (_2!5441 lt!192871)))) ((_ sign_extend 32) (currentByte!5591 (_2!5441 lt!192872))) ((_ sign_extend 32) (currentBit!5586 (_2!5441 lt!192872))) lt!192864)))

(declare-fun lt!192880 () Unit!7547)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4382 array!5424 (_ BitVec 64)) Unit!7547)

(assert (=> b!122577 (= lt!192880 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5441 lt!192872) (buf!2894 (_2!5441 lt!192871)) lt!192864))))

(assert (=> b!122577 (= lt!192864 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!10358 0))(
  ( (tuple2!10359 (_1!5444 BitStream!4382) (_2!5444 Bool)) )
))
(declare-fun lt!192885 () tuple2!10358)

(declare-fun lt!192877 () (_ BitVec 64))

(assert (=> b!122577 (= lt!192862 (bvor lt!192876 (ite (_2!5444 lt!192885) lt!192877 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122577 (= lt!192863 (readNLeastSignificantBitsLoopPure!0 (_1!5442 lt!192869) nBits!396 i!615 lt!192876))))

(assert (=> b!122577 (validate_offset_bits!1 ((_ sign_extend 32) (size!2454 (buf!2894 (_2!5441 lt!192871)))) ((_ sign_extend 32) (currentByte!5591 thiss!1305)) ((_ sign_extend 32) (currentBit!5586 thiss!1305)) lt!192873)))

(declare-fun lt!192875 () Unit!7547)

(assert (=> b!122577 (= lt!192875 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2894 (_2!5441 lt!192871)) lt!192873))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122577 (= lt!192876 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!192881 () Bool)

(assert (=> b!122577 (= (_2!5444 lt!192885) lt!192881)))

(declare-fun readBitPure!0 (BitStream!4382) tuple2!10358)

(assert (=> b!122577 (= lt!192885 (readBitPure!0 (_1!5442 lt!192869)))))

(declare-fun reader!0 (BitStream!4382 BitStream!4382) tuple2!10354)

(assert (=> b!122577 (= lt!192860 (reader!0 (_2!5441 lt!192872) (_2!5441 lt!192871)))))

(assert (=> b!122577 (= lt!192869 (reader!0 thiss!1305 (_2!5441 lt!192871)))))

(declare-fun e!80330 () Bool)

(assert (=> b!122577 e!80330))

(declare-fun res!101587 () Bool)

(assert (=> b!122577 (=> (not res!101587) (not e!80330))))

(declare-fun lt!192879 () tuple2!10358)

(declare-fun lt!192887 () tuple2!10358)

(assert (=> b!122577 (= res!101587 (= (bitIndex!0 (size!2454 (buf!2894 (_1!5444 lt!192879))) (currentByte!5591 (_1!5444 lt!192879)) (currentBit!5586 (_1!5444 lt!192879))) (bitIndex!0 (size!2454 (buf!2894 (_1!5444 lt!192887))) (currentByte!5591 (_1!5444 lt!192887)) (currentBit!5586 (_1!5444 lt!192887)))))))

(declare-fun lt!192867 () Unit!7547)

(declare-fun lt!192861 () BitStream!4382)

(declare-fun readBitPrefixLemma!0 (BitStream!4382 BitStream!4382) Unit!7547)

(assert (=> b!122577 (= lt!192867 (readBitPrefixLemma!0 lt!192861 (_2!5441 lt!192871)))))

(assert (=> b!122577 (= lt!192887 (readBitPure!0 (BitStream!4383 (buf!2894 (_2!5441 lt!192871)) (currentByte!5591 thiss!1305) (currentBit!5586 thiss!1305))))))

(assert (=> b!122577 (= lt!192879 (readBitPure!0 lt!192861))))

(assert (=> b!122577 (= lt!192861 (BitStream!4383 (buf!2894 (_2!5441 lt!192872)) (currentByte!5591 thiss!1305) (currentBit!5586 thiss!1305)))))

(assert (=> b!122577 e!80334))

(declare-fun res!101593 () Bool)

(assert (=> b!122577 (=> (not res!101593) (not e!80334))))

(declare-fun isPrefixOf!0 (BitStream!4382 BitStream!4382) Bool)

(assert (=> b!122577 (= res!101593 (isPrefixOf!0 thiss!1305 (_2!5441 lt!192871)))))

(declare-fun lt!192866 () Unit!7547)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4382 BitStream!4382 BitStream!4382) Unit!7547)

(assert (=> b!122577 (= lt!192866 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5441 lt!192872) (_2!5441 lt!192871)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4382 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10352)

(assert (=> b!122577 (= lt!192871 (appendNLeastSignificantBitsLoop!0 (_2!5441 lt!192872) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!80337 () Bool)

(assert (=> b!122577 e!80337))

(declare-fun res!101596 () Bool)

(assert (=> b!122577 (=> (not res!101596) (not e!80337))))

(assert (=> b!122577 (= res!101596 (= (size!2454 (buf!2894 thiss!1305)) (size!2454 (buf!2894 (_2!5441 lt!192872)))))))

(declare-fun appendBit!0 (BitStream!4382 Bool) tuple2!10352)

(assert (=> b!122577 (= lt!192872 (appendBit!0 thiss!1305 lt!192881))))

(assert (=> b!122577 (= lt!192881 (not (= (bvand v!199 lt!192877) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122577 (= lt!192877 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!122578 () Bool)

(declare-fun res!101591 () Bool)

(assert (=> b!122578 (=> (not res!101591) (not e!80340))))

(assert (=> b!122578 (= res!101591 (bvslt i!615 nBits!396))))

(declare-fun b!122579 () Bool)

(declare-fun res!101592 () Bool)

(declare-fun e!80336 () Bool)

(assert (=> b!122579 (=> (not res!101592) (not e!80336))))

(assert (=> b!122579 (= res!101592 (isPrefixOf!0 thiss!1305 (_2!5441 lt!192872)))))

(declare-fun res!101590 () Bool)

(declare-fun e!80331 () Bool)

(assert (=> start!24174 (=> (not res!101590) (not e!80331))))

(assert (=> start!24174 (= res!101590 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24174 e!80331))

(assert (=> start!24174 true))

(declare-fun inv!12 (BitStream!4382) Bool)

(assert (=> start!24174 (and (inv!12 thiss!1305) e!80333)))

(declare-fun b!122580 () Bool)

(declare-fun e!80335 () Bool)

(declare-fun lt!192874 () tuple2!10358)

(declare-fun lt!192883 () (_ BitVec 64))

(assert (=> b!122580 (= e!80335 (= (bitIndex!0 (size!2454 (buf!2894 (_1!5444 lt!192874))) (currentByte!5591 (_1!5444 lt!192874)) (currentBit!5586 (_1!5444 lt!192874))) lt!192883))))

(declare-fun b!122581 () Bool)

(assert (=> b!122581 (= e!80336 e!80335)))

(declare-fun res!101595 () Bool)

(assert (=> b!122581 (=> (not res!101595) (not e!80335))))

(assert (=> b!122581 (= res!101595 (and (= (_2!5444 lt!192874) lt!192881) (= (_1!5444 lt!192874) (_2!5441 lt!192872))))))

(declare-fun readerFrom!0 (BitStream!4382 (_ BitVec 32) (_ BitVec 32)) BitStream!4382)

(assert (=> b!122581 (= lt!192874 (readBitPure!0 (readerFrom!0 (_2!5441 lt!192872) (currentBit!5586 thiss!1305) (currentByte!5591 thiss!1305))))))

(declare-fun b!122582 () Bool)

(declare-fun res!101597 () Bool)

(assert (=> b!122582 (=> (not res!101597) (not e!80340))))

(assert (=> b!122582 (= res!101597 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!122583 () Bool)

(declare-fun res!101586 () Bool)

(assert (=> b!122583 (=> (not res!101586) (not e!80334))))

(assert (=> b!122583 (= res!101586 (invariant!0 (currentBit!5586 thiss!1305) (currentByte!5591 thiss!1305) (size!2454 (buf!2894 (_2!5441 lt!192872)))))))

(declare-fun b!122584 () Bool)

(assert (=> b!122584 (= e!80330 (= (_2!5444 lt!192879) (_2!5444 lt!192887)))))

(declare-fun b!122585 () Bool)

(assert (=> b!122585 (= e!80331 e!80340)))

(declare-fun res!101598 () Bool)

(assert (=> b!122585 (=> (not res!101598) (not e!80340))))

(assert (=> b!122585 (= res!101598 (validate_offset_bits!1 ((_ sign_extend 32) (size!2454 (buf!2894 thiss!1305))) ((_ sign_extend 32) (currentByte!5591 thiss!1305)) ((_ sign_extend 32) (currentBit!5586 thiss!1305)) lt!192873))))

(assert (=> b!122585 (= lt!192873 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!122586 () Bool)

(assert (=> b!122586 (= e!80337 e!80336)))

(declare-fun res!101588 () Bool)

(assert (=> b!122586 (=> (not res!101588) (not e!80336))))

(declare-fun lt!192886 () (_ BitVec 64))

(assert (=> b!122586 (= res!101588 (= lt!192883 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!192886)))))

(assert (=> b!122586 (= lt!192883 (bitIndex!0 (size!2454 (buf!2894 (_2!5441 lt!192872))) (currentByte!5591 (_2!5441 lt!192872)) (currentBit!5586 (_2!5441 lt!192872))))))

(assert (=> b!122586 (= lt!192886 (bitIndex!0 (size!2454 (buf!2894 thiss!1305)) (currentByte!5591 thiss!1305) (currentBit!5586 thiss!1305)))))

(declare-fun b!122587 () Bool)

(assert (=> b!122587 (= e!80339 (and (= lt!192870 (bvsub lt!192878 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!5442 lt!192860) lt!192882)) (and (= (_2!5443 lt!192863) (_2!5443 lt!192884)) (= (_1!5443 lt!192863) (_2!5442 lt!192869))))))))

(assert (= (and start!24174 res!101590) b!122585))

(assert (= (and b!122585 res!101598) b!122582))

(assert (= (and b!122582 res!101597) b!122578))

(assert (= (and b!122578 res!101591) b!122577))

(assert (= (and b!122577 res!101596) b!122586))

(assert (= (and b!122586 res!101588) b!122579))

(assert (= (and b!122579 res!101592) b!122581))

(assert (= (and b!122581 res!101595) b!122580))

(assert (= (and b!122577 res!101593) b!122583))

(assert (= (and b!122583 res!101586) b!122574))

(assert (= (and b!122577 res!101587) b!122584))

(assert (= (and b!122577 (not res!101594)) b!122576))

(assert (= (and b!122576 res!101589) b!122587))

(assert (= start!24174 b!122575))

(declare-fun m!186195 () Bool)

(assert (=> b!122580 m!186195))

(declare-fun m!186197 () Bool)

(assert (=> b!122576 m!186197))

(declare-fun m!186199 () Bool)

(assert (=> b!122576 m!186199))

(declare-fun m!186201 () Bool)

(assert (=> b!122576 m!186201))

(declare-fun m!186203 () Bool)

(assert (=> b!122576 m!186203))

(declare-fun m!186205 () Bool)

(assert (=> b!122576 m!186205))

(declare-fun m!186207 () Bool)

(assert (=> b!122576 m!186207))

(declare-fun m!186209 () Bool)

(assert (=> b!122576 m!186209))

(declare-fun m!186211 () Bool)

(assert (=> b!122576 m!186211))

(declare-fun m!186213 () Bool)

(assert (=> b!122585 m!186213))

(declare-fun m!186215 () Bool)

(assert (=> b!122583 m!186215))

(declare-fun m!186217 () Bool)

(assert (=> b!122577 m!186217))

(declare-fun m!186219 () Bool)

(assert (=> b!122577 m!186219))

(declare-fun m!186221 () Bool)

(assert (=> b!122577 m!186221))

(declare-fun m!186223 () Bool)

(assert (=> b!122577 m!186223))

(declare-fun m!186225 () Bool)

(assert (=> b!122577 m!186225))

(declare-fun m!186227 () Bool)

(assert (=> b!122577 m!186227))

(declare-fun m!186229 () Bool)

(assert (=> b!122577 m!186229))

(declare-fun m!186231 () Bool)

(assert (=> b!122577 m!186231))

(declare-fun m!186233 () Bool)

(assert (=> b!122577 m!186233))

(declare-fun m!186235 () Bool)

(assert (=> b!122577 m!186235))

(declare-fun m!186237 () Bool)

(assert (=> b!122577 m!186237))

(declare-fun m!186239 () Bool)

(assert (=> b!122577 m!186239))

(declare-fun m!186241 () Bool)

(assert (=> b!122577 m!186241))

(declare-fun m!186243 () Bool)

(assert (=> b!122577 m!186243))

(declare-fun m!186245 () Bool)

(assert (=> b!122577 m!186245))

(declare-fun m!186247 () Bool)

(assert (=> b!122577 m!186247))

(declare-fun m!186249 () Bool)

(assert (=> b!122577 m!186249))

(declare-fun m!186251 () Bool)

(assert (=> b!122577 m!186251))

(declare-fun m!186253 () Bool)

(assert (=> b!122577 m!186253))

(declare-fun m!186255 () Bool)

(assert (=> b!122575 m!186255))

(declare-fun m!186257 () Bool)

(assert (=> start!24174 m!186257))

(declare-fun m!186259 () Bool)

(assert (=> b!122582 m!186259))

(declare-fun m!186261 () Bool)

(assert (=> b!122581 m!186261))

(assert (=> b!122581 m!186261))

(declare-fun m!186263 () Bool)

(assert (=> b!122581 m!186263))

(declare-fun m!186265 () Bool)

(assert (=> b!122579 m!186265))

(assert (=> b!122586 m!186197))

(assert (=> b!122586 m!186199))

(declare-fun m!186267 () Bool)

(assert (=> b!122574 m!186267))

(push 1)

(assert (not b!122580))

(assert (not b!122575))

(assert (not b!122574))

(assert (not start!24174))

(assert (not b!122577))

(assert (not b!122585))

(assert (not b!122583))

(assert (not b!122582))

(assert (not b!122579))

(assert (not b!122581))

(assert (not b!122576))

(assert (not b!122586))

(check-sat)

(pop 1)

(push 1)

(check-sat)

