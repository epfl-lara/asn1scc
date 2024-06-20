; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24788 () Bool)

(assert start!24788)

(declare-fun b!125681 () Bool)

(declare-fun e!82731 () Bool)

(declare-fun e!82732 () Bool)

(assert (=> b!125681 (= e!82731 (not e!82732))))

(declare-fun res!104104 () Bool)

(assert (=> b!125681 (=> res!104104 e!82732)))

(declare-datatypes ((array!5677 0))(
  ( (array!5678 (arr!3163 (Array (_ BitVec 32) (_ BitVec 8))) (size!2570 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4464 0))(
  ( (BitStream!4465 (buf!2946 array!5677) (currentByte!5661 (_ BitVec 32)) (currentBit!5656 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10486 0))(
  ( (tuple2!10487 (_1!5519 BitStream!4464) (_2!5519 BitStream!4464)) )
))
(declare-fun lt!196568 () tuple2!10486)

(declare-fun arr!227 () array!5677)

(declare-datatypes ((tuple2!10488 0))(
  ( (tuple2!10489 (_1!5520 BitStream!4464) (_2!5520 array!5677)) )
))
(declare-fun lt!196566 () tuple2!10488)

(assert (=> b!125681 (= res!104104 (or (not (= (size!2570 (_2!5520 lt!196566)) (size!2570 arr!227))) (not (= (_1!5520 lt!196566) (_2!5519 lt!196568)))))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4464 array!5677 (_ BitVec 32) (_ BitVec 32)) tuple2!10488)

(assert (=> b!125681 (= lt!196566 (readByteArrayLoopPure!0 (_1!5519 lt!196568) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-datatypes ((Unit!7737 0))(
  ( (Unit!7738) )
))
(declare-datatypes ((tuple2!10490 0))(
  ( (tuple2!10491 (_1!5521 Unit!7737) (_2!5521 BitStream!4464)) )
))
(declare-fun lt!196564 () tuple2!10490)

(declare-fun thiss!1614 () BitStream!4464)

(declare-fun lt!196567 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!125681 (validate_offset_bits!1 ((_ sign_extend 32) (size!2570 (buf!2946 (_2!5521 lt!196564)))) ((_ sign_extend 32) (currentByte!5661 thiss!1614)) ((_ sign_extend 32) (currentBit!5656 thiss!1614)) lt!196567)))

(declare-fun lt!196565 () Unit!7737)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4464 array!5677 (_ BitVec 64)) Unit!7737)

(assert (=> b!125681 (= lt!196565 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2946 (_2!5521 lt!196564)) lt!196567))))

(declare-fun reader!0 (BitStream!4464 BitStream!4464) tuple2!10486)

(assert (=> b!125681 (= lt!196568 (reader!0 thiss!1614 (_2!5521 lt!196564)))))

(declare-fun b!125683 () Bool)

(declare-fun res!104106 () Bool)

(assert (=> b!125683 (=> (not res!104106) (not e!82731))))

(declare-fun isPrefixOf!0 (BitStream!4464 BitStream!4464) Bool)

(assert (=> b!125683 (= res!104106 (isPrefixOf!0 thiss!1614 (_2!5521 lt!196564)))))

(declare-fun b!125684 () Bool)

(declare-fun e!82736 () Bool)

(declare-fun array_inv!2359 (array!5677) Bool)

(assert (=> b!125684 (= e!82736 (array_inv!2359 (buf!2946 thiss!1614)))))

(declare-fun b!125685 () Bool)

(declare-fun res!104107 () Bool)

(declare-fun e!82735 () Bool)

(assert (=> b!125685 (=> (not res!104107) (not e!82735))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!125685 (= res!104107 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2570 (buf!2946 thiss!1614))) ((_ sign_extend 32) (currentByte!5661 thiss!1614)) ((_ sign_extend 32) (currentBit!5656 thiss!1614)) noOfBytes!1))))

(declare-fun b!125686 () Bool)

(declare-fun e!82734 () Bool)

(assert (=> b!125686 (= e!82734 e!82731)))

(declare-fun res!104105 () Bool)

(assert (=> b!125686 (=> (not res!104105) (not e!82731))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!125686 (= res!104105 (= (bitIndex!0 (size!2570 (buf!2946 (_2!5521 lt!196564))) (currentByte!5661 (_2!5521 lt!196564)) (currentBit!5656 (_2!5521 lt!196564))) (bvadd (bitIndex!0 (size!2570 (buf!2946 thiss!1614)) (currentByte!5661 thiss!1614) (currentBit!5656 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!196567))))))

(assert (=> b!125686 (= lt!196567 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!125687 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!125687 (= e!82735 (not (invariant!0 (currentBit!5656 (_2!5521 lt!196564)) (currentByte!5661 (_2!5521 lt!196564)) (size!2570 (buf!2946 (_2!5521 lt!196564))))))))

(assert (=> b!125687 e!82734))

(declare-fun res!104103 () Bool)

(assert (=> b!125687 (=> (not res!104103) (not e!82734))))

(assert (=> b!125687 (= res!104103 (= (size!2570 (buf!2946 thiss!1614)) (size!2570 (buf!2946 (_2!5521 lt!196564)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4464 array!5677 (_ BitVec 32) (_ BitVec 32)) tuple2!10490)

(assert (=> b!125687 (= lt!196564 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun res!104102 () Bool)

(assert (=> start!24788 (=> (not res!104102) (not e!82735))))

(assert (=> start!24788 (= res!104102 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2570 arr!227))))))

(assert (=> start!24788 e!82735))

(assert (=> start!24788 true))

(assert (=> start!24788 (array_inv!2359 arr!227)))

(declare-fun inv!12 (BitStream!4464) Bool)

(assert (=> start!24788 (and (inv!12 thiss!1614) e!82736)))

(declare-fun b!125682 () Bool)

(declare-fun arrayRangesEq!57 (array!5677 array!5677 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!125682 (= e!82732 (not (arrayRangesEq!57 arr!227 (_2!5520 lt!196566) #b00000000000000000000000000000000 noOfBytes!1)))))

(assert (= (and start!24788 res!104102) b!125685))

(assert (= (and b!125685 res!104107) b!125687))

(assert (= (and b!125687 res!104103) b!125686))

(assert (= (and b!125686 res!104105) b!125683))

(assert (= (and b!125683 res!104106) b!125681))

(assert (= (and b!125681 (not res!104104)) b!125682))

(assert (= start!24788 b!125684))

(declare-fun m!191053 () Bool)

(assert (=> start!24788 m!191053))

(declare-fun m!191055 () Bool)

(assert (=> start!24788 m!191055))

(declare-fun m!191057 () Bool)

(assert (=> b!125685 m!191057))

(declare-fun m!191059 () Bool)

(assert (=> b!125681 m!191059))

(declare-fun m!191061 () Bool)

(assert (=> b!125681 m!191061))

(declare-fun m!191063 () Bool)

(assert (=> b!125681 m!191063))

(declare-fun m!191065 () Bool)

(assert (=> b!125681 m!191065))

(declare-fun m!191067 () Bool)

(assert (=> b!125683 m!191067))

(declare-fun m!191069 () Bool)

(assert (=> b!125684 m!191069))

(declare-fun m!191071 () Bool)

(assert (=> b!125686 m!191071))

(declare-fun m!191073 () Bool)

(assert (=> b!125686 m!191073))

(declare-fun m!191075 () Bool)

(assert (=> b!125682 m!191075))

(declare-fun m!191077 () Bool)

(assert (=> b!125687 m!191077))

(declare-fun m!191079 () Bool)

(assert (=> b!125687 m!191079))

(check-sat (not b!125684) (not b!125682) (not start!24788) (not b!125687) (not b!125685) (not b!125686) (not b!125681) (not b!125683))
(check-sat)
(get-model)

(declare-fun d!40858 () Bool)

(assert (=> d!40858 (= (invariant!0 (currentBit!5656 (_2!5521 lt!196564)) (currentByte!5661 (_2!5521 lt!196564)) (size!2570 (buf!2946 (_2!5521 lt!196564)))) (and (bvsge (currentBit!5656 (_2!5521 lt!196564)) #b00000000000000000000000000000000) (bvslt (currentBit!5656 (_2!5521 lt!196564)) #b00000000000000000000000000001000) (bvsge (currentByte!5661 (_2!5521 lt!196564)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5661 (_2!5521 lt!196564)) (size!2570 (buf!2946 (_2!5521 lt!196564)))) (and (= (currentBit!5656 (_2!5521 lt!196564)) #b00000000000000000000000000000000) (= (currentByte!5661 (_2!5521 lt!196564)) (size!2570 (buf!2946 (_2!5521 lt!196564))))))))))

(assert (=> b!125687 d!40858))

(declare-fun b!125749 () Bool)

(declare-fun res!104167 () Bool)

(declare-fun e!82784 () Bool)

(assert (=> b!125749 (=> (not res!104167) (not e!82784))))

(declare-fun lt!196657 () (_ BitVec 64))

(declare-fun lt!196659 () (_ BitVec 64))

(declare-fun lt!196660 () tuple2!10490)

(assert (=> b!125749 (= res!104167 (= (bitIndex!0 (size!2570 (buf!2946 (_2!5521 lt!196660))) (currentByte!5661 (_2!5521 lt!196660)) (currentBit!5656 (_2!5521 lt!196660))) (bvadd lt!196657 lt!196659)))))

(assert (=> b!125749 (or (not (= (bvand lt!196657 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!196659 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!196657 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!196657 lt!196659) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!196658 () (_ BitVec 64))

(assert (=> b!125749 (= lt!196659 (bvmul lt!196658 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!125749 (or (= lt!196658 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!196658 #b0000000000000000000000000000000000000000000000000000000000001000) lt!196658)))))

(assert (=> b!125749 (= lt!196658 ((_ sign_extend 32) (bvsub noOfBytes!1 #b00000000000000000000000000000000)))))

(assert (=> b!125749 (or (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand (bvsub noOfBytes!1 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!125749 (= lt!196657 (bitIndex!0 (size!2570 (buf!2946 thiss!1614)) (currentByte!5661 thiss!1614) (currentBit!5656 thiss!1614)))))

(declare-fun b!125751 () Bool)

(declare-fun e!82783 () Bool)

(declare-fun lt!196656 () (_ BitVec 64))

(assert (=> b!125751 (= e!82783 (validate_offset_bits!1 ((_ sign_extend 32) (size!2570 (buf!2946 thiss!1614))) ((_ sign_extend 32) (currentByte!5661 thiss!1614)) ((_ sign_extend 32) (currentBit!5656 thiss!1614)) lt!196656))))

(declare-fun b!125750 () Bool)

(declare-fun res!104170 () Bool)

(assert (=> b!125750 (=> (not res!104170) (not e!82784))))

(assert (=> b!125750 (= res!104170 (isPrefixOf!0 thiss!1614 (_2!5521 lt!196660)))))

(declare-fun d!40860 () Bool)

(assert (=> d!40860 e!82784))

(declare-fun res!104166 () Bool)

(assert (=> d!40860 (=> (not res!104166) (not e!82784))))

(assert (=> d!40860 (= res!104166 (= (size!2570 (buf!2946 thiss!1614)) (size!2570 (buf!2946 (_2!5521 lt!196660)))))))

(declare-fun choose!64 (BitStream!4464 array!5677 (_ BitVec 32) (_ BitVec 32)) tuple2!10490)

(assert (=> d!40860 (= lt!196660 (choose!64 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!40860 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2570 arr!227)))))

(assert (=> d!40860 (= (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1) lt!196660)))

(declare-fun b!125752 () Bool)

(declare-fun lt!196661 () tuple2!10488)

(declare-fun e!82782 () Bool)

(assert (=> b!125752 (= e!82782 (arrayRangesEq!57 arr!227 (_2!5520 lt!196661) #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!125753 () Bool)

(assert (=> b!125753 (= e!82784 e!82782)))

(declare-fun res!104168 () Bool)

(assert (=> b!125753 (=> (not res!104168) (not e!82782))))

(declare-fun lt!196662 () tuple2!10486)

(assert (=> b!125753 (= res!104168 (and (= (size!2570 (_2!5520 lt!196661)) (size!2570 arr!227)) (= (_1!5520 lt!196661) (_2!5519 lt!196662))))))

(assert (=> b!125753 (= lt!196661 (readByteArrayLoopPure!0 (_1!5519 lt!196662) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!196664 () Unit!7737)

(declare-fun lt!196663 () Unit!7737)

(assert (=> b!125753 (= lt!196664 lt!196663)))

(assert (=> b!125753 (validate_offset_bits!1 ((_ sign_extend 32) (size!2570 (buf!2946 (_2!5521 lt!196660)))) ((_ sign_extend 32) (currentByte!5661 thiss!1614)) ((_ sign_extend 32) (currentBit!5656 thiss!1614)) lt!196656)))

(assert (=> b!125753 (= lt!196663 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2946 (_2!5521 lt!196660)) lt!196656))))

(assert (=> b!125753 e!82783))

(declare-fun res!104169 () Bool)

(assert (=> b!125753 (=> (not res!104169) (not e!82783))))

(assert (=> b!125753 (= res!104169 (and (= (size!2570 (buf!2946 thiss!1614)) (size!2570 (buf!2946 (_2!5521 lt!196660)))) (bvsge lt!196656 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!125753 (= lt!196656 ((_ sign_extend 32) (bvsub noOfBytes!1 #b00000000000000000000000000000000)))))

(assert (=> b!125753 (or (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand (bvsub noOfBytes!1 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!125753 (= lt!196662 (reader!0 thiss!1614 (_2!5521 lt!196660)))))

(assert (= (and d!40860 res!104166) b!125749))

(assert (= (and b!125749 res!104167) b!125750))

(assert (= (and b!125750 res!104170) b!125753))

(assert (= (and b!125753 res!104169) b!125751))

(assert (= (and b!125753 res!104168) b!125752))

(declare-fun m!191147 () Bool)

(assert (=> b!125750 m!191147))

(declare-fun m!191149 () Bool)

(assert (=> b!125751 m!191149))

(declare-fun m!191151 () Bool)

(assert (=> d!40860 m!191151))

(declare-fun m!191153 () Bool)

(assert (=> b!125749 m!191153))

(assert (=> b!125749 m!191073))

(declare-fun m!191155 () Bool)

(assert (=> b!125752 m!191155))

(declare-fun m!191157 () Bool)

(assert (=> b!125753 m!191157))

(declare-fun m!191159 () Bool)

(assert (=> b!125753 m!191159))

(declare-fun m!191161 () Bool)

(assert (=> b!125753 m!191161))

(declare-fun m!191163 () Bool)

(assert (=> b!125753 m!191163))

(assert (=> b!125687 d!40860))

(declare-fun d!40866 () Bool)

(declare-fun res!104183 () Bool)

(declare-fun e!82793 () Bool)

(assert (=> d!40866 (=> res!104183 e!82793)))

(assert (=> d!40866 (= res!104183 (= #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!40866 (= (arrayRangesEq!57 arr!227 (_2!5520 lt!196566) #b00000000000000000000000000000000 noOfBytes!1) e!82793)))

(declare-fun b!125766 () Bool)

(declare-fun e!82794 () Bool)

(assert (=> b!125766 (= e!82793 e!82794)))

(declare-fun res!104184 () Bool)

(assert (=> b!125766 (=> (not res!104184) (not e!82794))))

(assert (=> b!125766 (= res!104184 (= (select (arr!3163 arr!227) #b00000000000000000000000000000000) (select (arr!3163 (_2!5520 lt!196566)) #b00000000000000000000000000000000)))))

(declare-fun b!125767 () Bool)

(assert (=> b!125767 (= e!82794 (arrayRangesEq!57 arr!227 (_2!5520 lt!196566) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) noOfBytes!1))))

(assert (= (and d!40866 (not res!104183)) b!125766))

(assert (= (and b!125766 res!104184) b!125767))

(declare-fun m!191171 () Bool)

(assert (=> b!125766 m!191171))

(declare-fun m!191173 () Bool)

(assert (=> b!125766 m!191173))

(declare-fun m!191177 () Bool)

(assert (=> b!125767 m!191177))

(assert (=> b!125682 d!40866))

(declare-fun d!40876 () Bool)

(assert (=> d!40876 (= (array_inv!2359 (buf!2946 thiss!1614)) (bvsge (size!2570 (buf!2946 thiss!1614)) #b00000000000000000000000000000000))))

(assert (=> b!125684 d!40876))

(declare-fun d!40878 () Bool)

(declare-fun res!104199 () Bool)

(declare-fun e!82804 () Bool)

(assert (=> d!40878 (=> (not res!104199) (not e!82804))))

(assert (=> d!40878 (= res!104199 (= (size!2570 (buf!2946 thiss!1614)) (size!2570 (buf!2946 (_2!5521 lt!196564)))))))

(assert (=> d!40878 (= (isPrefixOf!0 thiss!1614 (_2!5521 lt!196564)) e!82804)))

(declare-fun b!125780 () Bool)

(declare-fun res!104197 () Bool)

(assert (=> b!125780 (=> (not res!104197) (not e!82804))))

(assert (=> b!125780 (= res!104197 (bvsle (bitIndex!0 (size!2570 (buf!2946 thiss!1614)) (currentByte!5661 thiss!1614) (currentBit!5656 thiss!1614)) (bitIndex!0 (size!2570 (buf!2946 (_2!5521 lt!196564))) (currentByte!5661 (_2!5521 lt!196564)) (currentBit!5656 (_2!5521 lt!196564)))))))

(declare-fun b!125781 () Bool)

(declare-fun e!82803 () Bool)

(assert (=> b!125781 (= e!82804 e!82803)))

(declare-fun res!104198 () Bool)

(assert (=> b!125781 (=> res!104198 e!82803)))

(assert (=> b!125781 (= res!104198 (= (size!2570 (buf!2946 thiss!1614)) #b00000000000000000000000000000000))))

(declare-fun b!125782 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5677 array!5677 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!125782 (= e!82803 (arrayBitRangesEq!0 (buf!2946 thiss!1614) (buf!2946 (_2!5521 lt!196564)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2570 (buf!2946 thiss!1614)) (currentByte!5661 thiss!1614) (currentBit!5656 thiss!1614))))))

(assert (= (and d!40878 res!104199) b!125780))

(assert (= (and b!125780 res!104197) b!125781))

(assert (= (and b!125781 (not res!104198)) b!125782))

(assert (=> b!125780 m!191073))

(assert (=> b!125780 m!191071))

(assert (=> b!125782 m!191073))

(assert (=> b!125782 m!191073))

(declare-fun m!191181 () Bool)

(assert (=> b!125782 m!191181))

(assert (=> b!125683 d!40878))

(declare-fun d!40884 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!40884 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2570 (buf!2946 thiss!1614))) ((_ sign_extend 32) (currentByte!5661 thiss!1614)) ((_ sign_extend 32) (currentBit!5656 thiss!1614)) noOfBytes!1) (bvsle ((_ sign_extend 32) noOfBytes!1) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2570 (buf!2946 thiss!1614))) ((_ sign_extend 32) (currentByte!5661 thiss!1614)) ((_ sign_extend 32) (currentBit!5656 thiss!1614))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!9897 () Bool)

(assert (= bs!9897 d!40884))

(declare-fun m!191185 () Bool)

(assert (=> bs!9897 m!191185))

(assert (=> b!125685 d!40884))

(declare-datatypes ((tuple3!444 0))(
  ( (tuple3!445 (_1!5526 Unit!7737) (_2!5526 BitStream!4464) (_3!277 array!5677)) )
))
(declare-fun lt!196697 () tuple3!444)

(declare-fun d!40890 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!4464 array!5677 (_ BitVec 32) (_ BitVec 32)) tuple3!444)

(assert (=> d!40890 (= lt!196697 (readByteArrayLoop!0 (_1!5519 lt!196568) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!40890 (= (readByteArrayLoopPure!0 (_1!5519 lt!196568) arr!227 #b00000000000000000000000000000000 noOfBytes!1) (tuple2!10489 (_2!5526 lt!196697) (_3!277 lt!196697)))))

(declare-fun bs!9899 () Bool)

(assert (= bs!9899 d!40890))

(declare-fun m!191193 () Bool)

(assert (=> bs!9899 m!191193))

(assert (=> b!125681 d!40890))

(declare-fun d!40896 () Bool)

(assert (=> d!40896 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2570 (buf!2946 (_2!5521 lt!196564)))) ((_ sign_extend 32) (currentByte!5661 thiss!1614)) ((_ sign_extend 32) (currentBit!5656 thiss!1614)) lt!196567) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2570 (buf!2946 (_2!5521 lt!196564)))) ((_ sign_extend 32) (currentByte!5661 thiss!1614)) ((_ sign_extend 32) (currentBit!5656 thiss!1614))) lt!196567))))

(declare-fun bs!9900 () Bool)

(assert (= bs!9900 d!40896))

(declare-fun m!191195 () Bool)

(assert (=> bs!9900 m!191195))

(assert (=> b!125681 d!40896))

(declare-fun d!40898 () Bool)

(assert (=> d!40898 (validate_offset_bits!1 ((_ sign_extend 32) (size!2570 (buf!2946 (_2!5521 lt!196564)))) ((_ sign_extend 32) (currentByte!5661 thiss!1614)) ((_ sign_extend 32) (currentBit!5656 thiss!1614)) lt!196567)))

(declare-fun lt!196702 () Unit!7737)

(declare-fun choose!9 (BitStream!4464 array!5677 (_ BitVec 64) BitStream!4464) Unit!7737)

(assert (=> d!40898 (= lt!196702 (choose!9 thiss!1614 (buf!2946 (_2!5521 lt!196564)) lt!196567 (BitStream!4465 (buf!2946 (_2!5521 lt!196564)) (currentByte!5661 thiss!1614) (currentBit!5656 thiss!1614))))))

(assert (=> d!40898 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2946 (_2!5521 lt!196564)) lt!196567) lt!196702)))

(declare-fun bs!9901 () Bool)

(assert (= bs!9901 d!40898))

(assert (=> bs!9901 m!191061))

(declare-fun m!191197 () Bool)

(assert (=> bs!9901 m!191197))

(assert (=> b!125681 d!40898))

(declare-fun b!125832 () Bool)

(declare-fun e!82835 () Unit!7737)

(declare-fun lt!196830 () Unit!7737)

(assert (=> b!125832 (= e!82835 lt!196830)))

(declare-fun lt!196831 () (_ BitVec 64))

(assert (=> b!125832 (= lt!196831 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!196838 () (_ BitVec 64))

(assert (=> b!125832 (= lt!196838 (bitIndex!0 (size!2570 (buf!2946 thiss!1614)) (currentByte!5661 thiss!1614) (currentBit!5656 thiss!1614)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5677 array!5677 (_ BitVec 64) (_ BitVec 64)) Unit!7737)

(assert (=> b!125832 (= lt!196830 (arrayBitRangesEqSymmetric!0 (buf!2946 thiss!1614) (buf!2946 (_2!5521 lt!196564)) lt!196831 lt!196838))))

(assert (=> b!125832 (arrayBitRangesEq!0 (buf!2946 (_2!5521 lt!196564)) (buf!2946 thiss!1614) lt!196831 lt!196838)))

(declare-fun b!125833 () Bool)

(declare-fun res!104240 () Bool)

(declare-fun e!82836 () Bool)

(assert (=> b!125833 (=> (not res!104240) (not e!82836))))

(declare-fun lt!196829 () tuple2!10486)

(assert (=> b!125833 (= res!104240 (isPrefixOf!0 (_2!5519 lt!196829) (_2!5521 lt!196564)))))

(declare-fun d!40900 () Bool)

(assert (=> d!40900 e!82836))

(declare-fun res!104239 () Bool)

(assert (=> d!40900 (=> (not res!104239) (not e!82836))))

(assert (=> d!40900 (= res!104239 (isPrefixOf!0 (_1!5519 lt!196829) (_2!5519 lt!196829)))))

(declare-fun lt!196835 () BitStream!4464)

(assert (=> d!40900 (= lt!196829 (tuple2!10487 lt!196835 (_2!5521 lt!196564)))))

(declare-fun lt!196821 () Unit!7737)

(declare-fun lt!196834 () Unit!7737)

(assert (=> d!40900 (= lt!196821 lt!196834)))

(assert (=> d!40900 (isPrefixOf!0 lt!196835 (_2!5521 lt!196564))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4464 BitStream!4464 BitStream!4464) Unit!7737)

(assert (=> d!40900 (= lt!196834 (lemmaIsPrefixTransitive!0 lt!196835 (_2!5521 lt!196564) (_2!5521 lt!196564)))))

(declare-fun lt!196837 () Unit!7737)

(declare-fun lt!196826 () Unit!7737)

(assert (=> d!40900 (= lt!196837 lt!196826)))

(assert (=> d!40900 (isPrefixOf!0 lt!196835 (_2!5521 lt!196564))))

(assert (=> d!40900 (= lt!196826 (lemmaIsPrefixTransitive!0 lt!196835 thiss!1614 (_2!5521 lt!196564)))))

(declare-fun lt!196819 () Unit!7737)

(assert (=> d!40900 (= lt!196819 e!82835)))

(declare-fun c!7473 () Bool)

(assert (=> d!40900 (= c!7473 (not (= (size!2570 (buf!2946 thiss!1614)) #b00000000000000000000000000000000)))))

(declare-fun lt!196836 () Unit!7737)

(declare-fun lt!196828 () Unit!7737)

(assert (=> d!40900 (= lt!196836 lt!196828)))

(assert (=> d!40900 (isPrefixOf!0 (_2!5521 lt!196564) (_2!5521 lt!196564))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4464) Unit!7737)

(assert (=> d!40900 (= lt!196828 (lemmaIsPrefixRefl!0 (_2!5521 lt!196564)))))

(declare-fun lt!196832 () Unit!7737)

(declare-fun lt!196823 () Unit!7737)

(assert (=> d!40900 (= lt!196832 lt!196823)))

(assert (=> d!40900 (= lt!196823 (lemmaIsPrefixRefl!0 (_2!5521 lt!196564)))))

(declare-fun lt!196824 () Unit!7737)

(declare-fun lt!196825 () Unit!7737)

(assert (=> d!40900 (= lt!196824 lt!196825)))

(assert (=> d!40900 (isPrefixOf!0 lt!196835 lt!196835)))

(assert (=> d!40900 (= lt!196825 (lemmaIsPrefixRefl!0 lt!196835))))

(declare-fun lt!196827 () Unit!7737)

(declare-fun lt!196822 () Unit!7737)

(assert (=> d!40900 (= lt!196827 lt!196822)))

(assert (=> d!40900 (isPrefixOf!0 thiss!1614 thiss!1614)))

(assert (=> d!40900 (= lt!196822 (lemmaIsPrefixRefl!0 thiss!1614))))

(assert (=> d!40900 (= lt!196835 (BitStream!4465 (buf!2946 (_2!5521 lt!196564)) (currentByte!5661 thiss!1614) (currentBit!5656 thiss!1614)))))

(assert (=> d!40900 (isPrefixOf!0 thiss!1614 (_2!5521 lt!196564))))

(assert (=> d!40900 (= (reader!0 thiss!1614 (_2!5521 lt!196564)) lt!196829)))

(declare-fun b!125834 () Bool)

(declare-fun Unit!7742 () Unit!7737)

(assert (=> b!125834 (= e!82835 Unit!7742)))

(declare-fun b!125835 () Bool)

(declare-fun res!104241 () Bool)

(assert (=> b!125835 (=> (not res!104241) (not e!82836))))

(assert (=> b!125835 (= res!104241 (isPrefixOf!0 (_1!5519 lt!196829) thiss!1614))))

(declare-fun b!125836 () Bool)

(declare-fun lt!196820 () (_ BitVec 64))

(declare-fun lt!196833 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4464 (_ BitVec 64)) BitStream!4464)

(assert (=> b!125836 (= e!82836 (= (_1!5519 lt!196829) (withMovedBitIndex!0 (_2!5519 lt!196829) (bvsub lt!196820 lt!196833))))))

(assert (=> b!125836 (or (= (bvand lt!196820 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!196833 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!196820 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!196820 lt!196833) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!125836 (= lt!196833 (bitIndex!0 (size!2570 (buf!2946 (_2!5521 lt!196564))) (currentByte!5661 (_2!5521 lt!196564)) (currentBit!5656 (_2!5521 lt!196564))))))

(assert (=> b!125836 (= lt!196820 (bitIndex!0 (size!2570 (buf!2946 thiss!1614)) (currentByte!5661 thiss!1614) (currentBit!5656 thiss!1614)))))

(assert (= (and d!40900 c!7473) b!125832))

(assert (= (and d!40900 (not c!7473)) b!125834))

(assert (= (and d!40900 res!104239) b!125835))

(assert (= (and b!125835 res!104241) b!125833))

(assert (= (and b!125833 res!104240) b!125836))

(declare-fun m!191243 () Bool)

(assert (=> b!125836 m!191243))

(assert (=> b!125836 m!191071))

(assert (=> b!125836 m!191073))

(assert (=> b!125832 m!191073))

(declare-fun m!191245 () Bool)

(assert (=> b!125832 m!191245))

(declare-fun m!191247 () Bool)

(assert (=> b!125832 m!191247))

(declare-fun m!191249 () Bool)

(assert (=> b!125835 m!191249))

(declare-fun m!191251 () Bool)

(assert (=> d!40900 m!191251))

(declare-fun m!191253 () Bool)

(assert (=> d!40900 m!191253))

(declare-fun m!191255 () Bool)

(assert (=> d!40900 m!191255))

(declare-fun m!191257 () Bool)

(assert (=> d!40900 m!191257))

(declare-fun m!191259 () Bool)

(assert (=> d!40900 m!191259))

(declare-fun m!191261 () Bool)

(assert (=> d!40900 m!191261))

(declare-fun m!191263 () Bool)

(assert (=> d!40900 m!191263))

(declare-fun m!191265 () Bool)

(assert (=> d!40900 m!191265))

(declare-fun m!191267 () Bool)

(assert (=> d!40900 m!191267))

(declare-fun m!191269 () Bool)

(assert (=> d!40900 m!191269))

(assert (=> d!40900 m!191067))

(declare-fun m!191271 () Bool)

(assert (=> b!125833 m!191271))

(assert (=> b!125681 d!40900))

(declare-fun d!40916 () Bool)

(assert (=> d!40916 (= (array_inv!2359 arr!227) (bvsge (size!2570 arr!227) #b00000000000000000000000000000000))))

(assert (=> start!24788 d!40916))

(declare-fun d!40918 () Bool)

(assert (=> d!40918 (= (inv!12 thiss!1614) (invariant!0 (currentBit!5656 thiss!1614) (currentByte!5661 thiss!1614) (size!2570 (buf!2946 thiss!1614))))))

(declare-fun bs!9905 () Bool)

(assert (= bs!9905 d!40918))

(declare-fun m!191273 () Bool)

(assert (=> bs!9905 m!191273))

(assert (=> start!24788 d!40918))

(declare-fun d!40920 () Bool)

(declare-fun e!82849 () Bool)

(assert (=> d!40920 e!82849))

(declare-fun res!104264 () Bool)

(assert (=> d!40920 (=> (not res!104264) (not e!82849))))

(declare-fun lt!196926 () (_ BitVec 64))

(declare-fun lt!196928 () (_ BitVec 64))

(declare-fun lt!196923 () (_ BitVec 64))

(assert (=> d!40920 (= res!104264 (= lt!196926 (bvsub lt!196928 lt!196923)))))

(assert (=> d!40920 (or (= (bvand lt!196928 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!196923 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!196928 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!196928 lt!196923) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40920 (= lt!196923 (remainingBits!0 ((_ sign_extend 32) (size!2570 (buf!2946 (_2!5521 lt!196564)))) ((_ sign_extend 32) (currentByte!5661 (_2!5521 lt!196564))) ((_ sign_extend 32) (currentBit!5656 (_2!5521 lt!196564)))))))

(declare-fun lt!196927 () (_ BitVec 64))

(declare-fun lt!196924 () (_ BitVec 64))

(assert (=> d!40920 (= lt!196928 (bvmul lt!196927 lt!196924))))

(assert (=> d!40920 (or (= lt!196927 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!196924 (bvsdiv (bvmul lt!196927 lt!196924) lt!196927)))))

(assert (=> d!40920 (= lt!196924 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40920 (= lt!196927 ((_ sign_extend 32) (size!2570 (buf!2946 (_2!5521 lt!196564)))))))

(assert (=> d!40920 (= lt!196926 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5661 (_2!5521 lt!196564))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5656 (_2!5521 lt!196564)))))))

(assert (=> d!40920 (invariant!0 (currentBit!5656 (_2!5521 lt!196564)) (currentByte!5661 (_2!5521 lt!196564)) (size!2570 (buf!2946 (_2!5521 lt!196564))))))

(assert (=> d!40920 (= (bitIndex!0 (size!2570 (buf!2946 (_2!5521 lt!196564))) (currentByte!5661 (_2!5521 lt!196564)) (currentBit!5656 (_2!5521 lt!196564))) lt!196926)))

(declare-fun b!125864 () Bool)

(declare-fun res!104263 () Bool)

(assert (=> b!125864 (=> (not res!104263) (not e!82849))))

(assert (=> b!125864 (= res!104263 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!196926))))

(declare-fun b!125865 () Bool)

(declare-fun lt!196925 () (_ BitVec 64))

(assert (=> b!125865 (= e!82849 (bvsle lt!196926 (bvmul lt!196925 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!125865 (or (= lt!196925 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!196925 #b0000000000000000000000000000000000000000000000000000000000001000) lt!196925)))))

(assert (=> b!125865 (= lt!196925 ((_ sign_extend 32) (size!2570 (buf!2946 (_2!5521 lt!196564)))))))

(assert (= (and d!40920 res!104264) b!125864))

(assert (= (and b!125864 res!104263) b!125865))

(declare-fun m!191311 () Bool)

(assert (=> d!40920 m!191311))

(assert (=> d!40920 m!191077))

(assert (=> b!125686 d!40920))

(declare-fun d!40930 () Bool)

(declare-fun e!82850 () Bool)

(assert (=> d!40930 e!82850))

(declare-fun res!104266 () Bool)

(assert (=> d!40930 (=> (not res!104266) (not e!82850))))

(declare-fun lt!196934 () (_ BitVec 64))

(declare-fun lt!196929 () (_ BitVec 64))

(declare-fun lt!196932 () (_ BitVec 64))

(assert (=> d!40930 (= res!104266 (= lt!196932 (bvsub lt!196934 lt!196929)))))

(assert (=> d!40930 (or (= (bvand lt!196934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!196929 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!196934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!196934 lt!196929) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40930 (= lt!196929 (remainingBits!0 ((_ sign_extend 32) (size!2570 (buf!2946 thiss!1614))) ((_ sign_extend 32) (currentByte!5661 thiss!1614)) ((_ sign_extend 32) (currentBit!5656 thiss!1614))))))

(declare-fun lt!196933 () (_ BitVec 64))

(declare-fun lt!196930 () (_ BitVec 64))

(assert (=> d!40930 (= lt!196934 (bvmul lt!196933 lt!196930))))

(assert (=> d!40930 (or (= lt!196933 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!196930 (bvsdiv (bvmul lt!196933 lt!196930) lt!196933)))))

(assert (=> d!40930 (= lt!196930 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40930 (= lt!196933 ((_ sign_extend 32) (size!2570 (buf!2946 thiss!1614))))))

(assert (=> d!40930 (= lt!196932 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5661 thiss!1614)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5656 thiss!1614))))))

(assert (=> d!40930 (invariant!0 (currentBit!5656 thiss!1614) (currentByte!5661 thiss!1614) (size!2570 (buf!2946 thiss!1614)))))

(assert (=> d!40930 (= (bitIndex!0 (size!2570 (buf!2946 thiss!1614)) (currentByte!5661 thiss!1614) (currentBit!5656 thiss!1614)) lt!196932)))

(declare-fun b!125866 () Bool)

(declare-fun res!104265 () Bool)

(assert (=> b!125866 (=> (not res!104265) (not e!82850))))

(assert (=> b!125866 (= res!104265 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!196932))))

(declare-fun b!125867 () Bool)

(declare-fun lt!196931 () (_ BitVec 64))

(assert (=> b!125867 (= e!82850 (bvsle lt!196932 (bvmul lt!196931 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!125867 (or (= lt!196931 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!196931 #b0000000000000000000000000000000000000000000000000000000000001000) lt!196931)))))

(assert (=> b!125867 (= lt!196931 ((_ sign_extend 32) (size!2570 (buf!2946 thiss!1614))))))

(assert (= (and d!40930 res!104266) b!125866))

(assert (= (and b!125866 res!104265) b!125867))

(assert (=> d!40930 m!191185))

(assert (=> d!40930 m!191273))

(assert (=> b!125686 d!40930))

(check-sat (not d!40920) (not b!125752) (not b!125836) (not d!40930) (not d!40900) (not d!40884) (not b!125749) (not b!125833) (not b!125751) (not b!125780) (not b!125750) (not d!40860) (not d!40890) (not d!40918) (not d!40898) (not b!125835) (not b!125832) (not d!40896) (not b!125782) (not b!125767) (not b!125753))
