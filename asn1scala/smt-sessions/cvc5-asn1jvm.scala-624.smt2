; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17674 () Bool)

(assert start!17674)

(declare-fun b!85228 () Bool)

(declare-fun res!69932 () Bool)

(declare-fun e!56786 () Bool)

(assert (=> b!85228 (=> (not res!69932) (not e!56786))))

(declare-datatypes ((array!4050 0))(
  ( (array!4051 (arr!2466 (Array (_ BitVec 32) (_ BitVec 8))) (size!1829 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3220 0))(
  ( (BitStream!3221 (buf!2219 array!4050) (currentByte!4416 (_ BitVec 32)) (currentBit!4411 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3220)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!85228 (= res!69932 (invariant!0 (currentBit!4411 thiss!1152) (currentByte!4416 thiss!1152) (size!1829 (buf!2219 thiss!1152))))))

(declare-fun b!85229 () Bool)

(declare-fun e!56787 () Bool)

(declare-fun thiss!1151 () BitStream!3220)

(declare-fun array_inv!1675 (array!4050) Bool)

(assert (=> b!85229 (= e!56787 (array_inv!1675 (buf!2219 thiss!1151)))))

(declare-fun b!85230 () Bool)

(declare-fun res!69929 () Bool)

(assert (=> b!85230 (=> (not res!69929) (not e!56786))))

(assert (=> b!85230 (= res!69929 (and (bvsle ((_ sign_extend 32) (size!1829 (buf!2219 thiss!1152))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4416 thiss!1152)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4411 thiss!1152)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1829 (buf!2219 thiss!1152))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4416 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4411 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!85231 () Bool)

(declare-fun res!69933 () Bool)

(assert (=> b!85231 (=> (not res!69933) (not e!56786))))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!85231 (= res!69933 (and (bvsle i!576 nBits!336) (= (size!1829 (buf!2219 thiss!1152)) (size!1829 (buf!2219 thiss!1151)))))))

(declare-fun b!85232 () Bool)

(declare-fun res!69930 () Bool)

(assert (=> b!85232 (=> (not res!69930) (not e!56786))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!85232 (= res!69930 (validate_offset_bits!1 ((_ sign_extend 32) (size!1829 (buf!2219 thiss!1151))) ((_ sign_extend 32) (currentByte!4416 thiss!1151)) ((_ sign_extend 32) (currentBit!4411 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!85233 () Bool)

(declare-fun res!69931 () Bool)

(assert (=> b!85233 (=> (not res!69931) (not e!56786))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!85233 (= res!69931 (= (bitIndex!0 (size!1829 (buf!2219 thiss!1152)) (currentByte!4416 thiss!1152) (currentBit!4411 thiss!1152)) (bvadd (bitIndex!0 (size!1829 (buf!2219 thiss!1151)) (currentByte!4416 thiss!1151) (currentBit!4411 thiss!1151)) ((_ sign_extend 32) i!576))))))

(declare-fun b!85234 () Bool)

(declare-fun res!69926 () Bool)

(assert (=> b!85234 (=> (not res!69926) (not e!56786))))

(assert (=> b!85234 (= res!69926 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4411 thiss!1152))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4416 thiss!1152))) ((_ extract 31 0) ((_ sign_extend 32) (size!1829 (buf!2219 thiss!1152))))))))

(declare-fun b!85235 () Bool)

(declare-fun res!69934 () Bool)

(assert (=> b!85235 (=> (not res!69934) (not e!56786))))

(assert (=> b!85235 (= res!69934 (invariant!0 (currentBit!4411 thiss!1151) (currentByte!4416 thiss!1151) (size!1829 (buf!2219 thiss!1151))))))

(declare-fun b!85227 () Bool)

(assert (=> b!85227 (= e!56786 (bvslt ((_ sign_extend 32) (bvsub nBits!336 i!576)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!69927 () Bool)

(assert (=> start!17674 (=> (not res!69927) (not e!56786))))

(assert (=> start!17674 (= res!69927 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17674 e!56786))

(assert (=> start!17674 true))

(declare-fun inv!12 (BitStream!3220) Bool)

(assert (=> start!17674 (and (inv!12 thiss!1151) e!56787)))

(declare-fun e!56788 () Bool)

(assert (=> start!17674 (and (inv!12 thiss!1152) e!56788)))

(declare-fun b!85236 () Bool)

(assert (=> b!85236 (= e!56788 (array_inv!1675 (buf!2219 thiss!1152)))))

(declare-fun b!85237 () Bool)

(declare-fun res!69928 () Bool)

(assert (=> b!85237 (=> (not res!69928) (not e!56786))))

(assert (=> b!85237 (= res!69928 (bvsge i!576 #b00000000000000000000000000000000))))

(assert (= (and start!17674 res!69927) b!85232))

(assert (= (and b!85232 res!69930) b!85235))

(assert (= (and b!85235 res!69934) b!85237))

(assert (= (and b!85237 res!69928) b!85228))

(assert (= (and b!85228 res!69932) b!85231))

(assert (= (and b!85231 res!69933) b!85233))

(assert (= (and b!85233 res!69931) b!85230))

(assert (= (and b!85230 res!69929) b!85234))

(assert (= (and b!85234 res!69926) b!85227))

(assert (= start!17674 b!85229))

(assert (= start!17674 b!85236))

(declare-fun m!131465 () Bool)

(assert (=> b!85232 m!131465))

(declare-fun m!131467 () Bool)

(assert (=> b!85228 m!131467))

(declare-fun m!131469 () Bool)

(assert (=> b!85233 m!131469))

(declare-fun m!131471 () Bool)

(assert (=> b!85233 m!131471))

(declare-fun m!131473 () Bool)

(assert (=> b!85235 m!131473))

(declare-fun m!131475 () Bool)

(assert (=> start!17674 m!131475))

(declare-fun m!131477 () Bool)

(assert (=> start!17674 m!131477))

(declare-fun m!131479 () Bool)

(assert (=> b!85236 m!131479))

(declare-fun m!131481 () Bool)

(assert (=> b!85229 m!131481))

(declare-fun m!131483 () Bool)

(assert (=> b!85234 m!131483))

(push 1)

(assert (not start!17674))

(assert (not b!85235))

(assert (not b!85236))

(assert (not b!85233))

(assert (not b!85232))

(assert (not b!85229))

(assert (not b!85234))

(assert (not b!85228))

(check-sat)

(pop 1)

(push 1)

(check-sat)

