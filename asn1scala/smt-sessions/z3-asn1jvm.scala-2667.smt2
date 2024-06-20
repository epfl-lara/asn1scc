; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65370 () Bool)

(assert start!65370)

(declare-fun b!293322 () Bool)

(declare-fun res!242221 () Bool)

(declare-fun e!209458 () Bool)

(assert (=> b!293322 (=> (not res!242221) (not e!209458))))

(declare-datatypes ((array!17518 0))(
  ( (array!17519 (arr!8618 (Array (_ BitVec 32) (_ BitVec 8))) (size!7592 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13188 0))(
  ( (BitStream!13189 (buf!7655 array!17518) (currentByte!14119 (_ BitVec 32)) (currentBit!14114 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13188)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293322 (= res!242221 (validate_offset_bits!1 ((_ sign_extend 32) (size!7592 (buf!7655 thiss!1728))) ((_ sign_extend 32) (currentByte!14119 thiss!1728)) ((_ sign_extend 32) (currentBit!14114 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!293323 () Bool)

(declare-fun res!242220 () Bool)

(assert (=> b!293323 (=> (not res!242220) (not e!209458))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!293323 (= res!242220 (bvslt from!505 to!474))))

(declare-fun b!293325 () Bool)

(declare-fun e!209460 () Bool)

(declare-fun array_inv!7204 (array!17518) Bool)

(assert (=> b!293325 (= e!209460 (array_inv!7204 (buf!7655 thiss!1728)))))

(declare-fun res!242222 () Bool)

(assert (=> start!65370 (=> (not res!242222) (not e!209458))))

(declare-fun arr!273 () array!17518)

(assert (=> start!65370 (= res!242222 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7592 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65370 e!209458))

(declare-fun inv!12 (BitStream!13188) Bool)

(assert (=> start!65370 (and (inv!12 thiss!1728) e!209460)))

(assert (=> start!65370 true))

(assert (=> start!65370 (array_inv!7204 arr!273)))

(declare-fun b!293324 () Bool)

(assert (=> b!293324 (= e!209458 (and (not (= (bvand nBits!523 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand nBits!523 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!23014 0))(
  ( (tuple2!23015 (_1!12812 Bool) (_2!12812 BitStream!13188)) )
))
(declare-fun lt!425262 () tuple2!23014)

(declare-fun readBit!0 (BitStream!13188) tuple2!23014)

(assert (=> b!293324 (= lt!425262 (readBit!0 thiss!1728))))

(assert (= (and start!65370 res!242222) b!293322))

(assert (= (and b!293322 res!242221) b!293323))

(assert (= (and b!293323 res!242220) b!293324))

(assert (= start!65370 b!293325))

(declare-fun m!428855 () Bool)

(assert (=> b!293322 m!428855))

(declare-fun m!428857 () Bool)

(assert (=> b!293325 m!428857))

(declare-fun m!428859 () Bool)

(assert (=> start!65370 m!428859))

(declare-fun m!428861 () Bool)

(assert (=> start!65370 m!428861))

(declare-fun m!428863 () Bool)

(assert (=> b!293324 m!428863))

(check-sat (not b!293324) (not b!293325) (not b!293322) (not start!65370))
(check-sat)
