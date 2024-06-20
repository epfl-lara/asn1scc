; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65322 () Bool)

(assert start!65322)

(declare-fun b!293028 () Bool)

(declare-fun e!209161 () Bool)

(declare-datatypes ((array!17470 0))(
  ( (array!17471 (arr!8594 (Array (_ BitVec 32) (_ BitVec 8))) (size!7568 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13140 0))(
  ( (BitStream!13141 (buf!7631 array!17470) (currentByte!14095 (_ BitVec 32)) (currentBit!14090 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13140)

(declare-fun array_inv!7180 (array!17470) Bool)

(assert (=> b!293028 (= e!209161 (array_inv!7180 (buf!7631 thiss!1728)))))

(declare-fun b!293027 () Bool)

(declare-fun e!209162 () Bool)

(declare-fun from!505 () (_ BitVec 64))

(assert (=> b!293027 (= e!209162 (and (bvslt (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(declare-datatypes ((tuple2!22966 0))(
  ( (tuple2!22967 (_1!12788 Bool) (_2!12788 BitStream!13140)) )
))
(declare-fun lt!425163 () tuple2!22966)

(declare-fun readBit!0 (BitStream!13140) tuple2!22966)

(assert (=> b!293027 (= lt!425163 (readBit!0 thiss!1728))))

(declare-fun res!241995 () Bool)

(assert (=> start!65322 (=> (not res!241995) (not e!209162))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17470)

(assert (=> start!65322 (= res!241995 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7568 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65322 e!209162))

(declare-fun inv!12 (BitStream!13140) Bool)

(assert (=> start!65322 (and (inv!12 thiss!1728) e!209161)))

(assert (=> start!65322 true))

(assert (=> start!65322 (array_inv!7180 arr!273)))

(declare-fun b!293025 () Bool)

(declare-fun res!241997 () Bool)

(assert (=> b!293025 (=> (not res!241997) (not e!209162))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293025 (= res!241997 (validate_offset_bits!1 ((_ sign_extend 32) (size!7568 (buf!7631 thiss!1728))) ((_ sign_extend 32) (currentByte!14095 thiss!1728)) ((_ sign_extend 32) (currentBit!14090 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!293026 () Bool)

(declare-fun res!241996 () Bool)

(assert (=> b!293026 (=> (not res!241996) (not e!209162))))

(assert (=> b!293026 (= res!241996 (bvslt from!505 to!474))))

(assert (= (and start!65322 res!241995) b!293025))

(assert (= (and b!293025 res!241997) b!293026))

(assert (= (and b!293026 res!241996) b!293027))

(assert (= start!65322 b!293028))

(declare-fun m!428615 () Bool)

(assert (=> b!293028 m!428615))

(declare-fun m!428617 () Bool)

(assert (=> b!293027 m!428617))

(declare-fun m!428619 () Bool)

(assert (=> start!65322 m!428619))

(declare-fun m!428621 () Bool)

(assert (=> start!65322 m!428621))

(declare-fun m!428623 () Bool)

(assert (=> b!293025 m!428623))

(check-sat (not start!65322) (not b!293025) (not b!293027) (not b!293028))
(check-sat)
