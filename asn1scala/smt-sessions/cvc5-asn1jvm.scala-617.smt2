; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17506 () Bool)

(assert start!17506)

(declare-fun b!84404 () Bool)

(declare-fun e!56384 () Bool)

(declare-datatypes ((array!3996 0))(
  ( (array!3997 (arr!2445 (Array (_ BitVec 32) (_ BitVec 8))) (size!1808 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3178 0))(
  ( (BitStream!3179 (buf!2198 array!3996) (currentByte!4362 (_ BitVec 32)) (currentBit!4357 (_ BitVec 32))) )
))
(declare-fun thiss!1136 () BitStream!3178)

(declare-fun array_inv!1654 (array!3996) Bool)

(assert (=> b!84404 (= e!56384 (array_inv!1654 (buf!2198 thiss!1136)))))

(declare-fun b!84405 () Bool)

(declare-fun nBits!333 () (_ BitVec 32))

(declare-fun v!176 () (_ BitVec 64))

(declare-datatypes ((Unit!5653 0))(
  ( (Unit!5654) )
))
(declare-datatypes ((tuple3!364 0))(
  ( (tuple3!365 (_1!3826 Unit!5653) (_2!3826 BitStream!3178) (_3!206 (_ BitVec 32))) )
))
(declare-fun e!56385 () tuple3!364)

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3178 (_ BitVec 64) BitStream!3178 (_ BitVec 32)) tuple3!364)

(assert (=> b!84405 (= e!56385 (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 thiss!1136 #b00000000000000000000000000000000))))

(declare-fun b!84406 () Bool)

(declare-fun res!69283 () Bool)

(declare-fun e!56382 () Bool)

(assert (=> b!84406 (=> (not res!69283) (not e!56382))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!84406 (= res!69283 (validate_offset_bits!1 ((_ sign_extend 32) (size!1808 (buf!2198 thiss!1136))) ((_ sign_extend 32) (currentByte!4362 thiss!1136)) ((_ sign_extend 32) (currentBit!4357 thiss!1136)) ((_ sign_extend 32) nBits!333)))))

(declare-fun b!84407 () Bool)

(assert (=> b!84407 (= e!56382 false)))

(declare-fun lt!134253 () tuple3!364)

(assert (=> b!84407 (= lt!134253 e!56385)))

(declare-fun c!5807 () Bool)

(assert (=> b!84407 (= c!5807 (bvslt #b00000000000000000000000000000000 nBits!333))))

(declare-fun res!69282 () Bool)

(assert (=> start!17506 (=> (not res!69282) (not e!56382))))

(assert (=> start!17506 (= res!69282 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000)))))

(assert (=> start!17506 e!56382))

(assert (=> start!17506 true))

(declare-fun inv!12 (BitStream!3178) Bool)

(assert (=> start!17506 (and (inv!12 thiss!1136) e!56384)))

(declare-fun b!84408 () Bool)

(declare-fun Unit!5655 () Unit!5653)

(assert (=> b!84408 (= e!56385 (tuple3!365 Unit!5655 thiss!1136 #b00000000000000000000000000000000))))

(declare-fun b!84409 () Bool)

(declare-fun res!69281 () Bool)

(assert (=> b!84409 (=> (not res!69281) (not e!56382))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!84409 (= res!69281 (invariant!0 (currentBit!4357 thiss!1136) (currentByte!4362 thiss!1136) (size!1808 (buf!2198 thiss!1136))))))

(assert (= (and start!17506 res!69282) b!84406))

(assert (= (and b!84406 res!69283) b!84409))

(assert (= (and b!84409 res!69281) b!84407))

(assert (= (and b!84407 c!5807) b!84405))

(assert (= (and b!84407 (not c!5807)) b!84408))

(assert (= start!17506 b!84404))

(declare-fun m!130991 () Bool)

(assert (=> b!84409 m!130991))

(declare-fun m!130993 () Bool)

(assert (=> b!84406 m!130993))

(declare-fun m!130995 () Bool)

(assert (=> start!17506 m!130995))

(declare-fun m!130997 () Bool)

(assert (=> b!84404 m!130997))

(declare-fun m!130999 () Bool)

(assert (=> b!84405 m!130999))

(push 1)

(assert (not b!84409))

(assert (not start!17506))

(assert (not b!84406))

(assert (not b!84405))

(assert (not b!84404))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

