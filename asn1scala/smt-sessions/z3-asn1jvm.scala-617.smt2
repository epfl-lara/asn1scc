; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17508 () Bool)

(assert start!17508)

(declare-fun b!84422 () Bool)

(declare-datatypes ((Unit!5656 0))(
  ( (Unit!5657) )
))
(declare-datatypes ((array!3998 0))(
  ( (array!3999 (arr!2446 (Array (_ BitVec 32) (_ BitVec 8))) (size!1809 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3180 0))(
  ( (BitStream!3181 (buf!2199 array!3998) (currentByte!4363 (_ BitVec 32)) (currentBit!4358 (_ BitVec 32))) )
))
(declare-datatypes ((tuple3!366 0))(
  ( (tuple3!367 (_1!3827 Unit!5656) (_2!3827 BitStream!3180) (_3!207 (_ BitVec 32))) )
))
(declare-fun e!56395 () tuple3!366)

(declare-fun nBits!333 () (_ BitVec 32))

(declare-fun thiss!1136 () BitStream!3180)

(declare-fun v!176 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3180 (_ BitVec 64) BitStream!3180 (_ BitVec 32)) tuple3!366)

(assert (=> b!84422 (= e!56395 (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 thiss!1136 #b00000000000000000000000000000000))))

(declare-fun b!84423 () Bool)

(declare-fun e!56394 () Bool)

(assert (=> b!84423 (= e!56394 false)))

(declare-fun lt!134256 () tuple3!366)

(assert (=> b!84423 (= lt!134256 e!56395)))

(declare-fun c!5810 () Bool)

(assert (=> b!84423 (= c!5810 (bvslt #b00000000000000000000000000000000 nBits!333))))

(declare-fun b!84424 () Bool)

(declare-fun res!69291 () Bool)

(assert (=> b!84424 (=> (not res!69291) (not e!56394))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!84424 (= res!69291 (validate_offset_bits!1 ((_ sign_extend 32) (size!1809 (buf!2199 thiss!1136))) ((_ sign_extend 32) (currentByte!4363 thiss!1136)) ((_ sign_extend 32) (currentBit!4358 thiss!1136)) ((_ sign_extend 32) nBits!333)))))

(declare-fun b!84425 () Bool)

(declare-fun Unit!5658 () Unit!5656)

(assert (=> b!84425 (= e!56395 (tuple3!367 Unit!5658 thiss!1136 #b00000000000000000000000000000000))))

(declare-fun res!69292 () Bool)

(assert (=> start!17508 (=> (not res!69292) (not e!56394))))

(assert (=> start!17508 (= res!69292 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000)))))

(assert (=> start!17508 e!56394))

(assert (=> start!17508 true))

(declare-fun e!56397 () Bool)

(declare-fun inv!12 (BitStream!3180) Bool)

(assert (=> start!17508 (and (inv!12 thiss!1136) e!56397)))

(declare-fun b!84426 () Bool)

(declare-fun res!69290 () Bool)

(assert (=> b!84426 (=> (not res!69290) (not e!56394))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!84426 (= res!69290 (invariant!0 (currentBit!4358 thiss!1136) (currentByte!4363 thiss!1136) (size!1809 (buf!2199 thiss!1136))))))

(declare-fun b!84427 () Bool)

(declare-fun array_inv!1655 (array!3998) Bool)

(assert (=> b!84427 (= e!56397 (array_inv!1655 (buf!2199 thiss!1136)))))

(assert (= (and start!17508 res!69292) b!84424))

(assert (= (and b!84424 res!69291) b!84426))

(assert (= (and b!84426 res!69290) b!84423))

(assert (= (and b!84423 c!5810) b!84422))

(assert (= (and b!84423 (not c!5810)) b!84425))

(assert (= start!17508 b!84427))

(declare-fun m!131001 () Bool)

(assert (=> b!84427 m!131001))

(declare-fun m!131003 () Bool)

(assert (=> start!17508 m!131003))

(declare-fun m!131005 () Bool)

(assert (=> b!84424 m!131005))

(declare-fun m!131007 () Bool)

(assert (=> b!84422 m!131007))

(declare-fun m!131009 () Bool)

(assert (=> b!84426 m!131009))

(check-sat (not b!84427) (not b!84422) (not b!84424) (not b!84426) (not start!17508))
