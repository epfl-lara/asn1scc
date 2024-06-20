; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64428 () Bool)

(assert start!64428)

(declare-fun res!238904 () Bool)

(declare-fun e!205653 () Bool)

(assert (=> start!64428 (=> (not res!238904) (not e!205653))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-datatypes ((array!17095 0))(
  ( (array!17096 (arr!8390 (Array (_ BitVec 32) (_ BitVec 8))) (size!7394 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17095)

(declare-fun from!505 () (_ BitVec 64))

(assert (=> start!64428 (= res!238904 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7394 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64428 e!205653))

(declare-datatypes ((BitStream!12798 0))(
  ( (BitStream!12799 (buf!7460 array!17095) (currentByte!13855 (_ BitVec 32)) (currentBit!13850 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12798)

(declare-fun e!205652 () Bool)

(declare-fun inv!12 (BitStream!12798) Bool)

(assert (=> start!64428 (and (inv!12 thiss!1728) e!205652)))

(assert (=> start!64428 true))

(declare-fun array_inv!7006 (array!17095) Bool)

(assert (=> start!64428 (array_inv!7006 arr!273)))

(declare-fun b!289130 () Bool)

(declare-fun res!238903 () Bool)

(assert (=> b!289130 (=> (not res!238903) (not e!205653))))

(assert (=> b!289130 (= res!238903 (bvslt from!505 to!474))))

(declare-fun b!289131 () Bool)

(declare-fun e!205654 () Bool)

(assert (=> b!289131 (= e!205654 false)))

(declare-fun lt!419001 () (_ BitVec 64))

(declare-datatypes ((tuple2!22646 0))(
  ( (tuple2!22647 (_1!12517 Bool) (_2!12517 BitStream!12798)) )
))
(declare-fun lt!418999 () tuple2!22646)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289131 (= lt!419001 (bitIndex!0 (size!7394 (buf!7460 (_2!12517 lt!418999))) (currentByte!13855 (_2!12517 lt!418999)) (currentBit!13850 (_2!12517 lt!418999))))))

(declare-fun lt!419000 () (_ BitVec 64))

(assert (=> b!289131 (= lt!419000 (bitIndex!0 (size!7394 (buf!7460 thiss!1728)) (currentByte!13855 thiss!1728) (currentBit!13850 thiss!1728)))))

(declare-fun b!289132 () Bool)

(assert (=> b!289132 (= e!205653 e!205654)))

(declare-fun res!238901 () Bool)

(assert (=> b!289132 (=> (not res!238901) (not e!205654))))

(assert (=> b!289132 (= res!238901 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)) (= (size!7394 (buf!7460 thiss!1728)) (size!7394 (buf!7460 (_2!12517 lt!418999))))))))

(declare-fun readBit!0 (BitStream!12798) tuple2!22646)

(assert (=> b!289132 (= lt!418999 (readBit!0 thiss!1728))))

(declare-fun b!289133 () Bool)

(assert (=> b!289133 (= e!205652 (array_inv!7006 (buf!7460 thiss!1728)))))

(declare-fun b!289134 () Bool)

(declare-fun res!238902 () Bool)

(assert (=> b!289134 (=> (not res!238902) (not e!205653))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289134 (= res!238902 (validate_offset_bits!1 ((_ sign_extend 32) (size!7394 (buf!7460 thiss!1728))) ((_ sign_extend 32) (currentByte!13855 thiss!1728)) ((_ sign_extend 32) (currentBit!13850 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!64428 res!238904) b!289134))

(assert (= (and b!289134 res!238902) b!289130))

(assert (= (and b!289130 res!238903) b!289132))

(assert (= (and b!289132 res!238901) b!289131))

(assert (= start!64428 b!289133))

(declare-fun m!421845 () Bool)

(assert (=> start!64428 m!421845))

(declare-fun m!421847 () Bool)

(assert (=> start!64428 m!421847))

(declare-fun m!421849 () Bool)

(assert (=> b!289132 m!421849))

(declare-fun m!421851 () Bool)

(assert (=> b!289131 m!421851))

(declare-fun m!421853 () Bool)

(assert (=> b!289131 m!421853))

(declare-fun m!421855 () Bool)

(assert (=> b!289134 m!421855))

(declare-fun m!421857 () Bool)

(assert (=> b!289133 m!421857))

(check-sat (not start!64428) (not b!289133) (not b!289132) (not b!289131) (not b!289134))
