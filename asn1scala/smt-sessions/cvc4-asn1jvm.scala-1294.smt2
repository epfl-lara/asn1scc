; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36854 () Bool)

(assert start!36854)

(declare-fun res!140287 () Bool)

(declare-fun e!117159 () Bool)

(assert (=> start!36854 (=> (not res!140287) (not e!117159))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!36854 (= res!140287 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36854 e!117159))

(assert (=> start!36854 true))

(declare-datatypes ((array!8788 0))(
  ( (array!8789 (arr!4818 (Array (_ BitVec 32) (_ BitVec 8))) (size!3897 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6950 0))(
  ( (BitStream!6951 (buf!4349 array!8788) (currentByte!8252 (_ BitVec 32)) (currentBit!8247 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6950)

(declare-fun e!117158 () Bool)

(declare-fun inv!12 (BitStream!6950) Bool)

(assert (=> start!36854 (and (inv!12 thiss!1894) e!117158)))

(declare-fun b!168598 () Bool)

(declare-fun res!140288 () Bool)

(assert (=> b!168598 (=> (not res!140288) (not e!117159))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168598 (= res!140288 (validate_offset_bits!1 ((_ sign_extend 32) (size!3897 (buf!4349 thiss!1894))) ((_ sign_extend 32) (currentByte!8252 thiss!1894)) ((_ sign_extend 32) (currentBit!8247 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168599 () Bool)

(assert (=> b!168599 (= e!117159 (and (bvsle (bvadd (currentBit!8247 thiss!1894) nBits!600) #b00000000000000000000000000001000) (bvsgt (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!8247 thiss!1894) nBits!600)) #b00000000000000000000000000100000)))))

(declare-fun b!168600 () Bool)

(declare-fun array_inv!3638 (array!8788) Bool)

(assert (=> b!168600 (= e!117158 (array_inv!3638 (buf!4349 thiss!1894)))))

(assert (= (and start!36854 res!140287) b!168598))

(assert (= (and b!168598 res!140288) b!168599))

(assert (= start!36854 b!168600))

(declare-fun m!268185 () Bool)

(assert (=> start!36854 m!268185))

(declare-fun m!268187 () Bool)

(assert (=> b!168598 m!268187))

(declare-fun m!268189 () Bool)

(assert (=> b!168600 m!268189))

(push 1)

(assert (not b!168598))

(assert (not b!168600))

(assert (not start!36854))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59451 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59451 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3897 (buf!4349 thiss!1894))) ((_ sign_extend 32) (currentByte!8252 thiss!1894)) ((_ sign_extend 32) (currentBit!8247 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3897 (buf!4349 thiss!1894))) ((_ sign_extend 32) (currentByte!8252 thiss!1894)) ((_ sign_extend 32) (currentBit!8247 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14725 () Bool)

(assert (= bs!14725 d!59451))

(declare-fun m!268199 () Bool)

(assert (=> bs!14725 m!268199))

(assert (=> b!168598 d!59451))

(declare-fun d!59455 () Bool)

(assert (=> d!59455 (= (array_inv!3638 (buf!4349 thiss!1894)) (bvsge (size!3897 (buf!4349 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168600 d!59455))

(declare-fun d!59457 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59457 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8247 thiss!1894) (currentByte!8252 thiss!1894) (size!3897 (buf!4349 thiss!1894))))))

(declare-fun bs!14726 () Bool)

(assert (= bs!14726 d!59457))

(declare-fun m!268201 () Bool)

(assert (=> bs!14726 m!268201))

(assert (=> start!36854 d!59457))

(push 1)

(assert (not d!59451))

(assert (not d!59457))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

