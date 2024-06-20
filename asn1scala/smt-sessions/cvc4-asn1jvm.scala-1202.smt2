; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34190 () Bool)

(assert start!34190)

(declare-fun res!135727 () Bool)

(declare-fun e!112461 () Bool)

(assert (=> start!34190 (=> (not res!135727) (not e!112461))))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-datatypes ((array!8079 0))(
  ( (array!8080 (arr!4542 (Array (_ BitVec 32) (_ BitVec 8))) (size!3621 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6398 0))(
  ( (BitStream!6399 (buf!4073 array!8079) (currentByte!7591 (_ BitVec 32)) (currentBit!7586 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6398)

(assert (=> start!34190 (= res!135727 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!3621 (buf!4073 thiss!1577))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7591 thiss!1577)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7586 thiss!1577)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3621 (buf!4073 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!7591 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!7586 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!34190 e!112461))

(assert (=> start!34190 true))

(declare-fun e!112462 () Bool)

(declare-fun inv!12 (BitStream!6398) Bool)

(assert (=> start!34190 (and (inv!12 thiss!1577) e!112462)))

(declare-fun b!162915 () Bool)

(declare-fun res!135726 () Bool)

(assert (=> b!162915 (=> (not res!135726) (not e!112461))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!162915 (= res!135726 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7586 thiss!1577))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7591 thiss!1577))) ((_ extract 31 0) ((_ sign_extend 32) (size!3621 (buf!4073 thiss!1577))))))))

(declare-fun b!162916 () Bool)

(assert (=> b!162916 (= e!112461 (bvslt ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!162917 () Bool)

(declare-fun array_inv!3362 (array!8079) Bool)

(assert (=> b!162917 (= e!112462 (array_inv!3362 (buf!4073 thiss!1577)))))

(assert (= (and start!34190 res!135727) b!162915))

(assert (= (and b!162915 res!135726) b!162916))

(assert (= start!34190 b!162917))

(declare-fun m!258685 () Bool)

(assert (=> start!34190 m!258685))

(declare-fun m!258687 () Bool)

(assert (=> b!162915 m!258687))

(declare-fun m!258689 () Bool)

(assert (=> b!162917 m!258689))

(push 1)

(assert (not b!162917))

(assert (not start!34190))

(assert (not b!162915))

(check-sat)

(pop 1)

(push 1)

(check-sat)

