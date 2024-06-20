; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20902 () Bool)

(assert start!20902)

(declare-fun b!105682 () Bool)

(declare-fun e!69222 () Bool)

(declare-datatypes ((array!4888 0))(
  ( (array!4889 (arr!2822 (Array (_ BitVec 32) (_ BitVec 8))) (size!2229 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3932 0))(
  ( (BitStream!3933 (buf!2603 array!4888) (currentByte!5102 (_ BitVec 32)) (currentBit!5097 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3932)

(declare-datatypes ((Unit!6480 0))(
  ( (Unit!6481) )
))
(declare-datatypes ((tuple2!8702 0))(
  ( (tuple2!8703 (_1!4608 Unit!6480) (_2!4608 BitStream!3932)) )
))
(declare-fun lt!156059 () tuple2!8702)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!105682 (= e!69222 (invariant!0 (currentBit!5097 thiss!1305) (currentByte!5102 thiss!1305) (size!2229 (buf!2603 (_2!4608 lt!156059)))))))

(declare-fun b!105683 () Bool)

(declare-fun e!69213 () Bool)

(declare-fun lt!156075 () tuple2!8702)

(assert (=> b!105683 (= e!69213 (invariant!0 (currentBit!5097 (_2!4608 lt!156075)) (currentByte!5102 (_2!4608 lt!156075)) (size!2229 (buf!2603 (_2!4608 lt!156075)))))))

(declare-fun e!69215 () Bool)

(assert (=> b!105683 e!69215))

(declare-fun res!87043 () Bool)

(assert (=> b!105683 (=> (not res!87043) (not e!69215))))

(declare-datatypes ((tuple2!8704 0))(
  ( (tuple2!8705 (_1!4609 BitStream!3932) (_2!4609 (_ BitVec 64))) )
))
(declare-fun lt!156055 () tuple2!8704)

(declare-fun lt!156065 () tuple2!8704)

(assert (=> b!105683 (= res!87043 (and (= (_2!4609 lt!156055) (_2!4609 lt!156065)) (= (_1!4609 lt!156055) (_1!4609 lt!156065))))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun lt!156074 () (_ BitVec 64))

(declare-datatypes ((tuple2!8706 0))(
  ( (tuple2!8707 (_1!4610 BitStream!3932) (_2!4610 BitStream!3932)) )
))
(declare-fun lt!156058 () tuple2!8706)

(declare-fun i!615 () (_ BitVec 32))

(declare-fun lt!156064 () Unit!6480)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3932 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6480)

(assert (=> b!105683 (= lt!156064 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4610 lt!156058) nBits!396 i!615 lt!156074))))

(declare-fun lt!156057 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3932 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8704)

(declare-fun withMovedBitIndex!0 (BitStream!3932 (_ BitVec 64)) BitStream!3932)

(assert (=> b!105683 (= lt!156065 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4610 lt!156058) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!156057))))

(declare-fun b!105684 () Bool)

(declare-fun e!69221 () Bool)

(declare-fun e!69217 () Bool)

(assert (=> b!105684 (= e!69221 e!69217)))

(declare-fun res!87044 () Bool)

(assert (=> b!105684 (=> (not res!87044) (not e!69217))))

(declare-datatypes ((tuple2!8708 0))(
  ( (tuple2!8709 (_1!4611 BitStream!3932) (_2!4611 Bool)) )
))
(declare-fun lt!156076 () tuple2!8708)

(declare-fun lt!156072 () Bool)

(assert (=> b!105684 (= res!87044 (and (= (_2!4611 lt!156076) lt!156072) (= (_1!4611 lt!156076) (_2!4608 lt!156075))))))

(declare-fun readBitPure!0 (BitStream!3932) tuple2!8708)

(declare-fun readerFrom!0 (BitStream!3932 (_ BitVec 32) (_ BitVec 32)) BitStream!3932)

(assert (=> b!105684 (= lt!156076 (readBitPure!0 (readerFrom!0 (_2!4608 lt!156075) (currentBit!5097 thiss!1305) (currentByte!5102 thiss!1305))))))

(declare-fun b!105685 () Bool)

(declare-fun res!87036 () Bool)

(declare-fun e!69216 () Bool)

(assert (=> b!105685 (=> (not res!87036) (not e!69216))))

(assert (=> b!105685 (= res!87036 (bvslt i!615 nBits!396))))

(declare-fun b!105686 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!105686 (= e!69215 (= (_1!4610 lt!156058) (withMovedBitIndex!0 (_2!4610 lt!156058) (bvsub (bitIndex!0 (size!2229 (buf!2603 thiss!1305)) (currentByte!5102 thiss!1305) (currentBit!5097 thiss!1305)) (bitIndex!0 (size!2229 (buf!2603 (_2!4608 lt!156059))) (currentByte!5102 (_2!4608 lt!156059)) (currentBit!5097 (_2!4608 lt!156059)))))))))

(declare-fun b!105687 () Bool)

(declare-fun res!87039 () Bool)

(assert (=> b!105687 (=> (not res!87039) (not e!69221))))

(declare-fun isPrefixOf!0 (BitStream!3932 BitStream!3932) Bool)

(assert (=> b!105687 (= res!87039 (isPrefixOf!0 thiss!1305 (_2!4608 lt!156075)))))

(declare-fun b!105688 () Bool)

(declare-fun e!69219 () Bool)

(declare-fun array_inv!2031 (array!4888) Bool)

(assert (=> b!105688 (= e!69219 (array_inv!2031 (buf!2603 thiss!1305)))))

(declare-fun b!105689 () Bool)

(declare-fun res!87047 () Bool)

(assert (=> b!105689 (=> (not res!87047) (not e!69222))))

(assert (=> b!105689 (= res!87047 (invariant!0 (currentBit!5097 thiss!1305) (currentByte!5102 thiss!1305) (size!2229 (buf!2603 (_2!4608 lt!156075)))))))

(declare-fun b!105691 () Bool)

(declare-fun e!69220 () Bool)

(assert (=> b!105691 (= e!69220 e!69216)))

(declare-fun res!87038 () Bool)

(assert (=> b!105691 (=> (not res!87038) (not e!69216))))

(declare-fun lt!156071 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!105691 (= res!87038 (validate_offset_bits!1 ((_ sign_extend 32) (size!2229 (buf!2603 thiss!1305))) ((_ sign_extend 32) (currentByte!5102 thiss!1305)) ((_ sign_extend 32) (currentBit!5097 thiss!1305)) lt!156071))))

(assert (=> b!105691 (= lt!156071 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!105692 () Bool)

(declare-fun res!87037 () Bool)

(assert (=> b!105692 (=> (not res!87037) (not e!69216))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!105692 (= res!87037 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!105693 () Bool)

(declare-fun e!69223 () Bool)

(declare-fun lt!156078 () tuple2!8708)

(declare-fun lt!156068 () tuple2!8708)

(assert (=> b!105693 (= e!69223 (= (_2!4611 lt!156078) (_2!4611 lt!156068)))))

(declare-fun b!105694 () Bool)

(declare-fun lt!156069 () (_ BitVec 64))

(assert (=> b!105694 (= e!69217 (= (bitIndex!0 (size!2229 (buf!2603 (_1!4611 lt!156076))) (currentByte!5102 (_1!4611 lt!156076)) (currentBit!5097 (_1!4611 lt!156076))) lt!156069))))

(declare-fun b!105695 () Bool)

(declare-fun e!69214 () Bool)

(assert (=> b!105695 (= e!69214 e!69221)))

(declare-fun res!87041 () Bool)

(assert (=> b!105695 (=> (not res!87041) (not e!69221))))

(declare-fun lt!156060 () (_ BitVec 64))

(assert (=> b!105695 (= res!87041 (= lt!156069 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!156060)))))

(assert (=> b!105695 (= lt!156069 (bitIndex!0 (size!2229 (buf!2603 (_2!4608 lt!156075))) (currentByte!5102 (_2!4608 lt!156075)) (currentBit!5097 (_2!4608 lt!156075))))))

(assert (=> b!105695 (= lt!156060 (bitIndex!0 (size!2229 (buf!2603 thiss!1305)) (currentByte!5102 thiss!1305) (currentBit!5097 thiss!1305)))))

(declare-fun res!87046 () Bool)

(assert (=> start!20902 (=> (not res!87046) (not e!69220))))

(assert (=> start!20902 (= res!87046 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20902 e!69220))

(assert (=> start!20902 true))

(declare-fun inv!12 (BitStream!3932) Bool)

(assert (=> start!20902 (and (inv!12 thiss!1305) e!69219)))

(declare-fun b!105690 () Bool)

(assert (=> b!105690 (= e!69216 (not e!69213))))

(declare-fun res!87040 () Bool)

(assert (=> b!105690 (=> res!87040 e!69213)))

(declare-fun lt!156063 () tuple2!8706)

(assert (=> b!105690 (= res!87040 (not (= (_1!4609 (readNLeastSignificantBitsLoopPure!0 (_1!4610 lt!156063) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!156057)) (_2!4610 lt!156063))))))

(declare-fun lt!156066 () (_ BitVec 64))

(assert (=> b!105690 (validate_offset_bits!1 ((_ sign_extend 32) (size!2229 (buf!2603 (_2!4608 lt!156059)))) ((_ sign_extend 32) (currentByte!5102 (_2!4608 lt!156075))) ((_ sign_extend 32) (currentBit!5097 (_2!4608 lt!156075))) lt!156066)))

(declare-fun lt!156073 () Unit!6480)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3932 array!4888 (_ BitVec 64)) Unit!6480)

(assert (=> b!105690 (= lt!156073 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4608 lt!156075) (buf!2603 (_2!4608 lt!156059)) lt!156066))))

(assert (=> b!105690 (= lt!156066 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!156077 () (_ BitVec 64))

(declare-fun lt!156070 () tuple2!8708)

(assert (=> b!105690 (= lt!156057 (bvor lt!156074 (ite (_2!4611 lt!156070) lt!156077 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105690 (= lt!156055 (readNLeastSignificantBitsLoopPure!0 (_1!4610 lt!156058) nBits!396 i!615 lt!156074))))

(assert (=> b!105690 (validate_offset_bits!1 ((_ sign_extend 32) (size!2229 (buf!2603 (_2!4608 lt!156059)))) ((_ sign_extend 32) (currentByte!5102 thiss!1305)) ((_ sign_extend 32) (currentBit!5097 thiss!1305)) lt!156071)))

(declare-fun lt!156062 () Unit!6480)

(assert (=> b!105690 (= lt!156062 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2603 (_2!4608 lt!156059)) lt!156071))))

(assert (=> b!105690 (= lt!156074 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!105690 (= (_2!4611 lt!156070) lt!156072)))

(assert (=> b!105690 (= lt!156070 (readBitPure!0 (_1!4610 lt!156058)))))

(declare-fun reader!0 (BitStream!3932 BitStream!3932) tuple2!8706)

(assert (=> b!105690 (= lt!156063 (reader!0 (_2!4608 lt!156075) (_2!4608 lt!156059)))))

(assert (=> b!105690 (= lt!156058 (reader!0 thiss!1305 (_2!4608 lt!156059)))))

(assert (=> b!105690 e!69223))

(declare-fun res!87042 () Bool)

(assert (=> b!105690 (=> (not res!87042) (not e!69223))))

(assert (=> b!105690 (= res!87042 (= (bitIndex!0 (size!2229 (buf!2603 (_1!4611 lt!156078))) (currentByte!5102 (_1!4611 lt!156078)) (currentBit!5097 (_1!4611 lt!156078))) (bitIndex!0 (size!2229 (buf!2603 (_1!4611 lt!156068))) (currentByte!5102 (_1!4611 lt!156068)) (currentBit!5097 (_1!4611 lt!156068)))))))

(declare-fun lt!156067 () Unit!6480)

(declare-fun lt!156056 () BitStream!3932)

(declare-fun readBitPrefixLemma!0 (BitStream!3932 BitStream!3932) Unit!6480)

(assert (=> b!105690 (= lt!156067 (readBitPrefixLemma!0 lt!156056 (_2!4608 lt!156059)))))

(assert (=> b!105690 (= lt!156068 (readBitPure!0 (BitStream!3933 (buf!2603 (_2!4608 lt!156059)) (currentByte!5102 thiss!1305) (currentBit!5097 thiss!1305))))))

(assert (=> b!105690 (= lt!156078 (readBitPure!0 lt!156056))))

(assert (=> b!105690 (= lt!156056 (BitStream!3933 (buf!2603 (_2!4608 lt!156075)) (currentByte!5102 thiss!1305) (currentBit!5097 thiss!1305)))))

(assert (=> b!105690 e!69222))

(declare-fun res!87045 () Bool)

(assert (=> b!105690 (=> (not res!87045) (not e!69222))))

(assert (=> b!105690 (= res!87045 (isPrefixOf!0 thiss!1305 (_2!4608 lt!156059)))))

(declare-fun lt!156061 () Unit!6480)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3932 BitStream!3932 BitStream!3932) Unit!6480)

(assert (=> b!105690 (= lt!156061 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4608 lt!156075) (_2!4608 lt!156059)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3932 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8702)

(assert (=> b!105690 (= lt!156059 (appendNLeastSignificantBitsLoop!0 (_2!4608 lt!156075) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!105690 e!69214))

(declare-fun res!87048 () Bool)

(assert (=> b!105690 (=> (not res!87048) (not e!69214))))

(assert (=> b!105690 (= res!87048 (= (size!2229 (buf!2603 thiss!1305)) (size!2229 (buf!2603 (_2!4608 lt!156075)))))))

(declare-fun appendBit!0 (BitStream!3932 Bool) tuple2!8702)

(assert (=> b!105690 (= lt!156075 (appendBit!0 thiss!1305 lt!156072))))

(assert (=> b!105690 (= lt!156072 (not (= (bvand v!199 lt!156077) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105690 (= lt!156077 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(assert (= (and start!20902 res!87046) b!105691))

(assert (= (and b!105691 res!87038) b!105692))

(assert (= (and b!105692 res!87037) b!105685))

(assert (= (and b!105685 res!87036) b!105690))

(assert (= (and b!105690 res!87048) b!105695))

(assert (= (and b!105695 res!87041) b!105687))

(assert (= (and b!105687 res!87039) b!105684))

(assert (= (and b!105684 res!87044) b!105694))

(assert (= (and b!105690 res!87045) b!105689))

(assert (= (and b!105689 res!87047) b!105682))

(assert (= (and b!105690 res!87042) b!105693))

(assert (= (and b!105690 (not res!87040)) b!105683))

(assert (= (and b!105683 res!87043) b!105686))

(assert (= start!20902 b!105688))

(declare-fun m!155381 () Bool)

(assert (=> b!105686 m!155381))

(declare-fun m!155383 () Bool)

(assert (=> b!105686 m!155383))

(declare-fun m!155385 () Bool)

(assert (=> b!105686 m!155385))

(declare-fun m!155387 () Bool)

(assert (=> b!105690 m!155387))

(declare-fun m!155389 () Bool)

(assert (=> b!105690 m!155389))

(declare-fun m!155391 () Bool)

(assert (=> b!105690 m!155391))

(declare-fun m!155393 () Bool)

(assert (=> b!105690 m!155393))

(declare-fun m!155395 () Bool)

(assert (=> b!105690 m!155395))

(declare-fun m!155397 () Bool)

(assert (=> b!105690 m!155397))

(declare-fun m!155399 () Bool)

(assert (=> b!105690 m!155399))

(declare-fun m!155401 () Bool)

(assert (=> b!105690 m!155401))

(declare-fun m!155403 () Bool)

(assert (=> b!105690 m!155403))

(declare-fun m!155405 () Bool)

(assert (=> b!105690 m!155405))

(declare-fun m!155407 () Bool)

(assert (=> b!105690 m!155407))

(declare-fun m!155409 () Bool)

(assert (=> b!105690 m!155409))

(declare-fun m!155411 () Bool)

(assert (=> b!105690 m!155411))

(declare-fun m!155413 () Bool)

(assert (=> b!105690 m!155413))

(declare-fun m!155415 () Bool)

(assert (=> b!105690 m!155415))

(declare-fun m!155417 () Bool)

(assert (=> b!105690 m!155417))

(declare-fun m!155419 () Bool)

(assert (=> b!105690 m!155419))

(declare-fun m!155421 () Bool)

(assert (=> b!105690 m!155421))

(declare-fun m!155423 () Bool)

(assert (=> b!105690 m!155423))

(declare-fun m!155425 () Bool)

(assert (=> b!105691 m!155425))

(declare-fun m!155427 () Bool)

(assert (=> b!105695 m!155427))

(assert (=> b!105695 m!155381))

(declare-fun m!155429 () Bool)

(assert (=> b!105692 m!155429))

(declare-fun m!155431 () Bool)

(assert (=> b!105683 m!155431))

(declare-fun m!155433 () Bool)

(assert (=> b!105683 m!155433))

(declare-fun m!155435 () Bool)

(assert (=> b!105683 m!155435))

(assert (=> b!105683 m!155435))

(declare-fun m!155437 () Bool)

(assert (=> b!105683 m!155437))

(declare-fun m!155439 () Bool)

(assert (=> b!105694 m!155439))

(declare-fun m!155441 () Bool)

(assert (=> b!105687 m!155441))

(declare-fun m!155443 () Bool)

(assert (=> b!105682 m!155443))

(declare-fun m!155445 () Bool)

(assert (=> b!105689 m!155445))

(declare-fun m!155447 () Bool)

(assert (=> b!105684 m!155447))

(assert (=> b!105684 m!155447))

(declare-fun m!155449 () Bool)

(assert (=> b!105684 m!155449))

(declare-fun m!155451 () Bool)

(assert (=> start!20902 m!155451))

(declare-fun m!155453 () Bool)

(assert (=> b!105688 m!155453))

(push 1)

(assert (not b!105691))

(assert (not b!105690))

(assert (not start!20902))

(assert (not b!105695))

(assert (not b!105689))

(assert (not b!105686))

(assert (not b!105683))

(assert (not b!105688))

(assert (not b!105684))

(assert (not b!105682))

(assert (not b!105694))

(assert (not b!105692))

(assert (not b!105687))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!33170 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!33170 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2229 (buf!2603 thiss!1305))) ((_ sign_extend 32) (currentByte!5102 thiss!1305)) ((_ sign_extend 32) (currentBit!5097 thiss!1305)) lt!156071) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2229 (buf!2603 thiss!1305))) ((_ sign_extend 32) (currentByte!5102 thiss!1305)) ((_ sign_extend 32) (currentBit!5097 thiss!1305))) lt!156071))))

(declare-fun bs!8105 () Bool)

(assert (= bs!8105 d!33170))

(declare-fun m!155503 () Bool)

(assert (=> bs!8105 m!155503))

(assert (=> b!105691 d!33170))

(declare-fun d!33172 () Bool)

(assert (=> d!33172 (= (invariant!0 (currentBit!5097 thiss!1305) (currentByte!5102 thiss!1305) (size!2229 (buf!2603 (_2!4608 lt!156059)))) (and (bvsge (currentBit!5097 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5097 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5102 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5102 thiss!1305) (size!2229 (buf!2603 (_2!4608 lt!156059)))) (and (= (currentBit!5097 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5102 thiss!1305) (size!2229 (buf!2603 (_2!4608 lt!156059))))))))))

(assert (=> b!105682 d!33172))

(declare-fun d!33174 () Bool)

(assert (=> d!33174 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!105692 d!33174))

(declare-fun d!33176 () Bool)

(declare-fun e!69252 () Bool)

(assert (=> d!33176 e!69252))

(declare-fun res!87095 () Bool)

(assert (=> d!33176 (=> (not res!87095) (not e!69252))))

(declare-fun lt!156188 () (_ BitVec 64))

(declare-fun lt!156192 () (_ BitVec 64))

(declare-fun lt!156191 () (_ BitVec 64))

(assert (=> d!33176 (= res!87095 (= lt!156192 (bvsub lt!156188 lt!156191)))))

(assert (=> d!33176 (or (= (bvand lt!156188 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!156191 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!156188 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!156188 lt!156191) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33176 (= lt!156191 (remainingBits!0 ((_ sign_extend 32) (size!2229 (buf!2603 (_1!4611 lt!156076)))) ((_ sign_extend 32) (currentByte!5102 (_1!4611 lt!156076))) ((_ sign_extend 32) (currentBit!5097 (_1!4611 lt!156076)))))))

(declare-fun lt!156190 () (_ BitVec 64))

(declare-fun lt!156193 () (_ BitVec 64))

(assert (=> d!33176 (= lt!156188 (bvmul lt!156190 lt!156193))))

(assert (=> d!33176 (or (= lt!156190 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!156193 (bvsdiv (bvmul lt!156190 lt!156193) lt!156190)))))

(assert (=> d!33176 (= lt!156193 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33176 (= lt!156190 ((_ sign_extend 32) (size!2229 (buf!2603 (_1!4611 lt!156076)))))))

(assert (=> d!33176 (= lt!156192 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5102 (_1!4611 lt!156076))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5097 (_1!4611 lt!156076)))))))

(assert (=> d!33176 (invariant!0 (currentBit!5097 (_1!4611 lt!156076)) (currentByte!5102 (_1!4611 lt!156076)) (size!2229 (buf!2603 (_1!4611 lt!156076))))))

(assert (=> d!33176 (= (bitIndex!0 (size!2229 (buf!2603 (_1!4611 lt!156076))) (currentByte!5102 (_1!4611 lt!156076)) (currentBit!5097 (_1!4611 lt!156076))) lt!156192)))

(declare-fun b!105743 () Bool)

(declare-fun res!87096 () Bool)

(assert (=> b!105743 (=> (not res!87096) (not e!69252))))

(assert (=> b!105743 (= res!87096 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!156192))))

(declare-fun b!105744 () Bool)

(declare-fun lt!156189 () (_ BitVec 64))

(assert (=> b!105744 (= e!69252 (bvsle lt!156192 (bvmul lt!156189 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105744 (or (= lt!156189 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!156189 #b0000000000000000000000000000000000000000000000000000000000001000) lt!156189)))))

(assert (=> b!105744 (= lt!156189 ((_ sign_extend 32) (size!2229 (buf!2603 (_1!4611 lt!156076)))))))

(assert (= (and d!33176 res!87095) b!105743))

(assert (= (and b!105743 res!87096) b!105744))

(declare-fun m!155529 () Bool)

(assert (=> d!33176 m!155529))

(declare-fun m!155531 () Bool)

(assert (=> d!33176 m!155531))

(assert (=> b!105694 d!33176))

(declare-fun d!33192 () Bool)

(assert (=> d!33192 (= (invariant!0 (currentBit!5097 (_2!4608 lt!156075)) (currentByte!5102 (_2!4608 lt!156075)) (size!2229 (buf!2603 (_2!4608 lt!156075)))) (and (bvsge (currentBit!5097 (_2!4608 lt!156075)) #b00000000000000000000000000000000) (bvslt (currentBit!5097 (_2!4608 lt!156075)) #b00000000000000000000000000001000) (bvsge (currentByte!5102 (_2!4608 lt!156075)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5102 (_2!4608 lt!156075)) (size!2229 (buf!2603 (_2!4608 lt!156075)))) (and (= (currentBit!5097 (_2!4608 lt!156075)) #b00000000000000000000000000000000) (= (currentByte!5102 (_2!4608 lt!156075)) (size!2229 (buf!2603 (_2!4608 lt!156075))))))))))

(assert (=> b!105683 d!33192))

(declare-fun d!33194 () Bool)

(declare-fun lt!156206 () tuple2!8704)

(declare-fun lt!156209 () tuple2!8704)

(assert (=> d!33194 (and (= (_2!4609 lt!156206) (_2!4609 lt!156209)) (= (_1!4609 lt!156206) (_1!4609 lt!156209)))))

(declare-fun lt!156211 () Unit!6480)

(declare-fun lt!156210 () Bool)

(declare-fun lt!156207 () BitStream!3932)

(declare-fun lt!156208 () (_ BitVec 64))

(declare-fun choose!45 (BitStream!3932 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!8704 tuple2!8704 BitStream!3932 (_ BitVec 64) Bool BitStream!3932 (_ BitVec 64) tuple2!8704 tuple2!8704 BitStream!3932 (_ BitVec 64)) Unit!6480)

(assert (=> d!33194 (= lt!156211 (choose!45 (_1!4610 lt!156058) nBits!396 i!615 lt!156074 lt!156206 (tuple2!8705 (_1!4609 lt!156206) (_2!4609 lt!156206)) (_1!4609 lt!156206) (_2!4609 lt!156206) lt!156210 lt!156207 lt!156208 lt!156209 (tuple2!8705 (_1!4609 lt!156209) (_2!4609 lt!156209)) (_1!4609 lt!156209) (_2!4609 lt!156209)))))

(assert (=> d!33194 (= lt!156209 (readNLeastSignificantBitsLoopPure!0 lt!156207 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!156208))))

(assert (=> d!33194 (= lt!156208 (bvor lt!156074 (ite lt!156210 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33194 (= lt!156207 (withMovedBitIndex!0 (_1!4610 lt!156058) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!33194 (= lt!156210 (_2!4611 (readBitPure!0 (_1!4610 lt!156058))))))

(assert (=> d!33194 (= lt!156206 (readNLeastSignificantBitsLoopPure!0 (_1!4610 lt!156058) nBits!396 i!615 lt!156074))))

(assert (=> d!33194 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4610 lt!156058) nBits!396 i!615 lt!156074) lt!156211)))

(declare-fun bs!8111 () Bool)

(assert (= bs!8111 d!33194))

(assert (=> bs!8111 m!155435))

(assert (=> bs!8111 m!155405))

(declare-fun m!155533 () Bool)

(assert (=> bs!8111 m!155533))

(assert (=> bs!8111 m!155411))

(declare-fun m!155535 () Bool)

(assert (=> bs!8111 m!155535))

(assert (=> b!105683 d!33194))

(declare-datatypes ((tuple2!8714 0))(
  ( (tuple2!8715 (_1!4614 (_ BitVec 64)) (_2!4614 BitStream!3932)) )
))
(declare-fun lt!156214 () tuple2!8714)

(declare-fun d!33196 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3932 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8714)

(assert (=> d!33196 (= lt!156214 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4610 lt!156058) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!156057))))

(assert (=> d!33196 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4610 lt!156058) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!156057) (tuple2!8705 (_2!4614 lt!156214) (_1!4614 lt!156214)))))

(declare-fun bs!8112 () Bool)

(assert (= bs!8112 d!33196))

(assert (=> bs!8112 m!155435))

(declare-fun m!155537 () Bool)

(assert (=> bs!8112 m!155537))

(assert (=> b!105683 d!33196))

(declare-fun d!33198 () Bool)

(declare-fun e!69255 () Bool)

(assert (=> d!33198 e!69255))

(declare-fun res!87099 () Bool)

(assert (=> d!33198 (=> (not res!87099) (not e!69255))))

(declare-fun lt!156220 () (_ BitVec 64))

(declare-fun lt!156219 () BitStream!3932)

(assert (=> d!33198 (= res!87099 (= (bvadd lt!156220 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2229 (buf!2603 lt!156219)) (currentByte!5102 lt!156219) (currentBit!5097 lt!156219))))))

(assert (=> d!33198 (or (not (= (bvand lt!156220 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!156220 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!156220 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33198 (= lt!156220 (bitIndex!0 (size!2229 (buf!2603 (_1!4610 lt!156058))) (currentByte!5102 (_1!4610 lt!156058)) (currentBit!5097 (_1!4610 lt!156058))))))

(declare-fun moveBitIndex!0 (BitStream!3932 (_ BitVec 64)) tuple2!8702)

(assert (=> d!33198 (= lt!156219 (_2!4608 (moveBitIndex!0 (_1!4610 lt!156058) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!3932 (_ BitVec 64)) Bool)

(assert (=> d!33198 (moveBitIndexPrecond!0 (_1!4610 lt!156058) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!33198 (= (withMovedBitIndex!0 (_1!4610 lt!156058) #b0000000000000000000000000000000000000000000000000000000000000001) lt!156219)))

(declare-fun b!105747 () Bool)

(assert (=> b!105747 (= e!69255 (= (size!2229 (buf!2603 (_1!4610 lt!156058))) (size!2229 (buf!2603 lt!156219))))))

(assert (= (and d!33198 res!87099) b!105747))

(declare-fun m!155539 () Bool)

(assert (=> d!33198 m!155539))

(declare-fun m!155541 () Bool)

(assert (=> d!33198 m!155541))

(declare-fun m!155543 () Bool)

(assert (=> d!33198 m!155543))

(declare-fun m!155545 () Bool)

(assert (=> d!33198 m!155545))

(assert (=> b!105683 d!33198))

(declare-fun d!33200 () Bool)

(declare-fun e!69256 () Bool)

(assert (=> d!33200 e!69256))

(declare-fun res!87100 () Bool)

(assert (=> d!33200 (=> (not res!87100) (not e!69256))))

(declare-fun lt!156225 () (_ BitVec 64))

(declare-fun lt!156221 () (_ BitVec 64))

(declare-fun lt!156224 () (_ BitVec 64))

(assert (=> d!33200 (= res!87100 (= lt!156225 (bvsub lt!156221 lt!156224)))))

(assert (=> d!33200 (or (= (bvand lt!156221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!156224 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!156221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!156221 lt!156224) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33200 (= lt!156224 (remainingBits!0 ((_ sign_extend 32) (size!2229 (buf!2603 (_2!4608 lt!156075)))) ((_ sign_extend 32) (currentByte!5102 (_2!4608 lt!156075))) ((_ sign_extend 32) (currentBit!5097 (_2!4608 lt!156075)))))))

(declare-fun lt!156223 () (_ BitVec 64))

(declare-fun lt!156226 () (_ BitVec 64))

(assert (=> d!33200 (= lt!156221 (bvmul lt!156223 lt!156226))))

(assert (=> d!33200 (or (= lt!156223 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!156226 (bvsdiv (bvmul lt!156223 lt!156226) lt!156223)))))

(assert (=> d!33200 (= lt!156226 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33200 (= lt!156223 ((_ sign_extend 32) (size!2229 (buf!2603 (_2!4608 lt!156075)))))))

(assert (=> d!33200 (= lt!156225 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5102 (_2!4608 lt!156075))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5097 (_2!4608 lt!156075)))))))

(assert (=> d!33200 (invariant!0 (currentBit!5097 (_2!4608 lt!156075)) (currentByte!5102 (_2!4608 lt!156075)) (size!2229 (buf!2603 (_2!4608 lt!156075))))))

(assert (=> d!33200 (= (bitIndex!0 (size!2229 (buf!2603 (_2!4608 lt!156075))) (currentByte!5102 (_2!4608 lt!156075)) (currentBit!5097 (_2!4608 lt!156075))) lt!156225)))

(declare-fun b!105748 () Bool)

(declare-fun res!87101 () Bool)

(assert (=> b!105748 (=> (not res!87101) (not e!69256))))

(assert (=> b!105748 (= res!87101 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!156225))))

(declare-fun b!105749 () Bool)

(declare-fun lt!156222 () (_ BitVec 64))

(assert (=> b!105749 (= e!69256 (bvsle lt!156225 (bvmul lt!156222 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105749 (or (= lt!156222 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!156222 #b0000000000000000000000000000000000000000000000000000000000001000) lt!156222)))))

(assert (=> b!105749 (= lt!156222 ((_ sign_extend 32) (size!2229 (buf!2603 (_2!4608 lt!156075)))))))

(assert (= (and d!33200 res!87100) b!105748))

(assert (= (and b!105748 res!87101) b!105749))

(declare-fun m!155547 () Bool)

(assert (=> d!33200 m!155547))

(assert (=> d!33200 m!155431))

(assert (=> b!105695 d!33200))

(declare-fun d!33202 () Bool)

(declare-fun e!69257 () Bool)

(assert (=> d!33202 e!69257))

(declare-fun res!87102 () Bool)

(assert (=> d!33202 (=> (not res!87102) (not e!69257))))

(declare-fun lt!156230 () (_ BitVec 64))

(declare-fun lt!156231 () (_ BitVec 64))

(declare-fun lt!156227 () (_ BitVec 64))

(assert (=> d!33202 (= res!87102 (= lt!156231 (bvsub lt!156227 lt!156230)))))

(assert (=> d!33202 (or (= (bvand lt!156227 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!156230 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!156227 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!156227 lt!156230) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33202 (= lt!156230 (remainingBits!0 ((_ sign_extend 32) (size!2229 (buf!2603 thiss!1305))) ((_ sign_extend 32) (currentByte!5102 thiss!1305)) ((_ sign_extend 32) (currentBit!5097 thiss!1305))))))

(declare-fun lt!156229 () (_ BitVec 64))

(declare-fun lt!156232 () (_ BitVec 64))

(assert (=> d!33202 (= lt!156227 (bvmul lt!156229 lt!156232))))

(assert (=> d!33202 (or (= lt!156229 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!156232 (bvsdiv (bvmul lt!156229 lt!156232) lt!156229)))))

(assert (=> d!33202 (= lt!156232 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33202 (= lt!156229 ((_ sign_extend 32) (size!2229 (buf!2603 thiss!1305))))))

(assert (=> d!33202 (= lt!156231 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5102 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5097 thiss!1305))))))

(assert (=> d!33202 (invariant!0 (currentBit!5097 thiss!1305) (currentByte!5102 thiss!1305) (size!2229 (buf!2603 thiss!1305)))))

(assert (=> d!33202 (= (bitIndex!0 (size!2229 (buf!2603 thiss!1305)) (currentByte!5102 thiss!1305) (currentBit!5097 thiss!1305)) lt!156231)))

(declare-fun b!105750 () Bool)

(declare-fun res!87103 () Bool)

(assert (=> b!105750 (=> (not res!87103) (not e!69257))))

(assert (=> b!105750 (= res!87103 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!156231))))

(declare-fun b!105751 () Bool)

(declare-fun lt!156228 () (_ BitVec 64))

(assert (=> b!105751 (= e!69257 (bvsle lt!156231 (bvmul lt!156228 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105751 (or (= lt!156228 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!156228 #b0000000000000000000000000000000000000000000000000000000000001000) lt!156228)))))

(assert (=> b!105751 (= lt!156228 ((_ sign_extend 32) (size!2229 (buf!2603 thiss!1305))))))

(assert (= (and d!33202 res!87102) b!105750))

(assert (= (and b!105750 res!87103) b!105751))

(assert (=> d!33202 m!155503))

(declare-fun m!155549 () Bool)

(assert (=> d!33202 m!155549))

(assert (=> b!105695 d!33202))

(declare-fun d!33204 () Bool)

(declare-datatypes ((tuple2!8716 0))(
  ( (tuple2!8717 (_1!4615 Bool) (_2!4615 BitStream!3932)) )
))
(declare-fun lt!156235 () tuple2!8716)

(declare-fun readBit!0 (BitStream!3932) tuple2!8716)

(assert (=> d!33204 (= lt!156235 (readBit!0 (readerFrom!0 (_2!4608 lt!156075) (currentBit!5097 thiss!1305) (currentByte!5102 thiss!1305))))))

(assert (=> d!33204 (= (readBitPure!0 (readerFrom!0 (_2!4608 lt!156075) (currentBit!5097 thiss!1305) (currentByte!5102 thiss!1305))) (tuple2!8709 (_2!4615 lt!156235) (_1!4615 lt!156235)))))

(declare-fun bs!8113 () Bool)

(assert (= bs!8113 d!33204))

(assert (=> bs!8113 m!155447))

(declare-fun m!155551 () Bool)

(assert (=> bs!8113 m!155551))

(assert (=> b!105684 d!33204))

(declare-fun d!33206 () Bool)

(declare-fun e!69260 () Bool)

(assert (=> d!33206 e!69260))

(declare-fun res!87107 () Bool)

(assert (=> d!33206 (=> (not res!87107) (not e!69260))))

(assert (=> d!33206 (= res!87107 (invariant!0 (currentBit!5097 (_2!4608 lt!156075)) (currentByte!5102 (_2!4608 lt!156075)) (size!2229 (buf!2603 (_2!4608 lt!156075)))))))

(assert (=> d!33206 (= (readerFrom!0 (_2!4608 lt!156075) (currentBit!5097 thiss!1305) (currentByte!5102 thiss!1305)) (BitStream!3933 (buf!2603 (_2!4608 lt!156075)) (currentByte!5102 thiss!1305) (currentBit!5097 thiss!1305)))))

(declare-fun b!105754 () Bool)

(assert (=> b!105754 (= e!69260 (invariant!0 (currentBit!5097 thiss!1305) (currentByte!5102 thiss!1305) (size!2229 (buf!2603 (_2!4608 lt!156075)))))))

(assert (= (and d!33206 res!87107) b!105754))

(assert (=> d!33206 m!155431))

(assert (=> b!105754 m!155445))

(assert (=> b!105684 d!33206))

(declare-fun d!33208 () Bool)

(declare-fun e!69261 () Bool)

(assert (=> d!33208 e!69261))

(declare-fun res!87108 () Bool)

(assert (=> d!33208 (=> (not res!87108) (not e!69261))))

(declare-fun lt!156236 () BitStream!3932)

(declare-fun lt!156237 () (_ BitVec 64))

(assert (=> d!33208 (= res!87108 (= (bvadd lt!156237 (bvsub (bitIndex!0 (size!2229 (buf!2603 thiss!1305)) (currentByte!5102 thiss!1305) (currentBit!5097 thiss!1305)) (bitIndex!0 (size!2229 (buf!2603 (_2!4608 lt!156059))) (currentByte!5102 (_2!4608 lt!156059)) (currentBit!5097 (_2!4608 lt!156059))))) (bitIndex!0 (size!2229 (buf!2603 lt!156236)) (currentByte!5102 lt!156236) (currentBit!5097 lt!156236))))))

(assert (=> d!33208 (or (not (= (bvand lt!156237 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2229 (buf!2603 thiss!1305)) (currentByte!5102 thiss!1305) (currentBit!5097 thiss!1305)) (bitIndex!0 (size!2229 (buf!2603 (_2!4608 lt!156059))) (currentByte!5102 (_2!4608 lt!156059)) (currentBit!5097 (_2!4608 lt!156059)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!156237 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!156237 (bvsub (bitIndex!0 (size!2229 (buf!2603 thiss!1305)) (currentByte!5102 thiss!1305) (currentBit!5097 thiss!1305)) (bitIndex!0 (size!2229 (buf!2603 (_2!4608 lt!156059))) (currentByte!5102 (_2!4608 lt!156059)) (currentBit!5097 (_2!4608 lt!156059))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33208 (= lt!156237 (bitIndex!0 (size!2229 (buf!2603 (_2!4610 lt!156058))) (currentByte!5102 (_2!4610 lt!156058)) (currentBit!5097 (_2!4610 lt!156058))))))

(assert (=> d!33208 (= lt!156236 (_2!4608 (moveBitIndex!0 (_2!4610 lt!156058) (bvsub (bitIndex!0 (size!2229 (buf!2603 thiss!1305)) (currentByte!5102 thiss!1305) (currentBit!5097 thiss!1305)) (bitIndex!0 (size!2229 (buf!2603 (_2!4608 lt!156059))) (currentByte!5102 (_2!4608 lt!156059)) (currentBit!5097 (_2!4608 lt!156059)))))))))

(assert (=> d!33208 (moveBitIndexPrecond!0 (_2!4610 lt!156058) (bvsub (bitIndex!0 (size!2229 (buf!2603 thiss!1305)) (currentByte!5102 thiss!1305) (currentBit!5097 thiss!1305)) (bitIndex!0 (size!2229 (buf!2603 (_2!4608 lt!156059))) (currentByte!5102 (_2!4608 lt!156059)) (currentBit!5097 (_2!4608 lt!156059)))))))

(assert (=> d!33208 (= (withMovedBitIndex!0 (_2!4610 lt!156058) (bvsub (bitIndex!0 (size!2229 (buf!2603 thiss!1305)) (currentByte!5102 thiss!1305) (currentBit!5097 thiss!1305)) (bitIndex!0 (size!2229 (buf!2603 (_2!4608 lt!156059))) (currentByte!5102 (_2!4608 lt!156059)) (currentBit!5097 (_2!4608 lt!156059))))) lt!156236)))

(declare-fun b!105755 () Bool)

(assert (=> b!105755 (= e!69261 (= (size!2229 (buf!2603 (_2!4610 lt!156058))) (size!2229 (buf!2603 lt!156236))))))

(assert (= (and d!33208 res!87108) b!105755))

(declare-fun m!155553 () Bool)

(assert (=> d!33208 m!155553))

(declare-fun m!155555 () Bool)

(assert (=> d!33208 m!155555))

(declare-fun m!155557 () Bool)

(assert (=> d!33208 m!155557))

(declare-fun m!155559 () Bool)

(assert (=> d!33208 m!155559))

(assert (=> b!105686 d!33208))

(assert (=> b!105686 d!33202))

(declare-fun d!33210 () Bool)

(declare-fun e!69262 () Bool)

(assert (=> d!33210 e!69262))

(declare-fun res!87109 () Bool)

(assert (=> d!33210 (=> (not res!87109) (not e!69262))))

(declare-fun lt!156241 () (_ BitVec 64))

(declare-fun lt!156242 () (_ BitVec 64))

(declare-fun lt!156238 () (_ BitVec 64))

(assert (=> d!33210 (= res!87109 (= lt!156242 (bvsub lt!156238 lt!156241)))))

(assert (=> d!33210 (or (= (bvand lt!156238 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!156241 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!156238 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!156238 lt!156241) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33210 (= lt!156241 (remainingBits!0 ((_ sign_extend 32) (size!2229 (buf!2603 (_2!4608 lt!156059)))) ((_ sign_extend 32) (currentByte!5102 (_2!4608 lt!156059))) ((_ sign_extend 32) (currentBit!5097 (_2!4608 lt!156059)))))))

(declare-fun lt!156240 () (_ BitVec 64))

(declare-fun lt!156243 () (_ BitVec 64))

(assert (=> d!33210 (= lt!156238 (bvmul lt!156240 lt!156243))))

(assert (=> d!33210 (or (= lt!156240 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!156243 (bvsdiv (bvmul lt!156240 lt!156243) lt!156240)))))

(assert (=> d!33210 (= lt!156243 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33210 (= lt!156240 ((_ sign_extend 32) (size!2229 (buf!2603 (_2!4608 lt!156059)))))))

(assert (=> d!33210 (= lt!156242 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5102 (_2!4608 lt!156059))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5097 (_2!4608 lt!156059)))))))

(assert (=> d!33210 (invariant!0 (currentBit!5097 (_2!4608 lt!156059)) (currentByte!5102 (_2!4608 lt!156059)) (size!2229 (buf!2603 (_2!4608 lt!156059))))))

(assert (=> d!33210 (= (bitIndex!0 (size!2229 (buf!2603 (_2!4608 lt!156059))) (currentByte!5102 (_2!4608 lt!156059)) (currentBit!5097 (_2!4608 lt!156059))) lt!156242)))

(declare-fun b!105756 () Bool)

(declare-fun res!87110 () Bool)

(assert (=> b!105756 (=> (not res!87110) (not e!69262))))

(assert (=> b!105756 (= res!87110 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!156242))))

(declare-fun b!105757 () Bool)

(declare-fun lt!156239 () (_ BitVec 64))

(assert (=> b!105757 (= e!69262 (bvsle lt!156242 (bvmul lt!156239 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105757 (or (= lt!156239 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!156239 #b0000000000000000000000000000000000000000000000000000000000001000) lt!156239)))))

(assert (=> b!105757 (= lt!156239 ((_ sign_extend 32) (size!2229 (buf!2603 (_2!4608 lt!156059)))))))

(assert (= (and d!33210 res!87109) b!105756))

(assert (= (and b!105756 res!87110) b!105757))

(declare-fun m!155561 () Bool)

(assert (=> d!33210 m!155561))

(declare-fun m!155563 () Bool)

(assert (=> d!33210 m!155563))

(assert (=> b!105686 d!33210))

(declare-fun d!33212 () Bool)

(declare-fun res!87117 () Bool)

(declare-fun e!69267 () Bool)

(assert (=> d!33212 (=> (not res!87117) (not e!69267))))

(assert (=> d!33212 (= res!87117 (= (size!2229 (buf!2603 thiss!1305)) (size!2229 (buf!2603 (_2!4608 lt!156075)))))))

(assert (=> d!33212 (= (isPrefixOf!0 thiss!1305 (_2!4608 lt!156075)) e!69267)))

(declare-fun b!105764 () Bool)

(declare-fun res!87118 () Bool)

(assert (=> b!105764 (=> (not res!87118) (not e!69267))))

(assert (=> b!105764 (= res!87118 (bvsle (bitIndex!0 (size!2229 (buf!2603 thiss!1305)) (currentByte!5102 thiss!1305) (currentBit!5097 thiss!1305)) (bitIndex!0 (size!2229 (buf!2603 (_2!4608 lt!156075))) (currentByte!5102 (_2!4608 lt!156075)) (currentBit!5097 (_2!4608 lt!156075)))))))

(declare-fun b!105765 () Bool)

(declare-fun e!69268 () Bool)

(assert (=> b!105765 (= e!69267 e!69268)))

(declare-fun res!87119 () Bool)

(assert (=> b!105765 (=> res!87119 e!69268)))

(assert (=> b!105765 (= res!87119 (= (size!2229 (buf!2603 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!105766 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4888 array!4888 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!105766 (= e!69268 (arrayBitRangesEq!0 (buf!2603 thiss!1305) (buf!2603 (_2!4608 lt!156075)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2229 (buf!2603 thiss!1305)) (currentByte!5102 thiss!1305) (currentBit!5097 thiss!1305))))))

(assert (= (and d!33212 res!87117) b!105764))

(assert (= (and b!105764 res!87118) b!105765))

(assert (= (and b!105765 (not res!87119)) b!105766))

(assert (=> b!105764 m!155381))

(assert (=> b!105764 m!155427))

(assert (=> b!105766 m!155381))

(assert (=> b!105766 m!155381))

(declare-fun m!155565 () Bool)

(assert (=> b!105766 m!155565))

(assert (=> b!105687 d!33212))

(declare-fun d!33214 () Bool)

(assert (=> d!33214 (= (invariant!0 (currentBit!5097 thiss!1305) (currentByte!5102 thiss!1305) (size!2229 (buf!2603 (_2!4608 lt!156075)))) (and (bvsge (currentBit!5097 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5097 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5102 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5102 thiss!1305) (size!2229 (buf!2603 (_2!4608 lt!156075)))) (and (= (currentBit!5097 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5102 thiss!1305) (size!2229 (buf!2603 (_2!4608 lt!156075))))))))))

(assert (=> b!105689 d!33214))

(declare-fun d!33216 () Bool)

(assert (=> d!33216 (= (array_inv!2031 (buf!2603 thiss!1305)) (bvsge (size!2229 (buf!2603 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!105688 d!33216))

(declare-fun d!33218 () Bool)

(assert (=> d!33218 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!105690 d!33218))

(declare-fun d!33220 () Bool)

(declare-fun e!69271 () Bool)

(assert (=> d!33220 e!69271))

(declare-fun res!87122 () Bool)

(assert (=> d!33220 (=> (not res!87122) (not e!69271))))

(declare-fun lt!156255 () tuple2!8708)

(declare-fun lt!156252 () tuple2!8708)

(assert (=> d!33220 (= res!87122 (= (bitIndex!0 (size!2229 (buf!2603 (_1!4611 lt!156255))) (currentByte!5102 (_1!4611 lt!156255)) (currentBit!5097 (_1!4611 lt!156255))) (bitIndex!0 (size!2229 (buf!2603 (_1!4611 lt!156252))) (currentByte!5102 (_1!4611 lt!156252)) (currentBit!5097 (_1!4611 lt!156252)))))))

(declare-fun lt!156254 () Unit!6480)

(declare-fun lt!156253 () BitStream!3932)

(declare-fun choose!50 (BitStream!3932 BitStream!3932 BitStream!3932 tuple2!8708 tuple2!8708 BitStream!3932 Bool tuple2!8708 tuple2!8708 BitStream!3932 Bool) Unit!6480)

(assert (=> d!33220 (= lt!156254 (choose!50 lt!156056 (_2!4608 lt!156059) lt!156253 lt!156255 (tuple2!8709 (_1!4611 lt!156255) (_2!4611 lt!156255)) (_1!4611 lt!156255) (_2!4611 lt!156255) lt!156252 (tuple2!8709 (_1!4611 lt!156252) (_2!4611 lt!156252)) (_1!4611 lt!156252) (_2!4611 lt!156252)))))

(assert (=> d!33220 (= lt!156252 (readBitPure!0 lt!156253))))

(assert (=> d!33220 (= lt!156255 (readBitPure!0 lt!156056))))

(assert (=> d!33220 (= lt!156253 (BitStream!3933 (buf!2603 (_2!4608 lt!156059)) (currentByte!5102 lt!156056) (currentBit!5097 lt!156056)))))

(assert (=> d!33220 (invariant!0 (currentBit!5097 lt!156056) (currentByte!5102 lt!156056) (size!2229 (buf!2603 (_2!4608 lt!156059))))))

(assert (=> d!33220 (= (readBitPrefixLemma!0 lt!156056 (_2!4608 lt!156059)) lt!156254)))

(declare-fun b!105769 () Bool)

(assert (=> b!105769 (= e!69271 (= (_2!4611 lt!156255) (_2!4611 lt!156252)))))

(assert (= (and d!33220 res!87122) b!105769))

(declare-fun m!155567 () Bool)

(assert (=> d!33220 m!155567))

(declare-fun m!155569 () Bool)

(assert (=> d!33220 m!155569))

(declare-fun m!155571 () Bool)

(assert (=> d!33220 m!155571))

(assert (=> d!33220 m!155395))

(declare-fun m!155573 () Bool)

(assert (=> d!33220 m!155573))

(declare-fun m!155575 () Bool)

(assert (=> d!33220 m!155575))

(assert (=> b!105690 d!33220))

(declare-fun d!33222 () Bool)

(declare-fun lt!156256 () tuple2!8714)

(assert (=> d!33222 (= lt!156256 (readNLeastSignificantBitsLoop!0 (_1!4610 lt!156058) nBits!396 i!615 lt!156074))))

(assert (=> d!33222 (= (readNLeastSignificantBitsLoopPure!0 (_1!4610 lt!156058) nBits!396 i!615 lt!156074) (tuple2!8705 (_2!4614 lt!156256) (_1!4614 lt!156256)))))

(declare-fun bs!8114 () Bool)

(assert (= bs!8114 d!33222))

(declare-fun m!155577 () Bool)

(assert (=> bs!8114 m!155577))

(assert (=> b!105690 d!33222))

(declare-fun d!33224 () Bool)

(declare-fun e!69272 () Bool)

(assert (=> d!33224 e!69272))

(declare-fun res!87123 () Bool)

(assert (=> d!33224 (=> (not res!87123) (not e!69272))))

(declare-fun lt!156260 () (_ BitVec 64))

(declare-fun lt!156261 () (_ BitVec 64))

(declare-fun lt!156257 () (_ BitVec 64))

(assert (=> d!33224 (= res!87123 (= lt!156261 (bvsub lt!156257 lt!156260)))))

(assert (=> d!33224 (or (= (bvand lt!156257 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!156260 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!156257 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!156257 lt!156260) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33224 (= lt!156260 (remainingBits!0 ((_ sign_extend 32) (size!2229 (buf!2603 (_1!4611 lt!156068)))) ((_ sign_extend 32) (currentByte!5102 (_1!4611 lt!156068))) ((_ sign_extend 32) (currentBit!5097 (_1!4611 lt!156068)))))))

(declare-fun lt!156259 () (_ BitVec 64))

(declare-fun lt!156262 () (_ BitVec 64))

(assert (=> d!33224 (= lt!156257 (bvmul lt!156259 lt!156262))))

(assert (=> d!33224 (or (= lt!156259 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!156262 (bvsdiv (bvmul lt!156259 lt!156262) lt!156259)))))

(assert (=> d!33224 (= lt!156262 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33224 (= lt!156259 ((_ sign_extend 32) (size!2229 (buf!2603 (_1!4611 lt!156068)))))))

(assert (=> d!33224 (= lt!156261 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5102 (_1!4611 lt!156068))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5097 (_1!4611 lt!156068)))))))

(assert (=> d!33224 (invariant!0 (currentBit!5097 (_1!4611 lt!156068)) (currentByte!5102 (_1!4611 lt!156068)) (size!2229 (buf!2603 (_1!4611 lt!156068))))))

(assert (=> d!33224 (= (bitIndex!0 (size!2229 (buf!2603 (_1!4611 lt!156068))) (currentByte!5102 (_1!4611 lt!156068)) (currentBit!5097 (_1!4611 lt!156068))) lt!156261)))

(declare-fun b!105770 () Bool)

(declare-fun res!87124 () Bool)

(assert (=> b!105770 (=> (not res!87124) (not e!69272))))

(assert (=> b!105770 (= res!87124 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!156261))))

(declare-fun b!105771 () Bool)

(declare-fun lt!156258 () (_ BitVec 64))

(assert (=> b!105771 (= e!69272 (bvsle lt!156261 (bvmul lt!156258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105771 (or (= lt!156258 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!156258 #b0000000000000000000000000000000000000000000000000000000000001000) lt!156258)))))

(assert (=> b!105771 (= lt!156258 ((_ sign_extend 32) (size!2229 (buf!2603 (_1!4611 lt!156068)))))))

(assert (= (and d!33224 res!87123) b!105770))

(assert (= (and b!105770 res!87124) b!105771))

(declare-fun m!155579 () Bool)

(assert (=> d!33224 m!155579))

(declare-fun m!155581 () Bool)

(assert (=> d!33224 m!155581))

(assert (=> b!105690 d!33224))

(declare-fun d!33226 () Bool)

(declare-fun lt!156263 () tuple2!8716)

(assert (=> d!33226 (= lt!156263 (readBit!0 lt!156056))))

(assert (=> d!33226 (= (readBitPure!0 lt!156056) (tuple2!8709 (_2!4615 lt!156263) (_1!4615 lt!156263)))))

(declare-fun bs!8115 () Bool)

(assert (= bs!8115 d!33226))

(declare-fun m!155583 () Bool)

(assert (=> bs!8115 m!155583))

(assert (=> b!105690 d!33226))

(declare-fun d!33228 () Bool)

(assert (=> d!33228 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2229 (buf!2603 (_2!4608 lt!156059)))) ((_ sign_extend 32) (currentByte!5102 thiss!1305)) ((_ sign_extend 32) (currentBit!5097 thiss!1305)) lt!156071) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2229 (buf!2603 (_2!4608 lt!156059)))) ((_ sign_extend 32) (currentByte!5102 thiss!1305)) ((_ sign_extend 32) (currentBit!5097 thiss!1305))) lt!156071))))

(declare-fun bs!8116 () Bool)

(assert (= bs!8116 d!33228))

(declare-fun m!155585 () Bool)

(assert (=> bs!8116 m!155585))

(assert (=> b!105690 d!33228))

(declare-fun b!105859 () Bool)

(declare-fun res!87184 () Bool)

(declare-fun lt!156605 () tuple2!8702)

(assert (=> b!105859 (= res!87184 (isPrefixOf!0 (_2!4608 lt!156075) (_2!4608 lt!156605)))))

(declare-fun e!69317 () Bool)

(assert (=> b!105859 (=> (not res!87184) (not e!69317))))

(declare-fun b!105860 () Bool)

(declare-fun e!69323 () (_ BitVec 64))

(assert (=> b!105860 (= e!69323 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!105861 () Bool)

(declare-fun res!87187 () Bool)

(declare-fun e!69318 () Bool)

(assert (=> b!105861 (=> (not res!87187) (not e!69318))))

(declare-fun lt!156592 () tuple2!8702)

(declare-fun lt!156590 () (_ BitVec 64))

(declare-fun lt!156604 () (_ BitVec 64))

(assert (=> b!105861 (= res!87187 (= (bitIndex!0 (size!2229 (buf!2603 (_2!4608 lt!156592))) (currentByte!5102 (_2!4608 lt!156592)) (currentBit!5097 (_2!4608 lt!156592))) (bvadd lt!156604 lt!156590)))))

(assert (=> b!105861 (or (not (= (bvand lt!156604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!156590 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!156604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!156604 lt!156590) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105861 (= lt!156590 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!105861 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!105861 (= lt!156604 (bitIndex!0 (size!2229 (buf!2603 (_2!4608 lt!156075))) (currentByte!5102 (_2!4608 lt!156075)) (currentBit!5097 (_2!4608 lt!156075))))))

(declare-fun d!33230 () Bool)

(assert (=> d!33230 e!69318))

(declare-fun res!87186 () Bool)

(assert (=> d!33230 (=> (not res!87186) (not e!69318))))

(assert (=> d!33230 (= res!87186 (= (size!2229 (buf!2603 (_2!4608 lt!156075))) (size!2229 (buf!2603 (_2!4608 lt!156592)))))))

(declare-fun e!69320 () tuple2!8702)

(assert (=> d!33230 (= lt!156592 e!69320)))

(declare-fun c!6529 () Bool)

(assert (=> d!33230 (= c!6529 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!33230 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!33230 (= (appendNLeastSignificantBitsLoop!0 (_2!4608 lt!156075) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!156592)))

(declare-fun b!105862 () Bool)

(declare-fun lt!156612 () Unit!6480)

(assert (=> b!105862 (= e!69320 (tuple2!8703 lt!156612 (_2!4608 lt!156075)))))

(declare-fun lt!156593 () BitStream!3932)

(assert (=> b!105862 (= lt!156593 (_2!4608 lt!156075))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3932) Unit!6480)

(assert (=> b!105862 (= lt!156612 (lemmaIsPrefixRefl!0 lt!156593))))

(declare-fun call!1329 () Bool)

(assert (=> b!105862 call!1329))

(declare-fun b!105863 () Bool)

(declare-fun e!69322 () Bool)

(declare-fun lt!156620 () tuple2!8708)

(assert (=> b!105863 (= e!69322 (= (bitIndex!0 (size!2229 (buf!2603 (_1!4611 lt!156620))) (currentByte!5102 (_1!4611 lt!156620)) (currentBit!5097 (_1!4611 lt!156620))) (bitIndex!0 (size!2229 (buf!2603 (_2!4608 lt!156605))) (currentByte!5102 (_2!4608 lt!156605)) (currentBit!5097 (_2!4608 lt!156605)))))))

(declare-fun b!105864 () Bool)

(declare-fun res!87190 () Bool)

(assert (=> b!105864 (= res!87190 (= (bitIndex!0 (size!2229 (buf!2603 (_2!4608 lt!156605))) (currentByte!5102 (_2!4608 lt!156605)) (currentBit!5097 (_2!4608 lt!156605))) (bvadd (bitIndex!0 (size!2229 (buf!2603 (_2!4608 lt!156075))) (currentByte!5102 (_2!4608 lt!156075)) (currentBit!5097 (_2!4608 lt!156075))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!105864 (=> (not res!87190) (not e!69317))))

(declare-fun b!105865 () Bool)

(declare-fun lt!156596 () tuple2!8702)

(declare-fun Unit!6490 () Unit!6480)

(assert (=> b!105865 (= e!69320 (tuple2!8703 Unit!6490 (_2!4608 lt!156596)))))

(declare-fun lt!156610 () Bool)

(assert (=> b!105865 (= lt!156610 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105865 (= lt!156605 (appendBit!0 (_2!4608 lt!156075) lt!156610))))

(declare-fun res!87185 () Bool)

(assert (=> b!105865 (= res!87185 (= (size!2229 (buf!2603 (_2!4608 lt!156075))) (size!2229 (buf!2603 (_2!4608 lt!156605)))))))

(assert (=> b!105865 (=> (not res!87185) (not e!69317))))

(assert (=> b!105865 e!69317))

(declare-fun lt!156595 () tuple2!8702)

(assert (=> b!105865 (= lt!156595 lt!156605)))

(assert (=> b!105865 (= lt!156596 (appendNLeastSignificantBitsLoop!0 (_2!4608 lt!156595) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!156594 () Unit!6480)

(assert (=> b!105865 (= lt!156594 (lemmaIsPrefixTransitive!0 (_2!4608 lt!156075) (_2!4608 lt!156595) (_2!4608 lt!156596)))))

(assert (=> b!105865 call!1329))

(declare-fun lt!156588 () Unit!6480)

(assert (=> b!105865 (= lt!156588 lt!156594)))

(assert (=> b!105865 (invariant!0 (currentBit!5097 (_2!4608 lt!156075)) (currentByte!5102 (_2!4608 lt!156075)) (size!2229 (buf!2603 (_2!4608 lt!156595))))))

(declare-fun lt!156618 () BitStream!3932)

(assert (=> b!105865 (= lt!156618 (BitStream!3933 (buf!2603 (_2!4608 lt!156595)) (currentByte!5102 (_2!4608 lt!156075)) (currentBit!5097 (_2!4608 lt!156075))))))

(assert (=> b!105865 (invariant!0 (currentBit!5097 lt!156618) (currentByte!5102 lt!156618) (size!2229 (buf!2603 (_2!4608 lt!156596))))))

(declare-fun lt!156617 () BitStream!3932)

(assert (=> b!105865 (= lt!156617 (BitStream!3933 (buf!2603 (_2!4608 lt!156596)) (currentByte!5102 lt!156618) (currentBit!5097 lt!156618)))))

(declare-fun lt!156609 () tuple2!8708)

(assert (=> b!105865 (= lt!156609 (readBitPure!0 lt!156618))))

(declare-fun lt!156585 () tuple2!8708)

(assert (=> b!105865 (= lt!156585 (readBitPure!0 lt!156617))))

(declare-fun lt!156580 () Unit!6480)

(assert (=> b!105865 (= lt!156580 (readBitPrefixLemma!0 lt!156618 (_2!4608 lt!156596)))))

(declare-fun res!87191 () Bool)

(assert (=> b!105865 (= res!87191 (= (bitIndex!0 (size!2229 (buf!2603 (_1!4611 lt!156609))) (currentByte!5102 (_1!4611 lt!156609)) (currentBit!5097 (_1!4611 lt!156609))) (bitIndex!0 (size!2229 (buf!2603 (_1!4611 lt!156585))) (currentByte!5102 (_1!4611 lt!156585)) (currentBit!5097 (_1!4611 lt!156585)))))))

(declare-fun e!69319 () Bool)

(assert (=> b!105865 (=> (not res!87191) (not e!69319))))

(assert (=> b!105865 e!69319))

(declare-fun lt!156583 () Unit!6480)

(assert (=> b!105865 (= lt!156583 lt!156580)))

(declare-fun lt!156586 () tuple2!8706)

(assert (=> b!105865 (= lt!156586 (reader!0 (_2!4608 lt!156075) (_2!4608 lt!156596)))))

(declare-fun lt!156599 () tuple2!8706)

(assert (=> b!105865 (= lt!156599 (reader!0 (_2!4608 lt!156595) (_2!4608 lt!156596)))))

(declare-fun lt!156615 () tuple2!8708)

(assert (=> b!105865 (= lt!156615 (readBitPure!0 (_1!4610 lt!156586)))))

(assert (=> b!105865 (= (_2!4611 lt!156615) lt!156610)))

(declare-fun lt!156619 () Unit!6480)

(declare-fun Unit!6491 () Unit!6480)

(assert (=> b!105865 (= lt!156619 Unit!6491)))

(declare-fun lt!156591 () (_ BitVec 64))

(assert (=> b!105865 (= lt!156591 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!156622 () (_ BitVec 64))

(assert (=> b!105865 (= lt!156622 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!156616 () Unit!6480)

(assert (=> b!105865 (= lt!156616 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4608 lt!156075) (buf!2603 (_2!4608 lt!156596)) lt!156622))))

(assert (=> b!105865 (validate_offset_bits!1 ((_ sign_extend 32) (size!2229 (buf!2603 (_2!4608 lt!156596)))) ((_ sign_extend 32) (currentByte!5102 (_2!4608 lt!156075))) ((_ sign_extend 32) (currentBit!5097 (_2!4608 lt!156075))) lt!156622)))

(declare-fun lt!156597 () Unit!6480)

(assert (=> b!105865 (= lt!156597 lt!156616)))

(declare-fun lt!156621 () tuple2!8704)

(assert (=> b!105865 (= lt!156621 (readNLeastSignificantBitsLoopPure!0 (_1!4610 lt!156586) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!156591))))

(declare-fun lt!156607 () (_ BitVec 64))

(assert (=> b!105865 (= lt!156607 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!156589 () Unit!6480)

(assert (=> b!105865 (= lt!156589 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4608 lt!156595) (buf!2603 (_2!4608 lt!156596)) lt!156607))))

(assert (=> b!105865 (validate_offset_bits!1 ((_ sign_extend 32) (size!2229 (buf!2603 (_2!4608 lt!156596)))) ((_ sign_extend 32) (currentByte!5102 (_2!4608 lt!156595))) ((_ sign_extend 32) (currentBit!5097 (_2!4608 lt!156595))) lt!156607)))

(declare-fun lt!156598 () Unit!6480)

(assert (=> b!105865 (= lt!156598 lt!156589)))

(declare-fun lt!156603 () tuple2!8704)

(assert (=> b!105865 (= lt!156603 (readNLeastSignificantBitsLoopPure!0 (_1!4610 lt!156599) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!156591 (ite (_2!4611 lt!156615) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!156613 () tuple2!8704)

(assert (=> b!105865 (= lt!156613 (readNLeastSignificantBitsLoopPure!0 (_1!4610 lt!156586) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!156591))))

(declare-fun c!6530 () Bool)

(assert (=> b!105865 (= c!6530 (_2!4611 (readBitPure!0 (_1!4610 lt!156586))))))

(declare-fun lt!156601 () tuple2!8704)

(assert (=> b!105865 (= lt!156601 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4610 lt!156586) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!156591 e!69323)))))

(declare-fun lt!156578 () Unit!6480)

(assert (=> b!105865 (= lt!156578 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4610 lt!156586) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!156591))))

(assert (=> b!105865 (and (= (_2!4609 lt!156613) (_2!4609 lt!156601)) (= (_1!4609 lt!156613) (_1!4609 lt!156601)))))

(declare-fun lt!156584 () Unit!6480)

(assert (=> b!105865 (= lt!156584 lt!156578)))

(assert (=> b!105865 (= (_1!4610 lt!156586) (withMovedBitIndex!0 (_2!4610 lt!156586) (bvsub (bitIndex!0 (size!2229 (buf!2603 (_2!4608 lt!156075))) (currentByte!5102 (_2!4608 lt!156075)) (currentBit!5097 (_2!4608 lt!156075))) (bitIndex!0 (size!2229 (buf!2603 (_2!4608 lt!156596))) (currentByte!5102 (_2!4608 lt!156596)) (currentBit!5097 (_2!4608 lt!156596))))))))

(declare-fun lt!156614 () Unit!6480)

(declare-fun Unit!6492 () Unit!6480)

(assert (=> b!105865 (= lt!156614 Unit!6492)))

(assert (=> b!105865 (= (_1!4610 lt!156599) (withMovedBitIndex!0 (_2!4610 lt!156599) (bvsub (bitIndex!0 (size!2229 (buf!2603 (_2!4608 lt!156595))) (currentByte!5102 (_2!4608 lt!156595)) (currentBit!5097 (_2!4608 lt!156595))) (bitIndex!0 (size!2229 (buf!2603 (_2!4608 lt!156596))) (currentByte!5102 (_2!4608 lt!156596)) (currentBit!5097 (_2!4608 lt!156596))))))))

(declare-fun lt!156579 () Unit!6480)

(declare-fun Unit!6493 () Unit!6480)

(assert (=> b!105865 (= lt!156579 Unit!6493)))

(assert (=> b!105865 (= (bitIndex!0 (size!2229 (buf!2603 (_2!4608 lt!156075))) (currentByte!5102 (_2!4608 lt!156075)) (currentBit!5097 (_2!4608 lt!156075))) (bvsub (bitIndex!0 (size!2229 (buf!2603 (_2!4608 lt!156595))) (currentByte!5102 (_2!4608 lt!156595)) (currentBit!5097 (_2!4608 lt!156595))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!156608 () Unit!6480)

(declare-fun Unit!6494 () Unit!6480)

(assert (=> b!105865 (= lt!156608 Unit!6494)))

(assert (=> b!105865 (= (_2!4609 lt!156621) (_2!4609 lt!156603))))

(declare-fun lt!156581 () Unit!6480)

(declare-fun Unit!6495 () Unit!6480)

(assert (=> b!105865 (= lt!156581 Unit!6495)))

(assert (=> b!105865 (= (_1!4609 lt!156621) (_2!4610 lt!156586))))

(declare-fun b!105866 () Bool)

(assert (=> b!105866 (= e!69319 (= (_2!4611 lt!156609) (_2!4611 lt!156585)))))

(declare-fun lt!156606 () tuple2!8706)

(declare-fun lt!156582 () tuple2!8704)

(declare-fun b!105867 () Bool)

(assert (=> b!105867 (= e!69318 (and (= (_2!4609 lt!156582) v!199) (= (_1!4609 lt!156582) (_2!4610 lt!156606))))))

(declare-fun lt!156600 () (_ BitVec 64))

(assert (=> b!105867 (= lt!156582 (readNLeastSignificantBitsLoopPure!0 (_1!4610 lt!156606) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!156600))))

(declare-fun lt!156611 () Unit!6480)

(declare-fun lt!156602 () Unit!6480)

(assert (=> b!105867 (= lt!156611 lt!156602)))

(declare-fun lt!156587 () (_ BitVec 64))

(assert (=> b!105867 (validate_offset_bits!1 ((_ sign_extend 32) (size!2229 (buf!2603 (_2!4608 lt!156592)))) ((_ sign_extend 32) (currentByte!5102 (_2!4608 lt!156075))) ((_ sign_extend 32) (currentBit!5097 (_2!4608 lt!156075))) lt!156587)))

(assert (=> b!105867 (= lt!156602 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4608 lt!156075) (buf!2603 (_2!4608 lt!156592)) lt!156587))))

(declare-fun e!69321 () Bool)

(assert (=> b!105867 e!69321))

(declare-fun res!87188 () Bool)

(assert (=> b!105867 (=> (not res!87188) (not e!69321))))

(assert (=> b!105867 (= res!87188 (and (= (size!2229 (buf!2603 (_2!4608 lt!156075))) (size!2229 (buf!2603 (_2!4608 lt!156592)))) (bvsge lt!156587 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105867 (= lt!156587 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!105867 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!105867 (= lt!156600 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!105867 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!105867 (= lt!156606 (reader!0 (_2!4608 lt!156075) (_2!4608 lt!156592)))))

(declare-fun b!105868 () Bool)

(assert (=> b!105868 (= e!69321 (validate_offset_bits!1 ((_ sign_extend 32) (size!2229 (buf!2603 (_2!4608 lt!156075)))) ((_ sign_extend 32) (currentByte!5102 (_2!4608 lt!156075))) ((_ sign_extend 32) (currentBit!5097 (_2!4608 lt!156075))) lt!156587))))

(declare-fun b!105869 () Bool)

(declare-fun res!87189 () Bool)

(assert (=> b!105869 (=> (not res!87189) (not e!69318))))

(assert (=> b!105869 (= res!87189 (isPrefixOf!0 (_2!4608 lt!156075) (_2!4608 lt!156592)))))

(declare-fun bm!1326 () Bool)

(assert (=> bm!1326 (= call!1329 (isPrefixOf!0 (ite c!6529 (_2!4608 lt!156075) lt!156593) (ite c!6529 (_2!4608 lt!156596) lt!156593)))))

(declare-fun b!105870 () Bool)

(assert (=> b!105870 (= lt!156620 (readBitPure!0 (readerFrom!0 (_2!4608 lt!156605) (currentBit!5097 (_2!4608 lt!156075)) (currentByte!5102 (_2!4608 lt!156075)))))))

(declare-fun res!87192 () Bool)

(assert (=> b!105870 (= res!87192 (and (= (_2!4611 lt!156620) lt!156610) (= (_1!4611 lt!156620) (_2!4608 lt!156605))))))

(assert (=> b!105870 (=> (not res!87192) (not e!69322))))

(assert (=> b!105870 (= e!69317 e!69322)))

(declare-fun b!105871 () Bool)

(assert (=> b!105871 (= e!69323 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(assert (= (and d!33230 c!6529) b!105865))

(assert (= (and d!33230 (not c!6529)) b!105862))

(assert (= (and b!105865 res!87185) b!105864))

(assert (= (and b!105864 res!87190) b!105859))

(assert (= (and b!105859 res!87184) b!105870))

(assert (= (and b!105870 res!87192) b!105863))

(assert (= (and b!105865 res!87191) b!105866))

(assert (= (and b!105865 c!6530) b!105871))

(assert (= (and b!105865 (not c!6530)) b!105860))

(assert (= (or b!105865 b!105862) bm!1326))

(assert (= (and d!33230 res!87186) b!105861))

(assert (= (and b!105861 res!87187) b!105869))

(assert (= (and b!105869 res!87189) b!105867))

(assert (= (and b!105867 res!87188) b!105868))

(declare-fun m!155737 () Bool)

(assert (=> b!105865 m!155737))

(declare-fun m!155739 () Bool)

(assert (=> b!105865 m!155739))

(declare-fun m!155741 () Bool)

(assert (=> b!105865 m!155741))

(declare-fun m!155743 () Bool)

(assert (=> b!105865 m!155743))

(declare-fun m!155745 () Bool)

(assert (=> b!105865 m!155745))

(declare-fun m!155747 () Bool)

(assert (=> b!105865 m!155747))

(declare-fun m!155749 () Bool)

(assert (=> b!105865 m!155749))

(declare-fun m!155751 () Bool)

(assert (=> b!105865 m!155751))

(declare-fun m!155753 () Bool)

(assert (=> b!105865 m!155753))

(declare-fun m!155755 () Bool)

(assert (=> b!105865 m!155755))

(assert (=> b!105865 m!155747))

(declare-fun m!155757 () Bool)

(assert (=> b!105865 m!155757))

(declare-fun m!155759 () Bool)

(assert (=> b!105865 m!155759))

(declare-fun m!155761 () Bool)

(assert (=> b!105865 m!155761))

(declare-fun m!155763 () Bool)

(assert (=> b!105865 m!155763))

(declare-fun m!155765 () Bool)

(assert (=> b!105865 m!155765))

(declare-fun m!155767 () Bool)

(assert (=> b!105865 m!155767))

(declare-fun m!155769 () Bool)

(assert (=> b!105865 m!155769))

(declare-fun m!155773 () Bool)

(assert (=> b!105865 m!155773))

(declare-fun m!155777 () Bool)

(assert (=> b!105865 m!155777))

(assert (=> b!105865 m!155427))

(declare-fun m!155783 () Bool)

(assert (=> b!105865 m!155783))

(declare-fun m!155785 () Bool)

(assert (=> b!105865 m!155785))

(declare-fun m!155787 () Bool)

(assert (=> b!105865 m!155787))

(declare-fun m!155789 () Bool)

(assert (=> b!105865 m!155789))

(declare-fun m!155791 () Bool)

(assert (=> b!105865 m!155791))

(declare-fun m!155793 () Bool)

(assert (=> b!105865 m!155793))

(declare-fun m!155795 () Bool)

(assert (=> b!105865 m!155795))

(declare-fun m!155797 () Bool)

(assert (=> b!105865 m!155797))

(declare-fun m!155799 () Bool)

(assert (=> b!105868 m!155799))

(declare-fun m!155801 () Bool)

(assert (=> b!105867 m!155801))

(assert (=> b!105867 m!155763))

(declare-fun m!155803 () Bool)

(assert (=> b!105867 m!155803))

(declare-fun m!155805 () Bool)

(assert (=> b!105867 m!155805))

(declare-fun m!155811 () Bool)

(assert (=> b!105867 m!155811))

(declare-fun m!155813 () Bool)

(assert (=> bm!1326 m!155813))

(declare-fun m!155815 () Bool)

(assert (=> b!105870 m!155815))

(assert (=> b!105870 m!155815))

(declare-fun m!155817 () Bool)

(assert (=> b!105870 m!155817))

(declare-fun m!155819 () Bool)

(assert (=> b!105859 m!155819))

(declare-fun m!155821 () Bool)

(assert (=> b!105864 m!155821))

(assert (=> b!105864 m!155427))

(declare-fun m!155823 () Bool)

(assert (=> b!105863 m!155823))

(assert (=> b!105863 m!155821))

(declare-fun m!155825 () Bool)

(assert (=> b!105861 m!155825))

(assert (=> b!105861 m!155427))

(declare-fun m!155827 () Bool)

(assert (=> b!105869 m!155827))

(declare-fun m!155829 () Bool)

(assert (=> b!105862 m!155829))

(assert (=> b!105690 d!33230))

(declare-fun d!33254 () Bool)

(assert (=> d!33254 (validate_offset_bits!1 ((_ sign_extend 32) (size!2229 (buf!2603 (_2!4608 lt!156059)))) ((_ sign_extend 32) (currentByte!5102 (_2!4608 lt!156075))) ((_ sign_extend 32) (currentBit!5097 (_2!4608 lt!156075))) lt!156066)))

(declare-fun lt!156635 () Unit!6480)

(declare-fun choose!9 (BitStream!3932 array!4888 (_ BitVec 64) BitStream!3932) Unit!6480)

(assert (=> d!33254 (= lt!156635 (choose!9 (_2!4608 lt!156075) (buf!2603 (_2!4608 lt!156059)) lt!156066 (BitStream!3933 (buf!2603 (_2!4608 lt!156059)) (currentByte!5102 (_2!4608 lt!156075)) (currentBit!5097 (_2!4608 lt!156075)))))))

(assert (=> d!33254 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4608 lt!156075) (buf!2603 (_2!4608 lt!156059)) lt!156066) lt!156635)))

(declare-fun bs!8120 () Bool)

(assert (= bs!8120 d!33254))

(assert (=> bs!8120 m!155393))

(declare-fun m!155831 () Bool)

(assert (=> bs!8120 m!155831))

(assert (=> b!105690 d!33254))

(declare-fun d!33256 () Bool)

(assert (=> d!33256 (isPrefixOf!0 thiss!1305 (_2!4608 lt!156059))))

(declare-fun lt!156638 () Unit!6480)

(declare-fun choose!30 (BitStream!3932 BitStream!3932 BitStream!3932) Unit!6480)

(assert (=> d!33256 (= lt!156638 (choose!30 thiss!1305 (_2!4608 lt!156075) (_2!4608 lt!156059)))))

(assert (=> d!33256 (isPrefixOf!0 thiss!1305 (_2!4608 lt!156075))))

(assert (=> d!33256 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4608 lt!156075) (_2!4608 lt!156059)) lt!156638)))

(declare-fun bs!8121 () Bool)

(assert (= bs!8121 d!33256))

(assert (=> bs!8121 m!155403))

(declare-fun m!155833 () Bool)

(assert (=> bs!8121 m!155833))

(assert (=> bs!8121 m!155441))

(assert (=> b!105690 d!33256))

(declare-fun d!33258 () Bool)

(declare-fun lt!156639 () tuple2!8716)

(assert (=> d!33258 (= lt!156639 (readBit!0 (_1!4610 lt!156058)))))

(assert (=> d!33258 (= (readBitPure!0 (_1!4610 lt!156058)) (tuple2!8709 (_2!4615 lt!156639) (_1!4615 lt!156639)))))

(declare-fun bs!8122 () Bool)

(assert (= bs!8122 d!33258))

(declare-fun m!155835 () Bool)

(assert (=> bs!8122 m!155835))

(assert (=> b!105690 d!33258))

(declare-fun b!105888 () Bool)

(declare-fun res!87208 () Bool)

(declare-fun e!69334 () Bool)

(assert (=> b!105888 (=> (not res!87208) (not e!69334))))

(declare-fun lt!156684 () tuple2!8706)

(assert (=> b!105888 (= res!87208 (isPrefixOf!0 (_2!4610 lt!156684) (_2!4608 lt!156059)))))

(declare-fun b!105889 () Bool)

(declare-fun e!69333 () Unit!6480)

(declare-fun lt!156683 () Unit!6480)

(assert (=> b!105889 (= e!69333 lt!156683)))

(declare-fun lt!156695 () (_ BitVec 64))

(assert (=> b!105889 (= lt!156695 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!156688 () (_ BitVec 64))

(assert (=> b!105889 (= lt!156688 (bitIndex!0 (size!2229 (buf!2603 thiss!1305)) (currentByte!5102 thiss!1305) (currentBit!5097 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4888 array!4888 (_ BitVec 64) (_ BitVec 64)) Unit!6480)

(assert (=> b!105889 (= lt!156683 (arrayBitRangesEqSymmetric!0 (buf!2603 thiss!1305) (buf!2603 (_2!4608 lt!156059)) lt!156695 lt!156688))))

(assert (=> b!105889 (arrayBitRangesEq!0 (buf!2603 (_2!4608 lt!156059)) (buf!2603 thiss!1305) lt!156695 lt!156688)))

(declare-fun d!33260 () Bool)

(assert (=> d!33260 e!69334))

(declare-fun res!87206 () Bool)

(assert (=> d!33260 (=> (not res!87206) (not e!69334))))

(assert (=> d!33260 (= res!87206 (isPrefixOf!0 (_1!4610 lt!156684) (_2!4610 lt!156684)))))

(declare-fun lt!156697 () BitStream!3932)

(assert (=> d!33260 (= lt!156684 (tuple2!8707 lt!156697 (_2!4608 lt!156059)))))

(declare-fun lt!156699 () Unit!6480)

(declare-fun lt!156694 () Unit!6480)

(assert (=> d!33260 (= lt!156699 lt!156694)))

(assert (=> d!33260 (isPrefixOf!0 lt!156697 (_2!4608 lt!156059))))

(assert (=> d!33260 (= lt!156694 (lemmaIsPrefixTransitive!0 lt!156697 (_2!4608 lt!156059) (_2!4608 lt!156059)))))

(declare-fun lt!156687 () Unit!6480)

(declare-fun lt!156682 () Unit!6480)

(assert (=> d!33260 (= lt!156687 lt!156682)))

(assert (=> d!33260 (isPrefixOf!0 lt!156697 (_2!4608 lt!156059))))

(assert (=> d!33260 (= lt!156682 (lemmaIsPrefixTransitive!0 lt!156697 thiss!1305 (_2!4608 lt!156059)))))

(declare-fun lt!156680 () Unit!6480)

(assert (=> d!33260 (= lt!156680 e!69333)))

(declare-fun c!6533 () Bool)

(assert (=> d!33260 (= c!6533 (not (= (size!2229 (buf!2603 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!156690 () Unit!6480)

(declare-fun lt!156681 () Unit!6480)

(assert (=> d!33260 (= lt!156690 lt!156681)))

(assert (=> d!33260 (isPrefixOf!0 (_2!4608 lt!156059) (_2!4608 lt!156059))))

(assert (=> d!33260 (= lt!156681 (lemmaIsPrefixRefl!0 (_2!4608 lt!156059)))))

(declare-fun lt!156685 () Unit!6480)

(declare-fun lt!156692 () Unit!6480)

(assert (=> d!33260 (= lt!156685 lt!156692)))

(assert (=> d!33260 (= lt!156692 (lemmaIsPrefixRefl!0 (_2!4608 lt!156059)))))

(declare-fun lt!156689 () Unit!6480)

(declare-fun lt!156693 () Unit!6480)

(assert (=> d!33260 (= lt!156689 lt!156693)))

(assert (=> d!33260 (isPrefixOf!0 lt!156697 lt!156697)))

(assert (=> d!33260 (= lt!156693 (lemmaIsPrefixRefl!0 lt!156697))))

(declare-fun lt!156686 () Unit!6480)

(declare-fun lt!156691 () Unit!6480)

(assert (=> d!33260 (= lt!156686 lt!156691)))

(assert (=> d!33260 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!33260 (= lt!156691 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!33260 (= lt!156697 (BitStream!3933 (buf!2603 (_2!4608 lt!156059)) (currentByte!5102 thiss!1305) (currentBit!5097 thiss!1305)))))

(assert (=> d!33260 (isPrefixOf!0 thiss!1305 (_2!4608 lt!156059))))

(assert (=> d!33260 (= (reader!0 thiss!1305 (_2!4608 lt!156059)) lt!156684)))

(declare-fun b!105890 () Bool)

(declare-fun lt!156696 () (_ BitVec 64))

(declare-fun lt!156698 () (_ BitVec 64))

(assert (=> b!105890 (= e!69334 (= (_1!4610 lt!156684) (withMovedBitIndex!0 (_2!4610 lt!156684) (bvsub lt!156696 lt!156698))))))

(assert (=> b!105890 (or (= (bvand lt!156696 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!156698 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!156696 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!156696 lt!156698) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105890 (= lt!156698 (bitIndex!0 (size!2229 (buf!2603 (_2!4608 lt!156059))) (currentByte!5102 (_2!4608 lt!156059)) (currentBit!5097 (_2!4608 lt!156059))))))

(assert (=> b!105890 (= lt!156696 (bitIndex!0 (size!2229 (buf!2603 thiss!1305)) (currentByte!5102 thiss!1305) (currentBit!5097 thiss!1305)))))

(declare-fun b!105891 () Bool)

(declare-fun Unit!6496 () Unit!6480)

(assert (=> b!105891 (= e!69333 Unit!6496)))

(declare-fun b!105892 () Bool)

(declare-fun res!87207 () Bool)

(assert (=> b!105892 (=> (not res!87207) (not e!69334))))

(assert (=> b!105892 (= res!87207 (isPrefixOf!0 (_1!4610 lt!156684) thiss!1305))))

(assert (= (and d!33260 c!6533) b!105889))

(assert (= (and d!33260 (not c!6533)) b!105891))

(assert (= (and d!33260 res!87206) b!105892))

(assert (= (and b!105892 res!87207) b!105888))

(assert (= (and b!105888 res!87208) b!105890))

(assert (=> b!105889 m!155381))

(declare-fun m!155837 () Bool)

(assert (=> b!105889 m!155837))

(declare-fun m!155839 () Bool)

(assert (=> b!105889 m!155839))

(declare-fun m!155841 () Bool)

(assert (=> b!105888 m!155841))

(declare-fun m!155843 () Bool)

(assert (=> b!105892 m!155843))

(declare-fun m!155845 () Bool)

(assert (=> b!105890 m!155845))

(assert (=> b!105890 m!155383))

(assert (=> b!105890 m!155381))

(declare-fun m!155847 () Bool)

(assert (=> d!33260 m!155847))

(declare-fun m!155849 () Bool)

(assert (=> d!33260 m!155849))

(declare-fun m!155851 () Bool)

(assert (=> d!33260 m!155851))

(declare-fun m!155853 () Bool)

(assert (=> d!33260 m!155853))

(declare-fun m!155855 () Bool)

(assert (=> d!33260 m!155855))

(declare-fun m!155857 () Bool)

(assert (=> d!33260 m!155857))

(declare-fun m!155859 () Bool)

(assert (=> d!33260 m!155859))

(declare-fun m!155861 () Bool)

(assert (=> d!33260 m!155861))

(assert (=> d!33260 m!155403))

(declare-fun m!155863 () Bool)

(assert (=> d!33260 m!155863))

(declare-fun m!155865 () Bool)

(assert (=> d!33260 m!155865))

(assert (=> b!105690 d!33260))

(declare-fun b!105904 () Bool)

(declare-fun e!69340 () Bool)

(declare-fun e!69339 () Bool)

(assert (=> b!105904 (= e!69340 e!69339)))

(declare-fun res!87219 () Bool)

(assert (=> b!105904 (=> (not res!87219) (not e!69339))))

(declare-fun lt!156708 () tuple2!8702)

(declare-fun lt!156710 () tuple2!8708)

(assert (=> b!105904 (= res!87219 (and (= (_2!4611 lt!156710) lt!156072) (= (_1!4611 lt!156710) (_2!4608 lt!156708))))))

(assert (=> b!105904 (= lt!156710 (readBitPure!0 (readerFrom!0 (_2!4608 lt!156708) (currentBit!5097 thiss!1305) (currentByte!5102 thiss!1305))))))

(declare-fun b!105903 () Bool)

(declare-fun res!87220 () Bool)

(assert (=> b!105903 (=> (not res!87220) (not e!69340))))

(assert (=> b!105903 (= res!87220 (isPrefixOf!0 thiss!1305 (_2!4608 lt!156708)))))

(declare-fun d!33262 () Bool)

(assert (=> d!33262 e!69340))

(declare-fun res!87217 () Bool)

(assert (=> d!33262 (=> (not res!87217) (not e!69340))))

(assert (=> d!33262 (= res!87217 (= (size!2229 (buf!2603 thiss!1305)) (size!2229 (buf!2603 (_2!4608 lt!156708)))))))

(declare-fun choose!16 (BitStream!3932 Bool) tuple2!8702)

(assert (=> d!33262 (= lt!156708 (choose!16 thiss!1305 lt!156072))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!33262 (validate_offset_bit!0 ((_ sign_extend 32) (size!2229 (buf!2603 thiss!1305))) ((_ sign_extend 32) (currentByte!5102 thiss!1305)) ((_ sign_extend 32) (currentBit!5097 thiss!1305)))))

(assert (=> d!33262 (= (appendBit!0 thiss!1305 lt!156072) lt!156708)))

(declare-fun b!105902 () Bool)

(declare-fun res!87218 () Bool)

(assert (=> b!105902 (=> (not res!87218) (not e!69340))))

(declare-fun lt!156709 () (_ BitVec 64))

(declare-fun lt!156711 () (_ BitVec 64))

(assert (=> b!105902 (= res!87218 (= (bitIndex!0 (size!2229 (buf!2603 (_2!4608 lt!156708))) (currentByte!5102 (_2!4608 lt!156708)) (currentBit!5097 (_2!4608 lt!156708))) (bvadd lt!156711 lt!156709)))))

(assert (=> b!105902 (or (not (= (bvand lt!156711 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!156709 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!156711 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!156711 lt!156709) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105902 (= lt!156709 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!105902 (= lt!156711 (bitIndex!0 (size!2229 (buf!2603 thiss!1305)) (currentByte!5102 thiss!1305) (currentBit!5097 thiss!1305)))))

(declare-fun b!105905 () Bool)

(assert (=> b!105905 (= e!69339 (= (bitIndex!0 (size!2229 (buf!2603 (_1!4611 lt!156710))) (currentByte!5102 (_1!4611 lt!156710)) (currentBit!5097 (_1!4611 lt!156710))) (bitIndex!0 (size!2229 (buf!2603 (_2!4608 lt!156708))) (currentByte!5102 (_2!4608 lt!156708)) (currentBit!5097 (_2!4608 lt!156708)))))))

(assert (= (and d!33262 res!87217) b!105902))

(assert (= (and b!105902 res!87218) b!105903))

(assert (= (and b!105903 res!87220) b!105904))

(assert (= (and b!105904 res!87219) b!105905))

(declare-fun m!155867 () Bool)

(assert (=> b!105904 m!155867))

(assert (=> b!105904 m!155867))

(declare-fun m!155869 () Bool)

(assert (=> b!105904 m!155869))

(declare-fun m!155871 () Bool)

(assert (=> d!33262 m!155871))

(declare-fun m!155873 () Bool)

(assert (=> d!33262 m!155873))

(declare-fun m!155875 () Bool)

(assert (=> b!105903 m!155875))

(declare-fun m!155877 () Bool)

(assert (=> b!105902 m!155877))

(assert (=> b!105902 m!155381))

(declare-fun m!155879 () Bool)

(assert (=> b!105905 m!155879))

(assert (=> b!105905 m!155877))

(assert (=> b!105690 d!33262))

(declare-fun d!33264 () Bool)

(declare-fun e!69341 () Bool)

(assert (=> d!33264 e!69341))

(declare-fun res!87221 () Bool)

(assert (=> d!33264 (=> (not res!87221) (not e!69341))))

(declare-fun lt!156716 () (_ BitVec 64))

(declare-fun lt!156715 () (_ BitVec 64))

(declare-fun lt!156712 () (_ BitVec 64))

(assert (=> d!33264 (= res!87221 (= lt!156716 (bvsub lt!156712 lt!156715)))))

(assert (=> d!33264 (or (= (bvand lt!156712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!156715 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!156712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!156712 lt!156715) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33264 (= lt!156715 (remainingBits!0 ((_ sign_extend 32) (size!2229 (buf!2603 (_1!4611 lt!156078)))) ((_ sign_extend 32) (currentByte!5102 (_1!4611 lt!156078))) ((_ sign_extend 32) (currentBit!5097 (_1!4611 lt!156078)))))))

(declare-fun lt!156714 () (_ BitVec 64))

(declare-fun lt!156717 () (_ BitVec 64))

(assert (=> d!33264 (= lt!156712 (bvmul lt!156714 lt!156717))))

(assert (=> d!33264 (or (= lt!156714 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!156717 (bvsdiv (bvmul lt!156714 lt!156717) lt!156714)))))

(assert (=> d!33264 (= lt!156717 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33264 (= lt!156714 ((_ sign_extend 32) (size!2229 (buf!2603 (_1!4611 lt!156078)))))))

(assert (=> d!33264 (= lt!156716 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5102 (_1!4611 lt!156078))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5097 (_1!4611 lt!156078)))))))

(assert (=> d!33264 (invariant!0 (currentBit!5097 (_1!4611 lt!156078)) (currentByte!5102 (_1!4611 lt!156078)) (size!2229 (buf!2603 (_1!4611 lt!156078))))))

(assert (=> d!33264 (= (bitIndex!0 (size!2229 (buf!2603 (_1!4611 lt!156078))) (currentByte!5102 (_1!4611 lt!156078)) (currentBit!5097 (_1!4611 lt!156078))) lt!156716)))

(declare-fun b!105906 () Bool)

(declare-fun res!87222 () Bool)

(assert (=> b!105906 (=> (not res!87222) (not e!69341))))

(assert (=> b!105906 (= res!87222 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!156716))))

(declare-fun b!105907 () Bool)

(declare-fun lt!156713 () (_ BitVec 64))

(assert (=> b!105907 (= e!69341 (bvsle lt!156716 (bvmul lt!156713 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105907 (or (= lt!156713 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!156713 #b0000000000000000000000000000000000000000000000000000000000001000) lt!156713)))))

(assert (=> b!105907 (= lt!156713 ((_ sign_extend 32) (size!2229 (buf!2603 (_1!4611 lt!156078)))))))

(assert (= (and d!33264 res!87221) b!105906))

(assert (= (and b!105906 res!87222) b!105907))

(declare-fun m!155881 () Bool)

(assert (=> d!33264 m!155881))

(declare-fun m!155883 () Bool)

(assert (=> d!33264 m!155883))

(assert (=> b!105690 d!33264))

(declare-fun b!105908 () Bool)

(declare-fun res!87225 () Bool)

(declare-fun e!69343 () Bool)

(assert (=> b!105908 (=> (not res!87225) (not e!69343))))

(declare-fun lt!156722 () tuple2!8706)

(assert (=> b!105908 (= res!87225 (isPrefixOf!0 (_2!4610 lt!156722) (_2!4608 lt!156059)))))

(declare-fun b!105909 () Bool)

(declare-fun e!69342 () Unit!6480)

(declare-fun lt!156721 () Unit!6480)

(assert (=> b!105909 (= e!69342 lt!156721)))

(declare-fun lt!156733 () (_ BitVec 64))

(assert (=> b!105909 (= lt!156733 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!156726 () (_ BitVec 64))

(assert (=> b!105909 (= lt!156726 (bitIndex!0 (size!2229 (buf!2603 (_2!4608 lt!156075))) (currentByte!5102 (_2!4608 lt!156075)) (currentBit!5097 (_2!4608 lt!156075))))))

(assert (=> b!105909 (= lt!156721 (arrayBitRangesEqSymmetric!0 (buf!2603 (_2!4608 lt!156075)) (buf!2603 (_2!4608 lt!156059)) lt!156733 lt!156726))))

(assert (=> b!105909 (arrayBitRangesEq!0 (buf!2603 (_2!4608 lt!156059)) (buf!2603 (_2!4608 lt!156075)) lt!156733 lt!156726)))

(declare-fun d!33266 () Bool)

(assert (=> d!33266 e!69343))

(declare-fun res!87223 () Bool)

(assert (=> d!33266 (=> (not res!87223) (not e!69343))))

(assert (=> d!33266 (= res!87223 (isPrefixOf!0 (_1!4610 lt!156722) (_2!4610 lt!156722)))))

(declare-fun lt!156735 () BitStream!3932)

(assert (=> d!33266 (= lt!156722 (tuple2!8707 lt!156735 (_2!4608 lt!156059)))))

(declare-fun lt!156737 () Unit!6480)

(declare-fun lt!156732 () Unit!6480)

(assert (=> d!33266 (= lt!156737 lt!156732)))

(assert (=> d!33266 (isPrefixOf!0 lt!156735 (_2!4608 lt!156059))))

(assert (=> d!33266 (= lt!156732 (lemmaIsPrefixTransitive!0 lt!156735 (_2!4608 lt!156059) (_2!4608 lt!156059)))))

(declare-fun lt!156725 () Unit!6480)

(declare-fun lt!156720 () Unit!6480)

(assert (=> d!33266 (= lt!156725 lt!156720)))

(assert (=> d!33266 (isPrefixOf!0 lt!156735 (_2!4608 lt!156059))))

(assert (=> d!33266 (= lt!156720 (lemmaIsPrefixTransitive!0 lt!156735 (_2!4608 lt!156075) (_2!4608 lt!156059)))))

(declare-fun lt!156718 () Unit!6480)

(assert (=> d!33266 (= lt!156718 e!69342)))

(declare-fun c!6534 () Bool)

(assert (=> d!33266 (= c!6534 (not (= (size!2229 (buf!2603 (_2!4608 lt!156075))) #b00000000000000000000000000000000)))))

(declare-fun lt!156728 () Unit!6480)

(declare-fun lt!156719 () Unit!6480)

(assert (=> d!33266 (= lt!156728 lt!156719)))

(assert (=> d!33266 (isPrefixOf!0 (_2!4608 lt!156059) (_2!4608 lt!156059))))

(assert (=> d!33266 (= lt!156719 (lemmaIsPrefixRefl!0 (_2!4608 lt!156059)))))

(declare-fun lt!156723 () Unit!6480)

(declare-fun lt!156730 () Unit!6480)

(assert (=> d!33266 (= lt!156723 lt!156730)))

(assert (=> d!33266 (= lt!156730 (lemmaIsPrefixRefl!0 (_2!4608 lt!156059)))))

(declare-fun lt!156727 () Unit!6480)

(declare-fun lt!156731 () Unit!6480)

(assert (=> d!33266 (= lt!156727 lt!156731)))

(assert (=> d!33266 (isPrefixOf!0 lt!156735 lt!156735)))

(assert (=> d!33266 (= lt!156731 (lemmaIsPrefixRefl!0 lt!156735))))

(declare-fun lt!156724 () Unit!6480)

(declare-fun lt!156729 () Unit!6480)

(assert (=> d!33266 (= lt!156724 lt!156729)))

(assert (=> d!33266 (isPrefixOf!0 (_2!4608 lt!156075) (_2!4608 lt!156075))))

(assert (=> d!33266 (= lt!156729 (lemmaIsPrefixRefl!0 (_2!4608 lt!156075)))))

(assert (=> d!33266 (= lt!156735 (BitStream!3933 (buf!2603 (_2!4608 lt!156059)) (currentByte!5102 (_2!4608 lt!156075)) (currentBit!5097 (_2!4608 lt!156075))))))

(assert (=> d!33266 (isPrefixOf!0 (_2!4608 lt!156075) (_2!4608 lt!156059))))

(assert (=> d!33266 (= (reader!0 (_2!4608 lt!156075) (_2!4608 lt!156059)) lt!156722)))

(declare-fun b!105910 () Bool)

(declare-fun lt!156736 () (_ BitVec 64))

(declare-fun lt!156734 () (_ BitVec 64))

(assert (=> b!105910 (= e!69343 (= (_1!4610 lt!156722) (withMovedBitIndex!0 (_2!4610 lt!156722) (bvsub lt!156734 lt!156736))))))

(assert (=> b!105910 (or (= (bvand lt!156734 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!156736 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!156734 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!156734 lt!156736) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105910 (= lt!156736 (bitIndex!0 (size!2229 (buf!2603 (_2!4608 lt!156059))) (currentByte!5102 (_2!4608 lt!156059)) (currentBit!5097 (_2!4608 lt!156059))))))

(assert (=> b!105910 (= lt!156734 (bitIndex!0 (size!2229 (buf!2603 (_2!4608 lt!156075))) (currentByte!5102 (_2!4608 lt!156075)) (currentBit!5097 (_2!4608 lt!156075))))))

(declare-fun b!105911 () Bool)

(declare-fun Unit!6497 () Unit!6480)

(assert (=> b!105911 (= e!69342 Unit!6497)))

(declare-fun b!105912 () Bool)

(declare-fun res!87224 () Bool)

(assert (=> b!105912 (=> (not res!87224) (not e!69343))))

(assert (=> b!105912 (= res!87224 (isPrefixOf!0 (_1!4610 lt!156722) (_2!4608 lt!156075)))))

(assert (= (and d!33266 c!6534) b!105909))

(assert (= (and d!33266 (not c!6534)) b!105911))

(assert (= (and d!33266 res!87223) b!105912))

(assert (= (and b!105912 res!87224) b!105908))

(assert (= (and b!105908 res!87225) b!105910))

(assert (=> b!105909 m!155427))

(declare-fun m!155885 () Bool)

(assert (=> b!105909 m!155885))

(declare-fun m!155887 () Bool)

(assert (=> b!105909 m!155887))

(declare-fun m!155889 () Bool)

(assert (=> b!105908 m!155889))

(declare-fun m!155891 () Bool)

(assert (=> b!105912 m!155891))

(declare-fun m!155893 () Bool)

(assert (=> b!105910 m!155893))

(assert (=> b!105910 m!155383))

(assert (=> b!105910 m!155427))

(assert (=> d!33266 m!155847))

(declare-fun m!155895 () Bool)

(assert (=> d!33266 m!155895))

(assert (=> d!33266 m!155851))

(declare-fun m!155897 () Bool)

(assert (=> d!33266 m!155897))

(declare-fun m!155899 () Bool)

(assert (=> d!33266 m!155899))

(declare-fun m!155901 () Bool)

(assert (=> d!33266 m!155901))

(declare-fun m!155903 () Bool)

(assert (=> d!33266 m!155903))

(declare-fun m!155905 () Bool)

(assert (=> d!33266 m!155905))

(declare-fun m!155907 () Bool)

(assert (=> d!33266 m!155907))

(declare-fun m!155909 () Bool)

(assert (=> d!33266 m!155909))

(declare-fun m!155911 () Bool)

(assert (=> d!33266 m!155911))

(assert (=> b!105690 d!33266))

(declare-fun d!33268 () Bool)

(declare-fun lt!156738 () tuple2!8714)

(assert (=> d!33268 (= lt!156738 (readNLeastSignificantBitsLoop!0 (_1!4610 lt!156063) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!156057))))

(assert (=> d!33268 (= (readNLeastSignificantBitsLoopPure!0 (_1!4610 lt!156063) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!156057) (tuple2!8705 (_2!4614 lt!156738) (_1!4614 lt!156738)))))

(declare-fun bs!8123 () Bool)

(assert (= bs!8123 d!33268))

(declare-fun m!155913 () Bool)

(assert (=> bs!8123 m!155913))

(assert (=> b!105690 d!33268))

(declare-fun d!33270 () Bool)

(declare-fun res!87226 () Bool)

(declare-fun e!69344 () Bool)

(assert (=> d!33270 (=> (not res!87226) (not e!69344))))

(assert (=> d!33270 (= res!87226 (= (size!2229 (buf!2603 thiss!1305)) (size!2229 (buf!2603 (_2!4608 lt!156059)))))))

(assert (=> d!33270 (= (isPrefixOf!0 thiss!1305 (_2!4608 lt!156059)) e!69344)))

(declare-fun b!105913 () Bool)

(declare-fun res!87227 () Bool)

(assert (=> b!105913 (=> (not res!87227) (not e!69344))))

(assert (=> b!105913 (= res!87227 (bvsle (bitIndex!0 (size!2229 (buf!2603 thiss!1305)) (currentByte!5102 thiss!1305) (currentBit!5097 thiss!1305)) (bitIndex!0 (size!2229 (buf!2603 (_2!4608 lt!156059))) (currentByte!5102 (_2!4608 lt!156059)) (currentBit!5097 (_2!4608 lt!156059)))))))

(declare-fun b!105914 () Bool)

(declare-fun e!69345 () Bool)

(assert (=> b!105914 (= e!69344 e!69345)))

(declare-fun res!87228 () Bool)

(assert (=> b!105914 (=> res!87228 e!69345)))

(assert (=> b!105914 (= res!87228 (= (size!2229 (buf!2603 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!105915 () Bool)

(assert (=> b!105915 (= e!69345 (arrayBitRangesEq!0 (buf!2603 thiss!1305) (buf!2603 (_2!4608 lt!156059)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2229 (buf!2603 thiss!1305)) (currentByte!5102 thiss!1305) (currentBit!5097 thiss!1305))))))

(assert (= (and d!33270 res!87226) b!105913))

(assert (= (and b!105913 res!87227) b!105914))

(assert (= (and b!105914 (not res!87228)) b!105915))

(assert (=> b!105913 m!155381))

(assert (=> b!105913 m!155383))

(assert (=> b!105915 m!155381))

(assert (=> b!105915 m!155381))

(declare-fun m!155915 () Bool)

(assert (=> b!105915 m!155915))

(assert (=> b!105690 d!33270))

(declare-fun d!33272 () Bool)

(declare-fun lt!156739 () tuple2!8716)

(assert (=> d!33272 (= lt!156739 (readBit!0 (BitStream!3933 (buf!2603 (_2!4608 lt!156059)) (currentByte!5102 thiss!1305) (currentBit!5097 thiss!1305))))))

(assert (=> d!33272 (= (readBitPure!0 (BitStream!3933 (buf!2603 (_2!4608 lt!156059)) (currentByte!5102 thiss!1305) (currentBit!5097 thiss!1305))) (tuple2!8709 (_2!4615 lt!156739) (_1!4615 lt!156739)))))

(declare-fun bs!8124 () Bool)

(assert (= bs!8124 d!33272))

(declare-fun m!155917 () Bool)

(assert (=> bs!8124 m!155917))

(assert (=> b!105690 d!33272))

(declare-fun d!33274 () Bool)

(assert (=> d!33274 (validate_offset_bits!1 ((_ sign_extend 32) (size!2229 (buf!2603 (_2!4608 lt!156059)))) ((_ sign_extend 32) (currentByte!5102 thiss!1305)) ((_ sign_extend 32) (currentBit!5097 thiss!1305)) lt!156071)))

(declare-fun lt!156740 () Unit!6480)

(assert (=> d!33274 (= lt!156740 (choose!9 thiss!1305 (buf!2603 (_2!4608 lt!156059)) lt!156071 (BitStream!3933 (buf!2603 (_2!4608 lt!156059)) (currentByte!5102 thiss!1305) (currentBit!5097 thiss!1305))))))

(assert (=> d!33274 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2603 (_2!4608 lt!156059)) lt!156071) lt!156740)))

(declare-fun bs!8125 () Bool)

(assert (= bs!8125 d!33274))

(assert (=> bs!8125 m!155417))

(declare-fun m!155919 () Bool)

(assert (=> bs!8125 m!155919))

(assert (=> b!105690 d!33274))

(declare-fun d!33276 () Bool)

(assert (=> d!33276 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2229 (buf!2603 (_2!4608 lt!156059)))) ((_ sign_extend 32) (currentByte!5102 (_2!4608 lt!156075))) ((_ sign_extend 32) (currentBit!5097 (_2!4608 lt!156075))) lt!156066) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2229 (buf!2603 (_2!4608 lt!156059)))) ((_ sign_extend 32) (currentByte!5102 (_2!4608 lt!156075))) ((_ sign_extend 32) (currentBit!5097 (_2!4608 lt!156075)))) lt!156066))))

(declare-fun bs!8126 () Bool)

(assert (= bs!8126 d!33276))

(declare-fun m!155921 () Bool)

(assert (=> bs!8126 m!155921))

(assert (=> b!105690 d!33276))

(declare-fun d!33278 () Bool)

(assert (=> d!33278 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5097 thiss!1305) (currentByte!5102 thiss!1305) (size!2229 (buf!2603 thiss!1305))))))

(declare-fun bs!8127 () Bool)

(assert (= bs!8127 d!33278))

(assert (=> bs!8127 m!155549))

(assert (=> start!20902 d!33278))

(push 1)

