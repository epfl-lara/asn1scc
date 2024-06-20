; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25510 () Bool)

(assert start!25510)

(declare-fun b!129425 () Bool)

(declare-fun e!85790 () Bool)

(declare-fun e!85785 () Bool)

(assert (=> b!129425 (= e!85790 e!85785)))

(declare-fun res!107197 () Bool)

(assert (=> b!129425 (=> (not res!107197) (not e!85785))))

(declare-fun lt!200050 () (_ BitVec 64))

(declare-datatypes ((array!5995 0))(
  ( (array!5996 (arr!3330 (Array (_ BitVec 32) (_ BitVec 8))) (size!2713 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4690 0))(
  ( (BitStream!4691 (buf!3071 array!5995) (currentByte!5832 (_ BitVec 32)) (currentBit!5827 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8031 0))(
  ( (Unit!8032) )
))
(declare-datatypes ((tuple2!11062 0))(
  ( (tuple2!11063 (_1!5828 Unit!8031) (_2!5828 BitStream!4690)) )
))
(declare-fun lt!200049 () tuple2!11062)

(declare-fun lt!200047 () tuple2!11062)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!129425 (= res!107197 (= (bitIndex!0 (size!2713 (buf!3071 (_2!5828 lt!200049))) (currentByte!5832 (_2!5828 lt!200049)) (currentBit!5827 (_2!5828 lt!200049))) (bvadd (bitIndex!0 (size!2713 (buf!3071 (_2!5828 lt!200047))) (currentByte!5832 (_2!5828 lt!200047)) (currentBit!5827 (_2!5828 lt!200047))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!200050))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!129425 (= lt!200050 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!129426 () Bool)

(declare-fun res!107184 () Bool)

(declare-fun e!85789 () Bool)

(assert (=> b!129426 (=> (not res!107184) (not e!85789))))

(declare-fun thiss!1634 () BitStream!4690)

(assert (=> b!129426 (= res!107184 (= (bitIndex!0 (size!2713 (buf!3071 (_2!5828 lt!200047))) (currentByte!5832 (_2!5828 lt!200047)) (currentBit!5827 (_2!5828 lt!200047))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2713 (buf!3071 thiss!1634)) (currentByte!5832 thiss!1634) (currentBit!5827 thiss!1634)))))))

(declare-fun b!129427 () Bool)

(declare-fun res!107187 () Bool)

(assert (=> b!129427 (=> (not res!107187) (not e!85785))))

(declare-fun isPrefixOf!0 (BitStream!4690 BitStream!4690) Bool)

(assert (=> b!129427 (= res!107187 (isPrefixOf!0 (_2!5828 lt!200047) (_2!5828 lt!200049)))))

(declare-fun res!107194 () Bool)

(declare-fun e!85787 () Bool)

(assert (=> start!25510 (=> (not res!107194) (not e!85787))))

(declare-fun arr!237 () array!5995)

(assert (=> start!25510 (= res!107194 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2713 arr!237))))))

(assert (=> start!25510 e!85787))

(assert (=> start!25510 true))

(declare-fun array_inv!2502 (array!5995) Bool)

(assert (=> start!25510 (array_inv!2502 arr!237)))

(declare-fun e!85781 () Bool)

(declare-fun inv!12 (BitStream!4690) Bool)

(assert (=> start!25510 (and (inv!12 thiss!1634) e!85781)))

(declare-fun b!129428 () Bool)

(declare-datatypes ((tuple2!11064 0))(
  ( (tuple2!11065 (_1!5829 BitStream!4690) (_2!5829 array!5995)) )
))
(declare-fun lt!200051 () tuple2!11064)

(declare-fun e!85788 () Bool)

(declare-fun arrayRangesEq!116 (array!5995 array!5995 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129428 (= e!85788 (not (arrayRangesEq!116 arr!237 (_2!5829 lt!200051) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!129429 () Bool)

(declare-fun res!107191 () Bool)

(declare-fun e!85786 () Bool)

(assert (=> b!129429 (=> res!107191 e!85786)))

(declare-fun lt!200052 () (_ BitVec 64))

(assert (=> b!129429 (= res!107191 (bvsgt lt!200052 (bitIndex!0 (size!2713 (buf!3071 (_2!5828 lt!200049))) (currentByte!5832 (_2!5828 lt!200049)) (currentBit!5827 (_2!5828 lt!200049)))))))

(declare-fun b!129430 () Bool)

(declare-fun e!85784 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129430 (= e!85784 (invariant!0 (currentBit!5827 thiss!1634) (currentByte!5832 thiss!1634) (size!2713 (buf!3071 (_2!5828 lt!200047)))))))

(declare-fun b!129431 () Bool)

(assert (=> b!129431 (= e!85785 (not e!85788))))

(declare-fun res!107183 () Bool)

(assert (=> b!129431 (=> res!107183 e!85788)))

(declare-datatypes ((tuple2!11066 0))(
  ( (tuple2!11067 (_1!5830 BitStream!4690) (_2!5830 BitStream!4690)) )
))
(declare-fun lt!200053 () tuple2!11066)

(assert (=> b!129431 (= res!107183 (or (not (= (size!2713 (_2!5829 lt!200051)) (size!2713 arr!237))) (not (= (_1!5829 lt!200051) (_2!5830 lt!200053)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4690 array!5995 (_ BitVec 32) (_ BitVec 32)) tuple2!11064)

(assert (=> b!129431 (= lt!200051 (readByteArrayLoopPure!0 (_1!5830 lt!200053) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129431 (validate_offset_bits!1 ((_ sign_extend 32) (size!2713 (buf!3071 (_2!5828 lt!200049)))) ((_ sign_extend 32) (currentByte!5832 (_2!5828 lt!200047))) ((_ sign_extend 32) (currentBit!5827 (_2!5828 lt!200047))) lt!200050)))

(declare-fun lt!200042 () Unit!8031)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4690 array!5995 (_ BitVec 64)) Unit!8031)

(assert (=> b!129431 (= lt!200042 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5828 lt!200047) (buf!3071 (_2!5828 lt!200049)) lt!200050))))

(declare-fun reader!0 (BitStream!4690 BitStream!4690) tuple2!11066)

(assert (=> b!129431 (= lt!200053 (reader!0 (_2!5828 lt!200047) (_2!5828 lt!200049)))))

(declare-fun b!129432 () Bool)

(declare-fun res!107190 () Bool)

(assert (=> b!129432 (=> res!107190 e!85786)))

(declare-fun arrayBitRangesEq!0 (array!5995 array!5995 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129432 (= res!107190 (not (arrayBitRangesEq!0 (buf!3071 (_2!5828 lt!200047)) (buf!3071 (_2!5828 lt!200049)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!200052)))))

(declare-fun b!129433 () Bool)

(assert (=> b!129433 (= e!85787 (not e!85786))))

(declare-fun res!107195 () Bool)

(assert (=> b!129433 (=> res!107195 e!85786)))

(assert (=> b!129433 (= res!107195 (bvsgt lt!200052 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2713 (buf!3071 (_2!5828 lt!200047)))))))))

(assert (=> b!129433 (= lt!200052 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2713 (buf!3071 (_2!5828 lt!200047))) (currentByte!5832 thiss!1634) (currentBit!5827 thiss!1634))))))

(assert (=> b!129433 e!85784))

(declare-fun res!107188 () Bool)

(assert (=> b!129433 (=> (not res!107188) (not e!85784))))

(assert (=> b!129433 (= res!107188 (isPrefixOf!0 thiss!1634 (_2!5828 lt!200049)))))

(declare-fun lt!200043 () Unit!8031)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4690 BitStream!4690 BitStream!4690) Unit!8031)

(assert (=> b!129433 (= lt!200043 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5828 lt!200047) (_2!5828 lt!200049)))))

(assert (=> b!129433 e!85790))

(declare-fun res!107189 () Bool)

(assert (=> b!129433 (=> (not res!107189) (not e!85790))))

(assert (=> b!129433 (= res!107189 (= (size!2713 (buf!3071 (_2!5828 lt!200047))) (size!2713 (buf!3071 (_2!5828 lt!200049)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4690 array!5995 (_ BitVec 32) (_ BitVec 32)) tuple2!11062)

(assert (=> b!129433 (= lt!200049 (appendByteArrayLoop!0 (_2!5828 lt!200047) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!129433 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2713 (buf!3071 (_2!5828 lt!200047)))) ((_ sign_extend 32) (currentByte!5832 (_2!5828 lt!200047))) ((_ sign_extend 32) (currentBit!5827 (_2!5828 lt!200047))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!200044 () Unit!8031)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4690 BitStream!4690 (_ BitVec 64) (_ BitVec 32)) Unit!8031)

(assert (=> b!129433 (= lt!200044 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5828 lt!200047) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!129433 e!85789))

(declare-fun res!107192 () Bool)

(assert (=> b!129433 (=> (not res!107192) (not e!85789))))

(assert (=> b!129433 (= res!107192 (= (size!2713 (buf!3071 thiss!1634)) (size!2713 (buf!3071 (_2!5828 lt!200047)))))))

(declare-fun appendByte!0 (BitStream!4690 (_ BitVec 8)) tuple2!11062)

(assert (=> b!129433 (= lt!200047 (appendByte!0 thiss!1634 (select (arr!3330 arr!237) from!447)))))

(declare-fun b!129434 () Bool)

(declare-fun res!107186 () Bool)

(assert (=> b!129434 (=> (not res!107186) (not e!85789))))

(assert (=> b!129434 (= res!107186 (isPrefixOf!0 thiss!1634 (_2!5828 lt!200047)))))

(declare-fun b!129435 () Bool)

(assert (=> b!129435 (= e!85781 (array_inv!2502 (buf!3071 thiss!1634)))))

(declare-fun b!129436 () Bool)

(declare-fun res!107193 () Bool)

(assert (=> b!129436 (=> (not res!107193) (not e!85787))))

(assert (=> b!129436 (= res!107193 (bvslt from!447 to!404))))

(declare-fun b!129437 () Bool)

(declare-fun res!107196 () Bool)

(assert (=> b!129437 (=> (not res!107196) (not e!85787))))

(assert (=> b!129437 (= res!107196 (invariant!0 (currentBit!5827 thiss!1634) (currentByte!5832 thiss!1634) (size!2713 (buf!3071 thiss!1634))))))

(declare-datatypes ((tuple2!11068 0))(
  ( (tuple2!11069 (_1!5831 BitStream!4690) (_2!5831 (_ BitVec 8))) )
))
(declare-fun lt!200054 () tuple2!11068)

(declare-fun b!129438 () Bool)

(declare-fun lt!200048 () tuple2!11066)

(assert (=> b!129438 (= e!85789 (and (= (_2!5831 lt!200054) (select (arr!3330 arr!237) from!447)) (= (_1!5831 lt!200054) (_2!5830 lt!200048))))))

(declare-fun readBytePure!0 (BitStream!4690) tuple2!11068)

(assert (=> b!129438 (= lt!200054 (readBytePure!0 (_1!5830 lt!200048)))))

(assert (=> b!129438 (= lt!200048 (reader!0 thiss!1634 (_2!5828 lt!200047)))))

(declare-fun b!129439 () Bool)

(declare-fun res!107185 () Bool)

(assert (=> b!129439 (=> (not res!107185) (not e!85787))))

(assert (=> b!129439 (= res!107185 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2713 (buf!3071 thiss!1634))) ((_ sign_extend 32) (currentByte!5832 thiss!1634)) ((_ sign_extend 32) (currentBit!5827 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!129440 () Bool)

(assert (=> b!129440 (= e!85786 true)))

(declare-fun lt!200045 () tuple2!11068)

(assert (=> b!129440 (= lt!200045 (readBytePure!0 (BitStream!4691 (buf!3071 (_2!5828 lt!200049)) (currentByte!5832 thiss!1634) (currentBit!5827 thiss!1634))))))

(declare-fun lt!200046 () tuple2!11068)

(assert (=> b!129440 (= lt!200046 (readBytePure!0 (BitStream!4691 (buf!3071 (_2!5828 lt!200047)) (currentByte!5832 thiss!1634) (currentBit!5827 thiss!1634))))))

(assert (= (and start!25510 res!107194) b!129439))

(assert (= (and b!129439 res!107185) b!129436))

(assert (= (and b!129436 res!107193) b!129437))

(assert (= (and b!129437 res!107196) b!129433))

(assert (= (and b!129433 res!107192) b!129426))

(assert (= (and b!129426 res!107184) b!129434))

(assert (= (and b!129434 res!107186) b!129438))

(assert (= (and b!129433 res!107189) b!129425))

(assert (= (and b!129425 res!107197) b!129427))

(assert (= (and b!129427 res!107187) b!129431))

(assert (= (and b!129431 (not res!107183)) b!129428))

(assert (= (and b!129433 res!107188) b!129430))

(assert (= (and b!129433 (not res!107195)) b!129429))

(assert (= (and b!129429 (not res!107191)) b!129432))

(assert (= (and b!129432 (not res!107190)) b!129440))

(assert (= start!25510 b!129435))

(declare-fun m!195259 () Bool)

(assert (=> b!129427 m!195259))

(declare-fun m!195261 () Bool)

(assert (=> b!129429 m!195261))

(declare-fun m!195263 () Bool)

(assert (=> b!129434 m!195263))

(assert (=> b!129425 m!195261))

(declare-fun m!195265 () Bool)

(assert (=> b!129425 m!195265))

(declare-fun m!195267 () Bool)

(assert (=> b!129435 m!195267))

(declare-fun m!195269 () Bool)

(assert (=> b!129437 m!195269))

(declare-fun m!195271 () Bool)

(assert (=> b!129428 m!195271))

(declare-fun m!195273 () Bool)

(assert (=> b!129440 m!195273))

(declare-fun m!195275 () Bool)

(assert (=> b!129440 m!195275))

(declare-fun m!195277 () Bool)

(assert (=> b!129431 m!195277))

(declare-fun m!195279 () Bool)

(assert (=> b!129431 m!195279))

(declare-fun m!195281 () Bool)

(assert (=> b!129431 m!195281))

(declare-fun m!195283 () Bool)

(assert (=> b!129431 m!195283))

(assert (=> b!129426 m!195265))

(declare-fun m!195285 () Bool)

(assert (=> b!129426 m!195285))

(declare-fun m!195287 () Bool)

(assert (=> b!129438 m!195287))

(declare-fun m!195289 () Bool)

(assert (=> b!129438 m!195289))

(declare-fun m!195291 () Bool)

(assert (=> b!129438 m!195291))

(declare-fun m!195293 () Bool)

(assert (=> b!129439 m!195293))

(declare-fun m!195295 () Bool)

(assert (=> b!129433 m!195295))

(declare-fun m!195297 () Bool)

(assert (=> b!129433 m!195297))

(assert (=> b!129433 m!195287))

(declare-fun m!195299 () Bool)

(assert (=> b!129433 m!195299))

(declare-fun m!195301 () Bool)

(assert (=> b!129433 m!195301))

(declare-fun m!195303 () Bool)

(assert (=> b!129433 m!195303))

(declare-fun m!195305 () Bool)

(assert (=> b!129433 m!195305))

(declare-fun m!195307 () Bool)

(assert (=> b!129433 m!195307))

(assert (=> b!129433 m!195287))

(declare-fun m!195309 () Bool)

(assert (=> b!129430 m!195309))

(declare-fun m!195311 () Bool)

(assert (=> start!25510 m!195311))

(declare-fun m!195313 () Bool)

(assert (=> start!25510 m!195313))

(declare-fun m!195315 () Bool)

(assert (=> b!129432 m!195315))

(push 1)

(assert (not b!129433))

(assert (not start!25510))

(assert (not b!129426))

(assert (not b!129428))

(assert (not b!129425))

(assert (not b!129432))

(assert (not b!129431))

(assert (not b!129439))

(assert (not b!129430))

(assert (not b!129440))

(assert (not b!129437))

(assert (not b!129435))

(assert (not b!129434))

(assert (not b!129429))

(assert (not b!129438))

(assert (not b!129427))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

