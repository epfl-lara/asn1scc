; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47262 () Bool)

(assert start!47262)

(declare-fun b!225672 () Bool)

(declare-fun res!189363 () Bool)

(declare-fun e!154115 () Bool)

(assert (=> b!225672 (=> (not res!189363) (not e!154115))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!225672 (= res!189363 (bvslt i!761 to!496))))

(declare-fun b!225671 () Bool)

(declare-fun res!189361 () Bool)

(assert (=> b!225671 (=> (not res!189361) (not e!154115))))

(declare-datatypes ((array!11244 0))(
  ( (array!11245 (arr!5892 (Array (_ BitVec 32) (_ BitVec 8))) (size!4935 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8966 0))(
  ( (BitStream!8967 (buf!5476 array!11244) (currentByte!10260 (_ BitVec 32)) (currentBit!10255 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8966)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225671 (= res!189361 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4935 (buf!5476 thiss!1870))) ((_ sign_extend 32) (currentByte!10260 thiss!1870)) ((_ sign_extend 32) (currentBit!10255 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225673 () Bool)

(declare-datatypes ((tuple2!19302 0))(
  ( (tuple2!19303 (_1!10438 (_ BitVec 8)) (_2!10438 BitStream!8966)) )
))
(declare-fun readByte!0 (BitStream!8966) tuple2!19302)

(assert (=> b!225673 (= e!154115 (not (= (size!4935 (buf!5476 thiss!1870)) (size!4935 (buf!5476 (_2!10438 (readByte!0 thiss!1870)))))))))

(declare-fun b!225674 () Bool)

(declare-fun e!154113 () Bool)

(declare-fun array_inv!4676 (array!11244) Bool)

(assert (=> b!225674 (= e!154113 (array_inv!4676 (buf!5476 thiss!1870)))))

(declare-fun res!189362 () Bool)

(assert (=> start!47262 (=> (not res!189362) (not e!154115))))

(declare-fun arr!308 () array!11244)

(assert (=> start!47262 (= res!189362 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4935 arr!308))))))

(assert (=> start!47262 e!154115))

(assert (=> start!47262 true))

(assert (=> start!47262 (array_inv!4676 arr!308)))

(declare-fun inv!12 (BitStream!8966) Bool)

(assert (=> start!47262 (and (inv!12 thiss!1870) e!154113)))

(assert (= (and start!47262 res!189362) b!225671))

(assert (= (and b!225671 res!189361) b!225672))

(assert (= (and b!225672 res!189363) b!225673))

(assert (= start!47262 b!225674))

(declare-fun m!346697 () Bool)

(assert (=> b!225671 m!346697))

(declare-fun m!346699 () Bool)

(assert (=> b!225673 m!346699))

(declare-fun m!346701 () Bool)

(assert (=> b!225674 m!346701))

(declare-fun m!346703 () Bool)

(assert (=> start!47262 m!346703))

(declare-fun m!346705 () Bool)

(assert (=> start!47262 m!346705))

(push 1)

(assert (not b!225673))

(assert (not start!47262))

(assert (not b!225671))

(assert (not b!225674))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76572 () Bool)

(declare-fun lt!358770 () (_ BitVec 8))

(declare-fun lt!358768 () (_ BitVec 8))

(assert (=> d!76572 (= lt!358770 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5892 (buf!5476 thiss!1870)) (currentByte!10260 thiss!1870))) ((_ sign_extend 24) lt!358768))))))

(assert (=> d!76572 (= lt!358768 ((_ extract 7 0) (currentBit!10255 thiss!1870)))))

(declare-fun e!154132 () Bool)

(assert (=> d!76572 e!154132))

(declare-fun res!189383 () Bool)

(assert (=> d!76572 (=> (not res!189383) (not e!154132))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76572 (= res!189383 (validate_offset_bits!1 ((_ sign_extend 32) (size!4935 (buf!5476 thiss!1870))) ((_ sign_extend 32) (currentByte!10260 thiss!1870)) ((_ sign_extend 32) (currentBit!10255 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((Unit!16599 0))(
  ( (Unit!16600) )
))
(declare-datatypes ((tuple2!19308 0))(
  ( (tuple2!19309 (_1!10441 Unit!16599) (_2!10441 (_ BitVec 8))) )
))
(declare-fun Unit!16601 () Unit!16599)

(declare-fun Unit!16602 () Unit!16599)

(assert (=> d!76572 (= (readByte!0 thiss!1870) (tuple2!19303 (_2!10441 (ite (bvsgt ((_ sign_extend 24) lt!358768) #b00000000000000000000000000000000) (tuple2!19309 Unit!16601 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!358770) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5892 (buf!5476 thiss!1870)) (bvadd (currentByte!10260 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!358768)))))))) (tuple2!19309 Unit!16602 lt!358770))) (BitStream!8967 (buf!5476 thiss!1870) (bvadd (currentByte!10260 thiss!1870) #b00000000000000000000000000000001) (currentBit!10255 thiss!1870))))))

(declare-fun b!225691 () Bool)

(declare-fun e!154133 () Bool)

(assert (=> b!225691 (= e!154132 e!154133)))

(declare-fun res!189384 () Bool)

(assert (=> b!225691 (=> (not res!189384) (not e!154133))))

(declare-fun lt!358767 () tuple2!19302)

(assert (=> b!225691 (= res!189384 (= (buf!5476 (_2!10438 lt!358767)) (buf!5476 thiss!1870)))))

(declare-fun lt!358766 () (_ BitVec 8))

(declare-fun lt!358764 () (_ BitVec 8))

(declare-fun Unit!16603 () Unit!16599)

(declare-fun Unit!16604 () Unit!16599)

(assert (=> b!225691 (= lt!358767 (tuple2!19303 (_2!10441 (ite (bvsgt ((_ sign_extend 24) lt!358764) #b00000000000000000000000000000000) (tuple2!19309 Unit!16603 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!358766) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5892 (buf!5476 thiss!1870)) (bvadd (currentByte!10260 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!358764)))))))) (tuple2!19309 Unit!16604 lt!358766))) (BitStream!8967 (buf!5476 thiss!1870) (bvadd (currentByte!10260 thiss!1870) #b00000000000000000000000000000001) (currentBit!10255 thiss!1870))))))

(assert (=> b!225691 (= lt!358766 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5892 (buf!5476 thiss!1870)) (currentByte!10260 thiss!1870))) ((_ sign_extend 24) lt!358764))))))

(assert (=> b!225691 (= lt!358764 ((_ extract 7 0) (currentBit!10255 thiss!1870)))))

(declare-fun lt!358765 () (_ BitVec 64))

(declare-fun lt!358769 () (_ BitVec 64))

(declare-fun b!225692 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225692 (= e!154133 (= (bitIndex!0 (size!4935 (buf!5476 (_2!10438 lt!358767))) (currentByte!10260 (_2!10438 lt!358767)) (currentBit!10255 (_2!10438 lt!358767))) (bvadd lt!358769 lt!358765)))))

(assert (=> b!225692 (or (not (= (bvand lt!358769 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!358765 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!358769 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!358769 lt!358765) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!225692 (= lt!358765 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!225692 (= lt!358769 (bitIndex!0 (size!4935 (buf!5476 thiss!1870)) (currentByte!10260 thiss!1870) (currentBit!10255 thiss!1870)))))

(assert (= (and d!76572 res!189383) b!225691))

(assert (= (and b!225691 res!189384) b!225692))

(declare-fun m!346735 () Bool)

(assert (=> d!76572 m!346735))

(declare-fun m!346737 () Bool)

(assert (=> d!76572 m!346737))

(declare-fun m!346739 () Bool)

(assert (=> d!76572 m!346739))

(assert (=> b!225691 m!346739))

(assert (=> b!225691 m!346735))

(declare-fun m!346741 () Bool)

(assert (=> b!225692 m!346741))

(declare-fun m!346743 () Bool)

(assert (=> b!225692 m!346743))

(assert (=> b!225673 d!76572))

(declare-fun d!76586 () Bool)

(assert (=> d!76586 (= (array_inv!4676 arr!308) (bvsge (size!4935 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47262 d!76586))

(declare-fun d!76588 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!76588 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10255 thiss!1870) (currentByte!10260 thiss!1870) (size!4935 (buf!5476 thiss!1870))))))

(declare-fun bs!18717 () Bool)

(assert (= bs!18717 d!76588))

(declare-fun m!346745 () Bool)

(assert (=> bs!18717 m!346745))

(assert (=> start!47262 d!76588))

(declare-fun d!76590 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

