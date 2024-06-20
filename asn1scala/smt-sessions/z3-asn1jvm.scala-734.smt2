; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20574 () Bool)

(assert start!20574)

(declare-fun b!103519 () Bool)

(declare-fun e!67727 () Bool)

(declare-fun e!67724 () Bool)

(assert (=> b!103519 (= e!67727 e!67724)))

(declare-fun res!85161 () Bool)

(assert (=> b!103519 (=> res!85161 e!67724)))

(declare-datatypes ((array!4832 0))(
  ( (array!4833 (arr!2797 (Array (_ BitVec 32) (_ BitVec 8))) (size!2204 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3882 0))(
  ( (BitStream!3883 (buf!2570 array!4832) (currentByte!5055 (_ BitVec 32)) (currentBit!5050 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8478 0))(
  ( (tuple2!8479 (_1!4494 BitStream!3882) (_2!4494 BitStream!3882)) )
))
(declare-fun lt!151476 () tuple2!8478)

(declare-fun lt!151491 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!103519 (= res!85161 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2204 (buf!2570 (_1!4494 lt!151476)))) ((_ sign_extend 32) (currentByte!5055 (_1!4494 lt!151476))) ((_ sign_extend 32) (currentBit!5050 (_1!4494 lt!151476))) ((_ sign_extend 32) lt!151491))))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!103519 (= lt!151491 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun b!103520 () Bool)

(declare-fun e!67725 () Bool)

(declare-fun thiss!1305 () BitStream!3882)

(declare-fun array_inv!2006 (array!4832) Bool)

(assert (=> b!103520 (= e!67725 (array_inv!2006 (buf!2570 thiss!1305)))))

(declare-fun b!103521 () Bool)

(declare-fun lt!151481 () (_ BitVec 64))

(declare-fun lt!151477 () (_ BitVec 64))

(assert (=> b!103521 (= e!67724 (= (bvand lt!151481 lt!151477) lt!151481))))

(declare-fun b!103522 () Bool)

(declare-fun e!67730 () Bool)

(assert (=> b!103522 (= e!67730 (not e!67727))))

(declare-fun res!85168 () Bool)

(assert (=> b!103522 (=> res!85168 e!67727)))

(assert (=> b!103522 (= res!85168 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-datatypes ((Unit!6352 0))(
  ( (Unit!6353) )
))
(declare-datatypes ((tuple2!8480 0))(
  ( (tuple2!8481 (_1!4495 Unit!6352) (_2!4495 BitStream!3882)) )
))
(declare-fun lt!151475 () tuple2!8480)

(declare-fun lt!151490 () tuple2!8480)

(declare-fun lt!151470 () (_ BitVec 64))

(assert (=> b!103522 (validate_offset_bits!1 ((_ sign_extend 32) (size!2204 (buf!2570 (_2!4495 lt!151475)))) ((_ sign_extend 32) (currentByte!5055 (_2!4495 lt!151490))) ((_ sign_extend 32) (currentBit!5050 (_2!4495 lt!151490))) lt!151470)))

(declare-fun lt!151469 () Unit!6352)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3882 array!4832 (_ BitVec 64)) Unit!6352)

(assert (=> b!103522 (= lt!151469 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4495 lt!151490) (buf!2570 (_2!4495 lt!151475)) lt!151470))))

(assert (=> b!103522 (= lt!151470 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!151489 () (_ BitVec 64))

(declare-fun lt!151485 () (_ BitVec 64))

(declare-datatypes ((tuple2!8482 0))(
  ( (tuple2!8483 (_1!4496 BitStream!3882) (_2!4496 Bool)) )
))
(declare-fun lt!151471 () tuple2!8482)

(assert (=> b!103522 (= lt!151481 (bvor lt!151489 (ite (_2!4496 lt!151471) lt!151485 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!151472 () tuple2!8478)

(declare-datatypes ((tuple2!8484 0))(
  ( (tuple2!8485 (_1!4497 BitStream!3882) (_2!4497 (_ BitVec 64))) )
))
(declare-fun lt!151480 () tuple2!8484)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3882 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8484)

(assert (=> b!103522 (= lt!151480 (readNLeastSignificantBitsLoopPure!0 (_1!4494 lt!151472) nBits!396 i!615 lt!151489))))

(declare-fun lt!151478 () (_ BitVec 64))

(assert (=> b!103522 (validate_offset_bits!1 ((_ sign_extend 32) (size!2204 (buf!2570 (_2!4495 lt!151475)))) ((_ sign_extend 32) (currentByte!5055 thiss!1305)) ((_ sign_extend 32) (currentBit!5050 thiss!1305)) lt!151478)))

(declare-fun lt!151492 () Unit!6352)

(assert (=> b!103522 (= lt!151492 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2570 (_2!4495 lt!151475)) lt!151478))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103522 (= lt!151489 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!151474 () Bool)

(assert (=> b!103522 (= (_2!4496 lt!151471) lt!151474)))

(declare-fun readBitPure!0 (BitStream!3882) tuple2!8482)

(assert (=> b!103522 (= lt!151471 (readBitPure!0 (_1!4494 lt!151472)))))

(declare-fun reader!0 (BitStream!3882 BitStream!3882) tuple2!8478)

(assert (=> b!103522 (= lt!151476 (reader!0 (_2!4495 lt!151490) (_2!4495 lt!151475)))))

(assert (=> b!103522 (= lt!151472 (reader!0 thiss!1305 (_2!4495 lt!151475)))))

(declare-fun e!67734 () Bool)

(assert (=> b!103522 e!67734))

(declare-fun res!85158 () Bool)

(assert (=> b!103522 (=> (not res!85158) (not e!67734))))

(declare-fun lt!151486 () tuple2!8482)

(declare-fun lt!151479 () tuple2!8482)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103522 (= res!85158 (= (bitIndex!0 (size!2204 (buf!2570 (_1!4496 lt!151486))) (currentByte!5055 (_1!4496 lt!151486)) (currentBit!5050 (_1!4496 lt!151486))) (bitIndex!0 (size!2204 (buf!2570 (_1!4496 lt!151479))) (currentByte!5055 (_1!4496 lt!151479)) (currentBit!5050 (_1!4496 lt!151479)))))))

(declare-fun lt!151487 () Unit!6352)

(declare-fun lt!151484 () BitStream!3882)

(declare-fun readBitPrefixLemma!0 (BitStream!3882 BitStream!3882) Unit!6352)

(assert (=> b!103522 (= lt!151487 (readBitPrefixLemma!0 lt!151484 (_2!4495 lt!151475)))))

(assert (=> b!103522 (= lt!151479 (readBitPure!0 (BitStream!3883 (buf!2570 (_2!4495 lt!151475)) (currentByte!5055 thiss!1305) (currentBit!5050 thiss!1305))))))

(assert (=> b!103522 (= lt!151486 (readBitPure!0 lt!151484))))

(assert (=> b!103522 (= lt!151484 (BitStream!3883 (buf!2570 (_2!4495 lt!151490)) (currentByte!5055 thiss!1305) (currentBit!5050 thiss!1305)))))

(declare-fun e!67733 () Bool)

(assert (=> b!103522 e!67733))

(declare-fun res!85167 () Bool)

(assert (=> b!103522 (=> (not res!85167) (not e!67733))))

(declare-fun isPrefixOf!0 (BitStream!3882 BitStream!3882) Bool)

(assert (=> b!103522 (= res!85167 (isPrefixOf!0 thiss!1305 (_2!4495 lt!151475)))))

(declare-fun lt!151483 () Unit!6352)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3882 BitStream!3882 BitStream!3882) Unit!6352)

(assert (=> b!103522 (= lt!151483 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4495 lt!151490) (_2!4495 lt!151475)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3882 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8480)

(assert (=> b!103522 (= lt!151475 (appendNLeastSignificantBitsLoop!0 (_2!4495 lt!151490) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!67732 () Bool)

(assert (=> b!103522 e!67732))

(declare-fun res!85162 () Bool)

(assert (=> b!103522 (=> (not res!85162) (not e!67732))))

(assert (=> b!103522 (= res!85162 (= (size!2204 (buf!2570 thiss!1305)) (size!2204 (buf!2570 (_2!4495 lt!151490)))))))

(declare-fun appendBit!0 (BitStream!3882 Bool) tuple2!8480)

(assert (=> b!103522 (= lt!151490 (appendBit!0 thiss!1305 lt!151474))))

(assert (=> b!103522 (= lt!151474 (not (= (bvand v!199 lt!151485) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103522 (= lt!151485 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!103523 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!103523 (= e!67733 (invariant!0 (currentBit!5050 thiss!1305) (currentByte!5055 thiss!1305) (size!2204 (buf!2570 (_2!4495 lt!151475)))))))

(declare-fun b!103524 () Bool)

(declare-fun e!67726 () Bool)

(declare-fun e!67729 () Bool)

(assert (=> b!103524 (= e!67726 e!67729)))

(declare-fun res!85164 () Bool)

(assert (=> b!103524 (=> (not res!85164) (not e!67729))))

(declare-fun lt!151473 () tuple2!8482)

(assert (=> b!103524 (= res!85164 (and (= (_2!4496 lt!151473) lt!151474) (= (_1!4496 lt!151473) (_2!4495 lt!151490))))))

(declare-fun readerFrom!0 (BitStream!3882 (_ BitVec 32) (_ BitVec 32)) BitStream!3882)

(assert (=> b!103524 (= lt!151473 (readBitPure!0 (readerFrom!0 (_2!4495 lt!151490) (currentBit!5050 thiss!1305) (currentByte!5055 thiss!1305))))))

(declare-fun b!103525 () Bool)

(assert (=> b!103525 (= e!67732 e!67726)))

(declare-fun res!85157 () Bool)

(assert (=> b!103525 (=> (not res!85157) (not e!67726))))

(declare-fun lt!151482 () (_ BitVec 64))

(declare-fun lt!151488 () (_ BitVec 64))

(assert (=> b!103525 (= res!85157 (= lt!151482 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!151488)))))

(assert (=> b!103525 (= lt!151482 (bitIndex!0 (size!2204 (buf!2570 (_2!4495 lt!151490))) (currentByte!5055 (_2!4495 lt!151490)) (currentBit!5050 (_2!4495 lt!151490))))))

(assert (=> b!103525 (= lt!151488 (bitIndex!0 (size!2204 (buf!2570 thiss!1305)) (currentByte!5055 thiss!1305) (currentBit!5050 thiss!1305)))))

(declare-fun b!103526 () Bool)

(declare-fun res!85163 () Bool)

(assert (=> b!103526 (=> (not res!85163) (not e!67726))))

(assert (=> b!103526 (= res!85163 (isPrefixOf!0 thiss!1305 (_2!4495 lt!151490)))))

(declare-fun b!103527 () Bool)

(declare-fun e!67731 () Bool)

(declare-fun e!67728 () Bool)

(assert (=> b!103527 (= e!67731 e!67728)))

(declare-fun res!85159 () Bool)

(assert (=> b!103527 (=> (not res!85159) (not e!67728))))

(assert (=> b!103527 (= res!85159 (validate_offset_bits!1 ((_ sign_extend 32) (size!2204 (buf!2570 thiss!1305))) ((_ sign_extend 32) (currentByte!5055 thiss!1305)) ((_ sign_extend 32) (currentBit!5050 thiss!1305)) lt!151478))))

(assert (=> b!103527 (= lt!151478 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!103528 () Bool)

(assert (=> b!103528 (= e!67729 (= (bitIndex!0 (size!2204 (buf!2570 (_1!4496 lt!151473))) (currentByte!5055 (_1!4496 lt!151473)) (currentBit!5050 (_1!4496 lt!151473))) lt!151482))))

(declare-fun b!103529 () Bool)

(declare-fun res!85169 () Bool)

(assert (=> b!103529 (=> res!85169 e!67724)))

(assert (=> b!103529 (= res!85169 (not (= (bvand lt!151481 (onesLSBLong!0 lt!151491)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!103530 () Bool)

(declare-fun res!85160 () Bool)

(assert (=> b!103530 (=> (not res!85160) (not e!67733))))

(assert (=> b!103530 (= res!85160 (invariant!0 (currentBit!5050 thiss!1305) (currentByte!5055 thiss!1305) (size!2204 (buf!2570 (_2!4495 lt!151490)))))))

(declare-fun b!103531 () Bool)

(assert (=> b!103531 (= e!67728 e!67730)))

(declare-fun res!85166 () Bool)

(assert (=> b!103531 (=> (not res!85166) (not e!67730))))

(assert (=> b!103531 (= res!85166 (and (= (bvand v!199 lt!151477) v!199) (bvslt i!615 nBits!396)))))

(assert (=> b!103531 (= lt!151477 (onesLSBLong!0 nBits!396))))

(declare-fun b!103532 () Bool)

(assert (=> b!103532 (= e!67734 (= (_2!4496 lt!151486) (_2!4496 lt!151479)))))

(declare-fun res!85165 () Bool)

(assert (=> start!20574 (=> (not res!85165) (not e!67731))))

(assert (=> start!20574 (= res!85165 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20574 e!67731))

(assert (=> start!20574 true))

(declare-fun inv!12 (BitStream!3882) Bool)

(assert (=> start!20574 (and (inv!12 thiss!1305) e!67725)))

(assert (= (and start!20574 res!85165) b!103527))

(assert (= (and b!103527 res!85159) b!103531))

(assert (= (and b!103531 res!85166) b!103522))

(assert (= (and b!103522 res!85162) b!103525))

(assert (= (and b!103525 res!85157) b!103526))

(assert (= (and b!103526 res!85163) b!103524))

(assert (= (and b!103524 res!85164) b!103528))

(assert (= (and b!103522 res!85167) b!103530))

(assert (= (and b!103530 res!85160) b!103523))

(assert (= (and b!103522 res!85158) b!103532))

(assert (= (and b!103522 (not res!85168)) b!103519))

(assert (= (and b!103519 (not res!85161)) b!103529))

(assert (= (and b!103529 (not res!85169)) b!103521))

(assert (= start!20574 b!103520))

(declare-fun m!151169 () Bool)

(assert (=> b!103522 m!151169))

(declare-fun m!151171 () Bool)

(assert (=> b!103522 m!151171))

(declare-fun m!151173 () Bool)

(assert (=> b!103522 m!151173))

(declare-fun m!151175 () Bool)

(assert (=> b!103522 m!151175))

(declare-fun m!151177 () Bool)

(assert (=> b!103522 m!151177))

(declare-fun m!151179 () Bool)

(assert (=> b!103522 m!151179))

(declare-fun m!151181 () Bool)

(assert (=> b!103522 m!151181))

(declare-fun m!151183 () Bool)

(assert (=> b!103522 m!151183))

(declare-fun m!151185 () Bool)

(assert (=> b!103522 m!151185))

(declare-fun m!151187 () Bool)

(assert (=> b!103522 m!151187))

(declare-fun m!151189 () Bool)

(assert (=> b!103522 m!151189))

(declare-fun m!151191 () Bool)

(assert (=> b!103522 m!151191))

(declare-fun m!151193 () Bool)

(assert (=> b!103522 m!151193))

(declare-fun m!151195 () Bool)

(assert (=> b!103522 m!151195))

(declare-fun m!151197 () Bool)

(assert (=> b!103522 m!151197))

(declare-fun m!151199 () Bool)

(assert (=> b!103522 m!151199))

(declare-fun m!151201 () Bool)

(assert (=> b!103522 m!151201))

(declare-fun m!151203 () Bool)

(assert (=> b!103522 m!151203))

(declare-fun m!151205 () Bool)

(assert (=> b!103519 m!151205))

(declare-fun m!151207 () Bool)

(assert (=> b!103524 m!151207))

(assert (=> b!103524 m!151207))

(declare-fun m!151209 () Bool)

(assert (=> b!103524 m!151209))

(declare-fun m!151211 () Bool)

(assert (=> b!103528 m!151211))

(declare-fun m!151213 () Bool)

(assert (=> start!20574 m!151213))

(declare-fun m!151215 () Bool)

(assert (=> b!103526 m!151215))

(declare-fun m!151217 () Bool)

(assert (=> b!103531 m!151217))

(declare-fun m!151219 () Bool)

(assert (=> b!103529 m!151219))

(declare-fun m!151221 () Bool)

(assert (=> b!103520 m!151221))

(declare-fun m!151223 () Bool)

(assert (=> b!103530 m!151223))

(declare-fun m!151225 () Bool)

(assert (=> b!103525 m!151225))

(declare-fun m!151227 () Bool)

(assert (=> b!103525 m!151227))

(declare-fun m!151229 () Bool)

(assert (=> b!103527 m!151229))

(declare-fun m!151231 () Bool)

(assert (=> b!103523 m!151231))

(check-sat (not b!103519) (not b!103522) (not b!103525) (not b!103529) (not b!103526) (not b!103527) (not start!20574) (not b!103524) (not b!103523) (not b!103528) (not b!103530) (not b!103531) (not b!103520))
(check-sat)
