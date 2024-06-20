; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39234 () Bool)

(assert start!39234)

(declare-fun b!176478 () Bool)

(declare-fun res!146204 () Bool)

(declare-fun e!123022 () Bool)

(assert (=> b!176478 (=> (not res!146204) (not e!123022))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!9528 0))(
  ( (array!9529 (arr!5133 (Array (_ BitVec 32) (_ BitVec 8))) (size!4203 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7514 0))(
  ( (BitStream!7515 (buf!4646 array!9528) (currentByte!8799 (_ BitVec 32)) (currentBit!8794 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7514)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176478 (= res!146204 (validate_offset_bits!1 ((_ sign_extend 32) (size!4203 (buf!4646 thiss!1204))) ((_ sign_extend 32) (currentByte!8799 thiss!1204)) ((_ sign_extend 32) (currentBit!8794 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!176479 () Bool)

(declare-fun e!123023 () Bool)

(declare-fun array_inv!3944 (array!9528) Bool)

(assert (=> b!176479 (= e!123023 (array_inv!3944 (buf!4646 thiss!1204)))))

(declare-fun b!176480 () Bool)

(declare-fun res!146205 () Bool)

(declare-fun e!123019 () Bool)

(assert (=> b!176480 (=> (not res!146205) (not e!123019))))

(declare-datatypes ((Unit!12720 0))(
  ( (Unit!12721) )
))
(declare-datatypes ((tuple2!15190 0))(
  ( (tuple2!15191 (_1!8240 Unit!12720) (_2!8240 BitStream!7514)) )
))
(declare-fun lt!271685 () tuple2!15190)

(declare-fun isPrefixOf!0 (BitStream!7514 BitStream!7514) Bool)

(assert (=> b!176480 (= res!146205 (isPrefixOf!0 thiss!1204 (_2!8240 lt!271685)))))

(declare-fun b!176481 () Bool)

(declare-fun res!146199 () Bool)

(assert (=> b!176481 (=> (not res!146199) (not e!123022))))

(assert (=> b!176481 (= res!146199 (not (= i!590 nBits!348)))))

(declare-fun b!176482 () Bool)

(declare-fun e!123020 () Bool)

(assert (=> b!176482 (= e!123022 (not e!123020))))

(declare-fun res!146197 () Bool)

(assert (=> b!176482 (=> res!146197 e!123020)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!176482 (= res!146197 (not (= (bitIndex!0 (size!4203 (buf!4646 (_2!8240 lt!271685))) (currentByte!8799 (_2!8240 lt!271685)) (currentBit!8794 (_2!8240 lt!271685))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4203 (buf!4646 thiss!1204)) (currentByte!8799 thiss!1204) (currentBit!8794 thiss!1204))))))))

(declare-fun e!123025 () Bool)

(assert (=> b!176482 e!123025))

(declare-fun res!146198 () Bool)

(assert (=> b!176482 (=> (not res!146198) (not e!123025))))

(assert (=> b!176482 (= res!146198 (= (size!4203 (buf!4646 thiss!1204)) (size!4203 (buf!4646 (_2!8240 lt!271685)))))))

(declare-fun lt!271688 () Bool)

(declare-fun appendBit!0 (BitStream!7514 Bool) tuple2!15190)

(assert (=> b!176482 (= lt!271685 (appendBit!0 thiss!1204 lt!271688))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!176482 (= lt!271688 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!176483 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!176483 (= e!123020 (invariant!0 (currentBit!8794 (_2!8240 lt!271685)) (currentByte!8799 (_2!8240 lt!271685)) (size!4203 (buf!4646 (_2!8240 lt!271685)))))))

(declare-fun res!146203 () Bool)

(assert (=> start!39234 (=> (not res!146203) (not e!123022))))

(assert (=> start!39234 (= res!146203 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39234 e!123022))

(assert (=> start!39234 true))

(declare-fun inv!12 (BitStream!7514) Bool)

(assert (=> start!39234 (and (inv!12 thiss!1204) e!123023)))

(declare-fun b!176484 () Bool)

(declare-fun e!123021 () Bool)

(assert (=> b!176484 (= e!123019 e!123021)))

(declare-fun res!146202 () Bool)

(assert (=> b!176484 (=> (not res!146202) (not e!123021))))

(declare-datatypes ((tuple2!15192 0))(
  ( (tuple2!15193 (_1!8241 BitStream!7514) (_2!8241 Bool)) )
))
(declare-fun lt!271684 () tuple2!15192)

(assert (=> b!176484 (= res!146202 (and (= (_2!8241 lt!271684) lt!271688) (= (_1!8241 lt!271684) (_2!8240 lt!271685))))))

(declare-fun readBitPure!0 (BitStream!7514) tuple2!15192)

(declare-fun readerFrom!0 (BitStream!7514 (_ BitVec 32) (_ BitVec 32)) BitStream!7514)

(assert (=> b!176484 (= lt!271684 (readBitPure!0 (readerFrom!0 (_2!8240 lt!271685) (currentBit!8794 thiss!1204) (currentByte!8799 thiss!1204))))))

(declare-fun b!176485 () Bool)

(assert (=> b!176485 (= e!123025 e!123019)))

(declare-fun res!146200 () Bool)

(assert (=> b!176485 (=> (not res!146200) (not e!123019))))

(declare-fun lt!271686 () (_ BitVec 64))

(declare-fun lt!271687 () (_ BitVec 64))

(assert (=> b!176485 (= res!146200 (= lt!271686 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!271687)))))

(assert (=> b!176485 (= lt!271686 (bitIndex!0 (size!4203 (buf!4646 (_2!8240 lt!271685))) (currentByte!8799 (_2!8240 lt!271685)) (currentBit!8794 (_2!8240 lt!271685))))))

(assert (=> b!176485 (= lt!271687 (bitIndex!0 (size!4203 (buf!4646 thiss!1204)) (currentByte!8799 thiss!1204) (currentBit!8794 thiss!1204)))))

(declare-fun b!176486 () Bool)

(assert (=> b!176486 (= e!123021 (= (bitIndex!0 (size!4203 (buf!4646 (_1!8241 lt!271684))) (currentByte!8799 (_1!8241 lt!271684)) (currentBit!8794 (_1!8241 lt!271684))) lt!271686))))

(declare-fun b!176487 () Bool)

(declare-fun res!146201 () Bool)

(assert (=> b!176487 (=> (not res!146201) (not e!123022))))

(assert (=> b!176487 (= res!146201 (invariant!0 (currentBit!8794 thiss!1204) (currentByte!8799 thiss!1204) (size!4203 (buf!4646 thiss!1204))))))

(assert (= (and start!39234 res!146203) b!176478))

(assert (= (and b!176478 res!146204) b!176487))

(assert (= (and b!176487 res!146201) b!176481))

(assert (= (and b!176481 res!146199) b!176482))

(assert (= (and b!176482 res!146198) b!176485))

(assert (= (and b!176485 res!146200) b!176480))

(assert (= (and b!176480 res!146205) b!176484))

(assert (= (and b!176484 res!146202) b!176486))

(assert (= (and b!176482 (not res!146197)) b!176483))

(assert (= start!39234 b!176479))

(declare-fun m!276577 () Bool)

(assert (=> b!176484 m!276577))

(assert (=> b!176484 m!276577))

(declare-fun m!276579 () Bool)

(assert (=> b!176484 m!276579))

(declare-fun m!276581 () Bool)

(assert (=> b!176479 m!276581))

(declare-fun m!276583 () Bool)

(assert (=> b!176483 m!276583))

(declare-fun m!276585 () Bool)

(assert (=> start!39234 m!276585))

(declare-fun m!276587 () Bool)

(assert (=> b!176478 m!276587))

(declare-fun m!276589 () Bool)

(assert (=> b!176487 m!276589))

(declare-fun m!276591 () Bool)

(assert (=> b!176480 m!276591))

(declare-fun m!276593 () Bool)

(assert (=> b!176482 m!276593))

(declare-fun m!276595 () Bool)

(assert (=> b!176482 m!276595))

(declare-fun m!276597 () Bool)

(assert (=> b!176482 m!276597))

(assert (=> b!176485 m!276593))

(assert (=> b!176485 m!276595))

(declare-fun m!276599 () Bool)

(assert (=> b!176486 m!276599))

(push 1)

(assert (not start!39234))

(assert (not b!176484))

(assert (not b!176480))

(assert (not b!176487))

(assert (not b!176479))

(assert (not b!176478))

(assert (not b!176486))

(assert (not b!176482))

(assert (not b!176483))

(assert (not b!176485))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!62235 () Bool)

(assert (=> d!62235 (= (array_inv!3944 (buf!4646 thiss!1204)) (bvsge (size!4203 (buf!4646 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!176479 d!62235))

(declare-fun d!62237 () Bool)

(declare-datatypes ((tuple2!15196 0))(
  ( (tuple2!15197 (_1!8243 Bool) (_2!8243 BitStream!7514)) )
))
(declare-fun lt!271718 () tuple2!15196)

(declare-fun readBit!0 (BitStream!7514) tuple2!15196)

(assert (=> d!62237 (= lt!271718 (readBit!0 (readerFrom!0 (_2!8240 lt!271685) (currentBit!8794 thiss!1204) (currentByte!8799 thiss!1204))))))

(assert (=> d!62237 (= (readBitPure!0 (readerFrom!0 (_2!8240 lt!271685) (currentBit!8794 thiss!1204) (currentByte!8799 thiss!1204))) (tuple2!15193 (_2!8243 lt!271718) (_1!8243 lt!271718)))))

(declare-fun bs!15526 () Bool)

(assert (= bs!15526 d!62237))

(assert (=> bs!15526 m!276577))

(declare-fun m!276613 () Bool)

(assert (=> bs!15526 m!276613))

(assert (=> b!176484 d!62237))

(declare-fun d!62239 () Bool)

(declare-fun e!123051 () Bool)

(assert (=> d!62239 e!123051))

(declare-fun res!146247 () Bool)

(assert (=> d!62239 (=> (not res!146247) (not e!123051))))

(assert (=> d!62239 (= res!146247 (invariant!0 (currentBit!8794 (_2!8240 lt!271685)) (currentByte!8799 (_2!8240 lt!271685)) (size!4203 (buf!4646 (_2!8240 lt!271685)))))))

(assert (=> d!62239 (= (readerFrom!0 (_2!8240 lt!271685) (currentBit!8794 thiss!1204) (currentByte!8799 thiss!1204)) (BitStream!7515 (buf!4646 (_2!8240 lt!271685)) (currentByte!8799 thiss!1204) (currentBit!8794 thiss!1204)))))

(declare-fun b!176528 () Bool)

(assert (=> b!176528 (= e!123051 (invariant!0 (currentBit!8794 thiss!1204) (currentByte!8799 thiss!1204) (size!4203 (buf!4646 (_2!8240 lt!271685)))))))

(assert (= (and d!62239 res!146247) b!176528))

(assert (=> d!62239 m!276583))

(declare-fun m!276615 () Bool)

(assert (=> b!176528 m!276615))

(assert (=> b!176484 d!62239))

(declare-fun d!62241 () Bool)

(declare-fun e!123061 () Bool)

(assert (=> d!62241 e!123061))

(declare-fun res!146266 () Bool)

(assert (=> d!62241 (=> (not res!146266) (not e!123061))))

(declare-fun lt!271778 () (_ BitVec 64))

(declare-fun lt!271775 () (_ BitVec 64))

(declare-fun lt!271776 () (_ BitVec 64))

(assert (=> d!62241 (= res!146266 (= lt!271776 (bvsub lt!271775 lt!271778)))))

(assert (=> d!62241 (or (= (bvand lt!271775 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271778 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271775 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271775 lt!271778) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!62241 (= lt!271778 (remainingBits!0 ((_ sign_extend 32) (size!4203 (buf!4646 (_2!8240 lt!271685)))) ((_ sign_extend 32) (currentByte!8799 (_2!8240 lt!271685))) ((_ sign_extend 32) (currentBit!8794 (_2!8240 lt!271685)))))))

(declare-fun lt!271773 () (_ BitVec 64))

(declare-fun lt!271777 () (_ BitVec 64))

(assert (=> d!62241 (= lt!271775 (bvmul lt!271773 lt!271777))))

(assert (=> d!62241 (or (= lt!271773 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271777 (bvsdiv (bvmul lt!271773 lt!271777) lt!271773)))))

(assert (=> d!62241 (= lt!271777 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62241 (= lt!271773 ((_ sign_extend 32) (size!4203 (buf!4646 (_2!8240 lt!271685)))))))

(assert (=> d!62241 (= lt!271776 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8799 (_2!8240 lt!271685))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8794 (_2!8240 lt!271685)))))))

(assert (=> d!62241 (invariant!0 (currentBit!8794 (_2!8240 lt!271685)) (currentByte!8799 (_2!8240 lt!271685)) (size!4203 (buf!4646 (_2!8240 lt!271685))))))

(assert (=> d!62241 (= (bitIndex!0 (size!4203 (buf!4646 (_2!8240 lt!271685))) (currentByte!8799 (_2!8240 lt!271685)) (currentBit!8794 (_2!8240 lt!271685))) lt!271776)))

(declare-fun b!176547 () Bool)

(declare-fun res!146267 () Bool)

(assert (=> b!176547 (=> (not res!146267) (not e!123061))))

(assert (=> b!176547 (= res!146267 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271776))))

(declare-fun b!176548 () Bool)

(declare-fun lt!271774 () (_ BitVec 64))

(assert (=> b!176548 (= e!123061 (bvsle lt!271776 (bvmul lt!271774 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176548 (or (= lt!271774 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271774 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271774)))))

(assert (=> b!176548 (= lt!271774 ((_ sign_extend 32) (size!4203 (buf!4646 (_2!8240 lt!271685)))))))

(assert (= (and d!62241 res!146266) b!176547))

(assert (= (and b!176547 res!146267) b!176548))

(declare-fun m!276639 () Bool)

(assert (=> d!62241 m!276639))

(assert (=> d!62241 m!276583))

(assert (=> b!176485 d!62241))

(declare-fun d!62261 () Bool)

(declare-fun e!123062 () Bool)

(assert (=> d!62261 e!123062))

(declare-fun res!146268 () Bool)

(assert (=> d!62261 (=> (not res!146268) (not e!123062))))

(declare-fun lt!271781 () (_ BitVec 64))

(declare-fun lt!271782 () (_ BitVec 64))

(declare-fun lt!271784 () (_ BitVec 64))

(assert (=> d!62261 (= res!146268 (= lt!271782 (bvsub lt!271781 lt!271784)))))

(assert (=> d!62261 (or (= (bvand lt!271781 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271784 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271781 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271781 lt!271784) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62261 (= lt!271784 (remainingBits!0 ((_ sign_extend 32) (size!4203 (buf!4646 thiss!1204))) ((_ sign_extend 32) (currentByte!8799 thiss!1204)) ((_ sign_extend 32) (currentBit!8794 thiss!1204))))))

(declare-fun lt!271779 () (_ BitVec 64))

(declare-fun lt!271783 () (_ BitVec 64))

(assert (=> d!62261 (= lt!271781 (bvmul lt!271779 lt!271783))))

(assert (=> d!62261 (or (= lt!271779 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271783 (bvsdiv (bvmul lt!271779 lt!271783) lt!271779)))))

(assert (=> d!62261 (= lt!271783 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62261 (= lt!271779 ((_ sign_extend 32) (size!4203 (buf!4646 thiss!1204))))))

(assert (=> d!62261 (= lt!271782 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8799 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8794 thiss!1204))))))

(assert (=> d!62261 (invariant!0 (currentBit!8794 thiss!1204) (currentByte!8799 thiss!1204) (size!4203 (buf!4646 thiss!1204)))))

(assert (=> d!62261 (= (bitIndex!0 (size!4203 (buf!4646 thiss!1204)) (currentByte!8799 thiss!1204) (currentBit!8794 thiss!1204)) lt!271782)))

(declare-fun b!176549 () Bool)

(declare-fun res!146269 () Bool)

(assert (=> b!176549 (=> (not res!146269) (not e!123062))))

(assert (=> b!176549 (= res!146269 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271782))))

(declare-fun b!176550 () Bool)

(declare-fun lt!271780 () (_ BitVec 64))

(assert (=> b!176550 (= e!123062 (bvsle lt!271782 (bvmul lt!271780 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176550 (or (= lt!271780 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271780 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271780)))))

(assert (=> b!176550 (= lt!271780 ((_ sign_extend 32) (size!4203 (buf!4646 thiss!1204))))))

(assert (= (and d!62261 res!146268) b!176549))

(assert (= (and b!176549 res!146269) b!176550))

(declare-fun m!276641 () Bool)

(assert (=> d!62261 m!276641))

(assert (=> d!62261 m!276589))

(assert (=> b!176485 d!62261))

(declare-fun d!62263 () Bool)

(assert (=> d!62263 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8794 thiss!1204) (currentByte!8799 thiss!1204) (size!4203 (buf!4646 thiss!1204))))))

(declare-fun bs!15529 () Bool)

(assert (= bs!15529 d!62263))

(assert (=> bs!15529 m!276589))

(assert (=> start!39234 d!62263))

(declare-fun d!62265 () Bool)

(declare-fun res!146277 () Bool)

(declare-fun e!123067 () Bool)

(assert (=> d!62265 (=> (not res!146277) (not e!123067))))

(assert (=> d!62265 (= res!146277 (= (size!4203 (buf!4646 thiss!1204)) (size!4203 (buf!4646 (_2!8240 lt!271685)))))))

(assert (=> d!62265 (= (isPrefixOf!0 thiss!1204 (_2!8240 lt!271685)) e!123067)))

(declare-fun b!176557 () Bool)

(declare-fun res!146276 () Bool)

(assert (=> b!176557 (=> (not res!146276) (not e!123067))))

(assert (=> b!176557 (= res!146276 (bvsle (bitIndex!0 (size!4203 (buf!4646 thiss!1204)) (currentByte!8799 thiss!1204) (currentBit!8794 thiss!1204)) (bitIndex!0 (size!4203 (buf!4646 (_2!8240 lt!271685))) (currentByte!8799 (_2!8240 lt!271685)) (currentBit!8794 (_2!8240 lt!271685)))))))

(declare-fun b!176558 () Bool)

(declare-fun e!123068 () Bool)

(assert (=> b!176558 (= e!123067 e!123068)))

(declare-fun res!146278 () Bool)

(assert (=> b!176558 (=> res!146278 e!123068)))

(assert (=> b!176558 (= res!146278 (= (size!4203 (buf!4646 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!176559 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9528 array!9528 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176559 (= e!123068 (arrayBitRangesEq!0 (buf!4646 thiss!1204) (buf!4646 (_2!8240 lt!271685)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4203 (buf!4646 thiss!1204)) (currentByte!8799 thiss!1204) (currentBit!8794 thiss!1204))))))

(assert (= (and d!62265 res!146277) b!176557))

(assert (= (and b!176557 res!146276) b!176558))

(assert (= (and b!176558 (not res!146278)) b!176559))

(assert (=> b!176557 m!276595))

(assert (=> b!176557 m!276593))

(assert (=> b!176559 m!276595))

(assert (=> b!176559 m!276595))

(declare-fun m!276643 () Bool)

(assert (=> b!176559 m!276643))

(assert (=> b!176480 d!62265))

(declare-fun d!62267 () Bool)

(declare-fun e!123069 () Bool)

(assert (=> d!62267 e!123069))

(declare-fun res!146279 () Bool)

(assert (=> d!62267 (=> (not res!146279) (not e!123069))))

(declare-fun lt!271788 () (_ BitVec 64))

(declare-fun lt!271790 () (_ BitVec 64))

(declare-fun lt!271787 () (_ BitVec 64))

(assert (=> d!62267 (= res!146279 (= lt!271788 (bvsub lt!271787 lt!271790)))))

(assert (=> d!62267 (or (= (bvand lt!271787 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271790 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271787 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271787 lt!271790) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62267 (= lt!271790 (remainingBits!0 ((_ sign_extend 32) (size!4203 (buf!4646 (_1!8241 lt!271684)))) ((_ sign_extend 32) (currentByte!8799 (_1!8241 lt!271684))) ((_ sign_extend 32) (currentBit!8794 (_1!8241 lt!271684)))))))

(declare-fun lt!271785 () (_ BitVec 64))

(declare-fun lt!271789 () (_ BitVec 64))

(assert (=> d!62267 (= lt!271787 (bvmul lt!271785 lt!271789))))

(assert (=> d!62267 (or (= lt!271785 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271789 (bvsdiv (bvmul lt!271785 lt!271789) lt!271785)))))

(assert (=> d!62267 (= lt!271789 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62267 (= lt!271785 ((_ sign_extend 32) (size!4203 (buf!4646 (_1!8241 lt!271684)))))))

(assert (=> d!62267 (= lt!271788 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8799 (_1!8241 lt!271684))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8794 (_1!8241 lt!271684)))))))

(assert (=> d!62267 (invariant!0 (currentBit!8794 (_1!8241 lt!271684)) (currentByte!8799 (_1!8241 lt!271684)) (size!4203 (buf!4646 (_1!8241 lt!271684))))))

(assert (=> d!62267 (= (bitIndex!0 (size!4203 (buf!4646 (_1!8241 lt!271684))) (currentByte!8799 (_1!8241 lt!271684)) (currentBit!8794 (_1!8241 lt!271684))) lt!271788)))

(declare-fun b!176560 () Bool)

(declare-fun res!146280 () Bool)

(assert (=> b!176560 (=> (not res!146280) (not e!123069))))

(assert (=> b!176560 (= res!146280 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271788))))

(declare-fun b!176561 () Bool)

(declare-fun lt!271786 () (_ BitVec 64))

(assert (=> b!176561 (= e!123069 (bvsle lt!271788 (bvmul lt!271786 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176561 (or (= lt!271786 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271786 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271786)))))

(assert (=> b!176561 (= lt!271786 ((_ sign_extend 32) (size!4203 (buf!4646 (_1!8241 lt!271684)))))))

(assert (= (and d!62267 res!146279) b!176560))

(assert (= (and b!176560 res!146280) b!176561))

(declare-fun m!276645 () Bool)

(assert (=> d!62267 m!276645))

(declare-fun m!276647 () Bool)

(assert (=> d!62267 m!276647))

(assert (=> b!176486 d!62267))

(declare-fun d!62269 () Bool)

(assert (=> d!62269 (= (invariant!0 (currentBit!8794 thiss!1204) (currentByte!8799 thiss!1204) (size!4203 (buf!4646 thiss!1204))) (and (bvsge (currentBit!8794 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8794 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8799 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8799 thiss!1204) (size!4203 (buf!4646 thiss!1204))) (and (= (currentBit!8794 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8799 thiss!1204) (size!4203 (buf!4646 thiss!1204)))))))))

(assert (=> b!176487 d!62269))

(assert (=> b!176482 d!62241))

(assert (=> b!176482 d!62261))

(declare-fun b!176589 () Bool)

(declare-fun res!146308 () Bool)

(declare-fun e!123085 () Bool)

(assert (=> b!176589 (=> (not res!146308) (not e!123085))))

(declare-fun lt!271823 () tuple2!15190)

(declare-fun lt!271820 () (_ BitVec 64))

(declare-fun lt!271822 () (_ BitVec 64))

(assert (=> b!176589 (= res!146308 (= (bitIndex!0 (size!4203 (buf!4646 (_2!8240 lt!271823))) (currentByte!8799 (_2!8240 lt!271823)) (currentBit!8794 (_2!8240 lt!271823))) (bvadd lt!271820 lt!271822)))))

(assert (=> b!176589 (or (not (= (bvand lt!271820 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271822 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!271820 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!271820 lt!271822) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!176589 (= lt!271822 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!176589 (= lt!271820 (bitIndex!0 (size!4203 (buf!4646 thiss!1204)) (currentByte!8799 thiss!1204) (currentBit!8794 thiss!1204)))))

(declare-fun b!176592 () Bool)

(declare-fun e!123084 () Bool)

(declare-fun lt!271821 () tuple2!15192)

(assert (=> b!176592 (= e!123084 (= (bitIndex!0 (size!4203 (buf!4646 (_1!8241 lt!271821))) (currentByte!8799 (_1!8241 lt!271821)) (currentBit!8794 (_1!8241 lt!271821))) (bitIndex!0 (size!4203 (buf!4646 (_2!8240 lt!271823))) (currentByte!8799 (_2!8240 lt!271823)) (currentBit!8794 (_2!8240 lt!271823)))))))

(declare-fun b!176591 () Bool)

(assert (=> b!176591 (= e!123085 e!123084)))

(declare-fun res!146309 () Bool)

(assert (=> b!176591 (=> (not res!146309) (not e!123084))))

(assert (=> b!176591 (= res!146309 (and (= (_2!8241 lt!271821) lt!271688) (= (_1!8241 lt!271821) (_2!8240 lt!271823))))))

(assert (=> b!176591 (= lt!271821 (readBitPure!0 (readerFrom!0 (_2!8240 lt!271823) (currentBit!8794 thiss!1204) (currentByte!8799 thiss!1204))))))

(declare-fun d!62271 () Bool)

(assert (=> d!62271 e!123085))

(declare-fun res!146307 () Bool)

(assert (=> d!62271 (=> (not res!146307) (not e!123085))))

(assert (=> d!62271 (= res!146307 (= (size!4203 (buf!4646 thiss!1204)) (size!4203 (buf!4646 (_2!8240 lt!271823)))))))

(declare-fun choose!16 (BitStream!7514 Bool) tuple2!15190)

(assert (=> d!62271 (= lt!271823 (choose!16 thiss!1204 lt!271688))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!62271 (validate_offset_bit!0 ((_ sign_extend 32) (size!4203 (buf!4646 thiss!1204))) ((_ sign_extend 32) (currentByte!8799 thiss!1204)) ((_ sign_extend 32) (currentBit!8794 thiss!1204)))))

(assert (=> d!62271 (= (appendBit!0 thiss!1204 lt!271688) lt!271823)))

(declare-fun b!176590 () Bool)

(declare-fun res!146310 () Bool)

(assert (=> b!176590 (=> (not res!146310) (not e!123085))))

(assert (=> b!176590 (= res!146310 (isPrefixOf!0 thiss!1204 (_2!8240 lt!271823)))))

(assert (= (and d!62271 res!146307) b!176589))

(assert (= (and b!176589 res!146308) b!176590))

(assert (= (and b!176590 res!146310) b!176591))

(assert (= (and b!176591 res!146309) b!176592))

(declare-fun m!276671 () Bool)

(assert (=> d!62271 m!276671))

(declare-fun m!276673 () Bool)

(assert (=> d!62271 m!276673))

(declare-fun m!276675 () Bool)

(assert (=> b!176591 m!276675))

(assert (=> b!176591 m!276675))

(declare-fun m!276677 () Bool)

(assert (=> b!176591 m!276677))

(declare-fun m!276679 () Bool)

(assert (=> b!176592 m!276679))

(declare-fun m!276681 () Bool)

(assert (=> b!176592 m!276681))

(assert (=> b!176589 m!276681))

(assert (=> b!176589 m!276595))

(declare-fun m!276683 () Bool)

(assert (=> b!176590 m!276683))

(assert (=> b!176482 d!62271))

(declare-fun d!62281 () Bool)

(assert (=> d!62281 (= (invariant!0 (currentBit!8794 (_2!8240 lt!271685)) (currentByte!8799 (_2!8240 lt!271685)) (size!4203 (buf!4646 (_2!8240 lt!271685)))) (and (bvsge (currentBit!8794 (_2!8240 lt!271685)) #b00000000000000000000000000000000) (bvslt (currentBit!8794 (_2!8240 lt!271685)) #b00000000000000000000000000001000) (bvsge (currentByte!8799 (_2!8240 lt!271685)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8799 (_2!8240 lt!271685)) (size!4203 (buf!4646 (_2!8240 lt!271685)))) (and (= (currentBit!8794 (_2!8240 lt!271685)) #b00000000000000000000000000000000) (= (currentByte!8799 (_2!8240 lt!271685)) (size!4203 (buf!4646 (_2!8240 lt!271685))))))))))

