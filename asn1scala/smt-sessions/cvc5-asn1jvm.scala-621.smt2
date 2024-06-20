; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17626 () Bool)

(assert start!17626)

(declare-fun b!84947 () Bool)

(declare-fun res!69706 () Bool)

(declare-fun e!56640 () Bool)

(assert (=> b!84947 (=> (not res!69706) (not e!56640))))

(declare-datatypes ((array!4029 0))(
  ( (array!4030 (arr!2457 (Array (_ BitVec 32) (_ BitVec 8))) (size!1820 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3202 0))(
  ( (BitStream!3203 (buf!2210 array!4029) (currentByte!4398 (_ BitVec 32)) (currentBit!4393 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3202)

(declare-fun thiss!1151 () BitStream!3202)

(declare-fun i!576 () (_ BitVec 32))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!84947 (= res!69706 (= (bitIndex!0 (size!1820 (buf!2210 thiss!1152)) (currentByte!4398 thiss!1152) (currentBit!4393 thiss!1152)) (bvadd (bitIndex!0 (size!1820 (buf!2210 thiss!1151)) (currentByte!4398 thiss!1151) (currentBit!4393 thiss!1151)) ((_ sign_extend 32) i!576))))))

(declare-fun b!84948 () Bool)

(declare-fun e!56639 () Bool)

(declare-fun array_inv!1666 (array!4029) Bool)

(assert (=> b!84948 (= e!56639 (array_inv!1666 (buf!2210 thiss!1151)))))

(declare-fun b!84949 () Bool)

(declare-fun res!69702 () Bool)

(assert (=> b!84949 (=> (not res!69702) (not e!56640))))

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!84949 (= res!69702 (validate_offset_bits!1 ((_ sign_extend 32) (size!1820 (buf!2210 thiss!1151))) ((_ sign_extend 32) (currentByte!4398 thiss!1151)) ((_ sign_extend 32) (currentBit!4393 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!84950 () Bool)

(assert (=> b!84950 (= e!56640 (or (bvsgt ((_ sign_extend 32) (size!1820 (buf!2210 thiss!1152))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4398 thiss!1152)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4393 thiss!1152)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!84951 () Bool)

(declare-fun res!69700 () Bool)

(assert (=> b!84951 (=> (not res!69700) (not e!56640))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!84951 (= res!69700 (invariant!0 (currentBit!4393 thiss!1151) (currentByte!4398 thiss!1151) (size!1820 (buf!2210 thiss!1151))))))

(declare-fun b!84952 () Bool)

(declare-fun res!69701 () Bool)

(assert (=> b!84952 (=> (not res!69701) (not e!56640))))

(assert (=> b!84952 (= res!69701 (and (bvsle i!576 nBits!336) (= (size!1820 (buf!2210 thiss!1152)) (size!1820 (buf!2210 thiss!1151)))))))

(declare-fun b!84953 () Bool)

(declare-fun res!69704 () Bool)

(assert (=> b!84953 (=> (not res!69704) (not e!56640))))

(assert (=> b!84953 (= res!69704 (invariant!0 (currentBit!4393 thiss!1152) (currentByte!4398 thiss!1152) (size!1820 (buf!2210 thiss!1152))))))

(declare-fun b!84954 () Bool)

(declare-fun res!69703 () Bool)

(assert (=> b!84954 (=> (not res!69703) (not e!56640))))

(assert (=> b!84954 (= res!69703 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!84955 () Bool)

(declare-fun e!56643 () Bool)

(assert (=> b!84955 (= e!56643 (array_inv!1666 (buf!2210 thiss!1152)))))

(declare-fun res!69705 () Bool)

(assert (=> start!17626 (=> (not res!69705) (not e!56640))))

(assert (=> start!17626 (= res!69705 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17626 e!56640))

(assert (=> start!17626 true))

(declare-fun inv!12 (BitStream!3202) Bool)

(assert (=> start!17626 (and (inv!12 thiss!1151) e!56639)))

(assert (=> start!17626 (and (inv!12 thiss!1152) e!56643)))

(assert (= (and start!17626 res!69705) b!84949))

(assert (= (and b!84949 res!69702) b!84951))

(assert (= (and b!84951 res!69700) b!84954))

(assert (= (and b!84954 res!69703) b!84953))

(assert (= (and b!84953 res!69704) b!84952))

(assert (= (and b!84952 res!69701) b!84947))

(assert (= (and b!84947 res!69706) b!84950))

(assert (= start!17626 b!84948))

(assert (= start!17626 b!84955))

(declare-fun m!131285 () Bool)

(assert (=> b!84949 m!131285))

(declare-fun m!131287 () Bool)

(assert (=> b!84951 m!131287))

(declare-fun m!131289 () Bool)

(assert (=> b!84955 m!131289))

(declare-fun m!131291 () Bool)

(assert (=> b!84953 m!131291))

(declare-fun m!131293 () Bool)

(assert (=> b!84948 m!131293))

(declare-fun m!131295 () Bool)

(assert (=> b!84947 m!131295))

(declare-fun m!131297 () Bool)

(assert (=> b!84947 m!131297))

(declare-fun m!131299 () Bool)

(assert (=> start!17626 m!131299))

(declare-fun m!131301 () Bool)

(assert (=> start!17626 m!131301))

(push 1)

(assert (not b!84948))

(assert (not b!84951))

(assert (not b!84953))

(assert (not b!84949))

(assert (not b!84955))

(assert (not start!17626))

(assert (not b!84947))

(check-sat)

(pop 1)

(push 1)

(check-sat)

