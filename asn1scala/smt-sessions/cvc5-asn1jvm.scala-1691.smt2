; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46940 () Bool)

(assert start!46940)

(declare-fun res!188691 () Bool)

(declare-fun e!153301 () Bool)

(assert (=> start!46940 (=> (not res!188691) (not e!153301))))

(declare-datatypes ((array!11118 0))(
  ( (array!11119 (arr!5833 (Array (_ BitVec 32) (_ BitVec 8))) (size!4879 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11118)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46940 (= res!188691 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4879 arr!308))))))

(assert (=> start!46940 e!153301))

(assert (=> start!46940 true))

(declare-fun array_inv!4620 (array!11118) Bool)

(assert (=> start!46940 (array_inv!4620 arr!308)))

(declare-datatypes ((BitStream!8860 0))(
  ( (BitStream!8861 (buf!5423 array!11118) (currentByte!10169 (_ BitVec 32)) (currentBit!10164 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8860)

(declare-fun e!153302 () Bool)

(declare-fun inv!12 (BitStream!8860) Bool)

(assert (=> start!46940 (and (inv!12 thiss!1870) e!153302)))

(declare-fun b!224825 () Bool)

(declare-fun res!188689 () Bool)

(assert (=> b!224825 (=> (not res!188689) (not e!153301))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224825 (= res!188689 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4879 (buf!5423 thiss!1870))) ((_ sign_extend 32) (currentByte!10169 thiss!1870)) ((_ sign_extend 32) (currentBit!10164 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224827 () Bool)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!224827 (= e!153301 (not (validate_offset_byte!0 ((_ sign_extend 32) (size!4879 (buf!5423 thiss!1870))) ((_ sign_extend 32) (currentByte!10169 thiss!1870)) ((_ sign_extend 32) (currentBit!10164 thiss!1870)))))))

(declare-datatypes ((tuple2!19268 0))(
  ( (tuple2!19269 (_1!10418 (_ BitVec 8)) (_2!10418 BitStream!8860)) )
))
(declare-fun lt!357687 () tuple2!19268)

(declare-datatypes ((Unit!16482 0))(
  ( (Unit!16483) )
))
(declare-datatypes ((tuple3!1284 0))(
  ( (tuple3!1285 (_1!10419 Unit!16482) (_2!10419 BitStream!8860) (_3!784 array!11118)) )
))
(declare-fun lt!357695 () tuple3!1284)

(assert (=> b!224827 (and (= (_1!10418 lt!357687) (select (arr!5833 (_3!784 lt!357695)) i!761)) (= (select (arr!5833 (_3!784 lt!357695)) i!761) (_1!10418 lt!357687)))))

(declare-fun lt!357694 () array!11118)

(declare-fun lt!357690 () Unit!16482)

(declare-fun arrayRangesEqImpliesEq!97 (array!11118 array!11118 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16482)

(assert (=> b!224827 (= lt!357690 (arrayRangesEqImpliesEq!97 lt!357694 (_3!784 lt!357695) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arrayRangesEq!775 (array!11118 array!11118 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224827 (arrayRangesEq!775 arr!308 (_3!784 lt!357695) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!357693 () Unit!16482)

(declare-fun arrayRangesEqTransitive!246 (array!11118 array!11118 array!11118 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16482)

(assert (=> b!224827 (= lt!357693 (arrayRangesEqTransitive!246 arr!308 lt!357694 (_3!784 lt!357695) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224827 (arrayRangesEq!775 arr!308 lt!357694 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!357692 () Unit!16482)

(declare-fun arrayUpdatedAtPrefixLemma!367 (array!11118 (_ BitVec 32) (_ BitVec 8)) Unit!16482)

(assert (=> b!224827 (= lt!357692 (arrayUpdatedAtPrefixLemma!367 arr!308 i!761 (_1!10418 lt!357687)))))

(declare-fun lt!357686 () (_ BitVec 64))

(declare-fun lt!357691 () (_ BitVec 64))

(declare-fun lt!357696 () (_ BitVec 32))

(declare-fun lt!357688 () (_ BitVec 64))

(assert (=> b!224827 (and (= (bvadd lt!357691 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!357696))) lt!357688) (= (bvadd lt!357686 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!357688) (= (buf!5423 thiss!1870) (buf!5423 (_2!10419 lt!357695))) (= (size!4879 arr!308) (size!4879 (_3!784 lt!357695))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224827 (= lt!357688 (bitIndex!0 (size!4879 (buf!5423 (_2!10419 lt!357695))) (currentByte!10169 (_2!10419 lt!357695)) (currentBit!10164 (_2!10419 lt!357695))))))

(assert (=> b!224827 (= lt!357691 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!357686))))

(assert (=> b!224827 (= lt!357691 (bitIndex!0 (size!4879 (buf!5423 (_2!10418 lt!357687))) (currentByte!10169 (_2!10418 lt!357687)) (currentBit!10164 (_2!10418 lt!357687))))))

(assert (=> b!224827 (= lt!357686 (bitIndex!0 (size!4879 (buf!5423 thiss!1870)) (currentByte!10169 thiss!1870) (currentBit!10164 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8860 array!11118 (_ BitVec 32) (_ BitVec 32)) tuple3!1284)

(assert (=> b!224827 (= lt!357695 (readByteArrayLoop!0 (_2!10418 lt!357687) lt!357694 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!224827 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4879 (buf!5423 (_2!10418 lt!357687)))) ((_ sign_extend 32) (currentByte!10169 (_2!10418 lt!357687))) ((_ sign_extend 32) (currentBit!10164 (_2!10418 lt!357687))) lt!357696)))

(assert (=> b!224827 (= lt!357696 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!357689 () Unit!16482)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8860 BitStream!8860 (_ BitVec 64) (_ BitVec 32)) Unit!16482)

(assert (=> b!224827 (= lt!357689 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10418 lt!357687) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224827 (= lt!357694 (array!11119 (store (arr!5833 arr!308) i!761 (_1!10418 lt!357687)) (size!4879 arr!308)))))

(declare-fun readByte!0 (BitStream!8860) tuple2!19268)

(assert (=> b!224827 (= lt!357687 (readByte!0 thiss!1870))))

(declare-fun b!224828 () Bool)

(assert (=> b!224828 (= e!153302 (array_inv!4620 (buf!5423 thiss!1870)))))

(declare-fun b!224826 () Bool)

(declare-fun res!188690 () Bool)

(assert (=> b!224826 (=> (not res!188690) (not e!153301))))

(assert (=> b!224826 (= res!188690 (bvslt i!761 to!496))))

(assert (= (and start!46940 res!188691) b!224825))

(assert (= (and b!224825 res!188689) b!224826))

(assert (= (and b!224826 res!188690) b!224827))

(assert (= start!46940 b!224828))

(declare-fun m!345527 () Bool)

(assert (=> start!46940 m!345527))

(declare-fun m!345529 () Bool)

(assert (=> start!46940 m!345529))

(declare-fun m!345531 () Bool)

(assert (=> b!224825 m!345531))

(declare-fun m!345533 () Bool)

(assert (=> b!224827 m!345533))

(declare-fun m!345535 () Bool)

(assert (=> b!224827 m!345535))

(declare-fun m!345537 () Bool)

(assert (=> b!224827 m!345537))

(declare-fun m!345539 () Bool)

(assert (=> b!224827 m!345539))

(declare-fun m!345541 () Bool)

(assert (=> b!224827 m!345541))

(declare-fun m!345543 () Bool)

(assert (=> b!224827 m!345543))

(declare-fun m!345545 () Bool)

(assert (=> b!224827 m!345545))

(declare-fun m!345547 () Bool)

(assert (=> b!224827 m!345547))

(declare-fun m!345549 () Bool)

(assert (=> b!224827 m!345549))

(declare-fun m!345551 () Bool)

(assert (=> b!224827 m!345551))

(declare-fun m!345553 () Bool)

(assert (=> b!224827 m!345553))

(declare-fun m!345555 () Bool)

(assert (=> b!224827 m!345555))

(declare-fun m!345557 () Bool)

(assert (=> b!224827 m!345557))

(declare-fun m!345559 () Bool)

(assert (=> b!224827 m!345559))

(declare-fun m!345561 () Bool)

(assert (=> b!224827 m!345561))

(declare-fun m!345563 () Bool)

(assert (=> b!224828 m!345563))

(push 1)

(assert (not start!46940))

(assert (not b!224825))

(assert (not b!224828))

(assert (not b!224827))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76251 () Bool)

(assert (=> d!76251 (= (array_inv!4620 arr!308) (bvsge (size!4879 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46940 d!76251))

(declare-fun d!76253 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!76253 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10164 thiss!1870) (currentByte!10169 thiss!1870) (size!4879 (buf!5423 thiss!1870))))))

(declare-fun bs!18604 () Bool)

(assert (= bs!18604 d!76253))

(declare-fun m!345641 () Bool)

(assert (=> bs!18604 m!345641))

(assert (=> start!46940 d!76253))

(declare-fun d!76255 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76255 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4879 (buf!5423 thiss!1870))) ((_ sign_extend 32) (currentByte!10169 thiss!1870)) ((_ sign_extend 32) (currentBit!10164 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4879 (buf!5423 thiss!1870))) ((_ sign_extend 32) (currentByte!10169 thiss!1870)) ((_ sign_extend 32) (currentBit!10164 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18605 () Bool)

(assert (= bs!18605 d!76255))

(declare-fun m!345643 () Bool)

(assert (=> bs!18605 m!345643))

(assert (=> b!224825 d!76255))

(declare-fun d!76257 () Bool)

(assert (=> d!76257 (= (array_inv!4620 (buf!5423 thiss!1870)) (bvsge (size!4879 (buf!5423 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!224828 d!76257))

(declare-fun d!76259 () Bool)

(assert (=> d!76259 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!4879 lt!357694)) (bvslt i!761 (size!4879 (_3!784 lt!357695))) (= (select (arr!5833 lt!357694) i!761) (select (arr!5833 (_3!784 lt!357695)) i!761)))))

(declare-fun lt!357765 () Unit!16482)

(declare-fun choose!295 (array!11118 array!11118 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16482)

(assert (=> d!76259 (= lt!357765 (choose!295 lt!357694 (_3!784 lt!357695) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76259 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76259 (= (arrayRangesEqImpliesEq!97 lt!357694 (_3!784 lt!357695) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!357765)))

(declare-fun bs!18606 () Bool)

(assert (= bs!18606 d!76259))

(declare-fun m!345645 () Bool)

(assert (=> bs!18606 m!345645))

(assert (=> bs!18606 m!345549))

(declare-fun m!345647 () Bool)

(assert (=> bs!18606 m!345647))

(assert (=> b!224827 d!76259))

(declare-fun d!76261 () Bool)

(declare-fun res!188714 () Bool)

(declare-fun e!153331 () Bool)

(assert (=> d!76261 (=> res!188714 e!153331)))

(assert (=> d!76261 (= res!188714 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!76261 (= (arrayRangesEq!775 arr!308 (_3!784 lt!357695) #b00000000000000000000000000000000 i!761) e!153331)))

(declare-fun b!224857 () Bool)

(declare-fun e!153332 () Bool)

(assert (=> b!224857 (= e!153331 e!153332)))

(declare-fun res!188715 () Bool)

(assert (=> b!224857 (=> (not res!188715) (not e!153332))))

(assert (=> b!224857 (= res!188715 (= (select (arr!5833 arr!308) #b00000000000000000000000000000000) (select (arr!5833 (_3!784 lt!357695)) #b00000000000000000000000000000000)))))

(declare-fun b!224858 () Bool)

(assert (=> b!224858 (= e!153332 (arrayRangesEq!775 arr!308 (_3!784 lt!357695) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!76261 (not res!188714)) b!224857))

(assert (= (and b!224857 res!188715) b!224858))

(declare-fun m!345649 () Bool)

(assert (=> b!224857 m!345649))

(declare-fun m!345651 () Bool)

(assert (=> b!224857 m!345651))

(declare-fun m!345653 () Bool)

(assert (=> b!224858 m!345653))

(assert (=> b!224827 d!76261))

(declare-fun d!76267 () Bool)

(declare-fun lt!357802 () (_ BitVec 8))

(declare-fun lt!357799 () (_ BitVec 8))

(assert (=> d!76267 (= lt!357802 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5833 (buf!5423 thiss!1870)) (currentByte!10169 thiss!1870))) ((_ sign_extend 24) lt!357799))))))

(assert (=> d!76267 (= lt!357799 ((_ extract 7 0) (currentBit!10164 thiss!1870)))))

(declare-fun e!153341 () Bool)

(assert (=> d!76267 e!153341))

(declare-fun res!188728 () Bool)

(assert (=> d!76267 (=> (not res!188728) (not e!153341))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76267 (= res!188728 (validate_offset_bits!1 ((_ sign_extend 32) (size!4879 (buf!5423 thiss!1870))) ((_ sign_extend 32) (currentByte!10169 thiss!1870)) ((_ sign_extend 32) (currentBit!10164 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19274 0))(
  ( (tuple2!19275 (_1!10424 Unit!16482) (_2!10424 (_ BitVec 8))) )
))
(declare-fun Unit!16489 () Unit!16482)

(declare-fun Unit!16490 () Unit!16482)

(assert (=> d!76267 (= (readByte!0 thiss!1870) (tuple2!19269 (_2!10424 (ite (bvsgt ((_ sign_extend 24) lt!357799) #b00000000000000000000000000000000) (tuple2!19275 Unit!16489 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!357802) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5833 (buf!5423 thiss!1870)) (bvadd (currentByte!10169 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!357799)))))))) (tuple2!19275 Unit!16490 lt!357802))) (BitStream!8861 (buf!5423 thiss!1870) (bvadd (currentByte!10169 thiss!1870) #b00000000000000000000000000000001) (currentBit!10164 thiss!1870))))))

(declare-fun b!224869 () Bool)

(declare-fun e!153340 () Bool)

(assert (=> b!224869 (= e!153341 e!153340)))

(declare-fun res!188729 () Bool)

(assert (=> b!224869 (=> (not res!188729) (not e!153340))))

(declare-fun lt!357798 () tuple2!19268)

(assert (=> b!224869 (= res!188729 (= (buf!5423 (_2!10418 lt!357798)) (buf!5423 thiss!1870)))))

(declare-fun lt!357800 () (_ BitVec 8))

(declare-fun lt!357803 () (_ BitVec 8))

(declare-fun Unit!16491 () Unit!16482)

(declare-fun Unit!16492 () Unit!16482)

(assert (=> b!224869 (= lt!357798 (tuple2!19269 (_2!10424 (ite (bvsgt ((_ sign_extend 24) lt!357800) #b00000000000000000000000000000000) (tuple2!19275 Unit!16491 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!357803) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5833 (buf!5423 thiss!1870)) (bvadd (currentByte!10169 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!357800)))))))) (tuple2!19275 Unit!16492 lt!357803))) (BitStream!8861 (buf!5423 thiss!1870) (bvadd (currentByte!10169 thiss!1870) #b00000000000000000000000000000001) (currentBit!10164 thiss!1870))))))

(assert (=> b!224869 (= lt!357803 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5833 (buf!5423 thiss!1870)) (currentByte!10169 thiss!1870))) ((_ sign_extend 24) lt!357800))))))

(assert (=> b!224869 (= lt!357800 ((_ extract 7 0) (currentBit!10164 thiss!1870)))))

(declare-fun b!224870 () Bool)

(declare-fun lt!357801 () (_ BitVec 64))

(declare-fun lt!357804 () (_ BitVec 64))

(assert (=> b!224870 (= e!153340 (= (bitIndex!0 (size!4879 (buf!5423 (_2!10418 lt!357798))) (currentByte!10169 (_2!10418 lt!357798)) (currentBit!10164 (_2!10418 lt!357798))) (bvadd lt!357801 lt!357804)))))

(assert (=> b!224870 (or (not (= (bvand lt!357801 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!357804 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!357801 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!357801 lt!357804) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!224870 (= lt!357804 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!224870 (= lt!357801 (bitIndex!0 (size!4879 (buf!5423 thiss!1870)) (currentByte!10169 thiss!1870) (currentBit!10164 thiss!1870)))))

(assert (= (and d!76267 res!188728) b!224869))

(assert (= (and b!224869 res!188729) b!224870))

(declare-fun m!345663 () Bool)

(assert (=> d!76267 m!345663))

(declare-fun m!345665 () Bool)

(assert (=> d!76267 m!345665))

(declare-fun m!345667 () Bool)

(assert (=> d!76267 m!345667))

(assert (=> b!224869 m!345667))

(assert (=> b!224869 m!345663))

(declare-fun m!345669 () Bool)

(assert (=> b!224870 m!345669))

(assert (=> b!224870 m!345557))

(assert (=> b!224827 d!76267))

(declare-fun d!76281 () Bool)

(assert (=> d!76281 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4879 (buf!5423 (_2!10418 lt!357687)))) ((_ sign_extend 32) (currentByte!10169 (_2!10418 lt!357687))) ((_ sign_extend 32) (currentBit!10164 (_2!10418 lt!357687))) lt!357696) (bvsle ((_ sign_extend 32) lt!357696) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4879 (buf!5423 (_2!10418 lt!357687)))) ((_ sign_extend 32) (currentByte!10169 (_2!10418 lt!357687))) ((_ sign_extend 32) (currentBit!10164 (_2!10418 lt!357687)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18609 () Bool)

(assert (= bs!18609 d!76281))

(declare-fun m!345671 () Bool)

(assert (=> bs!18609 m!345671))

(assert (=> b!224827 d!76281))

(declare-fun d!76283 () Bool)

(declare-fun e!153344 () Bool)

(assert (=> d!76283 e!153344))

(declare-fun res!188735 () Bool)

(assert (=> d!76283 (=> (not res!188735) (not e!153344))))

(declare-fun lt!357817 () (_ BitVec 64))

(declare-fun lt!357821 () (_ BitVec 64))

(declare-fun lt!357820 () (_ BitVec 64))

(assert (=> d!76283 (= res!188735 (= lt!357820 (bvsub lt!357821 lt!357817)))))

(assert (=> d!76283 (or (= (bvand lt!357821 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!357817 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!357821 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!357821 lt!357817) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76283 (= lt!357817 (remainingBits!0 ((_ sign_extend 32) (size!4879 (buf!5423 thiss!1870))) ((_ sign_extend 32) (currentByte!10169 thiss!1870)) ((_ sign_extend 32) (currentBit!10164 thiss!1870))))))

(declare-fun lt!357818 () (_ BitVec 64))

(declare-fun lt!357822 () (_ BitVec 64))

(assert (=> d!76283 (= lt!357821 (bvmul lt!357818 lt!357822))))

(assert (=> d!76283 (or (= lt!357818 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!357822 (bvsdiv (bvmul lt!357818 lt!357822) lt!357818)))))

(assert (=> d!76283 (= lt!357822 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76283 (= lt!357818 ((_ sign_extend 32) (size!4879 (buf!5423 thiss!1870))))))

(assert (=> d!76283 (= lt!357820 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10169 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10164 thiss!1870))))))

(assert (=> d!76283 (invariant!0 (currentBit!10164 thiss!1870) (currentByte!10169 thiss!1870) (size!4879 (buf!5423 thiss!1870)))))

(assert (=> d!76283 (= (bitIndex!0 (size!4879 (buf!5423 thiss!1870)) (currentByte!10169 thiss!1870) (currentBit!10164 thiss!1870)) lt!357820)))

(declare-fun b!224875 () Bool)

(declare-fun res!188734 () Bool)

(assert (=> b!224875 (=> (not res!188734) (not e!153344))))

(assert (=> b!224875 (= res!188734 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!357820))))

(declare-fun b!224876 () Bool)

(declare-fun lt!357819 () (_ BitVec 64))

(assert (=> b!224876 (= e!153344 (bvsle lt!357820 (bvmul lt!357819 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!224876 (or (= lt!357819 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!357819 #b0000000000000000000000000000000000000000000000000000000000001000) lt!357819)))))

(assert (=> b!224876 (= lt!357819 ((_ sign_extend 32) (size!4879 (buf!5423 thiss!1870))))))

(assert (= (and d!76283 res!188735) b!224875))

(assert (= (and b!224875 res!188734) b!224876))

(assert (=> d!76283 m!345643))

(assert (=> d!76283 m!345641))

(assert (=> b!224827 d!76283))

(declare-fun d!76285 () Bool)

(declare-fun e!153347 () Bool)

(assert (=> d!76285 e!153347))

(declare-fun res!188738 () Bool)

(assert (=> d!76285 (=> (not res!188738) (not e!153347))))

(assert (=> d!76285 (= res!188738 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!4879 arr!308))))))

(declare-fun lt!357825 () Unit!16482)

(declare-fun choose!296 (array!11118 (_ BitVec 32) (_ BitVec 8)) Unit!16482)

(assert (=> d!76285 (= lt!357825 (choose!296 arr!308 i!761 (_1!10418 lt!357687)))))

(assert (=> d!76285 (and (bvsle #b00000000000000000000000000000000 i!761) (bvslt i!761 (size!4879 arr!308)))))

(assert (=> d!76285 (= (arrayUpdatedAtPrefixLemma!367 arr!308 i!761 (_1!10418 lt!357687)) lt!357825)))

(declare-fun b!224879 () Bool)

(assert (=> b!224879 (= e!153347 (arrayRangesEq!775 arr!308 (array!11119 (store (arr!5833 arr!308) i!761 (_1!10418 lt!357687)) (size!4879 arr!308)) #b00000000000000000000000000000000 i!761))))

(assert (= (and d!76285 res!188738) b!224879))

(declare-fun m!345673 () Bool)

(assert (=> d!76285 m!345673))

(assert (=> b!224879 m!345561))

(declare-fun m!345675 () Bool)

(assert (=> b!224879 m!345675))

(assert (=> b!224827 d!76285))

(declare-fun d!76287 () Bool)

(declare-fun e!153348 () Bool)

(assert (=> d!76287 e!153348))

(declare-fun res!188740 () Bool)

(assert (=> d!76287 (=> (not res!188740) (not e!153348))))

(declare-fun lt!357830 () (_ BitVec 64))

(declare-fun lt!357826 () (_ BitVec 64))

(declare-fun lt!357829 () (_ BitVec 64))

(assert (=> d!76287 (= res!188740 (= lt!357829 (bvsub lt!357830 lt!357826)))))

(assert (=> d!76287 (or (= (bvand lt!357830 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!357826 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!357830 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!357830 lt!357826) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76287 (= lt!357826 (remainingBits!0 ((_ sign_extend 32) (size!4879 (buf!5423 (_2!10418 lt!357687)))) ((_ sign_extend 32) (currentByte!10169 (_2!10418 lt!357687))) ((_ sign_extend 32) (currentBit!10164 (_2!10418 lt!357687)))))))

(declare-fun lt!357827 () (_ BitVec 64))

(declare-fun lt!357831 () (_ BitVec 64))

(assert (=> d!76287 (= lt!357830 (bvmul lt!357827 lt!357831))))

(assert (=> d!76287 (or (= lt!357827 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!357831 (bvsdiv (bvmul lt!357827 lt!357831) lt!357827)))))

(assert (=> d!76287 (= lt!357831 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76287 (= lt!357827 ((_ sign_extend 32) (size!4879 (buf!5423 (_2!10418 lt!357687)))))))

(assert (=> d!76287 (= lt!357829 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10169 (_2!10418 lt!357687))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10164 (_2!10418 lt!357687)))))))

(assert (=> d!76287 (invariant!0 (currentBit!10164 (_2!10418 lt!357687)) (currentByte!10169 (_2!10418 lt!357687)) (size!4879 (buf!5423 (_2!10418 lt!357687))))))

(assert (=> d!76287 (= (bitIndex!0 (size!4879 (buf!5423 (_2!10418 lt!357687))) (currentByte!10169 (_2!10418 lt!357687)) (currentBit!10164 (_2!10418 lt!357687))) lt!357829)))

(declare-fun b!224880 () Bool)

(declare-fun res!188739 () Bool)

(assert (=> b!224880 (=> (not res!188739) (not e!153348))))

(assert (=> b!224880 (= res!188739 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!357829))))

(declare-fun b!224881 () Bool)

(declare-fun lt!357828 () (_ BitVec 64))

(assert (=> b!224881 (= e!153348 (bvsle lt!357829 (bvmul lt!357828 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!224881 (or (= lt!357828 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!357828 #b0000000000000000000000000000000000000000000000000000000000001000) lt!357828)))))

(assert (=> b!224881 (= lt!357828 ((_ sign_extend 32) (size!4879 (buf!5423 (_2!10418 lt!357687)))))))

(assert (= (and d!76287 res!188740) b!224880))

(assert (= (and b!224880 res!188739) b!224881))

(assert (=> d!76287 m!345671))

(declare-fun m!345677 () Bool)

(assert (=> d!76287 m!345677))

(assert (=> b!224827 d!76287))

(declare-fun d!76289 () Bool)

(declare-fun e!153349 () Bool)

(assert (=> d!76289 e!153349))

(declare-fun res!188742 () Bool)

(assert (=> d!76289 (=> (not res!188742) (not e!153349))))

(declare-fun lt!357832 () (_ BitVec 64))

(declare-fun lt!357836 () (_ BitVec 64))

(declare-fun lt!357835 () (_ BitVec 64))

(assert (=> d!76289 (= res!188742 (= lt!357835 (bvsub lt!357836 lt!357832)))))

(assert (=> d!76289 (or (= (bvand lt!357836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!357832 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!357836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!357836 lt!357832) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76289 (= lt!357832 (remainingBits!0 ((_ sign_extend 32) (size!4879 (buf!5423 (_2!10419 lt!357695)))) ((_ sign_extend 32) (currentByte!10169 (_2!10419 lt!357695))) ((_ sign_extend 32) (currentBit!10164 (_2!10419 lt!357695)))))))

(declare-fun lt!357833 () (_ BitVec 64))

(declare-fun lt!357837 () (_ BitVec 64))

(assert (=> d!76289 (= lt!357836 (bvmul lt!357833 lt!357837))))

(assert (=> d!76289 (or (= lt!357833 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!357837 (bvsdiv (bvmul lt!357833 lt!357837) lt!357833)))))

(assert (=> d!76289 (= lt!357837 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76289 (= lt!357833 ((_ sign_extend 32) (size!4879 (buf!5423 (_2!10419 lt!357695)))))))

(assert (=> d!76289 (= lt!357835 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10169 (_2!10419 lt!357695))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10164 (_2!10419 lt!357695)))))))

(assert (=> d!76289 (invariant!0 (currentBit!10164 (_2!10419 lt!357695)) (currentByte!10169 (_2!10419 lt!357695)) (size!4879 (buf!5423 (_2!10419 lt!357695))))))

(assert (=> d!76289 (= (bitIndex!0 (size!4879 (buf!5423 (_2!10419 lt!357695))) (currentByte!10169 (_2!10419 lt!357695)) (currentBit!10164 (_2!10419 lt!357695))) lt!357835)))

(declare-fun b!224882 () Bool)

(declare-fun res!188741 () Bool)

(assert (=> b!224882 (=> (not res!188741) (not e!153349))))

(assert (=> b!224882 (= res!188741 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!357835))))

(declare-fun b!224883 () Bool)

(declare-fun lt!357834 () (_ BitVec 64))

(assert (=> b!224883 (= e!153349 (bvsle lt!357835 (bvmul lt!357834 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!224883 (or (= lt!357834 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!357834 #b0000000000000000000000000000000000000000000000000000000000001000) lt!357834)))))

(assert (=> b!224883 (= lt!357834 ((_ sign_extend 32) (size!4879 (buf!5423 (_2!10419 lt!357695)))))))

(assert (= (and d!76289 res!188742) b!224882))

(assert (= (and b!224882 res!188741) b!224883))

(declare-fun m!345679 () Bool)

(assert (=> d!76289 m!345679))

(declare-fun m!345681 () Bool)

(assert (=> d!76289 m!345681))

(assert (=> b!224827 d!76289))

(declare-fun d!76291 () Bool)

(declare-fun e!153358 () Bool)

(assert (=> d!76291 e!153358))

(declare-fun res!188751 () Bool)

(assert (=> d!76291 (=> (not res!188751) (not e!153358))))

(assert (=> d!76291 (= res!188751 (and (or (let ((rhs!3778 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3778 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3778) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!76292 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!76292 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!76292 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3777 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3777 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3777) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!357865 () Unit!16482)

(declare-fun choose!57 (BitStream!8860 BitStream!8860 (_ BitVec 64) (_ BitVec 32)) Unit!16482)

(assert (=> d!76291 (= lt!357865 (choose!57 thiss!1870 (_2!10418 lt!357687) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!76291 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10418 lt!357687) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!357865)))

(declare-fun lt!357866 () (_ BitVec 32))

(declare-fun b!224892 () Bool)

(assert (=> b!224892 (= e!153358 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4879 (buf!5423 (_2!10418 lt!357687)))) ((_ sign_extend 32) (currentByte!10169 (_2!10418 lt!357687))) ((_ sign_extend 32) (currentBit!10164 (_2!10418 lt!357687))) (bvsub (bvsub to!496 i!761) lt!357866)))))

(assert (=> b!224892 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!357866 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!357866) #b10000000000000000000000000000000)))))

(declare-fun lt!357867 () (_ BitVec 64))

(assert (=> b!224892 (= lt!357866 ((_ extract 31 0) lt!357867))))

(assert (=> b!224892 (and (bvslt lt!357867 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!357867 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!224892 (= lt!357867 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!76291 res!188751) b!224892))

(declare-fun m!345691 () Bool)

(assert (=> d!76291 m!345691))

(declare-fun m!345693 () Bool)

(assert (=> b!224892 m!345693))

(assert (=> b!224827 d!76291))

(declare-fun d!76297 () Bool)

(assert (=> d!76297 (arrayRangesEq!775 arr!308 (_3!784 lt!357695) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!357872 () Unit!16482)

(declare-fun choose!297 (array!11118 array!11118 array!11118 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16482)

(assert (=> d!76297 (= lt!357872 (choose!297 arr!308 lt!357694 (_3!784 lt!357695) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76297 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76297 (= (arrayRangesEqTransitive!246 arr!308 lt!357694 (_3!784 lt!357695) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!357872)))

(declare-fun bs!18610 () Bool)

(assert (= bs!18610 d!76297))

(assert (=> bs!18610 m!345547))

(declare-fun m!345695 () Bool)

(assert (=> bs!18610 m!345695))

(assert (=> b!224827 d!76297))

(declare-fun b!224958 () Bool)

(declare-fun res!188805 () Bool)

(declare-fun e!153408 () Bool)

(assert (=> b!224958 (=> (not res!188805) (not e!153408))))

(declare-fun lt!358220 () tuple3!1284)

(assert (=> b!224958 (= res!188805 (and (= (buf!5423 (_2!10418 lt!357687)) (buf!5423 (_2!10419 lt!358220))) (= (size!4879 lt!357694) (size!4879 (_3!784 lt!358220)))))))

(declare-fun bm!3654 () Bool)

(declare-fun call!3661 () (_ BitVec 64))

(assert (=> bm!3654 (= call!3661 (bitIndex!0 (size!4879 (buf!5423 (_2!10418 lt!357687))) (currentByte!10169 (_2!10418 lt!357687)) (currentBit!10164 (_2!10418 lt!357687))))))

(declare-fun b!224959 () Bool)

(assert (=> b!224959 (= e!153408 (arrayRangesEq!775 lt!357694 (_3!784 lt!358220) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun b!224960 () Bool)

(declare-fun e!153407 () Bool)

(declare-datatypes ((tuple2!19282 0))(
  ( (tuple2!19283 (_1!10428 BitStream!8860) (_2!10428 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!8860) tuple2!19282)

(assert (=> b!224960 (= e!153407 (= (select (arr!5833 (_3!784 lt!358220)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10428 (readBytePure!0 (_2!10418 lt!357687)))))))

(assert (=> b!224960 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4879 (_3!784 lt!358220))))))

(declare-fun b!224961 () Bool)

(declare-fun e!153406 () tuple3!1284)

(declare-fun lt!358217 () Unit!16482)

(declare-fun lt!358228 () tuple3!1284)

(assert (=> b!224961 (= e!153406 (tuple3!1285 lt!358217 (_2!10419 lt!358228) (_3!784 lt!358228)))))

(declare-fun lt!358210 () tuple2!19268)

(assert (=> b!224961 (= lt!358210 (readByte!0 (_2!10418 lt!357687)))))

(declare-fun lt!358199 () array!11118)

(assert (=> b!224961 (= lt!358199 (array!11119 (store (arr!5833 lt!357694) (bvadd #b00000000000000000000000000000001 i!761) (_1!10418 lt!358210)) (size!4879 lt!357694)))))

(declare-fun lt!358203 () (_ BitVec 64))

(assert (=> b!224961 (= lt!358203 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!358216 () (_ BitVec 32))

(assert (=> b!224961 (= lt!358216 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!358200 () Unit!16482)

(assert (=> b!224961 (= lt!358200 (validateOffsetBytesFromBitIndexLemma!0 (_2!10418 lt!357687) (_2!10418 lt!358210) lt!358203 lt!358216))))

(assert (=> b!224961 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4879 (buf!5423 (_2!10418 lt!358210)))) ((_ sign_extend 32) (currentByte!10169 (_2!10418 lt!358210))) ((_ sign_extend 32) (currentBit!10164 (_2!10418 lt!358210))) (bvsub lt!358216 ((_ extract 31 0) (bvsdiv (bvadd lt!358203 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!358222 () Unit!16482)

(assert (=> b!224961 (= lt!358222 lt!358200)))

(assert (=> b!224961 (= lt!358228 (readByteArrayLoop!0 (_2!10418 lt!358210) lt!358199 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!224961 (= (bitIndex!0 (size!4879 (buf!5423 (_2!10418 lt!358210))) (currentByte!10169 (_2!10418 lt!358210)) (currentBit!10164 (_2!10418 lt!358210))) (bvadd call!3661 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!358211 () Unit!16482)

(declare-fun Unit!16507 () Unit!16482)

(assert (=> b!224961 (= lt!358211 Unit!16507)))

(assert (=> b!224961 (= (bvadd (bitIndex!0 (size!4879 (buf!5423 (_2!10418 lt!358210))) (currentByte!10169 (_2!10418 lt!358210)) (currentBit!10164 (_2!10418 lt!358210))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4879 (buf!5423 (_2!10419 lt!358228))) (currentByte!10169 (_2!10419 lt!358228)) (currentBit!10164 (_2!10419 lt!358228))))))

(declare-fun lt!358221 () Unit!16482)

(declare-fun Unit!16508 () Unit!16482)

(assert (=> b!224961 (= lt!358221 Unit!16508)))

(assert (=> b!224961 (= (bvadd call!3661 (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4879 (buf!5423 (_2!10419 lt!358228))) (currentByte!10169 (_2!10419 lt!358228)) (currentBit!10164 (_2!10419 lt!358228))))))

(declare-fun lt!358223 () Unit!16482)

(declare-fun Unit!16509 () Unit!16482)

(assert (=> b!224961 (= lt!358223 Unit!16509)))

(assert (=> b!224961 (and (= (buf!5423 (_2!10418 lt!357687)) (buf!5423 (_2!10419 lt!358228))) (= (size!4879 lt!357694) (size!4879 (_3!784 lt!358228))))))

(declare-fun lt!358218 () Unit!16482)

(declare-fun Unit!16510 () Unit!16482)

(assert (=> b!224961 (= lt!358218 Unit!16510)))

(declare-fun lt!358213 () Unit!16482)

(assert (=> b!224961 (= lt!358213 (arrayUpdatedAtPrefixLemma!367 lt!357694 (bvadd #b00000000000000000000000000000001 i!761) (_1!10418 lt!358210)))))

(declare-fun call!3659 () Bool)

(assert (=> b!224961 call!3659))

(declare-fun lt!358234 () Unit!16482)

(assert (=> b!224961 (= lt!358234 lt!358213)))

(declare-fun lt!358205 () (_ BitVec 32))

(assert (=> b!224961 (= lt!358205 #b00000000000000000000000000000000)))

(declare-fun lt!358232 () Unit!16482)

(assert (=> b!224961 (= lt!358232 (arrayRangesEqTransitive!246 lt!357694 lt!358199 (_3!784 lt!358228) lt!358205 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(declare-fun call!3660 () Bool)

(assert (=> b!224961 call!3660))

(declare-fun lt!358214 () Unit!16482)

(assert (=> b!224961 (= lt!358214 lt!358232)))

(assert (=> b!224961 (arrayRangesEq!775 lt!357694 (_3!784 lt!358228) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!358201 () Unit!16482)

(declare-fun Unit!16511 () Unit!16482)

(assert (=> b!224961 (= lt!358201 Unit!16511)))

(declare-fun lt!358231 () Unit!16482)

(assert (=> b!224961 (= lt!358231 (arrayRangesEqImpliesEq!97 lt!358199 (_3!784 lt!358228) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!224961 (= (select (store (arr!5833 lt!357694) (bvadd #b00000000000000000000000000000001 i!761) (_1!10418 lt!358210)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5833 (_3!784 lt!358228)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!358209 () Unit!16482)

(assert (=> b!224961 (= lt!358209 lt!358231)))

(declare-fun lt!358207 () Bool)

(assert (=> b!224961 (= lt!358207 (= (select (arr!5833 (_3!784 lt!358228)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10418 lt!358210)))))

(declare-fun Unit!16512 () Unit!16482)

(assert (=> b!224961 (= lt!358217 Unit!16512)))

(assert (=> b!224961 lt!358207))

(declare-fun d!76299 () Bool)

(assert (=> d!76299 e!153407))

(declare-fun res!188806 () Bool)

(assert (=> d!76299 (=> res!188806 e!153407)))

(assert (=> d!76299 (= res!188806 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!358219 () Bool)

(assert (=> d!76299 (= lt!358219 e!153408)))

(declare-fun res!188804 () Bool)

(assert (=> d!76299 (=> (not res!188804) (not e!153408))))

(declare-fun lt!358208 () (_ BitVec 64))

(declare-fun lt!358233 () (_ BitVec 64))

(assert (=> d!76299 (= res!188804 (= (bvadd lt!358233 lt!358208) (bitIndex!0 (size!4879 (buf!5423 (_2!10419 lt!358220))) (currentByte!10169 (_2!10419 lt!358220)) (currentBit!10164 (_2!10419 lt!358220)))))))

(assert (=> d!76299 (or (not (= (bvand lt!358233 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!358208 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!358233 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!358233 lt!358208) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!358227 () (_ BitVec 64))

(assert (=> d!76299 (= lt!358208 (bvmul lt!358227 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!76299 (or (= lt!358227 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!358227 #b0000000000000000000000000000000000000000000000000000000000001000) lt!358227)))))

(assert (=> d!76299 (= lt!358227 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!76299 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!76299 (= lt!358233 (bitIndex!0 (size!4879 (buf!5423 (_2!10418 lt!357687))) (currentByte!10169 (_2!10418 lt!357687)) (currentBit!10164 (_2!10418 lt!357687))))))

(assert (=> d!76299 (= lt!358220 e!153406)))

(declare-fun c!11148 () Bool)

(assert (=> d!76299 (= c!11148 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!76299 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4879 lt!357694)))))

(assert (=> d!76299 (= (readByteArrayLoop!0 (_2!10418 lt!357687) lt!357694 (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!358220)))

(declare-fun lt!358212 () array!11118)

(declare-fun lt!358224 () (_ BitVec 32))

(declare-fun lt!358230 () array!11118)

(declare-fun bm!3655 () Bool)

(declare-fun lt!358226 () (_ BitVec 32))

(assert (=> bm!3655 (= call!3659 (arrayRangesEq!775 (ite c!11148 lt!357694 lt!358212) (ite c!11148 (array!11119 (store (arr!5833 lt!357694) (bvadd #b00000000000000000000000000000001 i!761) (_1!10418 lt!358210)) (size!4879 lt!357694)) lt!358230) (ite c!11148 #b00000000000000000000000000000000 lt!358224) (ite c!11148 (bvadd #b00000000000000000000000000000001 i!761) lt!358226)))))

(declare-fun bm!3656 () Bool)

(assert (=> bm!3656 (= call!3660 (arrayRangesEq!775 lt!357694 (ite c!11148 (_3!784 lt!358228) lt!357694) (ite c!11148 lt!358205 #b00000000000000000000000000000000) (ite c!11148 (bvadd #b00000000000000000000000000000001 i!761) (size!4879 lt!357694))))))

(declare-fun lt!358215 () Unit!16482)

(declare-fun b!224962 () Bool)

(assert (=> b!224962 (= e!153406 (tuple3!1285 lt!358215 (_2!10418 lt!357687) lt!357694))))

(assert (=> b!224962 (= call!3661 call!3661)))

(declare-fun lt!358206 () Unit!16482)

(declare-fun Unit!16513 () Unit!16482)

(assert (=> b!224962 (= lt!358206 Unit!16513)))

(declare-fun lt!358225 () Unit!16482)

(declare-fun arrayRangesEqReflexiveLemma!80 (array!11118) Unit!16482)

(assert (=> b!224962 (= lt!358225 (arrayRangesEqReflexiveLemma!80 lt!357694))))

(assert (=> b!224962 call!3660))

(declare-fun lt!358229 () Unit!16482)

(assert (=> b!224962 (= lt!358229 lt!358225)))

(assert (=> b!224962 (= lt!358212 lt!357694)))

(assert (=> b!224962 (= lt!358230 lt!357694)))

(declare-fun lt!358202 () (_ BitVec 32))

(assert (=> b!224962 (= lt!358202 #b00000000000000000000000000000000)))

(declare-fun lt!358204 () (_ BitVec 32))

(assert (=> b!224962 (= lt!358204 (size!4879 lt!357694))))

(assert (=> b!224962 (= lt!358224 #b00000000000000000000000000000000)))

(assert (=> b!224962 (= lt!358226 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!80 (array!11118 array!11118 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16482)

(assert (=> b!224962 (= lt!358215 (arrayRangesEqSlicedLemma!80 lt!358212 lt!358230 lt!358202 lt!358204 lt!358224 lt!358226))))

(assert (=> b!224962 call!3659))

(assert (= (and d!76299 c!11148) b!224961))

(assert (= (and d!76299 (not c!11148)) b!224962))

(assert (= (or b!224961 b!224962) bm!3655))

(assert (= (or b!224961 b!224962) bm!3656))

(assert (= (or b!224961 b!224962) bm!3654))

(assert (= (and d!76299 res!188804) b!224958))

(assert (= (and b!224958 res!188805) b!224959))

(assert (= (and d!76299 (not res!188806)) b!224960))

(declare-fun m!345789 () Bool)

(assert (=> b!224960 m!345789))

(declare-fun m!345791 () Bool)

(assert (=> b!224960 m!345791))

(declare-fun m!345793 () Bool)

(assert (=> d!76299 m!345793))

(assert (=> d!76299 m!345543))

(declare-fun m!345795 () Bool)

(assert (=> b!224961 m!345795))

(declare-fun m!345797 () Bool)

(assert (=> b!224961 m!345797))

(declare-fun m!345799 () Bool)

(assert (=> b!224961 m!345799))

(declare-fun m!345801 () Bool)

(assert (=> b!224961 m!345801))

(declare-fun m!345803 () Bool)

(assert (=> b!224961 m!345803))

(declare-fun m!345805 () Bool)

(assert (=> b!224961 m!345805))

(declare-fun m!345807 () Bool)

(assert (=> b!224961 m!345807))

(declare-fun m!345809 () Bool)

(assert (=> b!224961 m!345809))

(declare-fun m!345811 () Bool)

(assert (=> b!224961 m!345811))

(declare-fun m!345813 () Bool)

(assert (=> b!224961 m!345813))

(declare-fun m!345815 () Bool)

(assert (=> b!224961 m!345815))

(declare-fun m!345817 () Bool)

(assert (=> b!224961 m!345817))

(declare-fun m!345819 () Bool)

(assert (=> b!224961 m!345819))

(assert (=> bm!3655 m!345799))

(declare-fun m!345821 () Bool)

(assert (=> bm!3655 m!345821))

(declare-fun m!345823 () Bool)

(assert (=> bm!3656 m!345823))

(assert (=> bm!3654 m!345543))

(declare-fun m!345825 () Bool)

(assert (=> b!224959 m!345825))

(declare-fun m!345827 () Bool)

(assert (=> b!224962 m!345827))

(declare-fun m!345829 () Bool)

(assert (=> b!224962 m!345829))

(assert (=> b!224827 d!76299))

(declare-fun d!76334 () Bool)

(declare-fun res!188813 () Bool)

(declare-fun e!153413 () Bool)

(assert (=> d!76334 (=> res!188813 e!153413)))

(assert (=> d!76334 (= res!188813 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!76334 (= (arrayRangesEq!775 arr!308 lt!357694 #b00000000000000000000000000000000 i!761) e!153413)))

(declare-fun b!224969 () Bool)

(declare-fun e!153414 () Bool)

(assert (=> b!224969 (= e!153413 e!153414)))

(declare-fun res!188814 () Bool)

(assert (=> b!224969 (=> (not res!188814) (not e!153414))))

(assert (=> b!224969 (= res!188814 (= (select (arr!5833 arr!308) #b00000000000000000000000000000000) (select (arr!5833 lt!357694) #b00000000000000000000000000000000)))))

(declare-fun b!224970 () Bool)

(assert (=> b!224970 (= e!153414 (arrayRangesEq!775 arr!308 lt!357694 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!76334 (not res!188813)) b!224969))

(assert (= (and b!224969 res!188814) b!224970))

(assert (=> b!224969 m!345649))

(declare-fun m!345831 () Bool)

(assert (=> b!224969 m!345831))

(declare-fun m!345833 () Bool)

(assert (=> b!224970 m!345833))

(assert (=> b!224827 d!76334))

(declare-fun d!76336 () Bool)

(assert (=> d!76336 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!4879 (buf!5423 thiss!1870))) ((_ sign_extend 32) (currentByte!10169 thiss!1870)) ((_ sign_extend 32) (currentBit!10164 thiss!1870))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4879 (buf!5423 thiss!1870))) ((_ sign_extend 32) (currentByte!10169 thiss!1870)) ((_ sign_extend 32) (currentBit!10164 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!18618 () Bool)

(assert (= bs!18618 d!76336))

(assert (=> bs!18618 m!345643))

(assert (=> b!224827 d!76336))

(push 1)

(assert (not bm!3655))

(assert (not b!224970))

(assert (not bm!3656))

(assert (not b!224962))

(assert (not d!76285))

(assert (not d!76267))

(assert (not d!76291))

(assert (not d!76259))

(assert (not b!224879))

(assert (not b!224960))

(assert (not b!224870))

(assert (not d!76299))

(assert (not b!224858))

(assert (not d!76255))

(assert (not b!224961))

(assert (not bm!3654))

(assert (not b!224892))

(assert (not d!76297))

(assert (not d!76281))

(assert (not d!76289))

(assert (not d!76336))

(assert (not d!76287))

(assert (not d!76253))

(assert (not d!76283))

(assert (not b!224959))

(check-sat)

(pop 1)

(push 1)

(check-sat)

