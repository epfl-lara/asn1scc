; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15584 () Bool)

(assert start!15584)

(declare-fun b!78915 () Bool)

(declare-fun e!51780 () Bool)

(declare-datatypes ((array!3363 0))(
  ( (array!3364 (arr!2155 (Array (_ BitVec 32) (_ BitVec 8))) (size!1554 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2670 0))(
  ( (BitStream!2671 (buf!1944 array!3363) (currentByte!3806 (_ BitVec 32)) (currentBit!3801 (_ BitVec 32))) )
))
(declare-fun thiss!1107 () BitStream!2670)

(declare-fun array_inv!1400 (array!3363) Bool)

(assert (=> b!78915 (= e!51780 (array_inv!1400 (buf!1944 thiss!1107)))))

(declare-fun b!78916 () Bool)

(declare-fun res!65295 () Bool)

(declare-fun e!51778 () Bool)

(assert (=> b!78916 (=> (not res!65295) (not e!51778))))

(declare-datatypes ((Unit!5193 0))(
  ( (Unit!5194) )
))
(declare-datatypes ((tuple2!7032 0))(
  ( (tuple2!7033 (_1!3653 Unit!5193) (_2!3653 BitStream!2670)) )
))
(declare-fun lt!125819 () tuple2!7032)

(declare-fun isPrefixOf!0 (BitStream!2670 BitStream!2670) Bool)

(assert (=> b!78916 (= res!65295 (isPrefixOf!0 thiss!1107 (_2!3653 lt!125819)))))

(declare-fun b!78917 () Bool)

(declare-fun e!51777 () Bool)

(assert (=> b!78917 (= e!51778 e!51777)))

(declare-fun res!65296 () Bool)

(assert (=> b!78917 (=> (not res!65296) (not e!51777))))

(declare-fun lt!125816 () Bool)

(declare-datatypes ((tuple2!7034 0))(
  ( (tuple2!7035 (_1!3654 BitStream!2670) (_2!3654 Bool)) )
))
(declare-fun lt!125820 () tuple2!7034)

(assert (=> b!78917 (= res!65296 (and (= (_2!3654 lt!125820) lt!125816) (= (_1!3654 lt!125820) (_2!3653 lt!125819))))))

(declare-fun readBitPure!0 (BitStream!2670) tuple2!7034)

(declare-fun readerFrom!0 (BitStream!2670 (_ BitVec 32) (_ BitVec 32)) BitStream!2670)

(assert (=> b!78917 (= lt!125820 (readBitPure!0 (readerFrom!0 (_2!3653 lt!125819) (currentBit!3801 thiss!1107) (currentByte!3806 thiss!1107))))))

(declare-fun b!78918 () Bool)

(declare-fun res!65299 () Bool)

(declare-fun e!51776 () Bool)

(assert (=> b!78918 (=> res!65299 e!51776)))

(assert (=> b!78918 (= res!65299 (not (isPrefixOf!0 thiss!1107 (_2!3653 lt!125819))))))

(declare-fun b!78919 () Bool)

(declare-fun e!51774 () Bool)

(assert (=> b!78919 (= e!51774 e!51778)))

(declare-fun res!65291 () Bool)

(assert (=> b!78919 (=> (not res!65291) (not e!51778))))

(declare-fun lt!125815 () (_ BitVec 64))

(declare-fun lt!125818 () (_ BitVec 64))

(assert (=> b!78919 (= res!65291 (= lt!125815 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!125818)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!78919 (= lt!125815 (bitIndex!0 (size!1554 (buf!1944 (_2!3653 lt!125819))) (currentByte!3806 (_2!3653 lt!125819)) (currentBit!3801 (_2!3653 lt!125819))))))

(assert (=> b!78919 (= lt!125818 (bitIndex!0 (size!1554 (buf!1944 thiss!1107)) (currentByte!3806 thiss!1107) (currentBit!3801 thiss!1107)))))

(declare-fun b!78920 () Bool)

(declare-fun res!65294 () Bool)

(declare-fun e!51775 () Bool)

(assert (=> b!78920 (=> (not res!65294) (not e!51775))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78920 (= res!65294 (validate_offset_bit!0 ((_ sign_extend 32) (size!1554 (buf!1944 thiss!1107))) ((_ sign_extend 32) (currentByte!3806 thiss!1107)) ((_ sign_extend 32) (currentBit!3801 thiss!1107))))))

(declare-fun b!78921 () Bool)

(assert (=> b!78921 (= e!51777 (= (bitIndex!0 (size!1554 (buf!1944 (_1!3654 lt!125820))) (currentByte!3806 (_1!3654 lt!125820)) (currentBit!3801 (_1!3654 lt!125820))) lt!125815))))

(declare-fun b!78922 () Bool)

(assert (=> b!78922 (= e!51775 (not e!51776))))

(declare-fun res!65292 () Bool)

(assert (=> b!78922 (=> res!65292 e!51776)))

(assert (=> b!78922 (= res!65292 (not (= (size!1554 (buf!1944 (_2!3653 lt!125819))) (size!1554 (buf!1944 thiss!1107)))))))

(assert (=> b!78922 e!51774))

(declare-fun res!65293 () Bool)

(assert (=> b!78922 (=> (not res!65293) (not e!51774))))

(assert (=> b!78922 (= res!65293 (= (size!1554 (buf!1944 thiss!1107)) (size!1554 (buf!1944 (_2!3653 lt!125819)))))))

(declare-fun appendBit!0 (BitStream!2670 Bool) tuple2!7032)

(assert (=> b!78922 (= lt!125819 (appendBit!0 thiss!1107 lt!125816))))

(declare-fun b!215 () (_ BitVec 8))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> b!78922 (= lt!125816 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(declare-fun b!78924 () Bool)

(assert (=> b!78924 (= e!51776 true)))

(declare-fun lt!125817 () tuple2!7034)

(assert (=> b!78924 (= lt!125817 (readBitPure!0 (readerFrom!0 (_2!3653 lt!125819) (currentBit!3801 thiss!1107) (currentByte!3806 thiss!1107))))))

(declare-fun res!65297 () Bool)

(assert (=> start!15584 (=> (not res!65297) (not e!51775))))

(assert (=> start!15584 (= res!65297 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15584 e!51775))

(assert (=> start!15584 true))

(declare-fun inv!12 (BitStream!2670) Bool)

(assert (=> start!15584 (and (inv!12 thiss!1107) e!51780)))

(declare-fun b!78923 () Bool)

(declare-fun res!65298 () Bool)

(assert (=> b!78923 (=> res!65298 e!51776)))

(assert (=> b!78923 (= res!65298 (not (= (bitIndex!0 (size!1554 (buf!1944 (_2!3653 lt!125819))) (currentByte!3806 (_2!3653 lt!125819)) (currentBit!3801 (_2!3653 lt!125819))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1554 (buf!1944 thiss!1107)) (currentByte!3806 thiss!1107) (currentBit!3801 thiss!1107))))))))

(assert (= (and start!15584 res!65297) b!78920))

(assert (= (and b!78920 res!65294) b!78922))

(assert (= (and b!78922 res!65293) b!78919))

(assert (= (and b!78919 res!65291) b!78916))

(assert (= (and b!78916 res!65295) b!78917))

(assert (= (and b!78917 res!65296) b!78921))

(assert (= (and b!78922 (not res!65292)) b!78923))

(assert (= (and b!78923 (not res!65298)) b!78918))

(assert (= (and b!78918 (not res!65299)) b!78924))

(assert (= start!15584 b!78915))

(declare-fun m!124369 () Bool)

(assert (=> b!78923 m!124369))

(declare-fun m!124371 () Bool)

(assert (=> b!78923 m!124371))

(declare-fun m!124373 () Bool)

(assert (=> b!78920 m!124373))

(declare-fun m!124375 () Bool)

(assert (=> b!78917 m!124375))

(assert (=> b!78917 m!124375))

(declare-fun m!124377 () Bool)

(assert (=> b!78917 m!124377))

(declare-fun m!124379 () Bool)

(assert (=> b!78916 m!124379))

(assert (=> b!78918 m!124379))

(assert (=> b!78924 m!124375))

(assert (=> b!78924 m!124375))

(assert (=> b!78924 m!124377))

(assert (=> b!78919 m!124369))

(assert (=> b!78919 m!124371))

(declare-fun m!124381 () Bool)

(assert (=> b!78915 m!124381))

(declare-fun m!124383 () Bool)

(assert (=> b!78921 m!124383))

(declare-fun m!124385 () Bool)

(assert (=> b!78922 m!124385))

(declare-fun m!124387 () Bool)

(assert (=> b!78922 m!124387))

(declare-fun m!124389 () Bool)

(assert (=> start!15584 m!124389))

(check-sat (not b!78915) (not b!78922) (not b!78924) (not b!78923) (not b!78916) (not b!78920) (not start!15584) (not b!78919) (not b!78921) (not b!78918) (not b!78917))
