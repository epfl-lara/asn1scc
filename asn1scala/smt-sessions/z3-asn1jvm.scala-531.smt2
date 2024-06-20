; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15530 () Bool)

(assert start!15530)

(declare-fun b!78720 () Bool)

(declare-fun res!65113 () Bool)

(declare-fun e!51651 () Bool)

(assert (=> b!78720 (=> (not res!65113) (not e!51651))))

(declare-datatypes ((array!3354 0))(
  ( (array!3355 (arr!2152 (Array (_ BitVec 32) (_ BitVec 8))) (size!1551 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2664 0))(
  ( (BitStream!2665 (buf!1941 array!3354) (currentByte!3797 (_ BitVec 32)) (currentBit!3792 (_ BitVec 32))) )
))
(declare-fun thiss!1107 () BitStream!2664)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78720 (= res!65113 (validate_offset_bit!0 ((_ sign_extend 32) (size!1551 (buf!1941 thiss!1107))) ((_ sign_extend 32) (currentByte!3797 thiss!1107)) ((_ sign_extend 32) (currentBit!3792 thiss!1107))))))

(declare-fun b!78722 () Bool)

(declare-fun e!51656 () Bool)

(declare-fun e!51655 () Bool)

(assert (=> b!78722 (= e!51656 e!51655)))

(declare-fun res!65105 () Bool)

(assert (=> b!78722 (=> (not res!65105) (not e!51655))))

(declare-datatypes ((tuple2!7014 0))(
  ( (tuple2!7015 (_1!3644 BitStream!2664) (_2!3644 Bool)) )
))
(declare-fun lt!125627 () tuple2!7014)

(declare-fun lt!125629 () Bool)

(declare-datatypes ((Unit!5187 0))(
  ( (Unit!5188) )
))
(declare-datatypes ((tuple2!7016 0))(
  ( (tuple2!7017 (_1!3645 Unit!5187) (_2!3645 BitStream!2664)) )
))
(declare-fun lt!125631 () tuple2!7016)

(assert (=> b!78722 (= res!65105 (and (= (_2!3644 lt!125627) lt!125629) (= (_1!3644 lt!125627) (_2!3645 lt!125631))))))

(declare-fun readBitPure!0 (BitStream!2664) tuple2!7014)

(declare-fun readerFrom!0 (BitStream!2664 (_ BitVec 32) (_ BitVec 32)) BitStream!2664)

(assert (=> b!78722 (= lt!125627 (readBitPure!0 (readerFrom!0 (_2!3645 lt!125631) (currentBit!3792 thiss!1107) (currentByte!3797 thiss!1107))))))

(declare-fun b!78723 () Bool)

(declare-fun res!65106 () Bool)

(declare-fun e!51657 () Bool)

(assert (=> b!78723 (=> res!65106 e!51657)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!78723 (= res!65106 (not (= (bitIndex!0 (size!1551 (buf!1941 (_2!3645 lt!125631))) (currentByte!3797 (_2!3645 lt!125631)) (currentBit!3792 (_2!3645 lt!125631))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1551 (buf!1941 thiss!1107)) (currentByte!3797 thiss!1107) (currentBit!3792 thiss!1107))))))))

(declare-fun b!78724 () Bool)

(declare-fun res!65108 () Bool)

(assert (=> b!78724 (=> (not res!65108) (not e!51656))))

(declare-fun isPrefixOf!0 (BitStream!2664 BitStream!2664) Bool)

(assert (=> b!78724 (= res!65108 (isPrefixOf!0 thiss!1107 (_2!3645 lt!125631)))))

(declare-fun b!78725 () Bool)

(declare-fun lt!125630 () BitStream!2664)

(assert (=> b!78725 (= e!51657 (validate_offset_bit!0 ((_ sign_extend 32) (size!1551 (buf!1941 lt!125630))) ((_ sign_extend 32) (currentByte!3797 lt!125630)) ((_ sign_extend 32) (currentBit!3792 lt!125630))))))

(assert (=> b!78725 (= lt!125630 (readerFrom!0 (_2!3645 lt!125631) (currentBit!3792 thiss!1107) (currentByte!3797 thiss!1107)))))

(declare-fun b!78726 () Bool)

(declare-fun res!65109 () Bool)

(assert (=> b!78726 (=> res!65109 e!51657)))

(assert (=> b!78726 (= res!65109 (not (isPrefixOf!0 thiss!1107 (_2!3645 lt!125631))))))

(declare-fun b!78727 () Bool)

(assert (=> b!78727 (= e!51651 (not e!51657))))

(declare-fun res!65107 () Bool)

(assert (=> b!78727 (=> res!65107 e!51657)))

(assert (=> b!78727 (= res!65107 (not (= (size!1551 (buf!1941 (_2!3645 lt!125631))) (size!1551 (buf!1941 thiss!1107)))))))

(declare-fun e!51654 () Bool)

(assert (=> b!78727 e!51654))

(declare-fun res!65111 () Bool)

(assert (=> b!78727 (=> (not res!65111) (not e!51654))))

(assert (=> b!78727 (= res!65111 (= (size!1551 (buf!1941 thiss!1107)) (size!1551 (buf!1941 (_2!3645 lt!125631)))))))

(declare-fun appendBit!0 (BitStream!2664 Bool) tuple2!7016)

(assert (=> b!78727 (= lt!125631 (appendBit!0 thiss!1107 lt!125629))))

(declare-fun b!215 () (_ BitVec 8))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> b!78727 (= lt!125629 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(declare-fun b!78721 () Bool)

(assert (=> b!78721 (= e!51654 e!51656)))

(declare-fun res!65110 () Bool)

(assert (=> b!78721 (=> (not res!65110) (not e!51656))))

(declare-fun lt!125628 () (_ BitVec 64))

(declare-fun lt!125626 () (_ BitVec 64))

(assert (=> b!78721 (= res!65110 (= lt!125628 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!125626)))))

(assert (=> b!78721 (= lt!125628 (bitIndex!0 (size!1551 (buf!1941 (_2!3645 lt!125631))) (currentByte!3797 (_2!3645 lt!125631)) (currentBit!3792 (_2!3645 lt!125631))))))

(assert (=> b!78721 (= lt!125626 (bitIndex!0 (size!1551 (buf!1941 thiss!1107)) (currentByte!3797 thiss!1107) (currentBit!3792 thiss!1107)))))

(declare-fun res!65112 () Bool)

(assert (=> start!15530 (=> (not res!65112) (not e!51651))))

(assert (=> start!15530 (= res!65112 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15530 e!51651))

(assert (=> start!15530 true))

(declare-fun e!51653 () Bool)

(declare-fun inv!12 (BitStream!2664) Bool)

(assert (=> start!15530 (and (inv!12 thiss!1107) e!51653)))

(declare-fun b!78728 () Bool)

(declare-fun array_inv!1397 (array!3354) Bool)

(assert (=> b!78728 (= e!51653 (array_inv!1397 (buf!1941 thiss!1107)))))

(declare-fun b!78729 () Bool)

(assert (=> b!78729 (= e!51655 (= (bitIndex!0 (size!1551 (buf!1941 (_1!3644 lt!125627))) (currentByte!3797 (_1!3644 lt!125627)) (currentBit!3792 (_1!3644 lt!125627))) lt!125628))))

(assert (= (and start!15530 res!65112) b!78720))

(assert (= (and b!78720 res!65113) b!78727))

(assert (= (and b!78727 res!65111) b!78721))

(assert (= (and b!78721 res!65110) b!78724))

(assert (= (and b!78724 res!65108) b!78722))

(assert (= (and b!78722 res!65105) b!78729))

(assert (= (and b!78727 (not res!65107)) b!78723))

(assert (= (and b!78723 (not res!65106)) b!78726))

(assert (= (and b!78726 (not res!65109)) b!78725))

(assert (= start!15530 b!78728))

(declare-fun m!124203 () Bool)

(assert (=> b!78725 m!124203))

(declare-fun m!124205 () Bool)

(assert (=> b!78725 m!124205))

(declare-fun m!124207 () Bool)

(assert (=> b!78728 m!124207))

(declare-fun m!124209 () Bool)

(assert (=> b!78726 m!124209))

(declare-fun m!124211 () Bool)

(assert (=> b!78723 m!124211))

(declare-fun m!124213 () Bool)

(assert (=> b!78723 m!124213))

(declare-fun m!124215 () Bool)

(assert (=> start!15530 m!124215))

(assert (=> b!78724 m!124209))

(declare-fun m!124217 () Bool)

(assert (=> b!78720 m!124217))

(assert (=> b!78721 m!124211))

(assert (=> b!78721 m!124213))

(declare-fun m!124219 () Bool)

(assert (=> b!78729 m!124219))

(declare-fun m!124221 () Bool)

(assert (=> b!78727 m!124221))

(declare-fun m!124223 () Bool)

(assert (=> b!78727 m!124223))

(assert (=> b!78722 m!124205))

(assert (=> b!78722 m!124205))

(declare-fun m!124225 () Bool)

(assert (=> b!78722 m!124225))

(check-sat (not b!78722) (not b!78728) (not b!78725) (not b!78721) (not b!78729) (not b!78724) (not start!15530) (not b!78727) (not b!78723) (not b!78720) (not b!78726))
(check-sat)
(get-model)

(declare-fun d!24858 () Bool)

(declare-fun res!65147 () Bool)

(declare-fun e!51683 () Bool)

(assert (=> d!24858 (=> (not res!65147) (not e!51683))))

(assert (=> d!24858 (= res!65147 (= (size!1551 (buf!1941 thiss!1107)) (size!1551 (buf!1941 (_2!3645 lt!125631)))))))

(assert (=> d!24858 (= (isPrefixOf!0 thiss!1107 (_2!3645 lt!125631)) e!51683)))

(declare-fun b!78766 () Bool)

(declare-fun res!65149 () Bool)

(assert (=> b!78766 (=> (not res!65149) (not e!51683))))

(assert (=> b!78766 (= res!65149 (bvsle (bitIndex!0 (size!1551 (buf!1941 thiss!1107)) (currentByte!3797 thiss!1107) (currentBit!3792 thiss!1107)) (bitIndex!0 (size!1551 (buf!1941 (_2!3645 lt!125631))) (currentByte!3797 (_2!3645 lt!125631)) (currentBit!3792 (_2!3645 lt!125631)))))))

(declare-fun b!78767 () Bool)

(declare-fun e!51684 () Bool)

(assert (=> b!78767 (= e!51683 e!51684)))

(declare-fun res!65148 () Bool)

(assert (=> b!78767 (=> res!65148 e!51684)))

(assert (=> b!78767 (= res!65148 (= (size!1551 (buf!1941 thiss!1107)) #b00000000000000000000000000000000))))

(declare-fun b!78768 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3354 array!3354 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78768 (= e!51684 (arrayBitRangesEq!0 (buf!1941 thiss!1107) (buf!1941 (_2!3645 lt!125631)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1551 (buf!1941 thiss!1107)) (currentByte!3797 thiss!1107) (currentBit!3792 thiss!1107))))))

(assert (= (and d!24858 res!65147) b!78766))

(assert (= (and b!78766 res!65149) b!78767))

(assert (= (and b!78767 (not res!65148)) b!78768))

(assert (=> b!78766 m!124213))

(assert (=> b!78766 m!124211))

(assert (=> b!78768 m!124213))

(assert (=> b!78768 m!124213))

(declare-fun m!124251 () Bool)

(assert (=> b!78768 m!124251))

(assert (=> b!78726 d!24858))

(declare-fun d!24860 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24860 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!1551 (buf!1941 lt!125630))) ((_ sign_extend 32) (currentByte!3797 lt!125630)) ((_ sign_extend 32) (currentBit!3792 lt!125630))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1551 (buf!1941 lt!125630))) ((_ sign_extend 32) (currentByte!3797 lt!125630)) ((_ sign_extend 32) (currentBit!3792 lt!125630))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!6024 () Bool)

(assert (= bs!6024 d!24860))

(declare-fun m!124253 () Bool)

(assert (=> bs!6024 m!124253))

(assert (=> b!78725 d!24860))

(declare-fun d!24862 () Bool)

(declare-fun e!51687 () Bool)

(assert (=> d!24862 e!51687))

(declare-fun res!65153 () Bool)

(assert (=> d!24862 (=> (not res!65153) (not e!51687))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!24862 (= res!65153 (invariant!0 (currentBit!3792 (_2!3645 lt!125631)) (currentByte!3797 (_2!3645 lt!125631)) (size!1551 (buf!1941 (_2!3645 lt!125631)))))))

(assert (=> d!24862 (= (readerFrom!0 (_2!3645 lt!125631) (currentBit!3792 thiss!1107) (currentByte!3797 thiss!1107)) (BitStream!2665 (buf!1941 (_2!3645 lt!125631)) (currentByte!3797 thiss!1107) (currentBit!3792 thiss!1107)))))

(declare-fun b!78771 () Bool)

(assert (=> b!78771 (= e!51687 (invariant!0 (currentBit!3792 thiss!1107) (currentByte!3797 thiss!1107) (size!1551 (buf!1941 (_2!3645 lt!125631)))))))

(assert (= (and d!24862 res!65153) b!78771))

(declare-fun m!124255 () Bool)

(assert (=> d!24862 m!124255))

(declare-fun m!124257 () Bool)

(assert (=> b!78771 m!124257))

(assert (=> b!78725 d!24862))

(declare-fun d!24864 () Bool)

(assert (=> d!24864 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!1551 (buf!1941 thiss!1107))) ((_ sign_extend 32) (currentByte!3797 thiss!1107)) ((_ sign_extend 32) (currentBit!3792 thiss!1107))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1551 (buf!1941 thiss!1107))) ((_ sign_extend 32) (currentByte!3797 thiss!1107)) ((_ sign_extend 32) (currentBit!3792 thiss!1107))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!6025 () Bool)

(assert (= bs!6025 d!24864))

(declare-fun m!124259 () Bool)

(assert (=> bs!6025 m!124259))

(assert (=> b!78720 d!24864))

(declare-fun d!24866 () Bool)

(declare-fun e!51690 () Bool)

(assert (=> d!24866 e!51690))

(declare-fun res!65159 () Bool)

(assert (=> d!24866 (=> (not res!65159) (not e!51690))))

(declare-fun lt!125667 () (_ BitVec 64))

(declare-fun lt!125665 () (_ BitVec 64))

(declare-fun lt!125664 () (_ BitVec 64))

(assert (=> d!24866 (= res!65159 (= lt!125667 (bvsub lt!125664 lt!125665)))))

(assert (=> d!24866 (or (= (bvand lt!125664 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125665 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125664 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125664 lt!125665) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24866 (= lt!125665 (remainingBits!0 ((_ sign_extend 32) (size!1551 (buf!1941 (_1!3644 lt!125627)))) ((_ sign_extend 32) (currentByte!3797 (_1!3644 lt!125627))) ((_ sign_extend 32) (currentBit!3792 (_1!3644 lt!125627)))))))

(declare-fun lt!125666 () (_ BitVec 64))

(declare-fun lt!125663 () (_ BitVec 64))

(assert (=> d!24866 (= lt!125664 (bvmul lt!125666 lt!125663))))

(assert (=> d!24866 (or (= lt!125666 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125663 (bvsdiv (bvmul lt!125666 lt!125663) lt!125666)))))

(assert (=> d!24866 (= lt!125663 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24866 (= lt!125666 ((_ sign_extend 32) (size!1551 (buf!1941 (_1!3644 lt!125627)))))))

(assert (=> d!24866 (= lt!125667 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3797 (_1!3644 lt!125627))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3792 (_1!3644 lt!125627)))))))

(assert (=> d!24866 (invariant!0 (currentBit!3792 (_1!3644 lt!125627)) (currentByte!3797 (_1!3644 lt!125627)) (size!1551 (buf!1941 (_1!3644 lt!125627))))))

(assert (=> d!24866 (= (bitIndex!0 (size!1551 (buf!1941 (_1!3644 lt!125627))) (currentByte!3797 (_1!3644 lt!125627)) (currentBit!3792 (_1!3644 lt!125627))) lt!125667)))

(declare-fun b!78776 () Bool)

(declare-fun res!65158 () Bool)

(assert (=> b!78776 (=> (not res!65158) (not e!51690))))

(assert (=> b!78776 (= res!65158 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125667))))

(declare-fun b!78777 () Bool)

(declare-fun lt!125662 () (_ BitVec 64))

(assert (=> b!78777 (= e!51690 (bvsle lt!125667 (bvmul lt!125662 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78777 (or (= lt!125662 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125662 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125662)))))

(assert (=> b!78777 (= lt!125662 ((_ sign_extend 32) (size!1551 (buf!1941 (_1!3644 lt!125627)))))))

(assert (= (and d!24866 res!65159) b!78776))

(assert (= (and b!78776 res!65158) b!78777))

(declare-fun m!124261 () Bool)

(assert (=> d!24866 m!124261))

(declare-fun m!124263 () Bool)

(assert (=> d!24866 m!124263))

(assert (=> b!78729 d!24866))

(declare-fun d!24868 () Bool)

(assert (=> d!24868 (= (inv!12 thiss!1107) (invariant!0 (currentBit!3792 thiss!1107) (currentByte!3797 thiss!1107) (size!1551 (buf!1941 thiss!1107))))))

(declare-fun bs!6026 () Bool)

(assert (= bs!6026 d!24868))

(declare-fun m!124265 () Bool)

(assert (=> bs!6026 m!124265))

(assert (=> start!15530 d!24868))

(assert (=> b!78724 d!24858))

(declare-fun d!24870 () Bool)

(declare-fun e!51691 () Bool)

(assert (=> d!24870 e!51691))

(declare-fun res!65161 () Bool)

(assert (=> d!24870 (=> (not res!65161) (not e!51691))))

(declare-fun lt!125671 () (_ BitVec 64))

(declare-fun lt!125670 () (_ BitVec 64))

(declare-fun lt!125673 () (_ BitVec 64))

(assert (=> d!24870 (= res!65161 (= lt!125673 (bvsub lt!125670 lt!125671)))))

(assert (=> d!24870 (or (= (bvand lt!125670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125671 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125670 lt!125671) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24870 (= lt!125671 (remainingBits!0 ((_ sign_extend 32) (size!1551 (buf!1941 (_2!3645 lt!125631)))) ((_ sign_extend 32) (currentByte!3797 (_2!3645 lt!125631))) ((_ sign_extend 32) (currentBit!3792 (_2!3645 lt!125631)))))))

(declare-fun lt!125672 () (_ BitVec 64))

(declare-fun lt!125669 () (_ BitVec 64))

(assert (=> d!24870 (= lt!125670 (bvmul lt!125672 lt!125669))))

(assert (=> d!24870 (or (= lt!125672 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125669 (bvsdiv (bvmul lt!125672 lt!125669) lt!125672)))))

(assert (=> d!24870 (= lt!125669 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24870 (= lt!125672 ((_ sign_extend 32) (size!1551 (buf!1941 (_2!3645 lt!125631)))))))

(assert (=> d!24870 (= lt!125673 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3797 (_2!3645 lt!125631))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3792 (_2!3645 lt!125631)))))))

(assert (=> d!24870 (invariant!0 (currentBit!3792 (_2!3645 lt!125631)) (currentByte!3797 (_2!3645 lt!125631)) (size!1551 (buf!1941 (_2!3645 lt!125631))))))

(assert (=> d!24870 (= (bitIndex!0 (size!1551 (buf!1941 (_2!3645 lt!125631))) (currentByte!3797 (_2!3645 lt!125631)) (currentBit!3792 (_2!3645 lt!125631))) lt!125673)))

(declare-fun b!78778 () Bool)

(declare-fun res!65160 () Bool)

(assert (=> b!78778 (=> (not res!65160) (not e!51691))))

(assert (=> b!78778 (= res!65160 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125673))))

(declare-fun b!78779 () Bool)

(declare-fun lt!125668 () (_ BitVec 64))

(assert (=> b!78779 (= e!51691 (bvsle lt!125673 (bvmul lt!125668 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78779 (or (= lt!125668 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125668 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125668)))))

(assert (=> b!78779 (= lt!125668 ((_ sign_extend 32) (size!1551 (buf!1941 (_2!3645 lt!125631)))))))

(assert (= (and d!24870 res!65161) b!78778))

(assert (= (and b!78778 res!65160) b!78779))

(declare-fun m!124267 () Bool)

(assert (=> d!24870 m!124267))

(assert (=> d!24870 m!124255))

(assert (=> b!78723 d!24870))

(declare-fun d!24872 () Bool)

(declare-fun e!51692 () Bool)

(assert (=> d!24872 e!51692))

(declare-fun res!65163 () Bool)

(assert (=> d!24872 (=> (not res!65163) (not e!51692))))

(declare-fun lt!125676 () (_ BitVec 64))

(declare-fun lt!125679 () (_ BitVec 64))

(declare-fun lt!125677 () (_ BitVec 64))

(assert (=> d!24872 (= res!65163 (= lt!125679 (bvsub lt!125676 lt!125677)))))

(assert (=> d!24872 (or (= (bvand lt!125676 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125677 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125676 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125676 lt!125677) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24872 (= lt!125677 (remainingBits!0 ((_ sign_extend 32) (size!1551 (buf!1941 thiss!1107))) ((_ sign_extend 32) (currentByte!3797 thiss!1107)) ((_ sign_extend 32) (currentBit!3792 thiss!1107))))))

(declare-fun lt!125678 () (_ BitVec 64))

(declare-fun lt!125675 () (_ BitVec 64))

(assert (=> d!24872 (= lt!125676 (bvmul lt!125678 lt!125675))))

(assert (=> d!24872 (or (= lt!125678 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125675 (bvsdiv (bvmul lt!125678 lt!125675) lt!125678)))))

(assert (=> d!24872 (= lt!125675 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24872 (= lt!125678 ((_ sign_extend 32) (size!1551 (buf!1941 thiss!1107))))))

(assert (=> d!24872 (= lt!125679 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3797 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3792 thiss!1107))))))

(assert (=> d!24872 (invariant!0 (currentBit!3792 thiss!1107) (currentByte!3797 thiss!1107) (size!1551 (buf!1941 thiss!1107)))))

(assert (=> d!24872 (= (bitIndex!0 (size!1551 (buf!1941 thiss!1107)) (currentByte!3797 thiss!1107) (currentBit!3792 thiss!1107)) lt!125679)))

(declare-fun b!78780 () Bool)

(declare-fun res!65162 () Bool)

(assert (=> b!78780 (=> (not res!65162) (not e!51692))))

(assert (=> b!78780 (= res!65162 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125679))))

(declare-fun b!78781 () Bool)

(declare-fun lt!125674 () (_ BitVec 64))

(assert (=> b!78781 (= e!51692 (bvsle lt!125679 (bvmul lt!125674 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78781 (or (= lt!125674 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125674 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125674)))))

(assert (=> b!78781 (= lt!125674 ((_ sign_extend 32) (size!1551 (buf!1941 thiss!1107))))))

(assert (= (and d!24872 res!65163) b!78780))

(assert (= (and b!78780 res!65162) b!78781))

(assert (=> d!24872 m!124259))

(assert (=> d!24872 m!124265))

(assert (=> b!78723 d!24872))

(declare-fun d!24874 () Bool)

(assert (=> d!24874 (= (array_inv!1397 (buf!1941 thiss!1107)) (bvsge (size!1551 (buf!1941 thiss!1107)) #b00000000000000000000000000000000))))

(assert (=> b!78728 d!24874))

(declare-fun b!78797 () Bool)

(declare-fun e!51701 () Bool)

(declare-fun lt!125691 () tuple2!7014)

(declare-fun lt!125689 () tuple2!7016)

(assert (=> b!78797 (= e!51701 (= (bitIndex!0 (size!1551 (buf!1941 (_1!3644 lt!125691))) (currentByte!3797 (_1!3644 lt!125691)) (currentBit!3792 (_1!3644 lt!125691))) (bitIndex!0 (size!1551 (buf!1941 (_2!3645 lt!125689))) (currentByte!3797 (_2!3645 lt!125689)) (currentBit!3792 (_2!3645 lt!125689)))))))

(declare-fun b!78794 () Bool)

(declare-fun res!65178 () Bool)

(declare-fun e!51700 () Bool)

(assert (=> b!78794 (=> (not res!65178) (not e!51700))))

(declare-fun lt!125690 () (_ BitVec 64))

(declare-fun lt!125688 () (_ BitVec 64))

(assert (=> b!78794 (= res!65178 (= (bitIndex!0 (size!1551 (buf!1941 (_2!3645 lt!125689))) (currentByte!3797 (_2!3645 lt!125689)) (currentBit!3792 (_2!3645 lt!125689))) (bvadd lt!125690 lt!125688)))))

(assert (=> b!78794 (or (not (= (bvand lt!125690 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125688 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!125690 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!125690 lt!125688) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!78794 (= lt!125688 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!78794 (= lt!125690 (bitIndex!0 (size!1551 (buf!1941 thiss!1107)) (currentByte!3797 thiss!1107) (currentBit!3792 thiss!1107)))))

(declare-fun d!24876 () Bool)

(assert (=> d!24876 e!51700))

(declare-fun res!65176 () Bool)

(assert (=> d!24876 (=> (not res!65176) (not e!51700))))

(assert (=> d!24876 (= res!65176 (= (size!1551 (buf!1941 thiss!1107)) (size!1551 (buf!1941 (_2!3645 lt!125689)))))))

(declare-fun choose!16 (BitStream!2664 Bool) tuple2!7016)

(assert (=> d!24876 (= lt!125689 (choose!16 thiss!1107 lt!125629))))

(assert (=> d!24876 (validate_offset_bit!0 ((_ sign_extend 32) (size!1551 (buf!1941 thiss!1107))) ((_ sign_extend 32) (currentByte!3797 thiss!1107)) ((_ sign_extend 32) (currentBit!3792 thiss!1107)))))

(assert (=> d!24876 (= (appendBit!0 thiss!1107 lt!125629) lt!125689)))

(declare-fun b!78795 () Bool)

(declare-fun res!65179 () Bool)

(assert (=> b!78795 (=> (not res!65179) (not e!51700))))

(assert (=> b!78795 (= res!65179 (isPrefixOf!0 thiss!1107 (_2!3645 lt!125689)))))

(declare-fun b!78796 () Bool)

(assert (=> b!78796 (= e!51700 e!51701)))

(declare-fun res!65177 () Bool)

(assert (=> b!78796 (=> (not res!65177) (not e!51701))))

(assert (=> b!78796 (= res!65177 (and (= (_2!3644 lt!125691) lt!125629) (= (_1!3644 lt!125691) (_2!3645 lt!125689))))))

(assert (=> b!78796 (= lt!125691 (readBitPure!0 (readerFrom!0 (_2!3645 lt!125689) (currentBit!3792 thiss!1107) (currentByte!3797 thiss!1107))))))

(assert (= (and d!24876 res!65176) b!78794))

(assert (= (and b!78794 res!65178) b!78795))

(assert (= (and b!78795 res!65179) b!78796))

(assert (= (and b!78796 res!65177) b!78797))

(declare-fun m!124279 () Bool)

(assert (=> d!24876 m!124279))

(assert (=> d!24876 m!124217))

(declare-fun m!124281 () Bool)

(assert (=> b!78797 m!124281))

(declare-fun m!124283 () Bool)

(assert (=> b!78797 m!124283))

(declare-fun m!124285 () Bool)

(assert (=> b!78796 m!124285))

(assert (=> b!78796 m!124285))

(declare-fun m!124287 () Bool)

(assert (=> b!78796 m!124287))

(declare-fun m!124289 () Bool)

(assert (=> b!78795 m!124289))

(assert (=> b!78794 m!124283))

(assert (=> b!78794 m!124213))

(assert (=> b!78727 d!24876))

(declare-fun d!24890 () Bool)

(declare-datatypes ((tuple2!7022 0))(
  ( (tuple2!7023 (_1!3648 Bool) (_2!3648 BitStream!2664)) )
))
(declare-fun lt!125718 () tuple2!7022)

(declare-fun readBit!0 (BitStream!2664) tuple2!7022)

(assert (=> d!24890 (= lt!125718 (readBit!0 (readerFrom!0 (_2!3645 lt!125631) (currentBit!3792 thiss!1107) (currentByte!3797 thiss!1107))))))

(assert (=> d!24890 (= (readBitPure!0 (readerFrom!0 (_2!3645 lt!125631) (currentBit!3792 thiss!1107) (currentByte!3797 thiss!1107))) (tuple2!7015 (_2!3648 lt!125718) (_1!3648 lt!125718)))))

(declare-fun bs!6030 () Bool)

(assert (= bs!6030 d!24890))

(assert (=> bs!6030 m!124205))

(declare-fun m!124299 () Bool)

(assert (=> bs!6030 m!124299))

(assert (=> b!78722 d!24890))

(assert (=> b!78722 d!24862))

(assert (=> b!78721 d!24870))

(assert (=> b!78721 d!24872))

(check-sat (not d!24876) (not b!78794) (not d!24862) (not b!78796) (not d!24864) (not b!78768) (not d!24860) (not b!78795) (not b!78766) (not d!24866) (not d!24890) (not d!24868) (not d!24870) (not d!24872) (not b!78797) (not b!78771))
(check-sat)
