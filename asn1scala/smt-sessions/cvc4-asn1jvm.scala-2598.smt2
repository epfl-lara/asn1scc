; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64424 () Bool)

(assert start!64424)

(declare-fun b!289100 () Bool)

(declare-fun e!205623 () Bool)

(assert (=> b!289100 (= e!205623 false)))

(declare-fun lt!418983 () (_ BitVec 64))

(declare-datatypes ((array!17091 0))(
  ( (array!17092 (arr!8388 (Array (_ BitVec 32) (_ BitVec 8))) (size!7392 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12794 0))(
  ( (BitStream!12795 (buf!7458 array!17091) (currentByte!13853 (_ BitVec 32)) (currentBit!13848 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22642 0))(
  ( (tuple2!22643 (_1!12515 Bool) (_2!12515 BitStream!12794)) )
))
(declare-fun lt!418981 () tuple2!22642)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289100 (= lt!418983 (bitIndex!0 (size!7392 (buf!7458 (_2!12515 lt!418981))) (currentByte!13853 (_2!12515 lt!418981)) (currentBit!13848 (_2!12515 lt!418981))))))

(declare-fun lt!418982 () (_ BitVec 64))

(declare-fun thiss!1728 () BitStream!12794)

(assert (=> b!289100 (= lt!418982 (bitIndex!0 (size!7392 (buf!7458 thiss!1728)) (currentByte!13853 thiss!1728) (currentBit!13848 thiss!1728)))))

(declare-fun b!289101 () Bool)

(declare-fun e!205624 () Bool)

(assert (=> b!289101 (= e!205624 e!205623)))

(declare-fun res!238877 () Bool)

(assert (=> b!289101 (=> (not res!238877) (not e!205623))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> b!289101 (= res!238877 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)) (= (size!7392 (buf!7458 thiss!1728)) (size!7392 (buf!7458 (_2!12515 lt!418981))))))))

(declare-fun readBit!0 (BitStream!12794) tuple2!22642)

(assert (=> b!289101 (= lt!418981 (readBit!0 thiss!1728))))

(declare-fun b!289102 () Bool)

(declare-fun e!205622 () Bool)

(declare-fun array_inv!7004 (array!17091) Bool)

(assert (=> b!289102 (= e!205622 (array_inv!7004 (buf!7458 thiss!1728)))))

(declare-fun res!238880 () Bool)

(assert (=> start!64424 (=> (not res!238880) (not e!205624))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17091)

(assert (=> start!64424 (= res!238880 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7392 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64424 e!205624))

(declare-fun inv!12 (BitStream!12794) Bool)

(assert (=> start!64424 (and (inv!12 thiss!1728) e!205622)))

(assert (=> start!64424 true))

(assert (=> start!64424 (array_inv!7004 arr!273)))

(declare-fun b!289103 () Bool)

(declare-fun res!238878 () Bool)

(assert (=> b!289103 (=> (not res!238878) (not e!205624))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289103 (= res!238878 (validate_offset_bits!1 ((_ sign_extend 32) (size!7392 (buf!7458 thiss!1728))) ((_ sign_extend 32) (currentByte!13853 thiss!1728)) ((_ sign_extend 32) (currentBit!13848 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289104 () Bool)

(declare-fun res!238879 () Bool)

(assert (=> b!289104 (=> (not res!238879) (not e!205624))))

(assert (=> b!289104 (= res!238879 (bvslt from!505 to!474))))

(assert (= (and start!64424 res!238880) b!289103))

(assert (= (and b!289103 res!238878) b!289104))

(assert (= (and b!289104 res!238879) b!289101))

(assert (= (and b!289101 res!238877) b!289100))

(assert (= start!64424 b!289102))

(declare-fun m!421817 () Bool)

(assert (=> b!289100 m!421817))

(declare-fun m!421819 () Bool)

(assert (=> b!289100 m!421819))

(declare-fun m!421821 () Bool)

(assert (=> b!289102 m!421821))

(declare-fun m!421823 () Bool)

(assert (=> b!289103 m!421823))

(declare-fun m!421825 () Bool)

(assert (=> b!289101 m!421825))

(declare-fun m!421827 () Bool)

(assert (=> start!64424 m!421827))

(declare-fun m!421829 () Bool)

(assert (=> start!64424 m!421829))

(push 1)

