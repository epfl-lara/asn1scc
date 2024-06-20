; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17512 () Bool)

(assert start!17512)

(declare-fun res!69306 () Bool)

(declare-fun e!56418 () Bool)

(assert (=> start!17512 (=> (not res!69306) (not e!56418))))

(declare-fun nBits!333 () (_ BitVec 32))

(assert (=> start!17512 (= res!69306 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000)))))

(assert (=> start!17512 e!56418))

(assert (=> start!17512 true))

(declare-datatypes ((array!4002 0))(
  ( (array!4003 (arr!2448 (Array (_ BitVec 32) (_ BitVec 8))) (size!1811 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3184 0))(
  ( (BitStream!3185 (buf!2201 array!4002) (currentByte!4365 (_ BitVec 32)) (currentBit!4360 (_ BitVec 32))) )
))
(declare-fun thiss!1136 () BitStream!3184)

(declare-fun e!56416 () Bool)

(declare-fun inv!12 (BitStream!3184) Bool)

(assert (=> start!17512 (and (inv!12 thiss!1136) e!56416)))

(declare-fun b!84452 () Bool)

(declare-fun res!69307 () Bool)

(assert (=> b!84452 (=> (not res!69307) (not e!56418))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!84452 (= res!69307 (validate_offset_bits!1 ((_ sign_extend 32) (size!1811 (buf!2201 thiss!1136))) ((_ sign_extend 32) (currentByte!4365 thiss!1136)) ((_ sign_extend 32) (currentBit!4360 thiss!1136)) ((_ sign_extend 32) nBits!333)))))

(declare-fun b!84453 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!84453 (= e!56418 (not (invariant!0 (currentBit!4360 thiss!1136) (currentByte!4365 thiss!1136) (size!1811 (buf!2201 thiss!1136)))))))

(declare-fun b!84454 () Bool)

(declare-fun array_inv!1657 (array!4002) Bool)

(assert (=> b!84454 (= e!56416 (array_inv!1657 (buf!2201 thiss!1136)))))

(assert (= (and start!17512 res!69306) b!84452))

(assert (= (and b!84452 res!69307) b!84453))

(assert (= start!17512 b!84454))

(declare-fun m!131021 () Bool)

(assert (=> start!17512 m!131021))

(declare-fun m!131023 () Bool)

(assert (=> b!84452 m!131023))

(declare-fun m!131025 () Bool)

(assert (=> b!84453 m!131025))

(declare-fun m!131027 () Bool)

(assert (=> b!84454 m!131027))

(push 1)

(assert (not b!84453))

(assert (not b!84454))

(assert (not b!84452))

(assert (not start!17512))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27146 () Bool)

(assert (=> d!27146 (= (invariant!0 (currentBit!4360 thiss!1136) (currentByte!4365 thiss!1136) (size!1811 (buf!2201 thiss!1136))) (and (bvsge (currentBit!4360 thiss!1136) #b00000000000000000000000000000000) (bvslt (currentBit!4360 thiss!1136) #b00000000000000000000000000001000) (bvsge (currentByte!4365 thiss!1136) #b00000000000000000000000000000000) (or (bvslt (currentByte!4365 thiss!1136) (size!1811 (buf!2201 thiss!1136))) (and (= (currentBit!4360 thiss!1136) #b00000000000000000000000000000000) (= (currentByte!4365 thiss!1136) (size!1811 (buf!2201 thiss!1136)))))))))

(assert (=> b!84453 d!27146))

(declare-fun d!27150 () Bool)

(assert (=> d!27150 (= (array_inv!1657 (buf!2201 thiss!1136)) (bvsge (size!1811 (buf!2201 thiss!1136)) #b00000000000000000000000000000000))))

(assert (=> b!84454 d!27150))

(declare-fun d!27156 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27156 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1811 (buf!2201 thiss!1136))) ((_ sign_extend 32) (currentByte!4365 thiss!1136)) ((_ sign_extend 32) (currentBit!4360 thiss!1136)) ((_ sign_extend 32) nBits!333)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1811 (buf!2201 thiss!1136))) ((_ sign_extend 32) (currentByte!4365 thiss!1136)) ((_ sign_extend 32) (currentBit!4360 thiss!1136))) ((_ sign_extend 32) nBits!333)))))

(declare-fun bs!6720 () Bool)

(assert (= bs!6720 d!27156))

(declare-fun m!131047 () Bool)

(assert (=> bs!6720 m!131047))

(assert (=> b!84452 d!27156))

(declare-fun d!27160 () Bool)

(assert (=> d!27160 (= (inv!12 thiss!1136) (invariant!0 (currentBit!4360 thiss!1136) (currentByte!4365 thiss!1136) (size!1811 (buf!2201 thiss!1136))))))

(declare-fun bs!6723 () Bool)

(assert (= bs!6723 d!27160))

(assert (=> bs!6723 m!131025))

(assert (=> start!17512 d!27160))

(push 1)

(assert (not d!27160))

(assert (not d!27156))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

