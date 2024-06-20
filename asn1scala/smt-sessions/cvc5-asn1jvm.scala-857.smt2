; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24786 () Bool)

(assert start!24786)

(declare-fun b!125660 () Bool)

(declare-fun e!82713 () Bool)

(declare-fun e!82714 () Bool)

(assert (=> b!125660 (= e!82713 e!82714)))

(declare-fun res!104089 () Bool)

(assert (=> b!125660 (=> (not res!104089) (not e!82714))))

(declare-datatypes ((array!5675 0))(
  ( (array!5676 (arr!3162 (Array (_ BitVec 32) (_ BitVec 8))) (size!2569 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4462 0))(
  ( (BitStream!4463 (buf!2945 array!5675) (currentByte!5660 (_ BitVec 32)) (currentBit!5655 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4462)

(declare-datatypes ((Unit!7735 0))(
  ( (Unit!7736) )
))
(declare-datatypes ((tuple2!10480 0))(
  ( (tuple2!10481 (_1!5516 Unit!7735) (_2!5516 BitStream!4462)) )
))
(declare-fun lt!196550 () tuple2!10480)

(declare-fun lt!196553 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!125660 (= res!104089 (= (bitIndex!0 (size!2569 (buf!2945 (_2!5516 lt!196550))) (currentByte!5660 (_2!5516 lt!196550)) (currentBit!5655 (_2!5516 lt!196550))) (bvadd (bitIndex!0 (size!2569 (buf!2945 thiss!1614)) (currentByte!5660 thiss!1614) (currentBit!5655 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!196553))))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(assert (=> b!125660 (= lt!196553 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!125661 () Bool)

(declare-fun e!82715 () Bool)

(declare-fun array_inv!2358 (array!5675) Bool)

(assert (=> b!125661 (= e!82715 (array_inv!2358 (buf!2945 thiss!1614)))))

(declare-fun b!125662 () Bool)

(declare-fun res!104087 () Bool)

(declare-fun e!82711 () Bool)

(assert (=> b!125662 (=> (not res!104087) (not e!82711))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!125662 (= res!104087 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2569 (buf!2945 thiss!1614))) ((_ sign_extend 32) (currentByte!5660 thiss!1614)) ((_ sign_extend 32) (currentBit!5655 thiss!1614)) noOfBytes!1))))

(declare-fun b!125663 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!125663 (= e!82711 (not (invariant!0 (currentBit!5655 (_2!5516 lt!196550)) (currentByte!5660 (_2!5516 lt!196550)) (size!2569 (buf!2945 (_2!5516 lt!196550))))))))

(assert (=> b!125663 e!82713))

(declare-fun res!104084 () Bool)

(assert (=> b!125663 (=> (not res!104084) (not e!82713))))

(assert (=> b!125663 (= res!104084 (= (size!2569 (buf!2945 thiss!1614)) (size!2569 (buf!2945 (_2!5516 lt!196550)))))))

(declare-fun arr!227 () array!5675)

(declare-fun appendByteArrayLoop!0 (BitStream!4462 array!5675 (_ BitVec 32) (_ BitVec 32)) tuple2!10480)

(assert (=> b!125663 (= lt!196550 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-datatypes ((tuple2!10482 0))(
  ( (tuple2!10483 (_1!5517 BitStream!4462) (_2!5517 array!5675)) )
))
(declare-fun lt!196551 () tuple2!10482)

(declare-fun b!125664 () Bool)

(declare-fun e!82712 () Bool)

(declare-fun arrayRangesEq!56 (array!5675 array!5675 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!125664 (= e!82712 (not (arrayRangesEq!56 arr!227 (_2!5517 lt!196551) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!125665 () Bool)

(assert (=> b!125665 (= e!82714 (not e!82712))))

(declare-fun res!104088 () Bool)

(assert (=> b!125665 (=> res!104088 e!82712)))

(declare-datatypes ((tuple2!10484 0))(
  ( (tuple2!10485 (_1!5518 BitStream!4462) (_2!5518 BitStream!4462)) )
))
(declare-fun lt!196552 () tuple2!10484)

(assert (=> b!125665 (= res!104088 (or (not (= (size!2569 (_2!5517 lt!196551)) (size!2569 arr!227))) (not (= (_1!5517 lt!196551) (_2!5518 lt!196552)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4462 array!5675 (_ BitVec 32) (_ BitVec 32)) tuple2!10482)

(assert (=> b!125665 (= lt!196551 (readByteArrayLoopPure!0 (_1!5518 lt!196552) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!125665 (validate_offset_bits!1 ((_ sign_extend 32) (size!2569 (buf!2945 (_2!5516 lt!196550)))) ((_ sign_extend 32) (currentByte!5660 thiss!1614)) ((_ sign_extend 32) (currentBit!5655 thiss!1614)) lt!196553)))

(declare-fun lt!196549 () Unit!7735)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4462 array!5675 (_ BitVec 64)) Unit!7735)

(assert (=> b!125665 (= lt!196549 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2945 (_2!5516 lt!196550)) lt!196553))))

(declare-fun reader!0 (BitStream!4462 BitStream!4462) tuple2!10484)

(assert (=> b!125665 (= lt!196552 (reader!0 thiss!1614 (_2!5516 lt!196550)))))

(declare-fun res!104086 () Bool)

(assert (=> start!24786 (=> (not res!104086) (not e!82711))))

(assert (=> start!24786 (= res!104086 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2569 arr!227))))))

(assert (=> start!24786 e!82711))

(assert (=> start!24786 true))

(assert (=> start!24786 (array_inv!2358 arr!227)))

(declare-fun inv!12 (BitStream!4462) Bool)

(assert (=> start!24786 (and (inv!12 thiss!1614) e!82715)))

(declare-fun b!125666 () Bool)

(declare-fun res!104085 () Bool)

(assert (=> b!125666 (=> (not res!104085) (not e!82714))))

(declare-fun isPrefixOf!0 (BitStream!4462 BitStream!4462) Bool)

(assert (=> b!125666 (= res!104085 (isPrefixOf!0 thiss!1614 (_2!5516 lt!196550)))))

(assert (= (and start!24786 res!104086) b!125662))

(assert (= (and b!125662 res!104087) b!125663))

(assert (= (and b!125663 res!104084) b!125660))

(assert (= (and b!125660 res!104089) b!125666))

(assert (= (and b!125666 res!104085) b!125665))

(assert (= (and b!125665 (not res!104088)) b!125664))

(assert (= start!24786 b!125661))

(declare-fun m!191025 () Bool)

(assert (=> b!125660 m!191025))

(declare-fun m!191027 () Bool)

(assert (=> b!125660 m!191027))

(declare-fun m!191029 () Bool)

(assert (=> b!125666 m!191029))

(declare-fun m!191031 () Bool)

(assert (=> b!125664 m!191031))

(declare-fun m!191033 () Bool)

(assert (=> b!125665 m!191033))

(declare-fun m!191035 () Bool)

(assert (=> b!125665 m!191035))

(declare-fun m!191037 () Bool)

(assert (=> b!125665 m!191037))

(declare-fun m!191039 () Bool)

(assert (=> b!125665 m!191039))

(declare-fun m!191041 () Bool)

(assert (=> start!24786 m!191041))

(declare-fun m!191043 () Bool)

(assert (=> start!24786 m!191043))

(declare-fun m!191045 () Bool)

(assert (=> b!125661 m!191045))

(declare-fun m!191047 () Bool)

(assert (=> b!125663 m!191047))

(declare-fun m!191049 () Bool)

(assert (=> b!125663 m!191049))

(declare-fun m!191051 () Bool)

(assert (=> b!125662 m!191051))

(push 1)

(assert (not b!125663))

(assert (not b!125666))

(assert (not b!125660))

(assert (not b!125661))

(assert (not b!125662))

(assert (not b!125665))

(assert (not start!24786))

(assert (not b!125664))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!40854 () Bool)

(assert (=> d!40854 (= (invariant!0 (currentBit!5655 (_2!5516 lt!196550)) (currentByte!5660 (_2!5516 lt!196550)) (size!2569 (buf!2945 (_2!5516 lt!196550)))) (and (bvsge (currentBit!5655 (_2!5516 lt!196550)) #b00000000000000000000000000000000) (bvslt (currentBit!5655 (_2!5516 lt!196550)) #b00000000000000000000000000001000) (bvsge (currentByte!5660 (_2!5516 lt!196550)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5660 (_2!5516 lt!196550)) (size!2569 (buf!2945 (_2!5516 lt!196550)))) (and (= (currentBit!5655 (_2!5516 lt!196550)) #b00000000000000000000000000000000) (= (currentByte!5660 (_2!5516 lt!196550)) (size!2569 (buf!2945 (_2!5516 lt!196550))))))))))

(assert (=> b!125663 d!40854))

(declare-fun b!125736 () Bool)

(declare-fun res!104158 () Bool)

(declare-fun e!82776 () Bool)

(assert (=> b!125736 (=> (not res!104158) (not e!82776))))

(declare-fun lt!196640 () tuple2!10480)

(declare-fun lt!196642 () (_ BitVec 64))

(declare-fun lt!196644 () (_ BitVec 64))

(assert (=> b!125736 (= res!104158 (= (bitIndex!0 (size!2569 (buf!2945 (_2!5516 lt!196640))) (currentByte!5660 (_2!5516 lt!196640)) (currentBit!5655 (_2!5516 lt!196640))) (bvadd lt!196644 lt!196642)))))

(assert (=> b!125736 (or (not (= (bvand lt!196644 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!196642 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!196644 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!196644 lt!196642) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!196637 () (_ BitVec 64))

(assert (=> b!125736 (= lt!196642 (bvmul lt!196637 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!125736 (or (= lt!196637 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!196637 #b0000000000000000000000000000000000000000000000000000000000001000) lt!196637)))))

(assert (=> b!125736 (= lt!196637 ((_ sign_extend 32) (bvsub noOfBytes!1 #b00000000000000000000000000000000)))))

(assert (=> b!125736 (or (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand (bvsub noOfBytes!1 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!125736 (= lt!196644 (bitIndex!0 (size!2569 (buf!2945 thiss!1614)) (currentByte!5660 thiss!1614) (currentBit!5655 thiss!1614)))))

(declare-fun b!125737 () Bool)

(declare-fun e!82775 () Bool)

(declare-fun lt!196643 () (_ BitVec 64))

(assert (=> b!125737 (= e!82775 (validate_offset_bits!1 ((_ sign_extend 32) (size!2569 (buf!2945 thiss!1614))) ((_ sign_extend 32) (currentByte!5660 thiss!1614)) ((_ sign_extend 32) (currentBit!5655 thiss!1614)) lt!196643))))

(declare-fun b!125739 () Bool)

(declare-fun e!82777 () Bool)

(assert (=> b!125739 (= e!82776 e!82777)))

(declare-fun res!104159 () Bool)

(assert (=> b!125739 (=> (not res!104159) (not e!82777))))

(declare-fun lt!196639 () tuple2!10484)

(declare-fun lt!196641 () tuple2!10482)

(assert (=> b!125739 (= res!104159 (and (= (size!2569 (_2!5517 lt!196641)) (size!2569 arr!227)) (= (_1!5517 lt!196641) (_2!5518 lt!196639))))))

(assert (=> b!125739 (= lt!196641 (readByteArrayLoopPure!0 (_1!5518 lt!196639) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!196638 () Unit!7735)

(declare-fun lt!196645 () Unit!7735)

(assert (=> b!125739 (= lt!196638 lt!196645)))

(assert (=> b!125739 (validate_offset_bits!1 ((_ sign_extend 32) (size!2569 (buf!2945 (_2!5516 lt!196640)))) ((_ sign_extend 32) (currentByte!5660 thiss!1614)) ((_ sign_extend 32) (currentBit!5655 thiss!1614)) lt!196643)))

(assert (=> b!125739 (= lt!196645 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2945 (_2!5516 lt!196640)) lt!196643))))

(assert (=> b!125739 e!82775))

(declare-fun res!104157 () Bool)

(assert (=> b!125739 (=> (not res!104157) (not e!82775))))

(assert (=> b!125739 (= res!104157 (and (= (size!2569 (buf!2945 thiss!1614)) (size!2569 (buf!2945 (_2!5516 lt!196640)))) (bvsge lt!196643 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!125739 (= lt!196643 ((_ sign_extend 32) (bvsub noOfBytes!1 #b00000000000000000000000000000000)))))

(assert (=> b!125739 (or (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand (bvsub noOfBytes!1 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!125739 (= lt!196639 (reader!0 thiss!1614 (_2!5516 lt!196640)))))

(declare-fun b!125740 () Bool)

(assert (=> b!125740 (= e!82777 (arrayRangesEq!56 arr!227 (_2!5517 lt!196641) #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun d!40856 () Bool)

(assert (=> d!40856 e!82776))

(declare-fun res!104156 () Bool)

(assert (=> d!40856 (=> (not res!104156) (not e!82776))))

(assert (=> d!40856 (= res!104156 (= (size!2569 (buf!2945 thiss!1614)) (size!2569 (buf!2945 (_2!5516 lt!196640)))))))

(declare-fun choose!64 (BitStream!4462 array!5675 (_ BitVec 32) (_ BitVec 32)) tuple2!10480)

(assert (=> d!40856 (= lt!196640 (choose!64 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!40856 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2569 arr!227)))))

(assert (=> d!40856 (= (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1) lt!196640)))

(declare-fun b!125738 () Bool)

(declare-fun res!104155 () Bool)

(assert (=> b!125738 (=> (not res!104155) (not e!82776))))

(assert (=> b!125738 (= res!104155 (isPrefixOf!0 thiss!1614 (_2!5516 lt!196640)))))

(assert (= (and d!40856 res!104156) b!125736))

(assert (= (and b!125736 res!104158) b!125738))

(assert (= (and b!125738 res!104155) b!125739))

(assert (= (and b!125739 res!104157) b!125737))

(assert (= (and b!125739 res!104159) b!125740))

(declare-fun m!191129 () Bool)

(assert (=> b!125738 m!191129))

(declare-fun m!191131 () Bool)

(assert (=> b!125740 m!191131))

(declare-fun m!191133 () Bool)

(assert (=> b!125739 m!191133))

(declare-fun m!191135 () Bool)

(assert (=> b!125739 m!191135))

(declare-fun m!191137 () Bool)

(assert (=> b!125739 m!191137))

(declare-fun m!191139 () Bool)

(assert (=> b!125739 m!191139))

(declare-fun m!191141 () Bool)

(assert (=> b!125736 m!191141))

(assert (=> b!125736 m!191027))

(declare-fun m!191143 () Bool)

(assert (=> d!40856 m!191143))

(declare-fun m!191145 () Bool)

(assert (=> b!125737 m!191145))

(assert (=> b!125663 d!40856))

(declare-datatypes ((tuple3!442 0))(
  ( (tuple3!443 (_1!5525 Unit!7735) (_2!5525 BitStream!4462) (_3!276 array!5675)) )
))
(declare-fun lt!196679 () tuple3!442)

(declare-fun d!40864 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!4462 array!5675 (_ BitVec 32) (_ BitVec 32)) tuple3!442)

(assert (=> d!40864 (= lt!196679 (readByteArrayLoop!0 (_1!5518 lt!196552) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!40864 (= (readByteArrayLoopPure!0 (_1!5518 lt!196552) arr!227 #b00000000000000000000000000000000 noOfBytes!1) (tuple2!10483 (_2!5525 lt!196679) (_3!276 lt!196679)))))

(declare-fun bs!9894 () Bool)

(assert (= bs!9894 d!40864))

(declare-fun m!191165 () Bool)

(assert (=> bs!9894 m!191165))

(assert (=> b!125665 d!40864))

(declare-fun d!40868 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!40868 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2569 (buf!2945 (_2!5516 lt!196550)))) ((_ sign_extend 32) (currentByte!5660 thiss!1614)) ((_ sign_extend 32) (currentBit!5655 thiss!1614)) lt!196553) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2569 (buf!2945 (_2!5516 lt!196550)))) ((_ sign_extend 32) (currentByte!5660 thiss!1614)) ((_ sign_extend 32) (currentBit!5655 thiss!1614))) lt!196553))))

(declare-fun bs!9895 () Bool)

(assert (= bs!9895 d!40868))

(declare-fun m!191167 () Bool)

(assert (=> bs!9895 m!191167))

(assert (=> b!125665 d!40868))

(declare-fun d!40870 () Bool)

(assert (=> d!40870 (validate_offset_bits!1 ((_ sign_extend 32) (size!2569 (buf!2945 (_2!5516 lt!196550)))) ((_ sign_extend 32) (currentByte!5660 thiss!1614)) ((_ sign_extend 32) (currentBit!5655 thiss!1614)) lt!196553)))

(declare-fun lt!196694 () Unit!7735)

(declare-fun choose!9 (BitStream!4462 array!5675 (_ BitVec 64) BitStream!4462) Unit!7735)

(assert (=> d!40870 (= lt!196694 (choose!9 thiss!1614 (buf!2945 (_2!5516 lt!196550)) lt!196553 (BitStream!4463 (buf!2945 (_2!5516 lt!196550)) (currentByte!5660 thiss!1614) (currentBit!5655 thiss!1614))))))

(assert (=> d!40870 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2945 (_2!5516 lt!196550)) lt!196553) lt!196694)))

(declare-fun bs!9896 () Bool)

(assert (= bs!9896 d!40870))

(assert (=> bs!9896 m!191035))

(declare-fun m!191179 () Bool)

(assert (=> bs!9896 m!191179))

(assert (=> b!125665 d!40870))

(declare-fun b!125802 () Bool)

(declare-fun res!104217 () Bool)

(declare-fun e!82817 () Bool)

(assert (=> b!125802 (=> (not res!104217) (not e!82817))))

(declare-fun lt!196753 () tuple2!10484)

(assert (=> b!125802 (= res!104217 (isPrefixOf!0 (_2!5518 lt!196753) (_2!5516 lt!196550)))))

(declare-fun b!125803 () Bool)

(declare-fun e!82818 () Unit!7735)

(declare-fun lt!196761 () Unit!7735)

(assert (=> b!125803 (= e!82818 lt!196761)))

(declare-fun lt!196755 () (_ BitVec 64))

(assert (=> b!125803 (= lt!196755 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!196756 () (_ BitVec 64))

(assert (=> b!125803 (= lt!196756 (bitIndex!0 (size!2569 (buf!2945 thiss!1614)) (currentByte!5660 thiss!1614) (currentBit!5655 thiss!1614)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5675 array!5675 (_ BitVec 64) (_ BitVec 64)) Unit!7735)

(assert (=> b!125803 (= lt!196761 (arrayBitRangesEqSymmetric!0 (buf!2945 thiss!1614) (buf!2945 (_2!5516 lt!196550)) lt!196755 lt!196756))))

(declare-fun arrayBitRangesEq!0 (array!5675 array!5675 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!125803 (arrayBitRangesEq!0 (buf!2945 (_2!5516 lt!196550)) (buf!2945 thiss!1614) lt!196755 lt!196756)))

(declare-fun d!40882 () Bool)

(assert (=> d!40882 e!82817))

(declare-fun res!104215 () Bool)

(assert (=> d!40882 (=> (not res!104215) (not e!82817))))

(assert (=> d!40882 (= res!104215 (isPrefixOf!0 (_1!5518 lt!196753) (_2!5518 lt!196753)))))

(declare-fun lt!196764 () BitStream!4462)

(assert (=> d!40882 (= lt!196753 (tuple2!10485 lt!196764 (_2!5516 lt!196550)))))

(declare-fun lt!196762 () Unit!7735)

(declare-fun lt!196760 () Unit!7735)

(assert (=> d!40882 (= lt!196762 lt!196760)))

(assert (=> d!40882 (isPrefixOf!0 lt!196764 (_2!5516 lt!196550))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4462 BitStream!4462 BitStream!4462) Unit!7735)

(assert (=> d!40882 (= lt!196760 (lemmaIsPrefixTransitive!0 lt!196764 (_2!5516 lt!196550) (_2!5516 lt!196550)))))

(declare-fun lt!196749 () Unit!7735)

(declare-fun lt!196754 () Unit!7735)

(assert (=> d!40882 (= lt!196749 lt!196754)))

(assert (=> d!40882 (isPrefixOf!0 lt!196764 (_2!5516 lt!196550))))

(assert (=> d!40882 (= lt!196754 (lemmaIsPrefixTransitive!0 lt!196764 thiss!1614 (_2!5516 lt!196550)))))

(declare-fun lt!196748 () Unit!7735)

(assert (=> d!40882 (= lt!196748 e!82818)))

(declare-fun c!7470 () Bool)

(assert (=> d!40882 (= c!7470 (not (= (size!2569 (buf!2945 thiss!1614)) #b00000000000000000000000000000000)))))

(declare-fun lt!196766 () Unit!7735)

(declare-fun lt!196751 () Unit!7735)

(assert (=> d!40882 (= lt!196766 lt!196751)))

(assert (=> d!40882 (isPrefixOf!0 (_2!5516 lt!196550) (_2!5516 lt!196550))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4462) Unit!7735)

(assert (=> d!40882 (= lt!196751 (lemmaIsPrefixRefl!0 (_2!5516 lt!196550)))))

(declare-fun lt!196757 () Unit!7735)

(declare-fun lt!196752 () Unit!7735)

(assert (=> d!40882 (= lt!196757 lt!196752)))

(assert (=> d!40882 (= lt!196752 (lemmaIsPrefixRefl!0 (_2!5516 lt!196550)))))

(declare-fun lt!196759 () Unit!7735)

(declare-fun lt!196758 () Unit!7735)

(assert (=> d!40882 (= lt!196759 lt!196758)))

(assert (=> d!40882 (isPrefixOf!0 lt!196764 lt!196764)))

(assert (=> d!40882 (= lt!196758 (lemmaIsPrefixRefl!0 lt!196764))))

(declare-fun lt!196750 () Unit!7735)

(declare-fun lt!196765 () Unit!7735)

(assert (=> d!40882 (= lt!196750 lt!196765)))

(assert (=> d!40882 (isPrefixOf!0 thiss!1614 thiss!1614)))

(assert (=> d!40882 (= lt!196765 (lemmaIsPrefixRefl!0 thiss!1614))))

(assert (=> d!40882 (= lt!196764 (BitStream!4463 (buf!2945 (_2!5516 lt!196550)) (currentByte!5660 thiss!1614) (currentBit!5655 thiss!1614)))))

(assert (=> d!40882 (isPrefixOf!0 thiss!1614 (_2!5516 lt!196550))))

(assert (=> d!40882 (= (reader!0 thiss!1614 (_2!5516 lt!196550)) lt!196753)))

(declare-fun b!125804 () Bool)

(declare-fun Unit!7741 () Unit!7735)

(assert (=> b!125804 (= e!82818 Unit!7741)))

(declare-fun b!125805 () Bool)

(declare-fun res!104216 () Bool)

(assert (=> b!125805 (=> (not res!104216) (not e!82817))))

(assert (=> b!125805 (= res!104216 (isPrefixOf!0 (_1!5518 lt!196753) thiss!1614))))

(declare-fun b!125806 () Bool)

(declare-fun lt!196747 () (_ BitVec 64))

(declare-fun lt!196763 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4462 (_ BitVec 64)) BitStream!4462)

(assert (=> b!125806 (= e!82817 (= (_1!5518 lt!196753) (withMovedBitIndex!0 (_2!5518 lt!196753) (bvsub lt!196747 lt!196763))))))

(assert (=> b!125806 (or (= (bvand lt!196747 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!196763 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!196747 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!196747 lt!196763) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!125806 (= lt!196763 (bitIndex!0 (size!2569 (buf!2945 (_2!5516 lt!196550))) (currentByte!5660 (_2!5516 lt!196550)) (currentBit!5655 (_2!5516 lt!196550))))))

(assert (=> b!125806 (= lt!196747 (bitIndex!0 (size!2569 (buf!2945 thiss!1614)) (currentByte!5660 thiss!1614) (currentBit!5655 thiss!1614)))))

(assert (= (and d!40882 c!7470) b!125803))

(assert (= (and d!40882 (not c!7470)) b!125804))

(assert (= (and d!40882 res!104215) b!125805))

(assert (= (and b!125805 res!104216) b!125802))

(assert (= (and b!125802 res!104217) b!125806))

(declare-fun m!191205 () Bool)

(assert (=> b!125802 m!191205))

(assert (=> b!125803 m!191027))

(declare-fun m!191207 () Bool)

(assert (=> b!125803 m!191207))

(declare-fun m!191209 () Bool)

(assert (=> b!125803 m!191209))

(declare-fun m!191211 () Bool)

(assert (=> b!125806 m!191211))

(assert (=> b!125806 m!191025))

(assert (=> b!125806 m!191027))

(declare-fun m!191213 () Bool)

(assert (=> d!40882 m!191213))

(declare-fun m!191215 () Bool)

(assert (=> d!40882 m!191215))

(declare-fun m!191217 () Bool)

(assert (=> d!40882 m!191217))

(declare-fun m!191219 () Bool)

(assert (=> d!40882 m!191219))

(declare-fun m!191221 () Bool)

(assert (=> d!40882 m!191221))

(declare-fun m!191223 () Bool)

(assert (=> d!40882 m!191223))

(assert (=> d!40882 m!191029))

(declare-fun m!191225 () Bool)

(assert (=> d!40882 m!191225))

(declare-fun m!191227 () Bool)

(assert (=> d!40882 m!191227))

(declare-fun m!191229 () Bool)

(assert (=> d!40882 m!191229))

(declare-fun m!191231 () Bool)

(assert (=> d!40882 m!191231))

(declare-fun m!191233 () Bool)

(assert (=> b!125805 m!191233))

(assert (=> b!125665 d!40882))

(declare-fun d!40908 () Bool)

(declare-fun res!104222 () Bool)

(declare-fun e!82823 () Bool)

(assert (=> d!40908 (=> res!104222 e!82823)))

(assert (=> d!40908 (= res!104222 (= #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!40908 (= (arrayRangesEq!56 arr!227 (_2!5517 lt!196551) #b00000000000000000000000000000000 noOfBytes!1) e!82823)))

(declare-fun b!125811 () Bool)

(declare-fun e!82824 () Bool)

(assert (=> b!125811 (= e!82823 e!82824)))

(declare-fun res!104223 () Bool)

(assert (=> b!125811 (=> (not res!104223) (not e!82824))))

(assert (=> b!125811 (= res!104223 (= (select (arr!3162 arr!227) #b00000000000000000000000000000000) (select (arr!3162 (_2!5517 lt!196551)) #b00000000000000000000000000000000)))))

(declare-fun b!125812 () Bool)

(assert (=> b!125812 (= e!82824 (arrayRangesEq!56 arr!227 (_2!5517 lt!196551) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) noOfBytes!1))))

(assert (= (and d!40908 (not res!104222)) b!125811))

(assert (= (and b!125811 res!104223) b!125812))

(declare-fun m!191235 () Bool)

(assert (=> b!125811 m!191235))

(declare-fun m!191237 () Bool)

(assert (=> b!125811 m!191237))

(declare-fun m!191239 () Bool)

(assert (=> b!125812 m!191239))

(assert (=> b!125664 d!40908))

(declare-fun d!40910 () Bool)

(declare-fun res!104232 () Bool)

(declare-fun e!82830 () Bool)

(assert (=> d!40910 (=> (not res!104232) (not e!82830))))

(assert (=> d!40910 (= res!104232 (= (size!2569 (buf!2945 thiss!1614)) (size!2569 (buf!2945 (_2!5516 lt!196550)))))))

(assert (=> d!40910 (= (isPrefixOf!0 thiss!1614 (_2!5516 lt!196550)) e!82830)))

(declare-fun b!125819 () Bool)

(declare-fun res!104230 () Bool)

(assert (=> b!125819 (=> (not res!104230) (not e!82830))))

(assert (=> b!125819 (= res!104230 (bvsle (bitIndex!0 (size!2569 (buf!2945 thiss!1614)) (currentByte!5660 thiss!1614) (currentBit!5655 thiss!1614)) (bitIndex!0 (size!2569 (buf!2945 (_2!5516 lt!196550))) (currentByte!5660 (_2!5516 lt!196550)) (currentBit!5655 (_2!5516 lt!196550)))))))

(declare-fun b!125820 () Bool)

(declare-fun e!82829 () Bool)

(assert (=> b!125820 (= e!82830 e!82829)))

(declare-fun res!104231 () Bool)

(assert (=> b!125820 (=> res!104231 e!82829)))

(assert (=> b!125820 (= res!104231 (= (size!2569 (buf!2945 thiss!1614)) #b00000000000000000000000000000000))))

(declare-fun b!125821 () Bool)

(assert (=> b!125821 (= e!82829 (arrayBitRangesEq!0 (buf!2945 thiss!1614) (buf!2945 (_2!5516 lt!196550)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2569 (buf!2945 thiss!1614)) (currentByte!5660 thiss!1614) (currentBit!5655 thiss!1614))))))

(assert (= (and d!40910 res!104232) b!125819))

(assert (= (and b!125819 res!104230) b!125820))

(assert (= (and b!125820 (not res!104231)) b!125821))

(assert (=> b!125819 m!191027))

(assert (=> b!125819 m!191025))

(assert (=> b!125821 m!191027))

(assert (=> b!125821 m!191027))

(declare-fun m!191241 () Bool)

(assert (=> b!125821 m!191241))

(assert (=> b!125666 d!40910))

(declare-fun d!40912 () Bool)

(assert (=> d!40912 (= (array_inv!2358 (buf!2945 thiss!1614)) (bvsge (size!2569 (buf!2945 thiss!1614)) #b00000000000000000000000000000000))))

(assert (=> b!125661 d!40912))

(declare-fun d!40914 () Bool)

(declare-fun e!82845 () Bool)

(assert (=> d!40914 e!82845))

(declare-fun res!104256 () Bool)

(assert (=> d!40914 (=> (not res!104256) (not e!82845))))

(declare-fun lt!196903 () (_ BitVec 64))

(declare-fun lt!196901 () (_ BitVec 64))

(declare-fun lt!196904 () (_ BitVec 64))

(assert (=> d!40914 (= res!104256 (= lt!196901 (bvsub lt!196903 lt!196904)))))

(assert (=> d!40914 (or (= (bvand lt!196903 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!196904 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!196903 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!196903 lt!196904) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40914 (= lt!196904 (remainingBits!0 ((_ sign_extend 32) (size!2569 (buf!2945 (_2!5516 lt!196550)))) ((_ sign_extend 32) (currentByte!5660 (_2!5516 lt!196550))) ((_ sign_extend 32) (currentBit!5655 (_2!5516 lt!196550)))))))

(declare-fun lt!196899 () (_ BitVec 64))

(declare-fun lt!196902 () (_ BitVec 64))

(assert (=> d!40914 (= lt!196903 (bvmul lt!196899 lt!196902))))

(assert (=> d!40914 (or (= lt!196899 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!196902 (bvsdiv (bvmul lt!196899 lt!196902) lt!196899)))))

(assert (=> d!40914 (= lt!196902 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40914 (= lt!196899 ((_ sign_extend 32) (size!2569 (buf!2945 (_2!5516 lt!196550)))))))

(assert (=> d!40914 (= lt!196901 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5660 (_2!5516 lt!196550))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5655 (_2!5516 lt!196550)))))))

(assert (=> d!40914 (invariant!0 (currentBit!5655 (_2!5516 lt!196550)) (currentByte!5660 (_2!5516 lt!196550)) (size!2569 (buf!2945 (_2!5516 lt!196550))))))

(assert (=> d!40914 (= (bitIndex!0 (size!2569 (buf!2945 (_2!5516 lt!196550))) (currentByte!5660 (_2!5516 lt!196550)) (currentBit!5655 (_2!5516 lt!196550))) lt!196901)))

(declare-fun b!125856 () Bool)

(declare-fun res!104255 () Bool)

(assert (=> b!125856 (=> (not res!104255) (not e!82845))))

(assert (=> b!125856 (= res!104255 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!196901))))

(declare-fun b!125857 () Bool)

(declare-fun lt!196900 () (_ BitVec 64))

(assert (=> b!125857 (= e!82845 (bvsle lt!196901 (bvmul lt!196900 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!125857 (or (= lt!196900 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!196900 #b0000000000000000000000000000000000000000000000000000000000001000) lt!196900)))))

(assert (=> b!125857 (= lt!196900 ((_ sign_extend 32) (size!2569 (buf!2945 (_2!5516 lt!196550)))))))

(assert (= (and d!40914 res!104256) b!125856))

(assert (= (and b!125856 res!104255) b!125857))

(declare-fun m!191275 () Bool)

(assert (=> d!40914 m!191275))

(assert (=> d!40914 m!191047))

(assert (=> b!125660 d!40914))

(declare-fun d!40922 () Bool)

(declare-fun e!82846 () Bool)

(assert (=> d!40922 e!82846))

(declare-fun res!104258 () Bool)

(assert (=> d!40922 (=> (not res!104258) (not e!82846))))

(declare-fun lt!196907 () (_ BitVec 64))

(declare-fun lt!196910 () (_ BitVec 64))

(declare-fun lt!196909 () (_ BitVec 64))

(assert (=> d!40922 (= res!104258 (= lt!196907 (bvsub lt!196909 lt!196910)))))

(assert (=> d!40922 (or (= (bvand lt!196909 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!196910 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!196909 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!196909 lt!196910) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40922 (= lt!196910 (remainingBits!0 ((_ sign_extend 32) (size!2569 (buf!2945 thiss!1614))) ((_ sign_extend 32) (currentByte!5660 thiss!1614)) ((_ sign_extend 32) (currentBit!5655 thiss!1614))))))

(declare-fun lt!196905 () (_ BitVec 64))

(declare-fun lt!196908 () (_ BitVec 64))

(assert (=> d!40922 (= lt!196909 (bvmul lt!196905 lt!196908))))

(assert (=> d!40922 (or (= lt!196905 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!196908 (bvsdiv (bvmul lt!196905 lt!196908) lt!196905)))))

(assert (=> d!40922 (= lt!196908 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40922 (= lt!196905 ((_ sign_extend 32) (size!2569 (buf!2945 thiss!1614))))))

(assert (=> d!40922 (= lt!196907 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5660 thiss!1614)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5655 thiss!1614))))))

(assert (=> d!40922 (invariant!0 (currentBit!5655 thiss!1614) (currentByte!5660 thiss!1614) (size!2569 (buf!2945 thiss!1614)))))

(assert (=> d!40922 (= (bitIndex!0 (size!2569 (buf!2945 thiss!1614)) (currentByte!5660 thiss!1614) (currentBit!5655 thiss!1614)) lt!196907)))

(declare-fun b!125858 () Bool)

(declare-fun res!104257 () Bool)

(assert (=> b!125858 (=> (not res!104257) (not e!82846))))

(assert (=> b!125858 (= res!104257 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!196907))))

(declare-fun b!125859 () Bool)

(declare-fun lt!196906 () (_ BitVec 64))

(assert (=> b!125859 (= e!82846 (bvsle lt!196907 (bvmul lt!196906 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!125859 (or (= lt!196906 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!196906 #b0000000000000000000000000000000000000000000000000000000000001000) lt!196906)))))

(assert (=> b!125859 (= lt!196906 ((_ sign_extend 32) (size!2569 (buf!2945 thiss!1614))))))

(assert (= (and d!40922 res!104258) b!125858))

(assert (= (and b!125858 res!104257) b!125859))

(declare-fun m!191303 () Bool)

(assert (=> d!40922 m!191303))

(declare-fun m!191305 () Bool)

(assert (=> d!40922 m!191305))

(assert (=> b!125660 d!40922))

(declare-fun d!40924 () Bool)

(assert (=> d!40924 (= (array_inv!2358 arr!227) (bvsge (size!2569 arr!227) #b00000000000000000000000000000000))))

(assert (=> start!24786 d!40924))

(declare-fun d!40926 () Bool)

(assert (=> d!40926 (= (inv!12 thiss!1614) (invariant!0 (currentBit!5655 thiss!1614) (currentByte!5660 thiss!1614) (size!2569 (buf!2945 thiss!1614))))))

(declare-fun bs!9906 () Bool)

(assert (= bs!9906 d!40926))

(assert (=> bs!9906 m!191305))

(assert (=> start!24786 d!40926))

(declare-fun d!40928 () Bool)

(assert (=> d!40928 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2569 (buf!2945 thiss!1614))) ((_ sign_extend 32) (currentByte!5660 thiss!1614)) ((_ sign_extend 32) (currentBit!5655 thiss!1614)) noOfBytes!1) (bvsle ((_ sign_extend 32) noOfBytes!1) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2569 (buf!2945 thiss!1614))) ((_ sign_extend 32) (currentByte!5660 thiss!1614)) ((_ sign_extend 32) (currentBit!5655 thiss!1614))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!9907 () Bool)

(assert (= bs!9907 d!40928))

(assert (=> bs!9907 m!191303))

(assert (=> b!125662 d!40928))

(push 1)

(assert (not d!40882))

(assert (not b!125806))

(assert (not b!125803))

(assert (not b!125738))

(assert (not b!125802))

(assert (not b!125737))

(assert (not d!40926))

(assert (not b!125740))

(assert (not b!125821))

(assert (not d!40856))

(assert (not b!125736))

(assert (not d!40868))

(assert (not b!125812))

(assert (not d!40870))

(assert (not d!40928))

(assert (not d!40922))

(assert (not b!125819))

(assert (not d!40914))

(assert (not b!125739))

(assert (not b!125805))

(assert (not d!40864))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

