; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65346 () Bool)

(assert start!65346)

(declare-fun res!242110 () Bool)

(declare-fun e!209311 () Bool)

(assert (=> start!65346 (=> (not res!242110) (not e!209311))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17494 0))(
  ( (array!17495 (arr!8606 (Array (_ BitVec 32) (_ BitVec 8))) (size!7580 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17494)

(assert (=> start!65346 (= res!242110 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7580 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65346 e!209311))

(declare-datatypes ((BitStream!13164 0))(
  ( (BitStream!13165 (buf!7643 array!17494) (currentByte!14107 (_ BitVec 32)) (currentBit!14102 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13164)

(declare-fun e!209313 () Bool)

(declare-fun inv!12 (BitStream!13164) Bool)

(assert (=> start!65346 (and (inv!12 thiss!1728) e!209313)))

(assert (=> start!65346 true))

(declare-fun array_inv!7192 (array!17494) Bool)

(assert (=> start!65346 (array_inv!7192 arr!273)))

(declare-fun b!293174 () Bool)

(declare-fun e!209309 () Bool)

(assert (=> b!293174 (= e!209311 e!209309)))

(declare-fun res!242111 () Bool)

(assert (=> b!293174 (=> (not res!242111) (not e!209309))))

(declare-datatypes ((tuple2!22990 0))(
  ( (tuple2!22991 (_1!12800 Bool) (_2!12800 BitStream!13164)) )
))
(declare-fun readBit!0 (BitStream!13164) tuple2!22990)

(assert (=> b!293174 (= res!242111 (_1!12800 (readBit!0 thiss!1728)))))

(declare-fun lt!425199 () (_ BitVec 32))

(assert (=> b!293174 (= lt!425199 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!293175 () Bool)

(declare-fun res!242109 () Bool)

(assert (=> b!293175 (=> (not res!242109) (not e!209311))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293175 (= res!242109 (validate_offset_bits!1 ((_ sign_extend 32) (size!7580 (buf!7643 thiss!1728))) ((_ sign_extend 32) (currentByte!14107 thiss!1728)) ((_ sign_extend 32) (currentBit!14102 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!293176 () Bool)

(declare-fun res!242108 () Bool)

(assert (=> b!293176 (=> (not res!242108) (not e!209311))))

(assert (=> b!293176 (= res!242108 (bvslt from!505 to!474))))

(declare-fun b!293177 () Bool)

(assert (=> b!293177 (= e!209309 (or (bvslt lt!425199 #b00000000000000000000000000000000) (bvsge lt!425199 #b00000000000000000000000000001000)))))

(declare-fun b!293178 () Bool)

(assert (=> b!293178 (= e!209313 (array_inv!7192 (buf!7643 thiss!1728)))))

(assert (= (and start!65346 res!242110) b!293175))

(assert (= (and b!293175 res!242109) b!293176))

(assert (= (and b!293176 res!242108) b!293174))

(assert (= (and b!293174 res!242111) b!293177))

(assert (= start!65346 b!293178))

(declare-fun m!428735 () Bool)

(assert (=> start!65346 m!428735))

(declare-fun m!428737 () Bool)

(assert (=> start!65346 m!428737))

(declare-fun m!428739 () Bool)

(assert (=> b!293174 m!428739))

(declare-fun m!428741 () Bool)

(assert (=> b!293175 m!428741))

(declare-fun m!428743 () Bool)

(assert (=> b!293178 m!428743))

(check-sat (not b!293178) (not start!65346) (not b!293175) (not b!293174))
(check-sat)
