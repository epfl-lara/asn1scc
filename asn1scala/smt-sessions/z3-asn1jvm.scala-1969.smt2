; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50938 () Bool)

(assert start!50938)

(declare-fun b!238773 () Bool)

(declare-fun e!164956 () Bool)

(declare-fun e!164955 () Bool)

(assert (=> b!238773 (= e!164956 e!164955)))

(declare-fun res!199596 () Bool)

(assert (=> b!238773 (=> (not res!199596) (not e!164955))))

(declare-datatypes ((array!12744 0))(
  ( (array!12745 (arr!6587 (Array (_ BitVec 32) (_ BitVec 8))) (size!5600 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10164 0))(
  ( (BitStream!10165 (buf!6075 array!12744) (currentByte!11261 (_ BitVec 32)) (currentBit!11256 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10164)

(declare-fun lt!373431 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238773 (= res!199596 (validate_offset_bits!1 ((_ sign_extend 32) (size!5600 (buf!6075 thiss!1830))) ((_ sign_extend 32) (currentByte!11261 thiss!1830)) ((_ sign_extend 32) (currentBit!11256 thiss!1830)) lt!373431))))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!238773 (= lt!373431 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!238774 () Bool)

(declare-fun e!164959 () Bool)

(declare-fun array_inv!5341 (array!12744) Bool)

(assert (=> b!238774 (= e!164959 (array_inv!5341 (buf!6075 thiss!1830)))))

(declare-fun b!238776 () Bool)

(declare-fun res!199594 () Bool)

(declare-fun e!164954 () Bool)

(assert (=> b!238776 (=> res!199594 e!164954)))

(declare-fun acc!170 () (_ BitVec 64))

(declare-datatypes ((tuple2!20196 0))(
  ( (tuple2!20197 (_1!11002 (_ BitVec 64)) (_2!11002 BitStream!10164)) )
))
(declare-fun lt!373429 () tuple2!20196)

(declare-fun lt!373428 () (_ BitVec 64))

(assert (=> b!238776 (= res!199594 (or (not (= (bvlshr (_1!11002 lt!373429) lt!373431) (bvlshr acc!170 lt!373431))) (not (= (bvand (_1!11002 lt!373429) lt!373428) (_1!11002 lt!373429)))))))

(declare-fun b!238777 () Bool)

(declare-fun e!164958 () Bool)

(assert (=> b!238777 (= e!164958 e!164954)))

(declare-fun res!199595 () Bool)

(assert (=> b!238777 (=> res!199595 e!164954)))

(assert (=> b!238777 (= res!199595 (not (= (buf!6075 (_2!11002 lt!373429)) (buf!6075 thiss!1830))))))

(declare-datatypes ((tuple2!20198 0))(
  ( (tuple2!20199 (_1!11003 Bool) (_2!11003 BitStream!10164)) )
))
(declare-fun lt!373430 () tuple2!20198)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10164 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20196)

(assert (=> b!238777 (= lt!373429 (readNLeastSignificantBitsLoop!0 (_2!11003 lt!373430) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!11003 lt!373430) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!10164) tuple2!20198)

(assert (=> b!238777 (= lt!373430 (readBit!0 thiss!1830))))

(declare-fun b!238778 () Bool)

(declare-fun e!164960 () Bool)

(declare-datatypes ((tuple2!20200 0))(
  ( (tuple2!20201 (_1!11004 BitStream!10164) (_2!11004 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!10164) tuple2!20200)

(assert (=> b!238778 (= e!164960 (not (= (= (bvand (bvlshr (_1!11002 lt!373429) ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!11004 (readBitPure!0 thiss!1830)))))))

(declare-fun b!238779 () Bool)

(assert (=> b!238779 (= e!164955 e!164958)))

(declare-fun res!199598 () Bool)

(assert (=> b!238779 (=> (not res!199598) (not e!164958))))

(assert (=> b!238779 (= res!199598 (and (= (bvand acc!170 lt!373428) acc!170) (not (= nBits!581 i!752))))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238779 (= lt!373428 (onesLSBLong!0 nBits!581))))

(declare-fun b!238780 () Bool)

(declare-fun res!199593 () Bool)

(assert (=> b!238780 (=> (not res!199593) (not e!164955))))

(assert (=> b!238780 (= res!199593 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238781 () Bool)

(declare-fun res!199597 () Bool)

(assert (=> b!238781 (=> res!199597 e!164954)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238781 (= res!199597 (not (= (bitIndex!0 (size!5600 (buf!6075 (_2!11002 lt!373429))) (currentByte!11261 (_2!11002 lt!373429)) (currentBit!11256 (_2!11002 lt!373429))) (bvadd (bitIndex!0 (size!5600 (buf!6075 thiss!1830)) (currentByte!11261 thiss!1830) (currentBit!11256 thiss!1830)) lt!373431))))))

(declare-fun b!238775 () Bool)

(assert (=> b!238775 (= e!164954 e!164960)))

(declare-fun res!199592 () Bool)

(assert (=> b!238775 (=> (not res!199592) (not e!164960))))

(assert (=> b!238775 (= res!199592 (bvslt i!752 nBits!581))))

(declare-fun res!199599 () Bool)

(assert (=> start!50938 (=> (not res!199599) (not e!164956))))

(assert (=> start!50938 (= res!199599 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50938 e!164956))

(assert (=> start!50938 true))

(declare-fun inv!12 (BitStream!10164) Bool)

(assert (=> start!50938 (and (inv!12 thiss!1830) e!164959)))

(assert (= (and start!50938 res!199599) b!238773))

(assert (= (and b!238773 res!199596) b!238780))

(assert (= (and b!238780 res!199593) b!238779))

(assert (= (and b!238779 res!199598) b!238777))

(assert (= (and b!238777 (not res!199595)) b!238781))

(assert (= (and b!238781 (not res!199597)) b!238776))

(assert (= (and b!238776 (not res!199594)) b!238775))

(assert (= (and b!238775 res!199592) b!238778))

(assert (= start!50938 b!238774))

(declare-fun m!360845 () Bool)

(assert (=> b!238774 m!360845))

(declare-fun m!360847 () Bool)

(assert (=> b!238781 m!360847))

(declare-fun m!360849 () Bool)

(assert (=> b!238781 m!360849))

(declare-fun m!360851 () Bool)

(assert (=> start!50938 m!360851))

(declare-fun m!360853 () Bool)

(assert (=> b!238773 m!360853))

(declare-fun m!360855 () Bool)

(assert (=> b!238778 m!360855))

(declare-fun m!360857 () Bool)

(assert (=> b!238777 m!360857))

(declare-fun m!360859 () Bool)

(assert (=> b!238777 m!360859))

(declare-fun m!360861 () Bool)

(assert (=> b!238779 m!360861))

(declare-fun m!360863 () Bool)

(assert (=> b!238780 m!360863))

(check-sat (not b!238774) (not b!238777) (not b!238773) (not b!238781) (not b!238780) (not b!238779) (not b!238778) (not start!50938))
(check-sat)
(get-model)

(declare-fun d!80244 () Bool)

(declare-fun e!164984 () Bool)

(assert (=> d!80244 e!164984))

(declare-fun res!199629 () Bool)

(assert (=> d!80244 (=> (not res!199629) (not e!164984))))

(declare-fun lt!373459 () (_ BitVec 64))

(declare-fun lt!373458 () (_ BitVec 64))

(declare-fun lt!373457 () (_ BitVec 64))

(assert (=> d!80244 (= res!199629 (= lt!373458 (bvsub lt!373459 lt!373457)))))

(assert (=> d!80244 (or (= (bvand lt!373459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!373457 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!373459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!373459 lt!373457) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80244 (= lt!373457 (remainingBits!0 ((_ sign_extend 32) (size!5600 (buf!6075 (_2!11002 lt!373429)))) ((_ sign_extend 32) (currentByte!11261 (_2!11002 lt!373429))) ((_ sign_extend 32) (currentBit!11256 (_2!11002 lt!373429)))))))

(declare-fun lt!373456 () (_ BitVec 64))

(declare-fun lt!373461 () (_ BitVec 64))

(assert (=> d!80244 (= lt!373459 (bvmul lt!373456 lt!373461))))

(assert (=> d!80244 (or (= lt!373456 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!373461 (bvsdiv (bvmul lt!373456 lt!373461) lt!373456)))))

(assert (=> d!80244 (= lt!373461 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!80244 (= lt!373456 ((_ sign_extend 32) (size!5600 (buf!6075 (_2!11002 lt!373429)))))))

(assert (=> d!80244 (= lt!373458 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11261 (_2!11002 lt!373429))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11256 (_2!11002 lt!373429)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80244 (invariant!0 (currentBit!11256 (_2!11002 lt!373429)) (currentByte!11261 (_2!11002 lt!373429)) (size!5600 (buf!6075 (_2!11002 lt!373429))))))

(assert (=> d!80244 (= (bitIndex!0 (size!5600 (buf!6075 (_2!11002 lt!373429))) (currentByte!11261 (_2!11002 lt!373429)) (currentBit!11256 (_2!11002 lt!373429))) lt!373458)))

(declare-fun b!238813 () Bool)

(declare-fun res!199628 () Bool)

(assert (=> b!238813 (=> (not res!199628) (not e!164984))))

(assert (=> b!238813 (= res!199628 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!373458))))

(declare-fun b!238814 () Bool)

(declare-fun lt!373460 () (_ BitVec 64))

(assert (=> b!238814 (= e!164984 (bvsle lt!373458 (bvmul lt!373460 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!238814 (or (= lt!373460 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!373460 #b0000000000000000000000000000000000000000000000000000000000001000) lt!373460)))))

(assert (=> b!238814 (= lt!373460 ((_ sign_extend 32) (size!5600 (buf!6075 (_2!11002 lt!373429)))))))

(assert (= (and d!80244 res!199629) b!238813))

(assert (= (and b!238813 res!199628) b!238814))

(declare-fun m!360885 () Bool)

(assert (=> d!80244 m!360885))

(declare-fun m!360887 () Bool)

(assert (=> d!80244 m!360887))

(assert (=> b!238781 d!80244))

(declare-fun d!80246 () Bool)

(declare-fun e!164985 () Bool)

(assert (=> d!80246 e!164985))

(declare-fun res!199631 () Bool)

(assert (=> d!80246 (=> (not res!199631) (not e!164985))))

(declare-fun lt!373463 () (_ BitVec 64))

(declare-fun lt!373464 () (_ BitVec 64))

(declare-fun lt!373465 () (_ BitVec 64))

(assert (=> d!80246 (= res!199631 (= lt!373464 (bvsub lt!373465 lt!373463)))))

(assert (=> d!80246 (or (= (bvand lt!373465 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!373463 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!373465 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!373465 lt!373463) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!80246 (= lt!373463 (remainingBits!0 ((_ sign_extend 32) (size!5600 (buf!6075 thiss!1830))) ((_ sign_extend 32) (currentByte!11261 thiss!1830)) ((_ sign_extend 32) (currentBit!11256 thiss!1830))))))

(declare-fun lt!373462 () (_ BitVec 64))

(declare-fun lt!373467 () (_ BitVec 64))

(assert (=> d!80246 (= lt!373465 (bvmul lt!373462 lt!373467))))

(assert (=> d!80246 (or (= lt!373462 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!373467 (bvsdiv (bvmul lt!373462 lt!373467) lt!373462)))))

(assert (=> d!80246 (= lt!373467 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!80246 (= lt!373462 ((_ sign_extend 32) (size!5600 (buf!6075 thiss!1830))))))

(assert (=> d!80246 (= lt!373464 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11261 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11256 thiss!1830))))))

(assert (=> d!80246 (invariant!0 (currentBit!11256 thiss!1830) (currentByte!11261 thiss!1830) (size!5600 (buf!6075 thiss!1830)))))

(assert (=> d!80246 (= (bitIndex!0 (size!5600 (buf!6075 thiss!1830)) (currentByte!11261 thiss!1830) (currentBit!11256 thiss!1830)) lt!373464)))

(declare-fun b!238815 () Bool)

(declare-fun res!199630 () Bool)

(assert (=> b!238815 (=> (not res!199630) (not e!164985))))

(assert (=> b!238815 (= res!199630 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!373464))))

(declare-fun b!238816 () Bool)

(declare-fun lt!373466 () (_ BitVec 64))

(assert (=> b!238816 (= e!164985 (bvsle lt!373464 (bvmul lt!373466 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!238816 (or (= lt!373466 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!373466 #b0000000000000000000000000000000000000000000000000000000000001000) lt!373466)))))

(assert (=> b!238816 (= lt!373466 ((_ sign_extend 32) (size!5600 (buf!6075 thiss!1830))))))

(assert (= (and d!80246 res!199631) b!238815))

(assert (= (and b!238815 res!199630) b!238816))

(declare-fun m!360889 () Bool)

(assert (=> d!80246 m!360889))

(declare-fun m!360891 () Bool)

(assert (=> d!80246 m!360891))

(assert (=> b!238781 d!80246))

(declare-fun d!80248 () Bool)

(assert (=> d!80248 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!238780 d!80248))

(declare-fun d!80250 () Bool)

(assert (=> d!80250 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5600 (buf!6075 thiss!1830))) ((_ sign_extend 32) (currentByte!11261 thiss!1830)) ((_ sign_extend 32) (currentBit!11256 thiss!1830)) lt!373431) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5600 (buf!6075 thiss!1830))) ((_ sign_extend 32) (currentByte!11261 thiss!1830)) ((_ sign_extend 32) (currentBit!11256 thiss!1830))) lt!373431))))

(declare-fun bs!20078 () Bool)

(assert (= bs!20078 d!80250))

(assert (=> bs!20078 m!360889))

(assert (=> b!238773 d!80250))

(declare-fun d!80252 () Bool)

(assert (=> d!80252 (= (array_inv!5341 (buf!6075 thiss!1830)) (bvsge (size!5600 (buf!6075 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!238774 d!80252))

(declare-fun d!80254 () Bool)

(assert (=> d!80254 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!238779 d!80254))

(declare-fun d!80256 () Bool)

(assert (=> d!80256 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11256 thiss!1830) (currentByte!11261 thiss!1830) (size!5600 (buf!6075 thiss!1830))))))

(declare-fun bs!20079 () Bool)

(assert (= bs!20079 d!80256))

(assert (=> bs!20079 m!360891))

(assert (=> start!50938 d!80256))

(declare-fun b!238839 () Bool)

(declare-fun res!199653 () Bool)

(declare-fun e!164996 () Bool)

(assert (=> b!238839 (=> (not res!199653) (not e!164996))))

(declare-fun lt!373516 () tuple2!20196)

(assert (=> b!238839 (= res!199653 (= (bvand (_1!11002 lt!373516) (onesLSBLong!0 nBits!581)) (_1!11002 lt!373516)))))

(declare-fun b!238840 () Bool)

(declare-fun e!164997 () Bool)

(assert (=> b!238840 (= e!164996 e!164997)))

(declare-fun res!199654 () Bool)

(assert (=> b!238840 (=> res!199654 e!164997)))

(assert (=> b!238840 (= res!199654 (bvsge (bvadd #b00000000000000000000000000000001 i!752) nBits!581))))

(declare-fun b!238841 () Bool)

(declare-fun res!199651 () Bool)

(assert (=> b!238841 (=> (not res!199651) (not e!164996))))

(declare-fun lt!373515 () (_ BitVec 64))

(declare-fun lt!373519 () (_ BitVec 64))

(assert (=> b!238841 (= res!199651 (= (bvlshr (_1!11002 lt!373516) lt!373519) (bvlshr (bvor acc!170 (ite (_1!11003 lt!373430) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!373515)))))

(assert (=> b!238841 (and (bvsge lt!373515 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!373515 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!238841 (= lt!373515 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!238841 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!238841 (and (bvsge lt!373519 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!373519 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!238841 (= lt!373519 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!238841 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(declare-fun b!238842 () Bool)

(declare-fun res!199650 () Bool)

(assert (=> b!238842 (=> (not res!199650) (not e!164996))))

(declare-fun lt!373513 () (_ BitVec 64))

(declare-fun lt!373514 () (_ BitVec 64))

(assert (=> b!238842 (= res!199650 (= (bitIndex!0 (size!5600 (buf!6075 (_2!11002 lt!373516))) (currentByte!11261 (_2!11002 lt!373516)) (currentBit!11256 (_2!11002 lt!373516))) (bvadd lt!373514 lt!373513)))))

(assert (=> b!238842 (or (not (= (bvand lt!373514 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!373513 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!373514 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!373514 lt!373513) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!238842 (= lt!373513 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!238842 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!238842 (= lt!373514 (bitIndex!0 (size!5600 (buf!6075 (_2!11003 lt!373430))) (currentByte!11261 (_2!11003 lt!373430)) (currentBit!11256 (_2!11003 lt!373430))))))

(declare-fun lt!373518 () (_ BitVec 64))

(declare-fun b!238843 () Bool)

(assert (=> b!238843 (= e!164997 (= (= (bvand (bvlshr (_1!11002 lt!373516) lt!373518) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!11004 (readBitPure!0 (_2!11003 lt!373430)))))))

(assert (=> b!238843 (and (bvsge lt!373518 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!373518 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!373520 () (_ BitVec 32))

(assert (=> b!238843 (= lt!373518 ((_ sign_extend 32) (bvsub lt!373520 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!238843 (or (= (bvand lt!373520 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand lt!373520 #b10000000000000000000000000000000) (bvand (bvsub lt!373520 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!238843 (= lt!373520 (bvsub nBits!581 #b00000000000000000000000000000001))))

(assert (=> b!238843 (or (= (bvand nBits!581 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun e!164998 () tuple2!20196)

(declare-fun b!238844 () Bool)

(assert (=> b!238844 (= e!164998 (tuple2!20197 (bvor acc!170 (ite (_1!11003 lt!373430) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!11003 lt!373430)))))

(declare-fun d!80258 () Bool)

(assert (=> d!80258 e!164996))

(declare-fun res!199652 () Bool)

(assert (=> d!80258 (=> (not res!199652) (not e!164996))))

(assert (=> d!80258 (= res!199652 (= (buf!6075 (_2!11002 lt!373516)) (buf!6075 (_2!11003 lt!373430))))))

(assert (=> d!80258 (= lt!373516 e!164998)))

(declare-fun c!11362 () Bool)

(assert (=> d!80258 (= c!11362 (= nBits!581 (bvadd #b00000000000000000000000000000001 i!752)))))

(assert (=> d!80258 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!752)) (bvsle (bvadd #b00000000000000000000000000000001 i!752) nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000))))

(assert (=> d!80258 (= (readNLeastSignificantBitsLoop!0 (_2!11003 lt!373430) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!11003 lt!373430) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!373516)))

(declare-fun b!238845 () Bool)

(declare-fun lt!373517 () tuple2!20196)

(assert (=> b!238845 (= e!164998 (tuple2!20197 (_1!11002 lt!373517) (_2!11002 lt!373517)))))

(declare-fun lt!373521 () tuple2!20198)

(assert (=> b!238845 (= lt!373521 (readBit!0 (_2!11003 lt!373430)))))

(assert (=> b!238845 (= lt!373517 (readNLeastSignificantBitsLoop!0 (_2!11003 lt!373521) nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001) (bvor (bvor acc!170 (ite (_1!11003 lt!373430) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!11003 lt!373521) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!752)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!80258 c!11362) b!238844))

(assert (= (and d!80258 (not c!11362)) b!238845))

(assert (= (and d!80258 res!199652) b!238842))

(assert (= (and b!238842 res!199650) b!238841))

(assert (= (and b!238841 res!199651) b!238839))

(assert (= (and b!238839 res!199653) b!238840))

(assert (= (and b!238840 (not res!199654)) b!238843))

(assert (=> b!238839 m!360861))

(declare-fun m!360903 () Bool)

(assert (=> b!238842 m!360903))

(declare-fun m!360905 () Bool)

(assert (=> b!238842 m!360905))

(declare-fun m!360907 () Bool)

(assert (=> b!238843 m!360907))

(declare-fun m!360909 () Bool)

(assert (=> b!238845 m!360909))

(declare-fun m!360911 () Bool)

(assert (=> b!238845 m!360911))

(assert (=> b!238777 d!80258))

(declare-fun d!80278 () Bool)

(declare-fun e!165005 () Bool)

(assert (=> d!80278 e!165005))

(declare-fun res!199657 () Bool)

(assert (=> d!80278 (=> (not res!199657) (not e!165005))))

(declare-datatypes ((Unit!17401 0))(
  ( (Unit!17402) )
))
(declare-datatypes ((tuple2!20208 0))(
  ( (tuple2!20209 (_1!11008 Unit!17401) (_2!11008 BitStream!10164)) )
))
(declare-fun increaseBitIndex!0 (BitStream!10164) tuple2!20208)

(assert (=> d!80278 (= res!199657 (= (buf!6075 (_2!11008 (increaseBitIndex!0 thiss!1830))) (buf!6075 thiss!1830)))))

(declare-fun lt!373541 () Bool)

(assert (=> d!80278 (= lt!373541 (not (= (bvand ((_ sign_extend 24) (select (arr!6587 (buf!6075 thiss!1830)) (currentByte!11261 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11256 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!373542 () tuple2!20198)

(assert (=> d!80278 (= lt!373542 (tuple2!20199 (not (= (bvand ((_ sign_extend 24) (select (arr!6587 (buf!6075 thiss!1830)) (currentByte!11261 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11256 thiss!1830)))) #b00000000000000000000000000000000)) (_2!11008 (increaseBitIndex!0 thiss!1830))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!80278 (validate_offset_bit!0 ((_ sign_extend 32) (size!5600 (buf!6075 thiss!1830))) ((_ sign_extend 32) (currentByte!11261 thiss!1830)) ((_ sign_extend 32) (currentBit!11256 thiss!1830)))))

(assert (=> d!80278 (= (readBit!0 thiss!1830) lt!373542)))

(declare-fun lt!373544 () (_ BitVec 64))

(declare-fun b!238848 () Bool)

(declare-fun lt!373543 () (_ BitVec 64))

(assert (=> b!238848 (= e!165005 (= (bitIndex!0 (size!5600 (buf!6075 (_2!11008 (increaseBitIndex!0 thiss!1830)))) (currentByte!11261 (_2!11008 (increaseBitIndex!0 thiss!1830))) (currentBit!11256 (_2!11008 (increaseBitIndex!0 thiss!1830)))) (bvadd lt!373544 lt!373543)))))

(assert (=> b!238848 (or (not (= (bvand lt!373544 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!373543 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!373544 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!373544 lt!373543) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!238848 (= lt!373543 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!238848 (= lt!373544 (bitIndex!0 (size!5600 (buf!6075 thiss!1830)) (currentByte!11261 thiss!1830) (currentBit!11256 thiss!1830)))))

(declare-fun lt!373545 () Bool)

(assert (=> b!238848 (= lt!373545 (not (= (bvand ((_ sign_extend 24) (select (arr!6587 (buf!6075 thiss!1830)) (currentByte!11261 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11256 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!373539 () Bool)

(assert (=> b!238848 (= lt!373539 (not (= (bvand ((_ sign_extend 24) (select (arr!6587 (buf!6075 thiss!1830)) (currentByte!11261 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11256 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!373540 () Bool)

(assert (=> b!238848 (= lt!373540 (not (= (bvand ((_ sign_extend 24) (select (arr!6587 (buf!6075 thiss!1830)) (currentByte!11261 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11256 thiss!1830)))) #b00000000000000000000000000000000)))))

(assert (= (and d!80278 res!199657) b!238848))

(declare-fun m!360913 () Bool)

(assert (=> d!80278 m!360913))

(declare-fun m!360915 () Bool)

(assert (=> d!80278 m!360915))

(declare-fun m!360917 () Bool)

(assert (=> d!80278 m!360917))

(declare-fun m!360919 () Bool)

(assert (=> d!80278 m!360919))

(assert (=> b!238848 m!360917))

(assert (=> b!238848 m!360849))

(declare-fun m!360921 () Bool)

(assert (=> b!238848 m!360921))

(assert (=> b!238848 m!360913))

(assert (=> b!238848 m!360915))

(assert (=> b!238777 d!80278))

(declare-fun d!80280 () Bool)

(declare-fun lt!373548 () tuple2!20198)

(assert (=> d!80280 (= lt!373548 (readBit!0 thiss!1830))))

(assert (=> d!80280 (= (readBitPure!0 thiss!1830) (tuple2!20201 (_2!11003 lt!373548) (_1!11003 lt!373548)))))

(declare-fun bs!20083 () Bool)

(assert (= bs!20083 d!80280))

(assert (=> bs!20083 m!360859))

(assert (=> b!238778 d!80280))

(check-sat (not d!80280) (not b!238845) (not d!80246) (not d!80256) (not d!80278) (not b!238842) (not b!238848) (not b!238839) (not d!80244) (not d!80250) (not b!238843))
(check-sat)
