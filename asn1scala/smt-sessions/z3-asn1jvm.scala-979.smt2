; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27464 () Bool)

(assert start!27464)

(declare-fun b!141276 () Bool)

(declare-fun res!117833 () Bool)

(declare-fun e!94123 () Bool)

(assert (=> b!141276 (=> (not res!117833) (not e!94123))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6479 0))(
  ( (array!6480 (arr!3640 (Array (_ BitVec 32) (_ BitVec 8))) (size!2933 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5124 0))(
  ( (BitStream!5125 (buf!3354 array!6479) (currentByte!6214 (_ BitVec 32)) (currentBit!6209 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5124)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!141276 (= res!117833 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2933 (buf!3354 thiss!1634))) ((_ sign_extend 32) (currentByte!6214 thiss!1634)) ((_ sign_extend 32) (currentBit!6209 thiss!1634)) (bvsub to!404 from!447)))))

(declare-datatypes ((tuple2!12480 0))(
  ( (tuple2!12481 (_1!6570 BitStream!5124) (_2!6570 array!6479)) )
))
(declare-fun lt!219395 () tuple2!12480)

(declare-fun arr!237 () array!6479)

(declare-fun b!141277 () Bool)

(declare-fun e!94120 () Bool)

(declare-fun arrayRangesEq!249 (array!6479 array!6479 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141277 (= e!94120 (not (arrayRangesEq!249 arr!237 (_2!6570 lt!219395) #b00000000000000000000000000000000 to!404)))))

(declare-datatypes ((tuple2!12482 0))(
  ( (tuple2!12483 (_1!6571 BitStream!5124) (_2!6571 BitStream!5124)) )
))
(declare-fun lt!219397 () tuple2!12482)

(declare-datatypes ((tuple2!12484 0))(
  ( (tuple2!12485 (_1!6572 BitStream!5124) (_2!6572 (_ BitVec 8))) )
))
(declare-fun lt!219391 () tuple2!12484)

(declare-fun e!94119 () Bool)

(declare-fun b!141278 () Bool)

(assert (=> b!141278 (= e!94119 (and (= (_2!6572 lt!219391) (select (arr!3640 arr!237) from!447)) (= (_1!6572 lt!219391) (_2!6571 lt!219397))))))

(declare-fun readBytePure!0 (BitStream!5124) tuple2!12484)

(assert (=> b!141278 (= lt!219391 (readBytePure!0 (_1!6571 lt!219397)))))

(declare-datatypes ((Unit!8848 0))(
  ( (Unit!8849) )
))
(declare-datatypes ((tuple2!12486 0))(
  ( (tuple2!12487 (_1!6573 Unit!8848) (_2!6573 BitStream!5124)) )
))
(declare-fun lt!219393 () tuple2!12486)

(declare-fun reader!0 (BitStream!5124 BitStream!5124) tuple2!12482)

(assert (=> b!141278 (= lt!219397 (reader!0 thiss!1634 (_2!6573 lt!219393)))))

(declare-fun res!117835 () Bool)

(assert (=> start!27464 (=> (not res!117835) (not e!94123))))

(assert (=> start!27464 (= res!117835 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2933 arr!237))))))

(assert (=> start!27464 e!94123))

(assert (=> start!27464 true))

(declare-fun array_inv!2722 (array!6479) Bool)

(assert (=> start!27464 (array_inv!2722 arr!237)))

(declare-fun e!94118 () Bool)

(declare-fun inv!12 (BitStream!5124) Bool)

(assert (=> start!27464 (and (inv!12 thiss!1634) e!94118)))

(declare-fun b!141279 () Bool)

(declare-fun res!117834 () Bool)

(assert (=> b!141279 (=> (not res!117834) (not e!94119))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!141279 (= res!117834 (= (bitIndex!0 (size!2933 (buf!3354 (_2!6573 lt!219393))) (currentByte!6214 (_2!6573 lt!219393)) (currentBit!6209 (_2!6573 lt!219393))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2933 (buf!3354 thiss!1634)) (currentByte!6214 thiss!1634) (currentBit!6209 thiss!1634)))))))

(declare-fun b!141280 () Bool)

(assert (=> b!141280 (= e!94123 (not true))))

(declare-fun lt!219398 () Bool)

(declare-fun isPrefixOf!0 (BitStream!5124 BitStream!5124) Bool)

(assert (=> b!141280 (= lt!219398 (isPrefixOf!0 thiss!1634 (_2!6573 lt!219393)))))

(declare-fun e!94124 () Bool)

(assert (=> b!141280 e!94124))

(declare-fun res!117836 () Bool)

(assert (=> b!141280 (=> (not res!117836) (not e!94124))))

(declare-fun lt!219396 () tuple2!12486)

(assert (=> b!141280 (= res!117836 (= (size!2933 (buf!3354 (_2!6573 lt!219393))) (size!2933 (buf!3354 (_2!6573 lt!219396)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5124 array!6479 (_ BitVec 32) (_ BitVec 32)) tuple2!12486)

(assert (=> b!141280 (= lt!219396 (appendByteArrayLoop!0 (_2!6573 lt!219393) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!141280 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2933 (buf!3354 (_2!6573 lt!219393)))) ((_ sign_extend 32) (currentByte!6214 (_2!6573 lt!219393))) ((_ sign_extend 32) (currentBit!6209 (_2!6573 lt!219393))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!219392 () Unit!8848)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5124 BitStream!5124 (_ BitVec 64) (_ BitVec 32)) Unit!8848)

(assert (=> b!141280 (= lt!219392 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6573 lt!219393) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!141280 e!94119))

(declare-fun res!117828 () Bool)

(assert (=> b!141280 (=> (not res!117828) (not e!94119))))

(assert (=> b!141280 (= res!117828 (= (size!2933 (buf!3354 thiss!1634)) (size!2933 (buf!3354 (_2!6573 lt!219393)))))))

(declare-fun appendByte!0 (BitStream!5124 (_ BitVec 8)) tuple2!12486)

(assert (=> b!141280 (= lt!219393 (appendByte!0 thiss!1634 (select (arr!3640 arr!237) from!447)))))

(declare-fun b!141281 () Bool)

(declare-fun res!117831 () Bool)

(assert (=> b!141281 (=> (not res!117831) (not e!94123))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141281 (= res!117831 (invariant!0 (currentBit!6209 thiss!1634) (currentByte!6214 thiss!1634) (size!2933 (buf!3354 thiss!1634))))))

(declare-fun b!141282 () Bool)

(declare-fun res!117829 () Bool)

(assert (=> b!141282 (=> (not res!117829) (not e!94123))))

(assert (=> b!141282 (= res!117829 (bvslt from!447 to!404))))

(declare-fun b!141283 () Bool)

(declare-fun e!94122 () Bool)

(assert (=> b!141283 (= e!94124 e!94122)))

(declare-fun res!117832 () Bool)

(assert (=> b!141283 (=> (not res!117832) (not e!94122))))

(declare-fun lt!219394 () (_ BitVec 64))

(assert (=> b!141283 (= res!117832 (= (bitIndex!0 (size!2933 (buf!3354 (_2!6573 lt!219396))) (currentByte!6214 (_2!6573 lt!219396)) (currentBit!6209 (_2!6573 lt!219396))) (bvadd (bitIndex!0 (size!2933 (buf!3354 (_2!6573 lt!219393))) (currentByte!6214 (_2!6573 lt!219393)) (currentBit!6209 (_2!6573 lt!219393))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!219394))))))

(assert (=> b!141283 (= lt!219394 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!141284 () Bool)

(assert (=> b!141284 (= e!94118 (array_inv!2722 (buf!3354 thiss!1634)))))

(declare-fun b!141285 () Bool)

(declare-fun res!117830 () Bool)

(assert (=> b!141285 (=> (not res!117830) (not e!94122))))

(assert (=> b!141285 (= res!117830 (isPrefixOf!0 (_2!6573 lt!219393) (_2!6573 lt!219396)))))

(declare-fun b!141286 () Bool)

(declare-fun res!117838 () Bool)

(assert (=> b!141286 (=> (not res!117838) (not e!94119))))

(assert (=> b!141286 (= res!117838 (isPrefixOf!0 thiss!1634 (_2!6573 lt!219393)))))

(declare-fun b!141287 () Bool)

(assert (=> b!141287 (= e!94122 (not e!94120))))

(declare-fun res!117837 () Bool)

(assert (=> b!141287 (=> res!117837 e!94120)))

(declare-fun lt!219389 () tuple2!12482)

(assert (=> b!141287 (= res!117837 (or (not (= (size!2933 (_2!6570 lt!219395)) (size!2933 arr!237))) (not (= (_1!6570 lt!219395) (_2!6571 lt!219389)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5124 array!6479 (_ BitVec 32) (_ BitVec 32)) tuple2!12480)

(assert (=> b!141287 (= lt!219395 (readByteArrayLoopPure!0 (_1!6571 lt!219389) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!141287 (validate_offset_bits!1 ((_ sign_extend 32) (size!2933 (buf!3354 (_2!6573 lt!219396)))) ((_ sign_extend 32) (currentByte!6214 (_2!6573 lt!219393))) ((_ sign_extend 32) (currentBit!6209 (_2!6573 lt!219393))) lt!219394)))

(declare-fun lt!219390 () Unit!8848)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5124 array!6479 (_ BitVec 64)) Unit!8848)

(assert (=> b!141287 (= lt!219390 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6573 lt!219393) (buf!3354 (_2!6573 lt!219396)) lt!219394))))

(assert (=> b!141287 (= lt!219389 (reader!0 (_2!6573 lt!219393) (_2!6573 lt!219396)))))

(assert (= (and start!27464 res!117835) b!141276))

(assert (= (and b!141276 res!117833) b!141282))

(assert (= (and b!141282 res!117829) b!141281))

(assert (= (and b!141281 res!117831) b!141280))

(assert (= (and b!141280 res!117828) b!141279))

(assert (= (and b!141279 res!117834) b!141286))

(assert (= (and b!141286 res!117838) b!141278))

(assert (= (and b!141280 res!117836) b!141283))

(assert (= (and b!141283 res!117832) b!141285))

(assert (= (and b!141285 res!117830) b!141287))

(assert (= (and b!141287 (not res!117837)) b!141277))

(assert (= start!27464 b!141284))

(declare-fun m!217117 () Bool)

(assert (=> b!141276 m!217117))

(declare-fun m!217119 () Bool)

(assert (=> b!141284 m!217119))

(declare-fun m!217121 () Bool)

(assert (=> b!141286 m!217121))

(declare-fun m!217123 () Bool)

(assert (=> b!141287 m!217123))

(declare-fun m!217125 () Bool)

(assert (=> b!141287 m!217125))

(declare-fun m!217127 () Bool)

(assert (=> b!141287 m!217127))

(declare-fun m!217129 () Bool)

(assert (=> b!141287 m!217129))

(declare-fun m!217131 () Bool)

(assert (=> b!141277 m!217131))

(declare-fun m!217133 () Bool)

(assert (=> b!141285 m!217133))

(declare-fun m!217135 () Bool)

(assert (=> b!141280 m!217135))

(declare-fun m!217137 () Bool)

(assert (=> b!141280 m!217137))

(assert (=> b!141280 m!217121))

(declare-fun m!217139 () Bool)

(assert (=> b!141280 m!217139))

(declare-fun m!217141 () Bool)

(assert (=> b!141280 m!217141))

(declare-fun m!217143 () Bool)

(assert (=> b!141280 m!217143))

(assert (=> b!141280 m!217139))

(declare-fun m!217145 () Bool)

(assert (=> b!141281 m!217145))

(declare-fun m!217147 () Bool)

(assert (=> b!141283 m!217147))

(declare-fun m!217149 () Bool)

(assert (=> b!141283 m!217149))

(declare-fun m!217151 () Bool)

(assert (=> start!27464 m!217151))

(declare-fun m!217153 () Bool)

(assert (=> start!27464 m!217153))

(assert (=> b!141278 m!217139))

(declare-fun m!217155 () Bool)

(assert (=> b!141278 m!217155))

(declare-fun m!217157 () Bool)

(assert (=> b!141278 m!217157))

(assert (=> b!141279 m!217149))

(declare-fun m!217159 () Bool)

(assert (=> b!141279 m!217159))

(check-sat (not b!141284) (not b!141283) (not b!141286) (not b!141276) (not b!141277) (not b!141281) (not b!141280) (not b!141287) (not b!141279) (not b!141285) (not b!141278) (not start!27464))
