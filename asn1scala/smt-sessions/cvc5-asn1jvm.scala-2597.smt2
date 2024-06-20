; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64414 () Bool)

(assert start!64414)

(declare-fun b!289025 () Bool)

(declare-fun res!238820 () Bool)

(declare-fun e!205551 () Bool)

(assert (=> b!289025 (=> (not res!238820) (not e!205551))))

(declare-datatypes ((array!17081 0))(
  ( (array!17082 (arr!8383 (Array (_ BitVec 32) (_ BitVec 8))) (size!7387 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12784 0))(
  ( (BitStream!12785 (buf!7453 array!17081) (currentByte!13848 (_ BitVec 32)) (currentBit!13843 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12784)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289025 (= res!238820 (validate_offset_bits!1 ((_ sign_extend 32) (size!7387 (buf!7453 thiss!1728))) ((_ sign_extend 32) (currentByte!13848 thiss!1728)) ((_ sign_extend 32) (currentBit!13843 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289026 () Bool)

(declare-fun res!238817 () Bool)

(assert (=> b!289026 (=> (not res!238817) (not e!205551))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!289026 (= res!238817 (bvslt from!505 to!474))))

(declare-fun b!289027 () Bool)

(declare-fun e!205548 () Bool)

(assert (=> b!289027 (= e!205548 false)))

(declare-fun lt!418937 () (_ BitVec 64))

(declare-datatypes ((tuple2!22632 0))(
  ( (tuple2!22633 (_1!12510 Bool) (_2!12510 BitStream!12784)) )
))
(declare-fun lt!418938 () tuple2!22632)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289027 (= lt!418937 (bitIndex!0 (size!7387 (buf!7453 (_2!12510 lt!418938))) (currentByte!13848 (_2!12510 lt!418938)) (currentBit!13843 (_2!12510 lt!418938))))))

(declare-fun lt!418936 () (_ BitVec 64))

(assert (=> b!289027 (= lt!418936 (bitIndex!0 (size!7387 (buf!7453 thiss!1728)) (currentByte!13848 thiss!1728) (currentBit!13843 thiss!1728)))))

(declare-fun b!289028 () Bool)

(declare-fun e!205549 () Bool)

(declare-fun array_inv!6999 (array!17081) Bool)

(assert (=> b!289028 (= e!205549 (array_inv!6999 (buf!7453 thiss!1728)))))

(declare-fun res!238819 () Bool)

(assert (=> start!64414 (=> (not res!238819) (not e!205551))))

(declare-fun arr!273 () array!17081)

(assert (=> start!64414 (= res!238819 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7387 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64414 e!205551))

(declare-fun inv!12 (BitStream!12784) Bool)

(assert (=> start!64414 (and (inv!12 thiss!1728) e!205549)))

(assert (=> start!64414 true))

(assert (=> start!64414 (array_inv!6999 arr!273)))

(declare-fun b!289029 () Bool)

(assert (=> b!289029 (= e!205551 e!205548)))

(declare-fun res!238818 () Bool)

(assert (=> b!289029 (=> (not res!238818) (not e!205548))))

(assert (=> b!289029 (= res!238818 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)) (= (size!7387 (buf!7453 thiss!1728)) (size!7387 (buf!7453 (_2!12510 lt!418938))))))))

(declare-fun readBit!0 (BitStream!12784) tuple2!22632)

(assert (=> b!289029 (= lt!418938 (readBit!0 thiss!1728))))

(assert (= (and start!64414 res!238819) b!289025))

(assert (= (and b!289025 res!238820) b!289026))

(assert (= (and b!289026 res!238817) b!289029))

(assert (= (and b!289029 res!238818) b!289027))

(assert (= start!64414 b!289028))

(declare-fun m!421747 () Bool)

(assert (=> b!289029 m!421747))

(declare-fun m!421749 () Bool)

(assert (=> b!289025 m!421749))

(declare-fun m!421751 () Bool)

(assert (=> start!64414 m!421751))

(declare-fun m!421753 () Bool)

(assert (=> start!64414 m!421753))

(declare-fun m!421755 () Bool)

(assert (=> b!289027 m!421755))

(declare-fun m!421757 () Bool)

(assert (=> b!289027 m!421757))

(declare-fun m!421759 () Bool)

(assert (=> b!289028 m!421759))

(push 1)

(assert (not b!289029))

(assert (not start!64414))

(assert (not b!289025))

(assert (not b!289027))

(assert (not b!289028))

(check-sat)

