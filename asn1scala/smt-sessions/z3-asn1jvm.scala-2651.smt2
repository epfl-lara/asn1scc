; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65226 () Bool)

(assert start!65226)

(declare-fun b!292735 () Bool)

(declare-fun res!241776 () Bool)

(declare-fun e!208877 () Bool)

(assert (=> b!292735 (=> res!241776 e!208877)))

(declare-datatypes ((array!17431 0))(
  ( (array!17432 (arr!8576 (Array (_ BitVec 32) (_ BitVec 8))) (size!7550 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13110 0))(
  ( (BitStream!13111 (buf!7616 array!17431) (currentByte!14071 (_ BitVec 32)) (currentBit!14066 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13110)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!292735 (= res!241776 (not (invariant!0 (currentBit!14066 thiss!1728) (currentByte!14071 thiss!1728) (size!7550 (buf!7616 thiss!1728)))))))

(declare-fun b!292737 () Bool)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292737 (= e!208877 (validate_offset_bits!1 ((_ sign_extend 32) (size!7550 (buf!7616 thiss!1728))) ((_ sign_extend 32) (currentByte!14071 thiss!1728)) ((_ sign_extend 32) (currentBit!14066 thiss!1728)) (bvsub to!474 from!505)))))

(declare-fun b!292738 () Bool)

(declare-fun e!208879 () Bool)

(declare-fun array_inv!7162 (array!17431) Bool)

(assert (=> b!292738 (= e!208879 (array_inv!7162 (buf!7616 thiss!1728)))))

(declare-fun b!292739 () Bool)

(declare-fun e!208878 () Bool)

(assert (=> b!292739 (= e!208878 (not e!208877))))

(declare-fun res!241774 () Bool)

(assert (=> b!292739 (=> res!241774 e!208877)))

(declare-fun lt!425001 () (_ BitVec 64))

(assert (=> b!292739 (= res!241774 (not (= (bvsub (bvadd lt!425001 to!474) from!505) lt!425001)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292739 (= lt!425001 (bitIndex!0 (size!7550 (buf!7616 thiss!1728)) (currentByte!14071 thiss!1728) (currentBit!14066 thiss!1728)))))

(declare-fun arr!273 () array!17431)

(declare-fun arrayBitRangesEq!0 (array!17431 array!17431 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292739 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20389 0))(
  ( (Unit!20390) )
))
(declare-fun lt!424999 () Unit!20389)

(declare-fun lt!424998 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17431 array!17431 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20389)

(assert (=> b!292739 (= lt!424999 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424998 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292739 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424998)))

(assert (=> b!292739 (= lt!424998 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7550 arr!273))))))

(declare-fun lt!425000 () Unit!20389)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17431) Unit!20389)

(assert (=> b!292739 (= lt!425000 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!292740 () Bool)

(declare-fun res!241778 () Bool)

(assert (=> b!292740 (=> (not res!241778) (not e!208878))))

(assert (=> b!292740 (= res!241778 (bvsge from!505 to!474))))

(declare-fun b!292736 () Bool)

(declare-fun res!241775 () Bool)

(assert (=> b!292736 (=> (not res!241775) (not e!208878))))

(declare-fun nBits!523 () (_ BitVec 64))

(assert (=> b!292736 (= res!241775 (validate_offset_bits!1 ((_ sign_extend 32) (size!7550 (buf!7616 thiss!1728))) ((_ sign_extend 32) (currentByte!14071 thiss!1728)) ((_ sign_extend 32) (currentBit!14066 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!241777 () Bool)

(assert (=> start!65226 (=> (not res!241777) (not e!208878))))

(assert (=> start!65226 (= res!241777 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7550 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65226 e!208878))

(declare-fun inv!12 (BitStream!13110) Bool)

(assert (=> start!65226 (and (inv!12 thiss!1728) e!208879)))

(assert (=> start!65226 true))

(assert (=> start!65226 (array_inv!7162 arr!273)))

(assert (= (and start!65226 res!241777) b!292736))

(assert (= (and b!292736 res!241775) b!292740))

(assert (= (and b!292740 res!241778) b!292739))

(assert (= (and b!292739 (not res!241774)) b!292735))

(assert (= (and b!292735 (not res!241776)) b!292737))

(assert (= start!65226 b!292738))

(declare-fun m!428345 () Bool)

(assert (=> b!292738 m!428345))

(declare-fun m!428347 () Bool)

(assert (=> b!292736 m!428347))

(declare-fun m!428349 () Bool)

(assert (=> b!292739 m!428349))

(declare-fun m!428351 () Bool)

(assert (=> b!292739 m!428351))

(declare-fun m!428353 () Bool)

(assert (=> b!292739 m!428353))

(declare-fun m!428355 () Bool)

(assert (=> b!292739 m!428355))

(declare-fun m!428357 () Bool)

(assert (=> b!292739 m!428357))

(declare-fun m!428359 () Bool)

(assert (=> start!65226 m!428359))

(declare-fun m!428361 () Bool)

(assert (=> start!65226 m!428361))

(declare-fun m!428363 () Bool)

(assert (=> b!292735 m!428363))

(declare-fun m!428365 () Bool)

(assert (=> b!292737 m!428365))

(check-sat (not b!292739) (not start!65226) (not b!292738) (not b!292737) (not b!292736) (not b!292735))
(check-sat)
(get-model)

(declare-fun d!98956 () Bool)

(declare-fun e!208899 () Bool)

(assert (=> d!98956 e!208899))

(declare-fun res!241796 () Bool)

(assert (=> d!98956 (=> (not res!241796) (not e!208899))))

(declare-fun lt!425019 () (_ BitVec 64))

(assert (=> d!98956 (= res!241796 (or (= lt!425019 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!425019 #b0000000000000000000000000000000000000000000000000000000000001000) lt!425019))))))

(assert (=> d!98956 (= lt!425019 ((_ sign_extend 32) (size!7550 arr!273)))))

(declare-fun lt!425018 () Unit!20389)

(declare-fun choose!59 (array!17431) Unit!20389)

(assert (=> d!98956 (= lt!425018 (choose!59 arr!273))))

(assert (=> d!98956 (= (arrayBitRangesEqReflexiveLemma!0 arr!273) lt!425018)))

(declare-fun b!292761 () Bool)

(assert (=> b!292761 (= e!208899 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!7550 arr!273)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!98956 res!241796) b!292761))

(declare-fun m!428389 () Bool)

(assert (=> d!98956 m!428389))

(declare-fun m!428391 () Bool)

(assert (=> b!292761 m!428391))

(assert (=> b!292739 d!98956))

(declare-fun d!98958 () Bool)

(declare-fun e!208902 () Bool)

(assert (=> d!98958 e!208902))

(declare-fun res!241801 () Bool)

(assert (=> d!98958 (=> (not res!241801) (not e!208902))))

(declare-fun lt!425032 () (_ BitVec 64))

(declare-fun lt!425033 () (_ BitVec 64))

(declare-fun lt!425037 () (_ BitVec 64))

(assert (=> d!98958 (= res!241801 (= lt!425037 (bvsub lt!425032 lt!425033)))))

(assert (=> d!98958 (or (= (bvand lt!425032 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!425033 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!425032 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!425032 lt!425033) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!98958 (= lt!425033 (remainingBits!0 ((_ sign_extend 32) (size!7550 (buf!7616 thiss!1728))) ((_ sign_extend 32) (currentByte!14071 thiss!1728)) ((_ sign_extend 32) (currentBit!14066 thiss!1728))))))

(declare-fun lt!425035 () (_ BitVec 64))

(declare-fun lt!425034 () (_ BitVec 64))

(assert (=> d!98958 (= lt!425032 (bvmul lt!425035 lt!425034))))

(assert (=> d!98958 (or (= lt!425035 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!425034 (bvsdiv (bvmul lt!425035 lt!425034) lt!425035)))))

(assert (=> d!98958 (= lt!425034 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!98958 (= lt!425035 ((_ sign_extend 32) (size!7550 (buf!7616 thiss!1728))))))

(assert (=> d!98958 (= lt!425037 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14071 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14066 thiss!1728))))))

(assert (=> d!98958 (invariant!0 (currentBit!14066 thiss!1728) (currentByte!14071 thiss!1728) (size!7550 (buf!7616 thiss!1728)))))

(assert (=> d!98958 (= (bitIndex!0 (size!7550 (buf!7616 thiss!1728)) (currentByte!14071 thiss!1728) (currentBit!14066 thiss!1728)) lt!425037)))

(declare-fun b!292766 () Bool)

(declare-fun res!241802 () Bool)

(assert (=> b!292766 (=> (not res!241802) (not e!208902))))

(assert (=> b!292766 (= res!241802 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!425037))))

(declare-fun b!292767 () Bool)

(declare-fun lt!425036 () (_ BitVec 64))

(assert (=> b!292767 (= e!208902 (bvsle lt!425037 (bvmul lt!425036 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!292767 (or (= lt!425036 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!425036 #b0000000000000000000000000000000000000000000000000000000000001000) lt!425036)))))

(assert (=> b!292767 (= lt!425036 ((_ sign_extend 32) (size!7550 (buf!7616 thiss!1728))))))

(assert (= (and d!98958 res!241801) b!292766))

(assert (= (and b!292766 res!241802) b!292767))

(declare-fun m!428393 () Bool)

(assert (=> d!98958 m!428393))

(assert (=> d!98958 m!428363))

(assert (=> b!292739 d!98958))

(declare-fun call!4937 () Bool)

(declare-fun lt!425046 () (_ BitVec 32))

(declare-fun c!13371 () Bool)

(declare-fun lt!425044 () (_ BitVec 32))

(declare-datatypes ((tuple4!864 0))(
  ( (tuple4!865 (_1!12775 (_ BitVec 32)) (_2!12775 (_ BitVec 32)) (_3!1302 (_ BitVec 32)) (_4!432 (_ BitVec 32))) )
))
(declare-fun lt!425045 () tuple4!864)

(declare-fun bm!4934 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4934 (= call!4937 (byteRangesEq!0 (select (arr!8576 arr!273) (_3!1302 lt!425045)) (select (arr!8576 arr!273) (_3!1302 lt!425045)) lt!425044 (ite c!13371 lt!425046 #b00000000000000000000000000001000)))))

(declare-fun b!292783 () Bool)

(declare-fun e!208915 () Bool)

(declare-fun e!208917 () Bool)

(assert (=> b!292783 (= e!208915 e!208917)))

(declare-fun res!241815 () Bool)

(assert (=> b!292783 (=> (not res!241815) (not e!208917))))

(declare-fun e!208920 () Bool)

(assert (=> b!292783 (= res!241815 e!208920)))

(declare-fun res!241813 () Bool)

(assert (=> b!292783 (=> res!241813 e!208920)))

(assert (=> b!292783 (= res!241813 (bvsge (_1!12775 lt!425045) (_2!12775 lt!425045)))))

(assert (=> b!292783 (= lt!425046 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!292783 (= lt!425044 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!864)

(assert (=> b!292783 (= lt!425045 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!292784 () Bool)

(declare-fun arrayRangesEq!1490 (array!17431 array!17431 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!292784 (= e!208920 (arrayRangesEq!1490 arr!273 arr!273 (_1!12775 lt!425045) (_2!12775 lt!425045)))))

(declare-fun b!292785 () Bool)

(declare-fun e!208918 () Bool)

(assert (=> b!292785 (= e!208917 e!208918)))

(assert (=> b!292785 (= c!13371 (= (_3!1302 lt!425045) (_4!432 lt!425045)))))

(declare-fun b!292786 () Bool)

(declare-fun e!208919 () Bool)

(assert (=> b!292786 (= e!208919 (byteRangesEq!0 (select (arr!8576 arr!273) (_4!432 lt!425045)) (select (arr!8576 arr!273) (_4!432 lt!425045)) #b00000000000000000000000000000000 lt!425046))))

(declare-fun b!292787 () Bool)

(assert (=> b!292787 (= e!208918 call!4937)))

(declare-fun b!292788 () Bool)

(declare-fun res!241816 () Bool)

(assert (=> b!292788 (= res!241816 (= lt!425046 #b00000000000000000000000000000000))))

(assert (=> b!292788 (=> res!241816 e!208919)))

(declare-fun e!208916 () Bool)

(assert (=> b!292788 (= e!208916 e!208919)))

(declare-fun b!292782 () Bool)

(assert (=> b!292782 (= e!208918 e!208916)))

(declare-fun res!241817 () Bool)

(assert (=> b!292782 (= res!241817 call!4937)))

(assert (=> b!292782 (=> (not res!241817) (not e!208916))))

(declare-fun d!98960 () Bool)

(declare-fun res!241814 () Bool)

(assert (=> d!98960 (=> res!241814 e!208915)))

(assert (=> d!98960 (= res!241814 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98960 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!208915)))

(assert (= (and d!98960 (not res!241814)) b!292783))

(assert (= (and b!292783 (not res!241813)) b!292784))

(assert (= (and b!292783 res!241815) b!292785))

(assert (= (and b!292785 c!13371) b!292787))

(assert (= (and b!292785 (not c!13371)) b!292782))

(assert (= (and b!292782 res!241817) b!292788))

(assert (= (and b!292788 (not res!241816)) b!292786))

(assert (= (or b!292787 b!292782) bm!4934))

(declare-fun m!428395 () Bool)

(assert (=> bm!4934 m!428395))

(assert (=> bm!4934 m!428395))

(assert (=> bm!4934 m!428395))

(assert (=> bm!4934 m!428395))

(declare-fun m!428397 () Bool)

(assert (=> bm!4934 m!428397))

(declare-fun m!428399 () Bool)

(assert (=> b!292783 m!428399))

(declare-fun m!428401 () Bool)

(assert (=> b!292784 m!428401))

(declare-fun m!428403 () Bool)

(assert (=> b!292786 m!428403))

(assert (=> b!292786 m!428403))

(assert (=> b!292786 m!428403))

(assert (=> b!292786 m!428403))

(declare-fun m!428405 () Bool)

(assert (=> b!292786 m!428405))

(assert (=> b!292739 d!98960))

(declare-fun d!98972 () Bool)

(assert (=> d!98972 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!425055 () Unit!20389)

(declare-fun choose!4 (array!17431 array!17431 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20389)

(assert (=> d!98972 (= lt!425055 (choose!4 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424998 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98972 (bvsle (size!7550 arr!273) (size!7550 arr!273))))

(assert (=> d!98972 (= (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424998 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) lt!425055)))

(declare-fun bs!25255 () Bool)

(assert (= bs!25255 d!98972))

(assert (=> bs!25255 m!428357))

(declare-fun m!428407 () Bool)

(assert (=> bs!25255 m!428407))

(assert (=> b!292739 d!98972))

(declare-fun c!13374 () Bool)

(declare-fun lt!425058 () (_ BitVec 32))

(declare-fun lt!425057 () tuple4!864)

(declare-fun bm!4937 () Bool)

(declare-fun call!4940 () Bool)

(declare-fun lt!425056 () (_ BitVec 32))

(assert (=> bm!4937 (= call!4940 (byteRangesEq!0 (select (arr!8576 arr!273) (_3!1302 lt!425057)) (select (arr!8576 arr!273) (_3!1302 lt!425057)) lt!425056 (ite c!13374 lt!425058 #b00000000000000000000000000001000)))))

(declare-fun b!292804 () Bool)

(declare-fun e!208933 () Bool)

(declare-fun e!208935 () Bool)

(assert (=> b!292804 (= e!208933 e!208935)))

(declare-fun res!241830 () Bool)

(assert (=> b!292804 (=> (not res!241830) (not e!208935))))

(declare-fun e!208938 () Bool)

(assert (=> b!292804 (= res!241830 e!208938)))

(declare-fun res!241828 () Bool)

(assert (=> b!292804 (=> res!241828 e!208938)))

(assert (=> b!292804 (= res!241828 (bvsge (_1!12775 lt!425057) (_2!12775 lt!425057)))))

(assert (=> b!292804 (= lt!425058 ((_ extract 31 0) (bvsrem lt!424998 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!292804 (= lt!425056 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!292804 (= lt!425057 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424998))))

(declare-fun b!292805 () Bool)

(assert (=> b!292805 (= e!208938 (arrayRangesEq!1490 arr!273 arr!273 (_1!12775 lt!425057) (_2!12775 lt!425057)))))

(declare-fun b!292806 () Bool)

(declare-fun e!208936 () Bool)

(assert (=> b!292806 (= e!208935 e!208936)))

(assert (=> b!292806 (= c!13374 (= (_3!1302 lt!425057) (_4!432 lt!425057)))))

(declare-fun e!208937 () Bool)

(declare-fun b!292807 () Bool)

(assert (=> b!292807 (= e!208937 (byteRangesEq!0 (select (arr!8576 arr!273) (_4!432 lt!425057)) (select (arr!8576 arr!273) (_4!432 lt!425057)) #b00000000000000000000000000000000 lt!425058))))

(declare-fun b!292808 () Bool)

(assert (=> b!292808 (= e!208936 call!4940)))

(declare-fun b!292809 () Bool)

(declare-fun res!241831 () Bool)

(assert (=> b!292809 (= res!241831 (= lt!425058 #b00000000000000000000000000000000))))

(assert (=> b!292809 (=> res!241831 e!208937)))

(declare-fun e!208934 () Bool)

(assert (=> b!292809 (= e!208934 e!208937)))

(declare-fun b!292803 () Bool)

(assert (=> b!292803 (= e!208936 e!208934)))

(declare-fun res!241832 () Bool)

(assert (=> b!292803 (= res!241832 call!4940)))

(assert (=> b!292803 (=> (not res!241832) (not e!208934))))

(declare-fun d!98974 () Bool)

(declare-fun res!241829 () Bool)

(assert (=> d!98974 (=> res!241829 e!208933)))

(assert (=> d!98974 (= res!241829 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!424998))))

(assert (=> d!98974 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424998) e!208933)))

(assert (= (and d!98974 (not res!241829)) b!292804))

(assert (= (and b!292804 (not res!241828)) b!292805))

(assert (= (and b!292804 res!241830) b!292806))

(assert (= (and b!292806 c!13374) b!292808))

(assert (= (and b!292806 (not c!13374)) b!292803))

(assert (= (and b!292803 res!241832) b!292809))

(assert (= (and b!292809 (not res!241831)) b!292807))

(assert (= (or b!292808 b!292803) bm!4937))

(declare-fun m!428409 () Bool)

(assert (=> bm!4937 m!428409))

(assert (=> bm!4937 m!428409))

(assert (=> bm!4937 m!428409))

(assert (=> bm!4937 m!428409))

(declare-fun m!428411 () Bool)

(assert (=> bm!4937 m!428411))

(declare-fun m!428413 () Bool)

(assert (=> b!292804 m!428413))

(declare-fun m!428415 () Bool)

(assert (=> b!292805 m!428415))

(declare-fun m!428417 () Bool)

(assert (=> b!292807 m!428417))

(assert (=> b!292807 m!428417))

(assert (=> b!292807 m!428417))

(assert (=> b!292807 m!428417))

(declare-fun m!428419 () Bool)

(assert (=> b!292807 m!428419))

(assert (=> b!292739 d!98974))

(declare-fun d!98976 () Bool)

(assert (=> d!98976 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14066 thiss!1728) (currentByte!14071 thiss!1728) (size!7550 (buf!7616 thiss!1728))))))

(declare-fun bs!25256 () Bool)

(assert (= bs!25256 d!98976))

(assert (=> bs!25256 m!428363))

(assert (=> start!65226 d!98976))

(declare-fun d!98978 () Bool)

(assert (=> d!98978 (= (array_inv!7162 arr!273) (bvsge (size!7550 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!65226 d!98978))

(declare-fun d!98980 () Bool)

(assert (=> d!98980 (= (invariant!0 (currentBit!14066 thiss!1728) (currentByte!14071 thiss!1728) (size!7550 (buf!7616 thiss!1728))) (and (bvsge (currentBit!14066 thiss!1728) #b00000000000000000000000000000000) (bvslt (currentBit!14066 thiss!1728) #b00000000000000000000000000001000) (bvsge (currentByte!14071 thiss!1728) #b00000000000000000000000000000000) (or (bvslt (currentByte!14071 thiss!1728) (size!7550 (buf!7616 thiss!1728))) (and (= (currentBit!14066 thiss!1728) #b00000000000000000000000000000000) (= (currentByte!14071 thiss!1728) (size!7550 (buf!7616 thiss!1728)))))))))

(assert (=> b!292735 d!98980))

(declare-fun d!98982 () Bool)

(assert (=> d!98982 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7550 (buf!7616 thiss!1728))) ((_ sign_extend 32) (currentByte!14071 thiss!1728)) ((_ sign_extend 32) (currentBit!14066 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7550 (buf!7616 thiss!1728))) ((_ sign_extend 32) (currentByte!14071 thiss!1728)) ((_ sign_extend 32) (currentBit!14066 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25257 () Bool)

(assert (= bs!25257 d!98982))

(assert (=> bs!25257 m!428393))

(assert (=> b!292736 d!98982))

(declare-fun d!98986 () Bool)

(assert (=> d!98986 (= (array_inv!7162 (buf!7616 thiss!1728)) (bvsge (size!7550 (buf!7616 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!292738 d!98986))

(declare-fun d!98988 () Bool)

(assert (=> d!98988 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7550 (buf!7616 thiss!1728))) ((_ sign_extend 32) (currentByte!14071 thiss!1728)) ((_ sign_extend 32) (currentBit!14066 thiss!1728)) (bvsub to!474 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7550 (buf!7616 thiss!1728))) ((_ sign_extend 32) (currentByte!14071 thiss!1728)) ((_ sign_extend 32) (currentBit!14066 thiss!1728))) (bvsub to!474 from!505)))))

(declare-fun bs!25258 () Bool)

(assert (= bs!25258 d!98988))

(assert (=> bs!25258 m!428393))

(assert (=> b!292737 d!98988))

(check-sat (not bm!4937) (not d!98988) (not b!292805) (not b!292807) (not b!292761) (not b!292786) (not b!292783) (not d!98982) (not d!98956) (not d!98972) (not d!98958) (not b!292804) (not bm!4934) (not b!292784) (not d!98976))
(check-sat)
