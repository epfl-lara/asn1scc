; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48488 () Bool)

(assert start!48488)

(declare-fun b!229652 () Bool)

(declare-fun e!157627 () Bool)

(declare-fun e!157629 () Bool)

(assert (=> b!229652 (= e!157627 e!157629)))

(declare-fun res!192520 () Bool)

(assert (=> b!229652 (=> (not res!192520) (not e!157629))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!367555 () (_ BitVec 64))

(assert (=> b!229652 (= res!192520 (bvsle bits!86 lt!367555))))

(declare-datatypes ((array!11688 0))(
  ( (array!11689 (arr!6111 (Array (_ BitVec 32) (_ BitVec 8))) (size!5124 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9344 0))(
  ( (BitStream!9345 (buf!5665 array!11688) (currentByte!10600 (_ BitVec 32)) (currentBit!10595 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9344)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229652 (= lt!367555 (bitIndex!0 (size!5124 (buf!5665 b2!99)) (currentByte!10600 b2!99) (currentBit!10595 b2!99)))))

(declare-fun b!229653 () Bool)

(declare-fun res!192523 () Bool)

(declare-fun e!157625 () Bool)

(assert (=> b!229653 (=> (not res!192523) (not e!157625))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b1!101 () BitStream!9344)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!229653 (= res!192523 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5124 (buf!5665 b1!101))) ((_ sign_extend 32) (currentByte!10600 b1!101)) ((_ sign_extend 32) (currentBit!10595 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!229654 () Bool)

(assert (=> b!229654 (= e!157629 e!157625)))

(declare-fun res!192519 () Bool)

(assert (=> b!229654 (=> (not res!192519) (not e!157625))))

(declare-fun lt!367557 () (_ BitVec 64))

(assert (=> b!229654 (= res!192519 (bvsle ((_ extract 31 0) lt!367557) bytes!19))))

(assert (=> b!229654 (= lt!367557 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!229655 () Bool)

(declare-fun lt!367556 () (_ BitVec 64))

(assert (=> b!229655 (= e!157625 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5124 (buf!5665 b1!101)))) lt!367556) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14258 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10600 b2!99))) ((_ sign_extend 32) (currentBit!10595 b2!99))))) (and (= lt!367555 bdg!14258) (= (bvsub lt!367555 bits!86) lt!367556) (let ((bdg!14259 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5124 (buf!5665 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14259 (bvsub bdg!14258 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub bdg!14259 bdg!14258) #b0000000000000000000000000000000000000000000000000000000000001000) lt!367557)) (or (bvsgt ((_ sign_extend 32) (size!5124 (buf!5665 b2!99))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!10600 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!10595 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111))))))))))

(assert (=> b!229655 (= lt!367556 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10600 b1!101))) ((_ sign_extend 32) (currentBit!10595 b1!101))))))

(declare-fun res!192521 () Bool)

(assert (=> start!48488 (=> (not res!192521) (not e!157627))))

(assert (=> start!48488 (= res!192521 (and (= (size!5124 (buf!5665 b1!101)) (size!5124 (buf!5665 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48488 e!157627))

(declare-fun e!157628 () Bool)

(declare-fun inv!12 (BitStream!9344) Bool)

(assert (=> start!48488 (and (inv!12 b1!101) e!157628)))

(declare-fun e!157626 () Bool)

(assert (=> start!48488 (and (inv!12 b2!99) e!157626)))

(assert (=> start!48488 true))

(declare-fun b!229656 () Bool)

(declare-fun res!192518 () Bool)

(assert (=> b!229656 (=> (not res!192518) (not e!157625))))

(assert (=> b!229656 (= res!192518 (= lt!367555 (bvadd (bitIndex!0 (size!5124 (buf!5665 b1!101)) (currentByte!10600 b1!101) (currentBit!10595 b1!101)) bits!86)))))

(declare-fun b!229657 () Bool)

(declare-fun res!192522 () Bool)

(assert (=> b!229657 (=> (not res!192522) (not e!157625))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229657 (= res!192522 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5124 (buf!5665 b1!101))) ((_ sign_extend 32) (currentByte!10600 b1!101)) ((_ sign_extend 32) (currentBit!10595 b1!101)) bytes!19))))

(declare-fun b!229658 () Bool)

(declare-fun array_inv!4865 (array!11688) Bool)

(assert (=> b!229658 (= e!157628 (array_inv!4865 (buf!5665 b1!101)))))

(declare-fun b!229659 () Bool)

(assert (=> b!229659 (= e!157626 (array_inv!4865 (buf!5665 b2!99)))))

(assert (= (and start!48488 res!192521) b!229652))

(assert (= (and b!229652 res!192520) b!229654))

(assert (= (and b!229654 res!192519) b!229657))

(assert (= (and b!229657 res!192522) b!229656))

(assert (= (and b!229656 res!192518) b!229653))

(assert (= (and b!229653 res!192523) b!229655))

(assert (= start!48488 b!229658))

(assert (= start!48488 b!229659))

(declare-fun m!353271 () Bool)

(assert (=> b!229658 m!353271))

(declare-fun m!353273 () Bool)

(assert (=> b!229659 m!353273))

(declare-fun m!353275 () Bool)

(assert (=> b!229656 m!353275))

(declare-fun m!353277 () Bool)

(assert (=> b!229657 m!353277))

(declare-fun m!353279 () Bool)

(assert (=> start!48488 m!353279))

(declare-fun m!353281 () Bool)

(assert (=> start!48488 m!353281))

(declare-fun m!353283 () Bool)

(assert (=> b!229652 m!353283))

(declare-fun m!353285 () Bool)

(assert (=> b!229653 m!353285))

(push 1)

(assert (not b!229656))

(assert (not start!48488))

(assert (not b!229653))

(assert (not b!229652))

(assert (not b!229658))

(assert (not b!229659))

(assert (not b!229657))

(check-sat)

(pop 1)

(push 1)

(check-sat)

