; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39232 () Bool)

(assert start!39232)

(declare-fun b!176448 () Bool)

(declare-fun e!123003 () Bool)

(declare-datatypes ((array!9526 0))(
  ( (array!9527 (arr!5132 (Array (_ BitVec 32) (_ BitVec 8))) (size!4202 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7512 0))(
  ( (BitStream!7513 (buf!4645 array!9526) (currentByte!8798 (_ BitVec 32)) (currentBit!8793 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12718 0))(
  ( (Unit!12719) )
))
(declare-datatypes ((tuple2!15186 0))(
  ( (tuple2!15187 (_1!8238 Unit!12718) (_2!8238 BitStream!7512)) )
))
(declare-fun lt!271672 () tuple2!15186)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!176448 (= e!123003 (invariant!0 (currentBit!8793 (_2!8238 lt!271672)) (currentByte!8798 (_2!8238 lt!271672)) (size!4202 (buf!4645 (_2!8238 lt!271672)))))))

(declare-fun b!176449 () Bool)

(declare-fun e!123001 () Bool)

(declare-fun e!122998 () Bool)

(assert (=> b!176449 (= e!123001 e!122998)))

(declare-fun res!146173 () Bool)

(assert (=> b!176449 (=> (not res!146173) (not e!122998))))

(declare-fun lt!271669 () (_ BitVec 64))

(declare-fun lt!271670 () (_ BitVec 64))

(assert (=> b!176449 (= res!146173 (= lt!271669 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!271670)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!176449 (= lt!271669 (bitIndex!0 (size!4202 (buf!4645 (_2!8238 lt!271672))) (currentByte!8798 (_2!8238 lt!271672)) (currentBit!8793 (_2!8238 lt!271672))))))

(declare-fun thiss!1204 () BitStream!7512)

(assert (=> b!176449 (= lt!271670 (bitIndex!0 (size!4202 (buf!4645 thiss!1204)) (currentByte!8798 thiss!1204) (currentBit!8793 thiss!1204)))))

(declare-fun b!176450 () Bool)

(declare-fun e!122999 () Bool)

(assert (=> b!176450 (= e!122998 e!122999)))

(declare-fun res!146171 () Bool)

(assert (=> b!176450 (=> (not res!146171) (not e!122999))))

(declare-datatypes ((tuple2!15188 0))(
  ( (tuple2!15189 (_1!8239 BitStream!7512) (_2!8239 Bool)) )
))
(declare-fun lt!271673 () tuple2!15188)

(declare-fun lt!271671 () Bool)

(assert (=> b!176450 (= res!146171 (and (= (_2!8239 lt!271673) lt!271671) (= (_1!8239 lt!271673) (_2!8238 lt!271672))))))

(declare-fun readBitPure!0 (BitStream!7512) tuple2!15188)

(declare-fun readerFrom!0 (BitStream!7512 (_ BitVec 32) (_ BitVec 32)) BitStream!7512)

(assert (=> b!176450 (= lt!271673 (readBitPure!0 (readerFrom!0 (_2!8238 lt!271672) (currentBit!8793 thiss!1204) (currentByte!8798 thiss!1204))))))

(declare-fun b!176451 () Bool)

(declare-fun e!123002 () Bool)

(declare-fun array_inv!3943 (array!9526) Bool)

(assert (=> b!176451 (= e!123002 (array_inv!3943 (buf!4645 thiss!1204)))))

(declare-fun res!146172 () Bool)

(declare-fun e!123004 () Bool)

(assert (=> start!39232 (=> (not res!146172) (not e!123004))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!39232 (= res!146172 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39232 e!123004))

(assert (=> start!39232 true))

(declare-fun inv!12 (BitStream!7512) Bool)

(assert (=> start!39232 (and (inv!12 thiss!1204) e!123002)))

(declare-fun b!176452 () Bool)

(declare-fun res!146176 () Bool)

(assert (=> b!176452 (=> (not res!146176) (not e!123004))))

(assert (=> b!176452 (= res!146176 (invariant!0 (currentBit!8793 thiss!1204) (currentByte!8798 thiss!1204) (size!4202 (buf!4645 thiss!1204))))))

(declare-fun b!176453 () Bool)

(declare-fun res!146170 () Bool)

(assert (=> b!176453 (=> (not res!146170) (not e!123004))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176453 (= res!146170 (validate_offset_bits!1 ((_ sign_extend 32) (size!4202 (buf!4645 thiss!1204))) ((_ sign_extend 32) (currentByte!8798 thiss!1204)) ((_ sign_extend 32) (currentBit!8793 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!176454 () Bool)

(declare-fun res!146178 () Bool)

(assert (=> b!176454 (=> (not res!146178) (not e!123004))))

(assert (=> b!176454 (= res!146178 (not (= i!590 nBits!348)))))

(declare-fun b!176455 () Bool)

(declare-fun res!146177 () Bool)

(assert (=> b!176455 (=> (not res!146177) (not e!122998))))

(declare-fun isPrefixOf!0 (BitStream!7512 BitStream!7512) Bool)

(assert (=> b!176455 (= res!146177 (isPrefixOf!0 thiss!1204 (_2!8238 lt!271672)))))

(declare-fun b!176456 () Bool)

(assert (=> b!176456 (= e!123004 (not e!123003))))

(declare-fun res!146175 () Bool)

(assert (=> b!176456 (=> res!146175 e!123003)))

(assert (=> b!176456 (= res!146175 (not (= (bitIndex!0 (size!4202 (buf!4645 (_2!8238 lt!271672))) (currentByte!8798 (_2!8238 lt!271672)) (currentBit!8793 (_2!8238 lt!271672))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4202 (buf!4645 thiss!1204)) (currentByte!8798 thiss!1204) (currentBit!8793 thiss!1204))))))))

(assert (=> b!176456 e!123001))

(declare-fun res!146174 () Bool)

(assert (=> b!176456 (=> (not res!146174) (not e!123001))))

(assert (=> b!176456 (= res!146174 (= (size!4202 (buf!4645 thiss!1204)) (size!4202 (buf!4645 (_2!8238 lt!271672)))))))

(declare-fun appendBit!0 (BitStream!7512 Bool) tuple2!15186)

(assert (=> b!176456 (= lt!271672 (appendBit!0 thiss!1204 lt!271671))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!176456 (= lt!271671 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!176457 () Bool)

(assert (=> b!176457 (= e!122999 (= (bitIndex!0 (size!4202 (buf!4645 (_1!8239 lt!271673))) (currentByte!8798 (_1!8239 lt!271673)) (currentBit!8793 (_1!8239 lt!271673))) lt!271669))))

(assert (= (and start!39232 res!146172) b!176453))

(assert (= (and b!176453 res!146170) b!176452))

(assert (= (and b!176452 res!146176) b!176454))

(assert (= (and b!176454 res!146178) b!176456))

(assert (= (and b!176456 res!146174) b!176449))

(assert (= (and b!176449 res!146173) b!176455))

(assert (= (and b!176455 res!146177) b!176450))

(assert (= (and b!176450 res!146171) b!176457))

(assert (= (and b!176456 (not res!146175)) b!176448))

(assert (= start!39232 b!176451))

(declare-fun m!276553 () Bool)

(assert (=> b!176448 m!276553))

(declare-fun m!276555 () Bool)

(assert (=> b!176456 m!276555))

(declare-fun m!276557 () Bool)

(assert (=> b!176456 m!276557))

(declare-fun m!276559 () Bool)

(assert (=> b!176456 m!276559))

(declare-fun m!276561 () Bool)

(assert (=> b!176455 m!276561))

(declare-fun m!276563 () Bool)

(assert (=> start!39232 m!276563))

(declare-fun m!276565 () Bool)

(assert (=> b!176451 m!276565))

(declare-fun m!276567 () Bool)

(assert (=> b!176450 m!276567))

(assert (=> b!176450 m!276567))

(declare-fun m!276569 () Bool)

(assert (=> b!176450 m!276569))

(declare-fun m!276571 () Bool)

(assert (=> b!176453 m!276571))

(declare-fun m!276573 () Bool)

(assert (=> b!176452 m!276573))

(assert (=> b!176449 m!276555))

(assert (=> b!176449 m!276557))

(declare-fun m!276575 () Bool)

(assert (=> b!176457 m!276575))

(check-sat (not b!176450) (not b!176451) (not b!176457) (not b!176449) (not b!176452) (not start!39232) (not b!176456) (not b!176448) (not b!176455) (not b!176453))
(check-sat)
(get-model)

(declare-fun d!62213 () Bool)

(assert (=> d!62213 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8793 thiss!1204) (currentByte!8798 thiss!1204) (size!4202 (buf!4645 thiss!1204))))))

(declare-fun bs!15523 () Bool)

(assert (= bs!15523 d!62213))

(assert (=> bs!15523 m!276573))

(assert (=> start!39232 d!62213))

(declare-fun d!62215 () Bool)

(declare-fun e!123028 () Bool)

(assert (=> d!62215 e!123028))

(declare-fun res!146211 () Bool)

(assert (=> d!62215 (=> (not res!146211) (not e!123028))))

(declare-fun lt!271704 () (_ BitVec 64))

(declare-fun lt!271701 () (_ BitVec 64))

(declare-fun lt!271705 () (_ BitVec 64))

(assert (=> d!62215 (= res!146211 (= lt!271704 (bvsub lt!271705 lt!271701)))))

(assert (=> d!62215 (or (= (bvand lt!271705 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271701 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271705 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271705 lt!271701) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!62215 (= lt!271701 (remainingBits!0 ((_ sign_extend 32) (size!4202 (buf!4645 (_2!8238 lt!271672)))) ((_ sign_extend 32) (currentByte!8798 (_2!8238 lt!271672))) ((_ sign_extend 32) (currentBit!8793 (_2!8238 lt!271672)))))))

(declare-fun lt!271703 () (_ BitVec 64))

(declare-fun lt!271702 () (_ BitVec 64))

(assert (=> d!62215 (= lt!271705 (bvmul lt!271703 lt!271702))))

(assert (=> d!62215 (or (= lt!271703 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271702 (bvsdiv (bvmul lt!271703 lt!271702) lt!271703)))))

(assert (=> d!62215 (= lt!271702 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62215 (= lt!271703 ((_ sign_extend 32) (size!4202 (buf!4645 (_2!8238 lt!271672)))))))

(assert (=> d!62215 (= lt!271704 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8798 (_2!8238 lt!271672))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8793 (_2!8238 lt!271672)))))))

(assert (=> d!62215 (invariant!0 (currentBit!8793 (_2!8238 lt!271672)) (currentByte!8798 (_2!8238 lt!271672)) (size!4202 (buf!4645 (_2!8238 lt!271672))))))

(assert (=> d!62215 (= (bitIndex!0 (size!4202 (buf!4645 (_2!8238 lt!271672))) (currentByte!8798 (_2!8238 lt!271672)) (currentBit!8793 (_2!8238 lt!271672))) lt!271704)))

(declare-fun b!176492 () Bool)

(declare-fun res!146210 () Bool)

(assert (=> b!176492 (=> (not res!146210) (not e!123028))))

(assert (=> b!176492 (= res!146210 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271704))))

(declare-fun b!176493 () Bool)

(declare-fun lt!271706 () (_ BitVec 64))

(assert (=> b!176493 (= e!123028 (bvsle lt!271704 (bvmul lt!271706 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176493 (or (= lt!271706 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271706 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271706)))))

(assert (=> b!176493 (= lt!271706 ((_ sign_extend 32) (size!4202 (buf!4645 (_2!8238 lt!271672)))))))

(assert (= (and d!62215 res!146211) b!176492))

(assert (= (and b!176492 res!146210) b!176493))

(declare-fun m!276601 () Bool)

(assert (=> d!62215 m!276601))

(assert (=> d!62215 m!276553))

(assert (=> b!176449 d!62215))

(declare-fun d!62217 () Bool)

(declare-fun e!123029 () Bool)

(assert (=> d!62217 e!123029))

(declare-fun res!146213 () Bool)

(assert (=> d!62217 (=> (not res!146213) (not e!123029))))

(declare-fun lt!271711 () (_ BitVec 64))

(declare-fun lt!271707 () (_ BitVec 64))

(declare-fun lt!271710 () (_ BitVec 64))

(assert (=> d!62217 (= res!146213 (= lt!271710 (bvsub lt!271711 lt!271707)))))

(assert (=> d!62217 (or (= (bvand lt!271711 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271707 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271711 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271711 lt!271707) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62217 (= lt!271707 (remainingBits!0 ((_ sign_extend 32) (size!4202 (buf!4645 thiss!1204))) ((_ sign_extend 32) (currentByte!8798 thiss!1204)) ((_ sign_extend 32) (currentBit!8793 thiss!1204))))))

(declare-fun lt!271709 () (_ BitVec 64))

(declare-fun lt!271708 () (_ BitVec 64))

(assert (=> d!62217 (= lt!271711 (bvmul lt!271709 lt!271708))))

(assert (=> d!62217 (or (= lt!271709 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271708 (bvsdiv (bvmul lt!271709 lt!271708) lt!271709)))))

(assert (=> d!62217 (= lt!271708 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62217 (= lt!271709 ((_ sign_extend 32) (size!4202 (buf!4645 thiss!1204))))))

(assert (=> d!62217 (= lt!271710 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8798 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8793 thiss!1204))))))

(assert (=> d!62217 (invariant!0 (currentBit!8793 thiss!1204) (currentByte!8798 thiss!1204) (size!4202 (buf!4645 thiss!1204)))))

(assert (=> d!62217 (= (bitIndex!0 (size!4202 (buf!4645 thiss!1204)) (currentByte!8798 thiss!1204) (currentBit!8793 thiss!1204)) lt!271710)))

(declare-fun b!176494 () Bool)

(declare-fun res!146212 () Bool)

(assert (=> b!176494 (=> (not res!146212) (not e!123029))))

(assert (=> b!176494 (= res!146212 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271710))))

(declare-fun b!176495 () Bool)

(declare-fun lt!271712 () (_ BitVec 64))

(assert (=> b!176495 (= e!123029 (bvsle lt!271710 (bvmul lt!271712 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176495 (or (= lt!271712 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271712 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271712)))))

(assert (=> b!176495 (= lt!271712 ((_ sign_extend 32) (size!4202 (buf!4645 thiss!1204))))))

(assert (= (and d!62217 res!146213) b!176494))

(assert (= (and b!176494 res!146212) b!176495))

(declare-fun m!276603 () Bool)

(assert (=> d!62217 m!276603))

(assert (=> d!62217 m!276573))

(assert (=> b!176449 d!62217))

(declare-fun d!62219 () Bool)

(declare-datatypes ((tuple2!15194 0))(
  ( (tuple2!15195 (_1!8242 Bool) (_2!8242 BitStream!7512)) )
))
(declare-fun lt!271715 () tuple2!15194)

(declare-fun readBit!0 (BitStream!7512) tuple2!15194)

(assert (=> d!62219 (= lt!271715 (readBit!0 (readerFrom!0 (_2!8238 lt!271672) (currentBit!8793 thiss!1204) (currentByte!8798 thiss!1204))))))

(assert (=> d!62219 (= (readBitPure!0 (readerFrom!0 (_2!8238 lt!271672) (currentBit!8793 thiss!1204) (currentByte!8798 thiss!1204))) (tuple2!15189 (_2!8242 lt!271715) (_1!8242 lt!271715)))))

(declare-fun bs!15524 () Bool)

(assert (= bs!15524 d!62219))

(assert (=> bs!15524 m!276567))

(declare-fun m!276605 () Bool)

(assert (=> bs!15524 m!276605))

(assert (=> b!176450 d!62219))

(declare-fun d!62221 () Bool)

(declare-fun e!123032 () Bool)

(assert (=> d!62221 e!123032))

(declare-fun res!146217 () Bool)

(assert (=> d!62221 (=> (not res!146217) (not e!123032))))

(assert (=> d!62221 (= res!146217 (invariant!0 (currentBit!8793 (_2!8238 lt!271672)) (currentByte!8798 (_2!8238 lt!271672)) (size!4202 (buf!4645 (_2!8238 lt!271672)))))))

(assert (=> d!62221 (= (readerFrom!0 (_2!8238 lt!271672) (currentBit!8793 thiss!1204) (currentByte!8798 thiss!1204)) (BitStream!7513 (buf!4645 (_2!8238 lt!271672)) (currentByte!8798 thiss!1204) (currentBit!8793 thiss!1204)))))

(declare-fun b!176498 () Bool)

(assert (=> b!176498 (= e!123032 (invariant!0 (currentBit!8793 thiss!1204) (currentByte!8798 thiss!1204) (size!4202 (buf!4645 (_2!8238 lt!271672)))))))

(assert (= (and d!62221 res!146217) b!176498))

(assert (=> d!62221 m!276553))

(declare-fun m!276607 () Bool)

(assert (=> b!176498 m!276607))

(assert (=> b!176450 d!62221))

(declare-fun d!62223 () Bool)

(declare-fun res!146225 () Bool)

(declare-fun e!123038 () Bool)

(assert (=> d!62223 (=> (not res!146225) (not e!123038))))

(assert (=> d!62223 (= res!146225 (= (size!4202 (buf!4645 thiss!1204)) (size!4202 (buf!4645 (_2!8238 lt!271672)))))))

(assert (=> d!62223 (= (isPrefixOf!0 thiss!1204 (_2!8238 lt!271672)) e!123038)))

(declare-fun b!176505 () Bool)

(declare-fun res!146226 () Bool)

(assert (=> b!176505 (=> (not res!146226) (not e!123038))))

(assert (=> b!176505 (= res!146226 (bvsle (bitIndex!0 (size!4202 (buf!4645 thiss!1204)) (currentByte!8798 thiss!1204) (currentBit!8793 thiss!1204)) (bitIndex!0 (size!4202 (buf!4645 (_2!8238 lt!271672))) (currentByte!8798 (_2!8238 lt!271672)) (currentBit!8793 (_2!8238 lt!271672)))))))

(declare-fun b!176506 () Bool)

(declare-fun e!123037 () Bool)

(assert (=> b!176506 (= e!123038 e!123037)))

(declare-fun res!146224 () Bool)

(assert (=> b!176506 (=> res!146224 e!123037)))

(assert (=> b!176506 (= res!146224 (= (size!4202 (buf!4645 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!176507 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9526 array!9526 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176507 (= e!123037 (arrayBitRangesEq!0 (buf!4645 thiss!1204) (buf!4645 (_2!8238 lt!271672)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4202 (buf!4645 thiss!1204)) (currentByte!8798 thiss!1204) (currentBit!8793 thiss!1204))))))

(assert (= (and d!62223 res!146225) b!176505))

(assert (= (and b!176505 res!146226) b!176506))

(assert (= (and b!176506 (not res!146224)) b!176507))

(assert (=> b!176505 m!276557))

(assert (=> b!176505 m!276555))

(assert (=> b!176507 m!276557))

(assert (=> b!176507 m!276557))

(declare-fun m!276609 () Bool)

(assert (=> b!176507 m!276609))

(assert (=> b!176455 d!62223))

(assert (=> b!176456 d!62215))

(assert (=> b!176456 d!62217))

(declare-fun b!176530 () Bool)

(declare-fun res!146249 () Bool)

(declare-fun e!123052 () Bool)

(assert (=> b!176530 (=> (not res!146249) (not e!123052))))

(declare-fun lt!271730 () tuple2!15186)

(assert (=> b!176530 (= res!146249 (isPrefixOf!0 thiss!1204 (_2!8238 lt!271730)))))

(declare-fun b!176532 () Bool)

(declare-fun e!123053 () Bool)

(declare-fun lt!271728 () tuple2!15188)

(assert (=> b!176532 (= e!123053 (= (bitIndex!0 (size!4202 (buf!4645 (_1!8239 lt!271728))) (currentByte!8798 (_1!8239 lt!271728)) (currentBit!8793 (_1!8239 lt!271728))) (bitIndex!0 (size!4202 (buf!4645 (_2!8238 lt!271730))) (currentByte!8798 (_2!8238 lt!271730)) (currentBit!8793 (_2!8238 lt!271730)))))))

(declare-fun b!176531 () Bool)

(assert (=> b!176531 (= e!123052 e!123053)))

(declare-fun res!146251 () Bool)

(assert (=> b!176531 (=> (not res!146251) (not e!123053))))

(assert (=> b!176531 (= res!146251 (and (= (_2!8239 lt!271728) lt!271671) (= (_1!8239 lt!271728) (_2!8238 lt!271730))))))

(assert (=> b!176531 (= lt!271728 (readBitPure!0 (readerFrom!0 (_2!8238 lt!271730) (currentBit!8793 thiss!1204) (currentByte!8798 thiss!1204))))))

(declare-fun d!62225 () Bool)

(assert (=> d!62225 e!123052))

(declare-fun res!146250 () Bool)

(assert (=> d!62225 (=> (not res!146250) (not e!123052))))

(assert (=> d!62225 (= res!146250 (= (size!4202 (buf!4645 thiss!1204)) (size!4202 (buf!4645 (_2!8238 lt!271730)))))))

(declare-fun choose!16 (BitStream!7512 Bool) tuple2!15186)

(assert (=> d!62225 (= lt!271730 (choose!16 thiss!1204 lt!271671))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!62225 (validate_offset_bit!0 ((_ sign_extend 32) (size!4202 (buf!4645 thiss!1204))) ((_ sign_extend 32) (currentByte!8798 thiss!1204)) ((_ sign_extend 32) (currentBit!8793 thiss!1204)))))

(assert (=> d!62225 (= (appendBit!0 thiss!1204 lt!271671) lt!271730)))

(declare-fun b!176529 () Bool)

(declare-fun res!146248 () Bool)

(assert (=> b!176529 (=> (not res!146248) (not e!123052))))

(declare-fun lt!271727 () (_ BitVec 64))

(declare-fun lt!271729 () (_ BitVec 64))

(assert (=> b!176529 (= res!146248 (= (bitIndex!0 (size!4202 (buf!4645 (_2!8238 lt!271730))) (currentByte!8798 (_2!8238 lt!271730)) (currentBit!8793 (_2!8238 lt!271730))) (bvadd lt!271729 lt!271727)))))

(assert (=> b!176529 (or (not (= (bvand lt!271729 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271727 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!271729 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!271729 lt!271727) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!176529 (= lt!271727 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!176529 (= lt!271729 (bitIndex!0 (size!4202 (buf!4645 thiss!1204)) (currentByte!8798 thiss!1204) (currentBit!8793 thiss!1204)))))

(assert (= (and d!62225 res!146250) b!176529))

(assert (= (and b!176529 res!146248) b!176530))

(assert (= (and b!176530 res!146249) b!176531))

(assert (= (and b!176531 res!146251) b!176532))

(declare-fun m!276617 () Bool)

(assert (=> b!176531 m!276617))

(assert (=> b!176531 m!276617))

(declare-fun m!276619 () Bool)

(assert (=> b!176531 m!276619))

(declare-fun m!276621 () Bool)

(assert (=> d!62225 m!276621))

(declare-fun m!276623 () Bool)

(assert (=> d!62225 m!276623))

(declare-fun m!276625 () Bool)

(assert (=> b!176530 m!276625))

(declare-fun m!276627 () Bool)

(assert (=> b!176532 m!276627))

(declare-fun m!276629 () Bool)

(assert (=> b!176532 m!276629))

(assert (=> b!176529 m!276629))

(assert (=> b!176529 m!276557))

(assert (=> b!176456 d!62225))

(declare-fun d!62243 () Bool)

(assert (=> d!62243 (= (array_inv!3943 (buf!4645 thiss!1204)) (bvsge (size!4202 (buf!4645 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!176451 d!62243))

(declare-fun d!62245 () Bool)

(assert (=> d!62245 (= (invariant!0 (currentBit!8793 thiss!1204) (currentByte!8798 thiss!1204) (size!4202 (buf!4645 thiss!1204))) (and (bvsge (currentBit!8793 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8793 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8798 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8798 thiss!1204) (size!4202 (buf!4645 thiss!1204))) (and (= (currentBit!8793 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8798 thiss!1204) (size!4202 (buf!4645 thiss!1204)))))))))

(assert (=> b!176452 d!62245))

(declare-fun d!62247 () Bool)

(declare-fun e!123056 () Bool)

(assert (=> d!62247 e!123056))

(declare-fun res!146257 () Bool)

(assert (=> d!62247 (=> (not res!146257) (not e!123056))))

(declare-fun lt!271747 () (_ BitVec 64))

(declare-fun lt!271743 () (_ BitVec 64))

(declare-fun lt!271746 () (_ BitVec 64))

(assert (=> d!62247 (= res!146257 (= lt!271746 (bvsub lt!271747 lt!271743)))))

(assert (=> d!62247 (or (= (bvand lt!271747 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271743 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271747 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271747 lt!271743) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62247 (= lt!271743 (remainingBits!0 ((_ sign_extend 32) (size!4202 (buf!4645 (_1!8239 lt!271673)))) ((_ sign_extend 32) (currentByte!8798 (_1!8239 lt!271673))) ((_ sign_extend 32) (currentBit!8793 (_1!8239 lt!271673)))))))

(declare-fun lt!271745 () (_ BitVec 64))

(declare-fun lt!271744 () (_ BitVec 64))

(assert (=> d!62247 (= lt!271747 (bvmul lt!271745 lt!271744))))

(assert (=> d!62247 (or (= lt!271745 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271744 (bvsdiv (bvmul lt!271745 lt!271744) lt!271745)))))

(assert (=> d!62247 (= lt!271744 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62247 (= lt!271745 ((_ sign_extend 32) (size!4202 (buf!4645 (_1!8239 lt!271673)))))))

(assert (=> d!62247 (= lt!271746 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8798 (_1!8239 lt!271673))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8793 (_1!8239 lt!271673)))))))

(assert (=> d!62247 (invariant!0 (currentBit!8793 (_1!8239 lt!271673)) (currentByte!8798 (_1!8239 lt!271673)) (size!4202 (buf!4645 (_1!8239 lt!271673))))))

(assert (=> d!62247 (= (bitIndex!0 (size!4202 (buf!4645 (_1!8239 lt!271673))) (currentByte!8798 (_1!8239 lt!271673)) (currentBit!8793 (_1!8239 lt!271673))) lt!271746)))

(declare-fun b!176537 () Bool)

(declare-fun res!146256 () Bool)

(assert (=> b!176537 (=> (not res!146256) (not e!123056))))

(assert (=> b!176537 (= res!146256 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271746))))

(declare-fun b!176538 () Bool)

(declare-fun lt!271748 () (_ BitVec 64))

(assert (=> b!176538 (= e!123056 (bvsle lt!271746 (bvmul lt!271748 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176538 (or (= lt!271748 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271748 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271748)))))

(assert (=> b!176538 (= lt!271748 ((_ sign_extend 32) (size!4202 (buf!4645 (_1!8239 lt!271673)))))))

(assert (= (and d!62247 res!146257) b!176537))

(assert (= (and b!176537 res!146256) b!176538))

(declare-fun m!276631 () Bool)

(assert (=> d!62247 m!276631))

(declare-fun m!276633 () Bool)

(assert (=> d!62247 m!276633))

(assert (=> b!176457 d!62247))

(declare-fun d!62249 () Bool)

(assert (=> d!62249 (= (invariant!0 (currentBit!8793 (_2!8238 lt!271672)) (currentByte!8798 (_2!8238 lt!271672)) (size!4202 (buf!4645 (_2!8238 lt!271672)))) (and (bvsge (currentBit!8793 (_2!8238 lt!271672)) #b00000000000000000000000000000000) (bvslt (currentBit!8793 (_2!8238 lt!271672)) #b00000000000000000000000000001000) (bvsge (currentByte!8798 (_2!8238 lt!271672)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8798 (_2!8238 lt!271672)) (size!4202 (buf!4645 (_2!8238 lt!271672)))) (and (= (currentBit!8793 (_2!8238 lt!271672)) #b00000000000000000000000000000000) (= (currentByte!8798 (_2!8238 lt!271672)) (size!4202 (buf!4645 (_2!8238 lt!271672))))))))))

(assert (=> b!176448 d!62249))

(declare-fun d!62253 () Bool)

(assert (=> d!62253 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4202 (buf!4645 thiss!1204))) ((_ sign_extend 32) (currentByte!8798 thiss!1204)) ((_ sign_extend 32) (currentBit!8793 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4202 (buf!4645 thiss!1204))) ((_ sign_extend 32) (currentByte!8798 thiss!1204)) ((_ sign_extend 32) (currentBit!8793 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!15527 () Bool)

(assert (= bs!15527 d!62253))

(assert (=> bs!15527 m!276603))

(assert (=> b!176453 d!62253))

(check-sat (not d!62221) (not b!176532) (not b!176529) (not b!176507) (not d!62253) (not d!62247) (not b!176498) (not d!62225) (not d!62217) (not b!176505) (not b!176530) (not b!176531) (not d!62213) (not d!62215) (not d!62219))
