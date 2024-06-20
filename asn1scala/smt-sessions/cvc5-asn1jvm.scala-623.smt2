; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17668 () Bool)

(assert start!17668)

(declare-fun b!85135 () Bool)

(declare-fun res!69858 () Bool)

(declare-fun e!56743 () Bool)

(assert (=> b!85135 (=> (not res!69858) (not e!56743))))

(declare-datatypes ((array!4044 0))(
  ( (array!4045 (arr!2463 (Array (_ BitVec 32) (_ BitVec 8))) (size!1826 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3214 0))(
  ( (BitStream!3215 (buf!2216 array!4044) (currentByte!4413 (_ BitVec 32)) (currentBit!4408 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3214)

(assert (=> b!85135 (= res!69858 (and (bvsle ((_ sign_extend 32) (size!1826 (buf!2216 thiss!1152))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4413 thiss!1152)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4408 thiss!1152)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1826 (buf!2216 thiss!1152))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4413 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4408 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!85136 () Bool)

(declare-fun res!69856 () Bool)

(assert (=> b!85136 (=> (not res!69856) (not e!56743))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!85136 (= res!69856 (invariant!0 (currentBit!4408 thiss!1152) (currentByte!4413 thiss!1152) (size!1826 (buf!2216 thiss!1152))))))

(declare-fun b!85137 () Bool)

(declare-fun res!69854 () Bool)

(assert (=> b!85137 (=> (not res!69854) (not e!56743))))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!85137 (= res!69854 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!85139 () Bool)

(declare-fun res!69852 () Bool)

(assert (=> b!85139 (=> (not res!69852) (not e!56743))))

(declare-fun thiss!1151 () BitStream!3214)

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!85139 (= res!69852 (and (bvsle i!576 nBits!336) (= (size!1826 (buf!2216 thiss!1152)) (size!1826 (buf!2216 thiss!1151)))))))

(declare-fun b!85140 () Bool)

(declare-fun res!69853 () Bool)

(assert (=> b!85140 (=> (not res!69853) (not e!56743))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!85140 (= res!69853 (validate_offset_bits!1 ((_ sign_extend 32) (size!1826 (buf!2216 thiss!1151))) ((_ sign_extend 32) (currentByte!4413 thiss!1151)) ((_ sign_extend 32) (currentBit!4408 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!85141 () Bool)

(declare-fun e!56745 () Bool)

(declare-fun array_inv!1672 (array!4044) Bool)

(assert (=> b!85141 (= e!56745 (array_inv!1672 (buf!2216 thiss!1151)))))

(declare-fun b!85142 () Bool)

(assert (=> b!85142 (= e!56743 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4408 thiss!1152))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4413 thiss!1152))) ((_ extract 31 0) ((_ sign_extend 32) (size!1826 (buf!2216 thiss!1152)))))))))

(declare-fun b!85143 () Bool)

(declare-fun e!56744 () Bool)

(assert (=> b!85143 (= e!56744 (array_inv!1672 (buf!2216 thiss!1152)))))

(declare-fun b!85144 () Bool)

(declare-fun res!69857 () Bool)

(assert (=> b!85144 (=> (not res!69857) (not e!56743))))

(assert (=> b!85144 (= res!69857 (invariant!0 (currentBit!4408 thiss!1151) (currentByte!4413 thiss!1151) (size!1826 (buf!2216 thiss!1151))))))

(declare-fun res!69859 () Bool)

(assert (=> start!17668 (=> (not res!69859) (not e!56743))))

(assert (=> start!17668 (= res!69859 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17668 e!56743))

(assert (=> start!17668 true))

(declare-fun inv!12 (BitStream!3214) Bool)

(assert (=> start!17668 (and (inv!12 thiss!1151) e!56745)))

(assert (=> start!17668 (and (inv!12 thiss!1152) e!56744)))

(declare-fun b!85138 () Bool)

(declare-fun res!69855 () Bool)

(assert (=> b!85138 (=> (not res!69855) (not e!56743))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!85138 (= res!69855 (= (bitIndex!0 (size!1826 (buf!2216 thiss!1152)) (currentByte!4413 thiss!1152) (currentBit!4408 thiss!1152)) (bvadd (bitIndex!0 (size!1826 (buf!2216 thiss!1151)) (currentByte!4413 thiss!1151) (currentBit!4408 thiss!1151)) ((_ sign_extend 32) i!576))))))

(assert (= (and start!17668 res!69859) b!85140))

(assert (= (and b!85140 res!69853) b!85144))

(assert (= (and b!85144 res!69857) b!85137))

(assert (= (and b!85137 res!69854) b!85136))

(assert (= (and b!85136 res!69856) b!85139))

(assert (= (and b!85139 res!69852) b!85138))

(assert (= (and b!85138 res!69855) b!85135))

(assert (= (and b!85135 res!69858) b!85142))

(assert (= start!17668 b!85141))

(assert (= start!17668 b!85143))

(declare-fun m!131405 () Bool)

(assert (=> b!85140 m!131405))

(declare-fun m!131407 () Bool)

(assert (=> start!17668 m!131407))

(declare-fun m!131409 () Bool)

(assert (=> start!17668 m!131409))

(declare-fun m!131411 () Bool)

(assert (=> b!85138 m!131411))

(declare-fun m!131413 () Bool)

(assert (=> b!85138 m!131413))

(declare-fun m!131415 () Bool)

(assert (=> b!85144 m!131415))

(declare-fun m!131417 () Bool)

(assert (=> b!85142 m!131417))

(declare-fun m!131419 () Bool)

(assert (=> b!85141 m!131419))

(declare-fun m!131421 () Bool)

(assert (=> b!85143 m!131421))

(declare-fun m!131423 () Bool)

(assert (=> b!85136 m!131423))

(push 1)

(assert (not b!85138))

(assert (not start!17668))

(assert (not b!85136))

(assert (not b!85140))

(assert (not b!85141))

(assert (not b!85143))

(assert (not b!85142))

(assert (not b!85144))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

