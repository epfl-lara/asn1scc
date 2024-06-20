; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47940 () Bool)

(assert start!47940)

(declare-fun b!228060 () Bool)

(declare-fun e!156223 () Bool)

(declare-datatypes ((array!11499 0))(
  ( (array!11500 (arr!6027 (Array (_ BitVec 32) (_ BitVec 8))) (size!5046 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9188 0))(
  ( (BitStream!9189 (buf!5587 array!11499) (currentByte!10437 (_ BitVec 32)) (currentBit!10432 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9188)

(declare-fun array_inv!4787 (array!11499) Bool)

(assert (=> b!228060 (= e!156223 (array_inv!4787 (buf!5587 thiss!1870)))))

(declare-fun b!228057 () Bool)

(declare-fun res!191304 () Bool)

(declare-fun e!156226 () Bool)

(assert (=> b!228057 (=> (not res!191304) (not e!156226))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228057 (= res!191304 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5046 (buf!5587 thiss!1870))) ((_ sign_extend 32) (currentByte!10437 thiss!1870)) ((_ sign_extend 32) (currentBit!10432 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!191305 () Bool)

(assert (=> start!47940 (=> (not res!191305) (not e!156226))))

(declare-fun arr!308 () array!11499)

(assert (=> start!47940 (= res!191305 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5046 arr!308))))))

(assert (=> start!47940 e!156226))

(assert (=> start!47940 true))

(assert (=> start!47940 (array_inv!4787 arr!308)))

(declare-fun inv!12 (BitStream!9188) Bool)

(assert (=> start!47940 (and (inv!12 thiss!1870) e!156223)))

(declare-fun b!228058 () Bool)

(declare-fun res!191303 () Bool)

(assert (=> b!228058 (=> (not res!191303) (not e!156226))))

(assert (=> b!228058 (= res!191303 (bvslt i!761 to!496))))

(declare-fun lt!365445 () (_ BitVec 64))

(declare-fun lt!365449 () (_ BitVec 64))

(declare-fun b!228059 () Bool)

(declare-fun lt!365444 () (_ BitVec 64))

(assert (=> b!228059 (= e!156226 (not (or (not (= lt!365444 (bvand lt!365445 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!365444 (bvand (bvadd lt!365449 lt!365445) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!228059 (= lt!365444 (bvand lt!365449 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!19638 0))(
  ( (tuple2!19639 (_1!10698 (_ BitVec 8)) (_2!10698 BitStream!9188)) )
))
(declare-fun lt!365440 () tuple2!19638)

(declare-datatypes ((Unit!17099 0))(
  ( (Unit!17100) )
))
(declare-datatypes ((tuple3!1474 0))(
  ( (tuple3!1475 (_1!10699 Unit!17099) (_2!10699 BitStream!9188) (_3!879 array!11499)) )
))
(declare-fun lt!365448 () tuple3!1474)

(assert (=> b!228059 (and (= (_1!10698 lt!365440) (select (arr!6027 (_3!879 lt!365448)) i!761)) (= (select (arr!6027 (_3!879 lt!365448)) i!761) (_1!10698 lt!365440)))))

(declare-fun lt!365443 () Unit!17099)

(declare-fun lt!365439 () array!11499)

(declare-fun arrayRangesEqImpliesEq!138 (array!11499 array!11499 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17099)

(assert (=> b!228059 (= lt!365443 (arrayRangesEqImpliesEq!138 lt!365439 (_3!879 lt!365448) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arrayRangesEq!882 (array!11499 array!11499 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228059 (arrayRangesEq!882 arr!308 (_3!879 lt!365448) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!365451 () Unit!17099)

(declare-fun arrayRangesEqTransitive!305 (array!11499 array!11499 array!11499 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17099)

(assert (=> b!228059 (= lt!365451 (arrayRangesEqTransitive!305 arr!308 lt!365439 (_3!879 lt!365448) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!228059 (arrayRangesEq!882 arr!308 lt!365439 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!365441 () Unit!17099)

(declare-fun arrayUpdatedAtPrefixLemma!441 (array!11499 (_ BitVec 32) (_ BitVec 8)) Unit!17099)

(assert (=> b!228059 (= lt!365441 (arrayUpdatedAtPrefixLemma!441 arr!308 i!761 (_1!10698 lt!365440)))))

(assert (=> b!228059 (= lt!365445 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761))))))

(declare-fun lt!365450 () (_ BitVec 32))

(declare-fun lt!365446 () (_ BitVec 64))

(declare-fun lt!365447 () (_ BitVec 64))

(assert (=> b!228059 (and (= (bvadd lt!365447 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!365450))) lt!365446) (= (bvadd lt!365449 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!365446) (= (buf!5587 thiss!1870) (buf!5587 (_2!10699 lt!365448))) (= (size!5046 arr!308) (size!5046 (_3!879 lt!365448))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228059 (= lt!365446 (bitIndex!0 (size!5046 (buf!5587 (_2!10699 lt!365448))) (currentByte!10437 (_2!10699 lt!365448)) (currentBit!10432 (_2!10699 lt!365448))))))

(assert (=> b!228059 (= lt!365447 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!365449))))

(assert (=> b!228059 (= lt!365447 (bitIndex!0 (size!5046 (buf!5587 (_2!10698 lt!365440))) (currentByte!10437 (_2!10698 lt!365440)) (currentBit!10432 (_2!10698 lt!365440))))))

(assert (=> b!228059 (= lt!365449 (bitIndex!0 (size!5046 (buf!5587 thiss!1870)) (currentByte!10437 thiss!1870) (currentBit!10432 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9188 array!11499 (_ BitVec 32) (_ BitVec 32)) tuple3!1474)

(assert (=> b!228059 (= lt!365448 (readByteArrayLoop!0 (_2!10698 lt!365440) lt!365439 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!228059 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5046 (buf!5587 (_2!10698 lt!365440)))) ((_ sign_extend 32) (currentByte!10437 (_2!10698 lt!365440))) ((_ sign_extend 32) (currentBit!10432 (_2!10698 lt!365440))) lt!365450)))

(assert (=> b!228059 (= lt!365450 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!365442 () Unit!17099)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9188 BitStream!9188 (_ BitVec 64) (_ BitVec 32)) Unit!17099)

(assert (=> b!228059 (= lt!365442 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10698 lt!365440) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!228059 (= lt!365439 (array!11500 (store (arr!6027 arr!308) i!761 (_1!10698 lt!365440)) (size!5046 arr!308)))))

(declare-fun readByte!0 (BitStream!9188) tuple2!19638)

(assert (=> b!228059 (= lt!365440 (readByte!0 thiss!1870))))

(assert (= (and start!47940 res!191305) b!228057))

(assert (= (and b!228057 res!191304) b!228058))

(assert (= (and b!228058 res!191303) b!228059))

(assert (= start!47940 b!228060))

(declare-fun m!351319 () Bool)

(assert (=> b!228060 m!351319))

(declare-fun m!351321 () Bool)

(assert (=> b!228057 m!351321))

(declare-fun m!351323 () Bool)

(assert (=> start!47940 m!351323))

(declare-fun m!351325 () Bool)

(assert (=> start!47940 m!351325))

(declare-fun m!351327 () Bool)

(assert (=> b!228059 m!351327))

(declare-fun m!351329 () Bool)

(assert (=> b!228059 m!351329))

(declare-fun m!351331 () Bool)

(assert (=> b!228059 m!351331))

(declare-fun m!351333 () Bool)

(assert (=> b!228059 m!351333))

(declare-fun m!351335 () Bool)

(assert (=> b!228059 m!351335))

(declare-fun m!351337 () Bool)

(assert (=> b!228059 m!351337))

(declare-fun m!351339 () Bool)

(assert (=> b!228059 m!351339))

(declare-fun m!351341 () Bool)

(assert (=> b!228059 m!351341))

(declare-fun m!351343 () Bool)

(assert (=> b!228059 m!351343))

(declare-fun m!351345 () Bool)

(assert (=> b!228059 m!351345))

(declare-fun m!351347 () Bool)

(assert (=> b!228059 m!351347))

(declare-fun m!351349 () Bool)

(assert (=> b!228059 m!351349))

(declare-fun m!351351 () Bool)

(assert (=> b!228059 m!351351))

(declare-fun m!351353 () Bool)

(assert (=> b!228059 m!351353))

(push 1)

(assert (not start!47940))

(assert (not b!228057))

(assert (not b!228060))

(assert (not b!228059))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77346 () Bool)

(assert (=> d!77346 (= (array_inv!4787 arr!308) (bvsge (size!5046 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47940 d!77346))

(declare-fun d!77348 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!77348 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10432 thiss!1870) (currentByte!10437 thiss!1870) (size!5046 (buf!5587 thiss!1870))))))

(declare-fun bs!18921 () Bool)

(assert (= bs!18921 d!77348))

(declare-fun m!351369 () Bool)

(assert (=> bs!18921 m!351369))

(assert (=> start!47940 d!77348))

(declare-fun d!77350 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77350 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5046 (buf!5587 thiss!1870))) ((_ sign_extend 32) (currentByte!10437 thiss!1870)) ((_ sign_extend 32) (currentBit!10432 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5046 (buf!5587 thiss!1870))) ((_ sign_extend 32) (currentByte!10437 thiss!1870)) ((_ sign_extend 32) (currentBit!10432 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18922 () Bool)

(assert (= bs!18922 d!77350))

(declare-fun m!351371 () Bool)

(assert (=> bs!18922 m!351371))

(assert (=> b!228057 d!77350))

(declare-fun d!77352 () Bool)

(assert (=> d!77352 (= (array_inv!4787 (buf!5587 thiss!1870)) (bvsge (size!5046 (buf!5587 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!228060 d!77352))

(declare-fun b!228125 () Bool)

(declare-fun e!156281 () tuple3!1474)

(declare-fun lt!365663 () Unit!17099)

(declare-fun lt!365657 () tuple3!1474)

(assert (=> b!228125 (= e!156281 (tuple3!1475 lt!365663 (_2!10699 lt!365657) (_3!879 lt!365657)))))

(declare-fun lt!365672 () tuple2!19638)

(assert (=> b!228125 (= lt!365672 (readByte!0 (_2!10698 lt!365440)))))

(declare-fun lt!365650 () array!11499)

(assert (=> b!228125 (= lt!365650 (array!11500 (store (arr!6027 lt!365439) (bvadd #b00000000000000000000000000000001 i!761) (_1!10698 lt!365672)) (size!5046 lt!365439)))))

(declare-fun lt!365659 () (_ BitVec 64))

(assert (=> b!228125 (= lt!365659 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!365660 () (_ BitVec 32))

(assert (=> b!228125 (= lt!365660 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!365673 () Unit!17099)

(assert (=> b!228125 (= lt!365673 (validateOffsetBytesFromBitIndexLemma!0 (_2!10698 lt!365440) (_2!10698 lt!365672) lt!365659 lt!365660))))

(assert (=> b!228125 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5046 (buf!5587 (_2!10698 lt!365672)))) ((_ sign_extend 32) (currentByte!10437 (_2!10698 lt!365672))) ((_ sign_extend 32) (currentBit!10432 (_2!10698 lt!365672))) (bvsub lt!365660 ((_ extract 31 0) (bvsdiv (bvadd lt!365659 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!365649 () Unit!17099)

(assert (=> b!228125 (= lt!365649 lt!365673)))

(assert (=> b!228125 (= lt!365657 (readByteArrayLoop!0 (_2!10698 lt!365672) lt!365650 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(declare-fun call!3890 () (_ BitVec 64))

(assert (=> b!228125 (= (bitIndex!0 (size!5046 (buf!5587 (_2!10698 lt!365672))) (currentByte!10437 (_2!10698 lt!365672)) (currentBit!10432 (_2!10698 lt!365672))) (bvadd call!3890 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!365662 () Unit!17099)

(declare-fun Unit!17105 () Unit!17099)

(assert (=> b!228125 (= lt!365662 Unit!17105)))

(assert (=> b!228125 (= (bvadd (bitIndex!0 (size!5046 (buf!5587 (_2!10698 lt!365672))) (currentByte!10437 (_2!10698 lt!365672)) (currentBit!10432 (_2!10698 lt!365672))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!5046 (buf!5587 (_2!10699 lt!365657))) (currentByte!10437 (_2!10699 lt!365657)) (currentBit!10432 (_2!10699 lt!365657))))))

(declare-fun lt!365661 () Unit!17099)

(declare-fun Unit!17106 () Unit!17099)

(assert (=> b!228125 (= lt!365661 Unit!17106)))

(assert (=> b!228125 (= (bvadd call!3890 (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!5046 (buf!5587 (_2!10699 lt!365657))) (currentByte!10437 (_2!10699 lt!365657)) (currentBit!10432 (_2!10699 lt!365657))))))

(declare-fun lt!365679 () Unit!17099)

(declare-fun Unit!17107 () Unit!17099)

(assert (=> b!228125 (= lt!365679 Unit!17107)))

(assert (=> b!228125 (and (= (buf!5587 (_2!10698 lt!365440)) (buf!5587 (_2!10699 lt!365657))) (= (size!5046 lt!365439) (size!5046 (_3!879 lt!365657))))))

(declare-fun lt!365666 () Unit!17099)

(declare-fun Unit!17108 () Unit!17099)

(assert (=> b!228125 (= lt!365666 Unit!17108)))

(declare-fun lt!365668 () Unit!17099)

(assert (=> b!228125 (= lt!365668 (arrayUpdatedAtPrefixLemma!441 lt!365439 (bvadd #b00000000000000000000000000000001 i!761) (_1!10698 lt!365672)))))

(declare-fun call!3891 () Bool)

(assert (=> b!228125 call!3891))

(declare-fun lt!365682 () Unit!17099)

(assert (=> b!228125 (= lt!365682 lt!365668)))

(declare-fun lt!365656 () (_ BitVec 32))

(assert (=> b!228125 (= lt!365656 #b00000000000000000000000000000000)))

(declare-fun lt!365647 () Unit!17099)

(assert (=> b!228125 (= lt!365647 (arrayRangesEqTransitive!305 lt!365439 lt!365650 (_3!879 lt!365657) lt!365656 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(declare-fun call!3889 () Bool)

(assert (=> b!228125 call!3889))

(declare-fun lt!365674 () Unit!17099)

(assert (=> b!228125 (= lt!365674 lt!365647)))

(assert (=> b!228125 (arrayRangesEq!882 lt!365439 (_3!879 lt!365657) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!365677 () Unit!17099)

(declare-fun Unit!17109 () Unit!17099)

(assert (=> b!228125 (= lt!365677 Unit!17109)))

(declare-fun lt!365653 () Unit!17099)

(assert (=> b!228125 (= lt!365653 (arrayRangesEqImpliesEq!138 lt!365650 (_3!879 lt!365657) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!228125 (= (select (store (arr!6027 lt!365439) (bvadd #b00000000000000000000000000000001 i!761) (_1!10698 lt!365672)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!6027 (_3!879 lt!365657)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!365669 () Unit!17099)

(assert (=> b!228125 (= lt!365669 lt!365653)))

(declare-fun lt!365667 () Bool)

(assert (=> b!228125 (= lt!365667 (= (select (arr!6027 (_3!879 lt!365657)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10698 lt!365672)))))

(declare-fun Unit!17110 () Unit!17099)

(assert (=> b!228125 (= lt!365663 Unit!17110)))

(assert (=> b!228125 lt!365667))

(declare-fun c!11224 () Bool)

(declare-fun bm!3886 () Bool)

(assert (=> bm!3886 (= call!3891 (arrayRangesEq!882 lt!365439 (ite c!11224 (array!11500 (store (arr!6027 lt!365439) (bvadd #b00000000000000000000000000000001 i!761) (_1!10698 lt!365672)) (size!5046 lt!365439)) lt!365439) #b00000000000000000000000000000000 (ite c!11224 (bvadd #b00000000000000000000000000000001 i!761) (size!5046 lt!365439))))))

(declare-fun d!77354 () Bool)

(declare-fun e!156280 () Bool)

(assert (=> d!77354 e!156280))

(declare-fun res!191369 () Bool)

(assert (=> d!77354 (=> res!191369 e!156280)))

(assert (=> d!77354 (= res!191369 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!365651 () Bool)

(declare-fun e!156279 () Bool)

(assert (=> d!77354 (= lt!365651 e!156279)))

(declare-fun res!191368 () Bool)

(assert (=> d!77354 (=> (not res!191368) (not e!156279))))

(declare-fun lt!365670 () tuple3!1474)

(declare-fun lt!365681 () (_ BitVec 64))

(declare-fun lt!365655 () (_ BitVec 64))

(assert (=> d!77354 (= res!191368 (= (bvadd lt!365681 lt!365655) (bitIndex!0 (size!5046 (buf!5587 (_2!10699 lt!365670))) (currentByte!10437 (_2!10699 lt!365670)) (currentBit!10432 (_2!10699 lt!365670)))))))

(assert (=> d!77354 (or (not (= (bvand lt!365681 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!365655 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!365681 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!365681 lt!365655) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!365648 () (_ BitVec 64))

(assert (=> d!77354 (= lt!365655 (bvmul lt!365648 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!77354 (or (= lt!365648 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!365648 #b0000000000000000000000000000000000000000000000000000000000001000) lt!365648)))))

(assert (=> d!77354 (= lt!365648 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!77354 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!77354 (= lt!365681 (bitIndex!0 (size!5046 (buf!5587 (_2!10698 lt!365440))) (currentByte!10437 (_2!10698 lt!365440)) (currentBit!10432 (_2!10698 lt!365440))))))

(assert (=> d!77354 (= lt!365670 e!156281)))

(assert (=> d!77354 (= c!11224 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!77354 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!5046 lt!365439)))))

(assert (=> d!77354 (= (readByteArrayLoop!0 (_2!10698 lt!365440) lt!365439 (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!365670)))

(declare-fun lt!365654 () (_ BitVec 32))

(declare-fun lt!365664 () array!11499)

(declare-fun bm!3887 () Bool)

(declare-fun lt!365680 () array!11499)

(declare-fun lt!365671 () (_ BitVec 32))

(assert (=> bm!3887 (= call!3889 (arrayRangesEq!882 (ite c!11224 lt!365439 lt!365680) (ite c!11224 (_3!879 lt!365657) lt!365664) (ite c!11224 lt!365656 lt!365671) (ite c!11224 (bvadd #b00000000000000000000000000000001 i!761) lt!365654)))))

(declare-fun b!228126 () Bool)

(assert (=> b!228126 (= e!156279 (arrayRangesEq!882 lt!365439 (_3!879 lt!365670) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun bm!3888 () Bool)

(assert (=> bm!3888 (= call!3890 (bitIndex!0 (size!5046 (buf!5587 (_2!10698 lt!365440))) (currentByte!10437 (_2!10698 lt!365440)) (currentBit!10432 (_2!10698 lt!365440))))))

(declare-fun lt!365652 () Unit!17099)

(declare-fun b!228127 () Bool)

(assert (=> b!228127 (= e!156281 (tuple3!1475 lt!365652 (_2!10698 lt!365440) lt!365439))))

(assert (=> b!228127 (= call!3890 call!3890)))

(declare-fun lt!365658 () Unit!17099)

(declare-fun Unit!17115 () Unit!17099)

(assert (=> b!228127 (= lt!365658 Unit!17115)))

(declare-fun lt!365665 () Unit!17099)

(declare-fun arrayRangesEqReflexiveLemma!139 (array!11499) Unit!17099)

(assert (=> b!228127 (= lt!365665 (arrayRangesEqReflexiveLemma!139 lt!365439))))

(assert (=> b!228127 call!3891))

(declare-fun lt!365675 () Unit!17099)

(assert (=> b!228127 (= lt!365675 lt!365665)))

(assert (=> b!228127 (= lt!365680 lt!365439)))

(assert (=> b!228127 (= lt!365664 lt!365439)))

(declare-fun lt!365678 () (_ BitVec 32))

(assert (=> b!228127 (= lt!365678 #b00000000000000000000000000000000)))

(declare-fun lt!365676 () (_ BitVec 32))

(assert (=> b!228127 (= lt!365676 (size!5046 lt!365439))))

(assert (=> b!228127 (= lt!365671 #b00000000000000000000000000000000)))

(assert (=> b!228127 (= lt!365654 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!124 (array!11499 array!11499 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17099)

(assert (=> b!228127 (= lt!365652 (arrayRangesEqSlicedLemma!124 lt!365680 lt!365664 lt!365678 lt!365676 lt!365671 lt!365654))))

(assert (=> b!228127 call!3889))

(declare-fun b!228128 () Bool)

(declare-fun res!191370 () Bool)

(assert (=> b!228128 (=> (not res!191370) (not e!156279))))

(assert (=> b!228128 (= res!191370 (and (= (buf!5587 (_2!10698 lt!365440)) (buf!5587 (_2!10699 lt!365670))) (= (size!5046 lt!365439) (size!5046 (_3!879 lt!365670)))))))

(declare-fun b!228129 () Bool)

(declare-datatypes ((tuple2!19644 0))(
  ( (tuple2!19645 (_1!10702 BitStream!9188) (_2!10702 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9188) tuple2!19644)

(assert (=> b!228129 (= e!156280 (= (select (arr!6027 (_3!879 lt!365670)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10702 (readBytePure!0 (_2!10698 lt!365440)))))))

(assert (=> b!228129 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!5046 (_3!879 lt!365670))))))

(assert (= (and d!77354 c!11224) b!228125))

(assert (= (and d!77354 (not c!11224)) b!228127))

(assert (= (or b!228125 b!228127) bm!3887))

(assert (= (or b!228125 b!228127) bm!3886))

(assert (= (or b!228125 b!228127) bm!3888))

(assert (= (and d!77354 res!191368) b!228128))

(assert (= (and b!228128 res!191370) b!228126))

(assert (= (and d!77354 (not res!191369)) b!228129))

(declare-fun m!351433 () Bool)

(assert (=> bm!3887 m!351433))

(declare-fun m!351435 () Bool)

(assert (=> bm!3886 m!351435))

(declare-fun m!351437 () Bool)

(assert (=> bm!3886 m!351437))

(declare-fun m!351439 () Bool)

(assert (=> d!77354 m!351439))

(assert (=> d!77354 m!351333))

(assert (=> bm!3888 m!351333))

(declare-fun m!351441 () Bool)

(assert (=> b!228129 m!351441))

(declare-fun m!351443 () Bool)

(assert (=> b!228129 m!351443))

(declare-fun m!351445 () Bool)

(assert (=> b!228125 m!351445))

(declare-fun m!351447 () Bool)

(assert (=> b!228125 m!351447))

(declare-fun m!351449 () Bool)

(assert (=> b!228125 m!351449))

(declare-fun m!351451 () Bool)

(assert (=> b!228125 m!351451))

(declare-fun m!351453 () Bool)

(assert (=> b!228125 m!351453))

(declare-fun m!351455 () Bool)

(assert (=> b!228125 m!351455))

(assert (=> b!228125 m!351435))

(declare-fun m!351457 () Bool)

(assert (=> b!228125 m!351457))

(declare-fun m!351459 () Bool)

(assert (=> b!228125 m!351459))

(declare-fun m!351461 () Bool)

(assert (=> b!228125 m!351461))

(declare-fun m!351463 () Bool)

(assert (=> b!228125 m!351463))

(declare-fun m!351465 () Bool)

(assert (=> b!228125 m!351465))

(declare-fun m!351467 () Bool)

(assert (=> b!228125 m!351467))

(declare-fun m!351469 () Bool)

(assert (=> b!228126 m!351469))

(declare-fun m!351471 () Bool)

(assert (=> b!228127 m!351471))

(declare-fun m!351473 () Bool)

(assert (=> b!228127 m!351473))

(assert (=> b!228059 d!77354))

(declare-fun d!77388 () Bool)

(assert (=> d!77388 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!5046 lt!365439)) (bvslt i!761 (size!5046 (_3!879 lt!365448))) (= (select (arr!6027 lt!365439) i!761) (select (arr!6027 (_3!879 lt!365448)) i!761)))))

(declare-fun lt!365685 () Unit!17099)

(declare-fun choose!328 (array!11499 array!11499 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17099)

(assert (=> d!77388 (= lt!365685 (choose!328 lt!365439 (_3!879 lt!365448) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77388 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77388 (= (arrayRangesEqImpliesEq!138 lt!365439 (_3!879 lt!365448) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!365685)))

(declare-fun bs!18925 () Bool)

(assert (= bs!18925 d!77388))

(declare-fun m!351475 () Bool)

(assert (=> bs!18925 m!351475))

(assert (=> bs!18925 m!351327))

(declare-fun m!351477 () Bool)

(assert (=> bs!18925 m!351477))

(assert (=> b!228059 d!77388))

(declare-fun d!77390 () Bool)

(assert (=> d!77390 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5046 (buf!5587 (_2!10698 lt!365440)))) ((_ sign_extend 32) (currentByte!10437 (_2!10698 lt!365440))) ((_ sign_extend 32) (currentBit!10432 (_2!10698 lt!365440))) lt!365450) (bvsle ((_ sign_extend 32) lt!365450) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5046 (buf!5587 (_2!10698 lt!365440)))) ((_ sign_extend 32) (currentByte!10437 (_2!10698 lt!365440))) ((_ sign_extend 32) (currentBit!10432 (_2!10698 lt!365440)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18926 () Bool)

(assert (= bs!18926 d!77390))

(declare-fun m!351479 () Bool)

(assert (=> bs!18926 m!351479))

(assert (=> b!228059 d!77390))

(declare-fun d!77392 () Bool)

(declare-fun lt!365717 () (_ BitVec 8))

(declare-fun lt!365716 () (_ BitVec 8))

(assert (=> d!77392 (= lt!365717 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!6027 (buf!5587 thiss!1870)) (currentByte!10437 thiss!1870))) ((_ sign_extend 24) lt!365716))))))

(assert (=> d!77392 (= lt!365716 ((_ extract 7 0) (currentBit!10432 thiss!1870)))))

(declare-fun e!156288 () Bool)

(assert (=> d!77392 e!156288))

(declare-fun res!191376 () Bool)

(assert (=> d!77392 (=> (not res!191376) (not e!156288))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!77392 (= res!191376 (validate_offset_bits!1 ((_ sign_extend 32) (size!5046 (buf!5587 thiss!1870))) ((_ sign_extend 32) (currentByte!10437 thiss!1870)) ((_ sign_extend 32) (currentBit!10432 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19646 0))(
  ( (tuple2!19647 (_1!10703 Unit!17099) (_2!10703 (_ BitVec 8))) )
))
(declare-fun Unit!17123 () Unit!17099)

(declare-fun Unit!17124 () Unit!17099)

(assert (=> d!77392 (= (readByte!0 thiss!1870) (tuple2!19639 (_2!10703 (ite (bvsgt ((_ sign_extend 24) lt!365716) #b00000000000000000000000000000000) (tuple2!19647 Unit!17123 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!365717) (bvlshr (bvand ((_ sign_extend 24) (select (arr!6027 (buf!5587 thiss!1870)) (bvadd (currentByte!10437 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!365716)))))))) (tuple2!19647 Unit!17124 lt!365717))) (BitStream!9189 (buf!5587 thiss!1870) (bvadd (currentByte!10437 thiss!1870) #b00000000000000000000000000000001) (currentBit!10432 thiss!1870))))))

(declare-fun b!228138 () Bool)

(declare-fun e!156289 () Bool)

(assert (=> b!228138 (= e!156288 e!156289)))

(declare-fun res!191377 () Bool)

(assert (=> b!228138 (=> (not res!191377) (not e!156289))))

(declare-fun lt!365719 () tuple2!19638)

(assert (=> b!228138 (= res!191377 (= (buf!5587 (_2!10698 lt!365719)) (buf!5587 thiss!1870)))))

(declare-fun lt!365718 () (_ BitVec 8))

(declare-fun lt!365720 () (_ BitVec 8))

(declare-fun Unit!17129 () Unit!17099)

(declare-fun Unit!17130 () Unit!17099)

(assert (=> b!228138 (= lt!365719 (tuple2!19639 (_2!10703 (ite (bvsgt ((_ sign_extend 24) lt!365720) #b00000000000000000000000000000000) (tuple2!19647 Unit!17129 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!365718) (bvlshr (bvand ((_ sign_extend 24) (select (arr!6027 (buf!5587 thiss!1870)) (bvadd (currentByte!10437 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!365720)))))))) (tuple2!19647 Unit!17130 lt!365718))) (BitStream!9189 (buf!5587 thiss!1870) (bvadd (currentByte!10437 thiss!1870) #b00000000000000000000000000000001) (currentBit!10432 thiss!1870))))))

(assert (=> b!228138 (= lt!365718 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!6027 (buf!5587 thiss!1870)) (currentByte!10437 thiss!1870))) ((_ sign_extend 24) lt!365720))))))

(assert (=> b!228138 (= lt!365720 ((_ extract 7 0) (currentBit!10432 thiss!1870)))))

(declare-fun lt!365715 () (_ BitVec 64))

(declare-fun b!228139 () Bool)

(declare-fun lt!365714 () (_ BitVec 64))

(assert (=> b!228139 (= e!156289 (= (bitIndex!0 (size!5046 (buf!5587 (_2!10698 lt!365719))) (currentByte!10437 (_2!10698 lt!365719)) (currentBit!10432 (_2!10698 lt!365719))) (bvadd lt!365714 lt!365715)))))

(assert (=> b!228139 (or (not (= (bvand lt!365714 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!365715 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!365714 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!365714 lt!365715) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!228139 (= lt!365715 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!228139 (= lt!365714 (bitIndex!0 (size!5046 (buf!5587 thiss!1870)) (currentByte!10437 thiss!1870) (currentBit!10432 thiss!1870)))))

(assert (= (and d!77392 res!191376) b!228138))

(assert (= (and b!228138 res!191377) b!228139))

(declare-fun m!351481 () Bool)

(assert (=> d!77392 m!351481))

(declare-fun m!351483 () Bool)

(assert (=> d!77392 m!351483))

(declare-fun m!351485 () Bool)

(assert (=> d!77392 m!351485))

(assert (=> b!228138 m!351485))

(assert (=> b!228138 m!351481))

(declare-fun m!351487 () Bool)

(assert (=> b!228139 m!351487))

(assert (=> b!228139 m!351343))

(assert (=> b!228059 d!77392))

(declare-fun d!77394 () Bool)

(assert (=> d!77394 (arrayRangesEq!882 arr!308 (_3!879 lt!365448) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!365773 () Unit!17099)

(declare-fun choose!331 (array!11499 array!11499 array!11499 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17099)

(assert (=> d!77394 (= lt!365773 (choose!331 arr!308 lt!365439 (_3!879 lt!365448) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77394 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77394 (= (arrayRangesEqTransitive!305 arr!308 lt!365439 (_3!879 lt!365448) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!365773)))

(declare-fun bs!18927 () Bool)

(assert (= bs!18927 d!77394))

(assert (=> bs!18927 m!351345))

(declare-fun m!351489 () Bool)

(assert (=> bs!18927 m!351489))

(assert (=> b!228059 d!77394))

(declare-fun d!77396 () Bool)

(declare-fun e!156296 () Bool)

(assert (=> d!77396 e!156296))

(declare-fun res!191386 () Bool)

(assert (=> d!77396 (=> (not res!191386) (not e!156296))))

(assert (=> d!77396 (= res!191386 (and (or (let ((rhs!4013 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!4013 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!4013) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!77397 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!77397 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!77397 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!4012 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!4012 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!4012) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!365789 () Unit!17099)

(declare-fun choose!57 (BitStream!9188 BitStream!9188 (_ BitVec 64) (_ BitVec 32)) Unit!17099)

(assert (=> d!77396 (= lt!365789 (choose!57 thiss!1870 (_2!10698 lt!365440) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!77396 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10698 lt!365440) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!365789)))

(declare-fun b!228148 () Bool)

(declare-fun lt!365790 () (_ BitVec 32))

(assert (=> b!228148 (= e!156296 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5046 (buf!5587 (_2!10698 lt!365440)))) ((_ sign_extend 32) (currentByte!10437 (_2!10698 lt!365440))) ((_ sign_extend 32) (currentBit!10432 (_2!10698 lt!365440))) (bvsub (bvsub to!496 i!761) lt!365790)))))

(assert (=> b!228148 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!365790 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!365790) #b10000000000000000000000000000000)))))

(declare-fun lt!365788 () (_ BitVec 64))

(assert (=> b!228148 (= lt!365790 ((_ extract 31 0) lt!365788))))

(assert (=> b!228148 (and (bvslt lt!365788 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!365788 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!228148 (= lt!365788 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!77396 res!191386) b!228148))

(declare-fun m!351491 () Bool)

(assert (=> d!77396 m!351491))

(declare-fun m!351493 () Bool)

(assert (=> b!228148 m!351493))

(assert (=> b!228059 d!77396))

(declare-fun d!77399 () Bool)

(declare-fun res!191394 () Bool)

(declare-fun e!156304 () Bool)

(assert (=> d!77399 (=> res!191394 e!156304)))

(assert (=> d!77399 (= res!191394 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!77399 (= (arrayRangesEq!882 arr!308 lt!365439 #b00000000000000000000000000000000 i!761) e!156304)))

(declare-fun b!228158 () Bool)

(declare-fun e!156305 () Bool)

(assert (=> b!228158 (= e!156304 e!156305)))

(declare-fun res!191395 () Bool)

(assert (=> b!228158 (=> (not res!191395) (not e!156305))))

(assert (=> b!228158 (= res!191395 (= (select (arr!6027 arr!308) #b00000000000000000000000000000000) (select (arr!6027 lt!365439) #b00000000000000000000000000000000)))))

(declare-fun b!228159 () Bool)

(assert (=> b!228159 (= e!156305 (arrayRangesEq!882 arr!308 lt!365439 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!77399 (not res!191394)) b!228158))

(assert (= (and b!228158 res!191395) b!228159))

(declare-fun m!351495 () Bool)

(assert (=> b!228158 m!351495))

(declare-fun m!351497 () Bool)

(assert (=> b!228158 m!351497))

(declare-fun m!351499 () Bool)

(assert (=> b!228159 m!351499))

(assert (=> b!228059 d!77399))

(declare-fun d!77401 () Bool)

(declare-fun e!156308 () Bool)

(assert (=> d!77401 e!156308))

(declare-fun res!191401 () Bool)

(assert (=> d!77401 (=> (not res!191401) (not e!156308))))

(declare-fun lt!365847 () (_ BitVec 64))

(declare-fun lt!365844 () (_ BitVec 64))

(declare-fun lt!365845 () (_ BitVec 64))

(assert (=> d!77401 (= res!191401 (= lt!365847 (bvsub lt!365845 lt!365844)))))

(assert (=> d!77401 (or (= (bvand lt!365845 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!365844 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!365845 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!365845 lt!365844) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77401 (= lt!365844 (remainingBits!0 ((_ sign_extend 32) (size!5046 (buf!5587 thiss!1870))) ((_ sign_extend 32) (currentByte!10437 thiss!1870)) ((_ sign_extend 32) (currentBit!10432 thiss!1870))))))

(declare-fun lt!365846 () (_ BitVec 64))

(declare-fun lt!365848 () (_ BitVec 64))

(assert (=> d!77401 (= lt!365845 (bvmul lt!365846 lt!365848))))

(assert (=> d!77401 (or (= lt!365846 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!365848 (bvsdiv (bvmul lt!365846 lt!365848) lt!365846)))))

(assert (=> d!77401 (= lt!365848 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77401 (= lt!365846 ((_ sign_extend 32) (size!5046 (buf!5587 thiss!1870))))))

(assert (=> d!77401 (= lt!365847 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10437 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10432 thiss!1870))))))

(assert (=> d!77401 (invariant!0 (currentBit!10432 thiss!1870) (currentByte!10437 thiss!1870) (size!5046 (buf!5587 thiss!1870)))))

(assert (=> d!77401 (= (bitIndex!0 (size!5046 (buf!5587 thiss!1870)) (currentByte!10437 thiss!1870) (currentBit!10432 thiss!1870)) lt!365847)))

(declare-fun b!228164 () Bool)

(declare-fun res!191400 () Bool)

(assert (=> b!228164 (=> (not res!191400) (not e!156308))))

(assert (=> b!228164 (= res!191400 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!365847))))

(declare-fun b!228165 () Bool)

(declare-fun lt!365849 () (_ BitVec 64))

(assert (=> b!228165 (= e!156308 (bvsle lt!365847 (bvmul lt!365849 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!228165 (or (= lt!365849 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!365849 #b0000000000000000000000000000000000000000000000000000000000001000) lt!365849)))))

(assert (=> b!228165 (= lt!365849 ((_ sign_extend 32) (size!5046 (buf!5587 thiss!1870))))))

(assert (= (and d!77401 res!191401) b!228164))

(assert (= (and b!228164 res!191400) b!228165))

(assert (=> d!77401 m!351371))

(assert (=> d!77401 m!351369))

(assert (=> b!228059 d!77401))

(declare-fun d!77411 () Bool)

(declare-fun e!156313 () Bool)

(assert (=> d!77411 e!156313))

(declare-fun res!191404 () Bool)

(assert (=> d!77411 (=> (not res!191404) (not e!156313))))

(assert (=> d!77411 (= res!191404 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!5046 arr!308))))))

(declare-fun lt!365914 () Unit!17099)

(declare-fun choose!332 (array!11499 (_ BitVec 32) (_ BitVec 8)) Unit!17099)

(assert (=> d!77411 (= lt!365914 (choose!332 arr!308 i!761 (_1!10698 lt!365440)))))

(assert (=> d!77411 (and (bvsle #b00000000000000000000000000000000 i!761) (bvslt i!761 (size!5046 arr!308)))))

(assert (=> d!77411 (= (arrayUpdatedAtPrefixLemma!441 arr!308 i!761 (_1!10698 lt!365440)) lt!365914)))

(declare-fun b!228172 () Bool)

(assert (=> b!228172 (= e!156313 (arrayRangesEq!882 arr!308 (array!11500 (store (arr!6027 arr!308) i!761 (_1!10698 lt!365440)) (size!5046 arr!308)) #b00000000000000000000000000000000 i!761))))

(assert (= (and d!77411 res!191404) b!228172))

(declare-fun m!351545 () Bool)

(assert (=> d!77411 m!351545))

(assert (=> b!228172 m!351351))

(declare-fun m!351547 () Bool)

(assert (=> b!228172 m!351547))

(assert (=> b!228059 d!77411))

(declare-fun d!77413 () Bool)

(declare-fun e!156314 () Bool)

(assert (=> d!77413 e!156314))

(declare-fun res!191406 () Bool)

(assert (=> d!77413 (=> (not res!191406) (not e!156314))))

(declare-fun lt!365918 () (_ BitVec 64))

(declare-fun lt!365915 () (_ BitVec 64))

(declare-fun lt!365916 () (_ BitVec 64))

(assert (=> d!77413 (= res!191406 (= lt!365918 (bvsub lt!365916 lt!365915)))))

(assert (=> d!77413 (or (= (bvand lt!365916 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!365915 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!365916 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!365916 lt!365915) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77413 (= lt!365915 (remainingBits!0 ((_ sign_extend 32) (size!5046 (buf!5587 (_2!10699 lt!365448)))) ((_ sign_extend 32) (currentByte!10437 (_2!10699 lt!365448))) ((_ sign_extend 32) (currentBit!10432 (_2!10699 lt!365448)))))))

(declare-fun lt!365917 () (_ BitVec 64))

(declare-fun lt!365919 () (_ BitVec 64))

(assert (=> d!77413 (= lt!365916 (bvmul lt!365917 lt!365919))))

(assert (=> d!77413 (or (= lt!365917 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!365919 (bvsdiv (bvmul lt!365917 lt!365919) lt!365917)))))

(assert (=> d!77413 (= lt!365919 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77413 (= lt!365917 ((_ sign_extend 32) (size!5046 (buf!5587 (_2!10699 lt!365448)))))))

(assert (=> d!77413 (= lt!365918 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10437 (_2!10699 lt!365448))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10432 (_2!10699 lt!365448)))))))

(assert (=> d!77413 (invariant!0 (currentBit!10432 (_2!10699 lt!365448)) (currentByte!10437 (_2!10699 lt!365448)) (size!5046 (buf!5587 (_2!10699 lt!365448))))))

(assert (=> d!77413 (= (bitIndex!0 (size!5046 (buf!5587 (_2!10699 lt!365448))) (currentByte!10437 (_2!10699 lt!365448)) (currentBit!10432 (_2!10699 lt!365448))) lt!365918)))

(declare-fun b!228173 () Bool)

(declare-fun res!191405 () Bool)

(assert (=> b!228173 (=> (not res!191405) (not e!156314))))

(assert (=> b!228173 (= res!191405 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!365918))))

(declare-fun b!228174 () Bool)

(declare-fun lt!365920 () (_ BitVec 64))

(assert (=> b!228174 (= e!156314 (bvsle lt!365918 (bvmul lt!365920 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!228174 (or (= lt!365920 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!365920 #b0000000000000000000000000000000000000000000000000000000000001000) lt!365920)))))

(assert (=> b!228174 (= lt!365920 ((_ sign_extend 32) (size!5046 (buf!5587 (_2!10699 lt!365448)))))))

(assert (= (and d!77413 res!191406) b!228173))

(assert (= (and b!228173 res!191405) b!228174))

(declare-fun m!351549 () Bool)

(assert (=> d!77413 m!351549))

(declare-fun m!351551 () Bool)

(assert (=> d!77413 m!351551))

(assert (=> b!228059 d!77413))

(declare-fun d!77415 () Bool)

(declare-fun res!191407 () Bool)

(declare-fun e!156315 () Bool)

(assert (=> d!77415 (=> res!191407 e!156315)))

(assert (=> d!77415 (= res!191407 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!77415 (= (arrayRangesEq!882 arr!308 (_3!879 lt!365448) #b00000000000000000000000000000000 i!761) e!156315)))

(declare-fun b!228175 () Bool)

(declare-fun e!156316 () Bool)

(assert (=> b!228175 (= e!156315 e!156316)))

(declare-fun res!191408 () Bool)

(assert (=> b!228175 (=> (not res!191408) (not e!156316))))

(assert (=> b!228175 (= res!191408 (= (select (arr!6027 arr!308) #b00000000000000000000000000000000) (select (arr!6027 (_3!879 lt!365448)) #b00000000000000000000000000000000)))))

(declare-fun b!228176 () Bool)

(assert (=> b!228176 (= e!156316 (arrayRangesEq!882 arr!308 (_3!879 lt!365448) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!77415 (not res!191407)) b!228175))

(assert (= (and b!228175 res!191408) b!228176))

(assert (=> b!228175 m!351495))

(declare-fun m!351553 () Bool)

(assert (=> b!228175 m!351553))

(declare-fun m!351555 () Bool)

(assert (=> b!228176 m!351555))

(assert (=> b!228059 d!77415))

(declare-fun d!77417 () Bool)

(declare-fun e!156317 () Bool)

(assert (=> d!77417 e!156317))

(declare-fun res!191410 () Bool)

(assert (=> d!77417 (=> (not res!191410) (not e!156317))))

(declare-fun lt!365921 () (_ BitVec 64))

(declare-fun lt!365924 () (_ BitVec 64))

(declare-fun lt!365922 () (_ BitVec 64))

(assert (=> d!77417 (= res!191410 (= lt!365924 (bvsub lt!365922 lt!365921)))))

(assert (=> d!77417 (or (= (bvand lt!365922 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!365921 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!365922 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!365922 lt!365921) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77417 (= lt!365921 (remainingBits!0 ((_ sign_extend 32) (size!5046 (buf!5587 (_2!10698 lt!365440)))) ((_ sign_extend 32) (currentByte!10437 (_2!10698 lt!365440))) ((_ sign_extend 32) (currentBit!10432 (_2!10698 lt!365440)))))))

(declare-fun lt!365923 () (_ BitVec 64))

(declare-fun lt!365925 () (_ BitVec 64))

(assert (=> d!77417 (= lt!365922 (bvmul lt!365923 lt!365925))))

(assert (=> d!77417 (or (= lt!365923 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!365925 (bvsdiv (bvmul lt!365923 lt!365925) lt!365923)))))

(assert (=> d!77417 (= lt!365925 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77417 (= lt!365923 ((_ sign_extend 32) (size!5046 (buf!5587 (_2!10698 lt!365440)))))))

(assert (=> d!77417 (= lt!365924 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10437 (_2!10698 lt!365440))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10432 (_2!10698 lt!365440)))))))

(assert (=> d!77417 (invariant!0 (currentBit!10432 (_2!10698 lt!365440)) (currentByte!10437 (_2!10698 lt!365440)) (size!5046 (buf!5587 (_2!10698 lt!365440))))))

(assert (=> d!77417 (= (bitIndex!0 (size!5046 (buf!5587 (_2!10698 lt!365440))) (currentByte!10437 (_2!10698 lt!365440)) (currentBit!10432 (_2!10698 lt!365440))) lt!365924)))

(declare-fun b!228177 () Bool)

(declare-fun res!191409 () Bool)

(assert (=> b!228177 (=> (not res!191409) (not e!156317))))

(assert (=> b!228177 (= res!191409 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!365924))))

(declare-fun b!228178 () Bool)

(declare-fun lt!365926 () (_ BitVec 64))

(assert (=> b!228178 (= e!156317 (bvsle lt!365924 (bvmul lt!365926 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!228178 (or (= lt!365926 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!365926 #b0000000000000000000000000000000000000000000000000000000000001000) lt!365926)))))

(assert (=> b!228178 (= lt!365926 ((_ sign_extend 32) (size!5046 (buf!5587 (_2!10698 lt!365440)))))))

(assert (= (and d!77417 res!191410) b!228177))

(assert (= (and b!228177 res!191409) b!228178))

(assert (=> d!77417 m!351479))

(declare-fun m!351557 () Bool)

(assert (=> d!77417 m!351557))

(assert (=> b!228059 d!77417))

(push 1)

(assert (not d!77350))

(assert (not d!77388))

(assert (not d!77413))

(assert (not d!77394))

(assert (not b!228176))

(assert (not bm!3887))

(assert (not d!77392))

(assert (not d!77396))

(assert (not b!228159))

(assert (not d!77348))

(assert (not b!228129))

(assert (not d!77417))

(assert (not d!77354))

(assert (not b!228125))

(assert (not d!77411))

(assert (not b!228172))

(assert (not b!228148))

(assert (not b!228127))

(assert (not bm!3888))

(assert (not b!228126))

(assert (not d!77390))

(assert (not d!77401))

(assert (not bm!3886))

(assert (not b!228139))

(check-sat)

(pop 1)

(push 1)

(check-sat)

