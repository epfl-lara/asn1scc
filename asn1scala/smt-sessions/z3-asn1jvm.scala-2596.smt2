; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64410 () Bool)

(assert start!64410)

(declare-fun b!288995 () Bool)

(declare-fun e!205520 () Bool)

(declare-fun e!205518 () Bool)

(assert (=> b!288995 (= e!205520 e!205518)))

(declare-fun res!238796 () Bool)

(assert (=> b!288995 (=> (not res!238796) (not e!205518))))

(declare-datatypes ((array!17077 0))(
  ( (array!17078 (arr!8381 (Array (_ BitVec 32) (_ BitVec 8))) (size!7385 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12780 0))(
  ( (BitStream!12781 (buf!7451 array!17077) (currentByte!13846 (_ BitVec 32)) (currentBit!13841 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12780)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((tuple2!22628 0))(
  ( (tuple2!22629 (_1!12508 Bool) (_2!12508 BitStream!12780)) )
))
(declare-fun lt!418919 () tuple2!22628)

(assert (=> b!288995 (= res!238796 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)) (= (size!7385 (buf!7451 thiss!1728)) (size!7385 (buf!7451 (_2!12508 lt!418919))))))))

(declare-fun readBit!0 (BitStream!12780) tuple2!22628)

(assert (=> b!288995 (= lt!418919 (readBit!0 thiss!1728))))

(declare-fun b!288996 () Bool)

(assert (=> b!288996 (= e!205518 false)))

(declare-fun lt!418920 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!288996 (= lt!418920 (bitIndex!0 (size!7385 (buf!7451 (_2!12508 lt!418919))) (currentByte!13846 (_2!12508 lt!418919)) (currentBit!13841 (_2!12508 lt!418919))))))

(declare-fun lt!418918 () (_ BitVec 64))

(assert (=> b!288996 (= lt!418918 (bitIndex!0 (size!7385 (buf!7451 thiss!1728)) (currentByte!13846 thiss!1728) (currentBit!13841 thiss!1728)))))

(declare-fun b!288997 () Bool)

(declare-fun res!238793 () Bool)

(assert (=> b!288997 (=> (not res!238793) (not e!205520))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!288997 (= res!238793 (validate_offset_bits!1 ((_ sign_extend 32) (size!7385 (buf!7451 thiss!1728))) ((_ sign_extend 32) (currentByte!13846 thiss!1728)) ((_ sign_extend 32) (currentBit!13841 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!238795 () Bool)

(assert (=> start!64410 (=> (not res!238795) (not e!205520))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17077)

(assert (=> start!64410 (= res!238795 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7385 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64410 e!205520))

(declare-fun e!205521 () Bool)

(declare-fun inv!12 (BitStream!12780) Bool)

(assert (=> start!64410 (and (inv!12 thiss!1728) e!205521)))

(assert (=> start!64410 true))

(declare-fun array_inv!6997 (array!17077) Bool)

(assert (=> start!64410 (array_inv!6997 arr!273)))

(declare-fun b!288998 () Bool)

(assert (=> b!288998 (= e!205521 (array_inv!6997 (buf!7451 thiss!1728)))))

(declare-fun b!288999 () Bool)

(declare-fun res!238794 () Bool)

(assert (=> b!288999 (=> (not res!238794) (not e!205520))))

(assert (=> b!288999 (= res!238794 (bvslt from!505 to!474))))

(assert (= (and start!64410 res!238795) b!288997))

(assert (= (and b!288997 res!238793) b!288999))

(assert (= (and b!288999 res!238794) b!288995))

(assert (= (and b!288995 res!238796) b!288996))

(assert (= start!64410 b!288998))

(declare-fun m!421719 () Bool)

(assert (=> b!288997 m!421719))

(declare-fun m!421721 () Bool)

(assert (=> b!288995 m!421721))

(declare-fun m!421723 () Bool)

(assert (=> b!288998 m!421723))

(declare-fun m!421725 () Bool)

(assert (=> b!288996 m!421725))

(declare-fun m!421727 () Bool)

(assert (=> b!288996 m!421727))

(declare-fun m!421729 () Bool)

(assert (=> start!64410 m!421729))

(declare-fun m!421731 () Bool)

(assert (=> start!64410 m!421731))

(check-sat (not b!288997) (not b!288995) (not b!288996) (not start!64410) (not b!288998))
