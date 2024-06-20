; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15590 () Bool)

(assert start!15590)

(declare-fun b!79005 () Bool)

(declare-fun e!51839 () Bool)

(declare-datatypes ((array!3369 0))(
  ( (array!3370 (arr!2158 (Array (_ BitVec 32) (_ BitVec 8))) (size!1557 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2676 0))(
  ( (BitStream!2677 (buf!1947 array!3369) (currentByte!3809 (_ BitVec 32)) (currentBit!3804 (_ BitVec 32))) )
))
(declare-fun lt!125880 () BitStream!2676)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79005 (= e!51839 (validate_offset_bits!1 ((_ sign_extend 32) (size!1557 (buf!1947 lt!125880))) ((_ sign_extend 32) (currentByte!3809 lt!125880)) ((_ sign_extend 32) (currentBit!3804 lt!125880)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!7044 0))(
  ( (tuple2!7045 (_1!3659 BitStream!2676) (_2!3659 Bool)) )
))
(declare-fun lt!125877 () tuple2!7044)

(declare-fun readBitPure!0 (BitStream!2676) tuple2!7044)

(assert (=> b!79005 (= lt!125877 (readBitPure!0 lt!125880))))

(declare-datatypes ((Unit!5199 0))(
  ( (Unit!5200) )
))
(declare-datatypes ((tuple2!7046 0))(
  ( (tuple2!7047 (_1!3660 Unit!5199) (_2!3660 BitStream!2676)) )
))
(declare-fun lt!125875 () tuple2!7046)

(declare-fun thiss!1107 () BitStream!2676)

(declare-fun readerFrom!0 (BitStream!2676 (_ BitVec 32) (_ BitVec 32)) BitStream!2676)

(assert (=> b!79005 (= lt!125880 (readerFrom!0 (_2!3660 lt!125875) (currentBit!3804 thiss!1107) (currentByte!3809 thiss!1107)))))

(declare-fun b!79006 () Bool)

(declare-fun e!51838 () Bool)

(declare-fun array_inv!1403 (array!3369) Bool)

(assert (=> b!79006 (= e!51838 (array_inv!1403 (buf!1947 thiss!1107)))))

(declare-fun b!79007 () Bool)

(declare-fun e!51840 () Bool)

(declare-fun lt!125878 () tuple2!7044)

(declare-fun lt!125879 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!79007 (= e!51840 (= (bitIndex!0 (size!1557 (buf!1947 (_1!3659 lt!125878))) (currentByte!3809 (_1!3659 lt!125878)) (currentBit!3804 (_1!3659 lt!125878))) lt!125879))))

(declare-fun b!79008 () Bool)

(declare-fun res!65380 () Bool)

(declare-fun e!51842 () Bool)

(assert (=> b!79008 (=> (not res!65380) (not e!51842))))

(declare-fun isPrefixOf!0 (BitStream!2676 BitStream!2676) Bool)

(assert (=> b!79008 (= res!65380 (isPrefixOf!0 thiss!1107 (_2!3660 lt!125875)))))

(declare-fun b!79009 () Bool)

(declare-fun e!51841 () Bool)

(assert (=> b!79009 (= e!51841 (not e!51839))))

(declare-fun res!65373 () Bool)

(assert (=> b!79009 (=> res!65373 e!51839)))

(assert (=> b!79009 (= res!65373 (not (= (size!1557 (buf!1947 (_2!3660 lt!125875))) (size!1557 (buf!1947 thiss!1107)))))))

(declare-fun e!51837 () Bool)

(assert (=> b!79009 e!51837))

(declare-fun res!65375 () Bool)

(assert (=> b!79009 (=> (not res!65375) (not e!51837))))

(assert (=> b!79009 (= res!65375 (= (size!1557 (buf!1947 thiss!1107)) (size!1557 (buf!1947 (_2!3660 lt!125875)))))))

(declare-fun lt!125876 () Bool)

(declare-fun appendBit!0 (BitStream!2676 Bool) tuple2!7046)

(assert (=> b!79009 (= lt!125875 (appendBit!0 thiss!1107 lt!125876))))

(declare-fun b!215 () (_ BitVec 8))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> b!79009 (= lt!125876 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(declare-fun b!79010 () Bool)

(assert (=> b!79010 (= e!51842 e!51840)))

(declare-fun res!65377 () Bool)

(assert (=> b!79010 (=> (not res!65377) (not e!51840))))

(assert (=> b!79010 (= res!65377 (and (= (_2!3659 lt!125878) lt!125876) (= (_1!3659 lt!125878) (_2!3660 lt!125875))))))

(assert (=> b!79010 (= lt!125878 (readBitPure!0 (readerFrom!0 (_2!3660 lt!125875) (currentBit!3804 thiss!1107) (currentByte!3809 thiss!1107))))))

(declare-fun res!65376 () Bool)

(assert (=> start!15590 (=> (not res!65376) (not e!51841))))

(assert (=> start!15590 (= res!65376 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15590 e!51841))

(assert (=> start!15590 true))

(declare-fun inv!12 (BitStream!2676) Bool)

(assert (=> start!15590 (and (inv!12 thiss!1107) e!51838)))

(declare-fun b!79011 () Bool)

(declare-fun res!65379 () Bool)

(assert (=> b!79011 (=> res!65379 e!51839)))

(assert (=> b!79011 (= res!65379 (not (isPrefixOf!0 thiss!1107 (_2!3660 lt!125875))))))

(declare-fun b!79012 () Bool)

(assert (=> b!79012 (= e!51837 e!51842)))

(declare-fun res!65378 () Bool)

(assert (=> b!79012 (=> (not res!65378) (not e!51842))))

(declare-fun lt!125874 () (_ BitVec 64))

(assert (=> b!79012 (= res!65378 (= lt!125879 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!125874)))))

(assert (=> b!79012 (= lt!125879 (bitIndex!0 (size!1557 (buf!1947 (_2!3660 lt!125875))) (currentByte!3809 (_2!3660 lt!125875)) (currentBit!3804 (_2!3660 lt!125875))))))

(assert (=> b!79012 (= lt!125874 (bitIndex!0 (size!1557 (buf!1947 thiss!1107)) (currentByte!3809 thiss!1107) (currentBit!3804 thiss!1107)))))

(declare-fun b!79013 () Bool)

(declare-fun res!65372 () Bool)

(assert (=> b!79013 (=> (not res!65372) (not e!51841))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79013 (= res!65372 (validate_offset_bit!0 ((_ sign_extend 32) (size!1557 (buf!1947 thiss!1107))) ((_ sign_extend 32) (currentByte!3809 thiss!1107)) ((_ sign_extend 32) (currentBit!3804 thiss!1107))))))

(declare-fun b!79014 () Bool)

(declare-fun res!65374 () Bool)

(assert (=> b!79014 (=> res!65374 e!51839)))

(assert (=> b!79014 (= res!65374 (not (= (bitIndex!0 (size!1557 (buf!1947 (_2!3660 lt!125875))) (currentByte!3809 (_2!3660 lt!125875)) (currentBit!3804 (_2!3660 lt!125875))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1557 (buf!1947 thiss!1107)) (currentByte!3809 thiss!1107) (currentBit!3804 thiss!1107))))))))

(assert (= (and start!15590 res!65376) b!79013))

(assert (= (and b!79013 res!65372) b!79009))

(assert (= (and b!79009 res!65375) b!79012))

(assert (= (and b!79012 res!65378) b!79008))

(assert (= (and b!79008 res!65380) b!79010))

(assert (= (and b!79010 res!65377) b!79007))

(assert (= (and b!79009 (not res!65373)) b!79014))

(assert (= (and b!79014 (not res!65374)) b!79011))

(assert (= (and b!79011 (not res!65379)) b!79005))

(assert (= start!15590 b!79006))

(declare-fun m!124439 () Bool)

(assert (=> b!79014 m!124439))

(declare-fun m!124441 () Bool)

(assert (=> b!79014 m!124441))

(declare-fun m!124443 () Bool)

(assert (=> b!79007 m!124443))

(declare-fun m!124445 () Bool)

(assert (=> b!79008 m!124445))

(declare-fun m!124447 () Bool)

(assert (=> b!79009 m!124447))

(declare-fun m!124449 () Bool)

(assert (=> b!79009 m!124449))

(declare-fun m!124451 () Bool)

(assert (=> b!79010 m!124451))

(assert (=> b!79010 m!124451))

(declare-fun m!124453 () Bool)

(assert (=> b!79010 m!124453))

(declare-fun m!124455 () Bool)

(assert (=> b!79013 m!124455))

(declare-fun m!124457 () Bool)

(assert (=> start!15590 m!124457))

(declare-fun m!124459 () Bool)

(assert (=> b!79005 m!124459))

(declare-fun m!124461 () Bool)

(assert (=> b!79005 m!124461))

(assert (=> b!79005 m!124451))

(declare-fun m!124463 () Bool)

(assert (=> b!79006 m!124463))

(assert (=> b!79012 m!124439))

(assert (=> b!79012 m!124441))

(assert (=> b!79011 m!124445))

(check-sat (not start!15590) (not b!79005) (not b!79013) (not b!79012) (not b!79011) (not b!79008) (not b!79006) (not b!79014) (not b!79010) (not b!79007) (not b!79009))
(check-sat)
(get-model)

(declare-fun d!24928 () Bool)

(declare-fun e!51867 () Bool)

(assert (=> d!24928 e!51867))

(declare-fun res!65413 () Bool)

(assert (=> d!24928 (=> (not res!65413) (not e!51867))))

(declare-fun lt!125918 () (_ BitVec 64))

(declare-fun lt!125917 () (_ BitVec 64))

(declare-fun lt!125919 () (_ BitVec 64))

(assert (=> d!24928 (= res!65413 (= lt!125917 (bvsub lt!125918 lt!125919)))))

(assert (=> d!24928 (or (= (bvand lt!125918 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125919 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125918 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125918 lt!125919) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24928 (= lt!125919 (remainingBits!0 ((_ sign_extend 32) (size!1557 (buf!1947 (_1!3659 lt!125878)))) ((_ sign_extend 32) (currentByte!3809 (_1!3659 lt!125878))) ((_ sign_extend 32) (currentBit!3804 (_1!3659 lt!125878)))))))

(declare-fun lt!125914 () (_ BitVec 64))

(declare-fun lt!125916 () (_ BitVec 64))

(assert (=> d!24928 (= lt!125918 (bvmul lt!125914 lt!125916))))

(assert (=> d!24928 (or (= lt!125914 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125916 (bvsdiv (bvmul lt!125914 lt!125916) lt!125914)))))

(assert (=> d!24928 (= lt!125916 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24928 (= lt!125914 ((_ sign_extend 32) (size!1557 (buf!1947 (_1!3659 lt!125878)))))))

(assert (=> d!24928 (= lt!125917 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3809 (_1!3659 lt!125878))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3804 (_1!3659 lt!125878)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!24928 (invariant!0 (currentBit!3804 (_1!3659 lt!125878)) (currentByte!3809 (_1!3659 lt!125878)) (size!1557 (buf!1947 (_1!3659 lt!125878))))))

(assert (=> d!24928 (= (bitIndex!0 (size!1557 (buf!1947 (_1!3659 lt!125878))) (currentByte!3809 (_1!3659 lt!125878)) (currentBit!3804 (_1!3659 lt!125878))) lt!125917)))

(declare-fun b!79049 () Bool)

(declare-fun res!65412 () Bool)

(assert (=> b!79049 (=> (not res!65412) (not e!51867))))

(assert (=> b!79049 (= res!65412 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125917))))

(declare-fun b!79050 () Bool)

(declare-fun lt!125915 () (_ BitVec 64))

(assert (=> b!79050 (= e!51867 (bvsle lt!125917 (bvmul lt!125915 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!79050 (or (= lt!125915 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125915 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125915)))))

(assert (=> b!79050 (= lt!125915 ((_ sign_extend 32) (size!1557 (buf!1947 (_1!3659 lt!125878)))))))

(assert (= (and d!24928 res!65413) b!79049))

(assert (= (and b!79049 res!65412) b!79050))

(declare-fun m!124491 () Bool)

(assert (=> d!24928 m!124491))

(declare-fun m!124493 () Bool)

(assert (=> d!24928 m!124493))

(assert (=> b!79007 d!24928))

(declare-fun d!24930 () Bool)

(assert (=> d!24930 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!1557 (buf!1947 thiss!1107))) ((_ sign_extend 32) (currentByte!3809 thiss!1107)) ((_ sign_extend 32) (currentBit!3804 thiss!1107))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1557 (buf!1947 thiss!1107))) ((_ sign_extend 32) (currentByte!3809 thiss!1107)) ((_ sign_extend 32) (currentBit!3804 thiss!1107))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!6042 () Bool)

(assert (= bs!6042 d!24930))

(declare-fun m!124495 () Bool)

(assert (=> bs!6042 m!124495))

(assert (=> b!79013 d!24930))

(declare-fun d!24932 () Bool)

(declare-fun res!65420 () Bool)

(declare-fun e!51872 () Bool)

(assert (=> d!24932 (=> (not res!65420) (not e!51872))))

(assert (=> d!24932 (= res!65420 (= (size!1557 (buf!1947 thiss!1107)) (size!1557 (buf!1947 (_2!3660 lt!125875)))))))

(assert (=> d!24932 (= (isPrefixOf!0 thiss!1107 (_2!3660 lt!125875)) e!51872)))

(declare-fun b!79057 () Bool)

(declare-fun res!65422 () Bool)

(assert (=> b!79057 (=> (not res!65422) (not e!51872))))

(assert (=> b!79057 (= res!65422 (bvsle (bitIndex!0 (size!1557 (buf!1947 thiss!1107)) (currentByte!3809 thiss!1107) (currentBit!3804 thiss!1107)) (bitIndex!0 (size!1557 (buf!1947 (_2!3660 lt!125875))) (currentByte!3809 (_2!3660 lt!125875)) (currentBit!3804 (_2!3660 lt!125875)))))))

(declare-fun b!79058 () Bool)

(declare-fun e!51873 () Bool)

(assert (=> b!79058 (= e!51872 e!51873)))

(declare-fun res!65421 () Bool)

(assert (=> b!79058 (=> res!65421 e!51873)))

(assert (=> b!79058 (= res!65421 (= (size!1557 (buf!1947 thiss!1107)) #b00000000000000000000000000000000))))

(declare-fun b!79059 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3369 array!3369 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79059 (= e!51873 (arrayBitRangesEq!0 (buf!1947 thiss!1107) (buf!1947 (_2!3660 lt!125875)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1557 (buf!1947 thiss!1107)) (currentByte!3809 thiss!1107) (currentBit!3804 thiss!1107))))))

(assert (= (and d!24932 res!65420) b!79057))

(assert (= (and b!79057 res!65422) b!79058))

(assert (= (and b!79058 (not res!65421)) b!79059))

(assert (=> b!79057 m!124441))

(assert (=> b!79057 m!124439))

(assert (=> b!79059 m!124441))

(assert (=> b!79059 m!124441))

(declare-fun m!124497 () Bool)

(assert (=> b!79059 m!124497))

(assert (=> b!79008 d!24932))

(assert (=> b!79011 d!24932))

(declare-fun d!24936 () Bool)

(assert (=> d!24936 (= (inv!12 thiss!1107) (invariant!0 (currentBit!3804 thiss!1107) (currentByte!3809 thiss!1107) (size!1557 (buf!1947 thiss!1107))))))

(declare-fun bs!6043 () Bool)

(assert (= bs!6043 d!24936))

(declare-fun m!124499 () Bool)

(assert (=> bs!6043 m!124499))

(assert (=> start!15590 d!24936))

(declare-fun d!24938 () Bool)

(assert (=> d!24938 (= (array_inv!1403 (buf!1947 thiss!1107)) (bvsge (size!1557 (buf!1947 thiss!1107)) #b00000000000000000000000000000000))))

(assert (=> b!79006 d!24938))

(declare-fun d!24940 () Bool)

(declare-fun e!51874 () Bool)

(assert (=> d!24940 e!51874))

(declare-fun res!65424 () Bool)

(assert (=> d!24940 (=> (not res!65424) (not e!51874))))

(declare-fun lt!125923 () (_ BitVec 64))

(declare-fun lt!125925 () (_ BitVec 64))

(declare-fun lt!125924 () (_ BitVec 64))

(assert (=> d!24940 (= res!65424 (= lt!125923 (bvsub lt!125924 lt!125925)))))

(assert (=> d!24940 (or (= (bvand lt!125924 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125925 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125924 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125924 lt!125925) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24940 (= lt!125925 (remainingBits!0 ((_ sign_extend 32) (size!1557 (buf!1947 (_2!3660 lt!125875)))) ((_ sign_extend 32) (currentByte!3809 (_2!3660 lt!125875))) ((_ sign_extend 32) (currentBit!3804 (_2!3660 lt!125875)))))))

(declare-fun lt!125920 () (_ BitVec 64))

(declare-fun lt!125922 () (_ BitVec 64))

(assert (=> d!24940 (= lt!125924 (bvmul lt!125920 lt!125922))))

(assert (=> d!24940 (or (= lt!125920 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125922 (bvsdiv (bvmul lt!125920 lt!125922) lt!125920)))))

(assert (=> d!24940 (= lt!125922 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24940 (= lt!125920 ((_ sign_extend 32) (size!1557 (buf!1947 (_2!3660 lt!125875)))))))

(assert (=> d!24940 (= lt!125923 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3809 (_2!3660 lt!125875))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3804 (_2!3660 lt!125875)))))))

(assert (=> d!24940 (invariant!0 (currentBit!3804 (_2!3660 lt!125875)) (currentByte!3809 (_2!3660 lt!125875)) (size!1557 (buf!1947 (_2!3660 lt!125875))))))

(assert (=> d!24940 (= (bitIndex!0 (size!1557 (buf!1947 (_2!3660 lt!125875))) (currentByte!3809 (_2!3660 lt!125875)) (currentBit!3804 (_2!3660 lt!125875))) lt!125923)))

(declare-fun b!79060 () Bool)

(declare-fun res!65423 () Bool)

(assert (=> b!79060 (=> (not res!65423) (not e!51874))))

(assert (=> b!79060 (= res!65423 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125923))))

(declare-fun b!79061 () Bool)

(declare-fun lt!125921 () (_ BitVec 64))

(assert (=> b!79061 (= e!51874 (bvsle lt!125923 (bvmul lt!125921 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!79061 (or (= lt!125921 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125921 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125921)))))

(assert (=> b!79061 (= lt!125921 ((_ sign_extend 32) (size!1557 (buf!1947 (_2!3660 lt!125875)))))))

(assert (= (and d!24940 res!65424) b!79060))

(assert (= (and b!79060 res!65423) b!79061))

(declare-fun m!124501 () Bool)

(assert (=> d!24940 m!124501))

(declare-fun m!124503 () Bool)

(assert (=> d!24940 m!124503))

(assert (=> b!79012 d!24940))

(declare-fun d!24942 () Bool)

(declare-fun e!51877 () Bool)

(assert (=> d!24942 e!51877))

(declare-fun res!65430 () Bool)

(assert (=> d!24942 (=> (not res!65430) (not e!51877))))

(declare-fun lt!125930 () (_ BitVec 64))

(declare-fun lt!125931 () (_ BitVec 64))

(declare-fun lt!125929 () (_ BitVec 64))

(assert (=> d!24942 (= res!65430 (= lt!125929 (bvsub lt!125930 lt!125931)))))

(assert (=> d!24942 (or (= (bvand lt!125930 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125931 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125930 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125930 lt!125931) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24942 (= lt!125931 (remainingBits!0 ((_ sign_extend 32) (size!1557 (buf!1947 thiss!1107))) ((_ sign_extend 32) (currentByte!3809 thiss!1107)) ((_ sign_extend 32) (currentBit!3804 thiss!1107))))))

(declare-fun lt!125926 () (_ BitVec 64))

(declare-fun lt!125928 () (_ BitVec 64))

(assert (=> d!24942 (= lt!125930 (bvmul lt!125926 lt!125928))))

(assert (=> d!24942 (or (= lt!125926 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125928 (bvsdiv (bvmul lt!125926 lt!125928) lt!125926)))))

(assert (=> d!24942 (= lt!125928 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24942 (= lt!125926 ((_ sign_extend 32) (size!1557 (buf!1947 thiss!1107))))))

(assert (=> d!24942 (= lt!125929 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3809 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3804 thiss!1107))))))

(assert (=> d!24942 (invariant!0 (currentBit!3804 thiss!1107) (currentByte!3809 thiss!1107) (size!1557 (buf!1947 thiss!1107)))))

(assert (=> d!24942 (= (bitIndex!0 (size!1557 (buf!1947 thiss!1107)) (currentByte!3809 thiss!1107) (currentBit!3804 thiss!1107)) lt!125929)))

(declare-fun b!79066 () Bool)

(declare-fun res!65429 () Bool)

(assert (=> b!79066 (=> (not res!65429) (not e!51877))))

(assert (=> b!79066 (= res!65429 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125929))))

(declare-fun b!79067 () Bool)

(declare-fun lt!125927 () (_ BitVec 64))

(assert (=> b!79067 (= e!51877 (bvsle lt!125929 (bvmul lt!125927 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!79067 (or (= lt!125927 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125927 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125927)))))

(assert (=> b!79067 (= lt!125927 ((_ sign_extend 32) (size!1557 (buf!1947 thiss!1107))))))

(assert (= (and d!24942 res!65430) b!79066))

(assert (= (and b!79066 res!65429) b!79067))

(assert (=> d!24942 m!124495))

(assert (=> d!24942 m!124499))

(assert (=> b!79012 d!24942))

(declare-fun d!24944 () Bool)

(declare-datatypes ((tuple2!7052 0))(
  ( (tuple2!7053 (_1!3663 Bool) (_2!3663 BitStream!2676)) )
))
(declare-fun lt!125934 () tuple2!7052)

(declare-fun readBit!0 (BitStream!2676) tuple2!7052)

(assert (=> d!24944 (= lt!125934 (readBit!0 (readerFrom!0 (_2!3660 lt!125875) (currentBit!3804 thiss!1107) (currentByte!3809 thiss!1107))))))

(assert (=> d!24944 (= (readBitPure!0 (readerFrom!0 (_2!3660 lt!125875) (currentBit!3804 thiss!1107) (currentByte!3809 thiss!1107))) (tuple2!7045 (_2!3663 lt!125934) (_1!3663 lt!125934)))))

(declare-fun bs!6045 () Bool)

(assert (= bs!6045 d!24944))

(assert (=> bs!6045 m!124451))

(declare-fun m!124509 () Bool)

(assert (=> bs!6045 m!124509))

(assert (=> b!79010 d!24944))

(declare-fun d!24950 () Bool)

(declare-fun e!51884 () Bool)

(assert (=> d!24950 e!51884))

(declare-fun res!65439 () Bool)

(assert (=> d!24950 (=> (not res!65439) (not e!51884))))

(assert (=> d!24950 (= res!65439 (invariant!0 (currentBit!3804 (_2!3660 lt!125875)) (currentByte!3809 (_2!3660 lt!125875)) (size!1557 (buf!1947 (_2!3660 lt!125875)))))))

(assert (=> d!24950 (= (readerFrom!0 (_2!3660 lt!125875) (currentBit!3804 thiss!1107) (currentByte!3809 thiss!1107)) (BitStream!2677 (buf!1947 (_2!3660 lt!125875)) (currentByte!3809 thiss!1107) (currentBit!3804 thiss!1107)))))

(declare-fun b!79075 () Bool)

(assert (=> b!79075 (= e!51884 (invariant!0 (currentBit!3804 thiss!1107) (currentByte!3809 thiss!1107) (size!1557 (buf!1947 (_2!3660 lt!125875)))))))

(assert (= (and d!24950 res!65439) b!79075))

(assert (=> d!24950 m!124503))

(declare-fun m!124513 () Bool)

(assert (=> b!79075 m!124513))

(assert (=> b!79010 d!24950))

(declare-fun d!24956 () Bool)

(assert (=> d!24956 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1557 (buf!1947 lt!125880))) ((_ sign_extend 32) (currentByte!3809 lt!125880)) ((_ sign_extend 32) (currentBit!3804 lt!125880)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1557 (buf!1947 lt!125880))) ((_ sign_extend 32) (currentByte!3809 lt!125880)) ((_ sign_extend 32) (currentBit!3804 lt!125880))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!6048 () Bool)

(assert (= bs!6048 d!24956))

(declare-fun m!124517 () Bool)

(assert (=> bs!6048 m!124517))

(assert (=> b!79005 d!24956))

(declare-fun d!24960 () Bool)

(declare-fun lt!125938 () tuple2!7052)

(assert (=> d!24960 (= lt!125938 (readBit!0 lt!125880))))

(assert (=> d!24960 (= (readBitPure!0 lt!125880) (tuple2!7045 (_2!3663 lt!125938) (_1!3663 lt!125938)))))

(declare-fun bs!6049 () Bool)

(assert (= bs!6049 d!24960))

(declare-fun m!124519 () Bool)

(assert (=> bs!6049 m!124519))

(assert (=> b!79005 d!24960))

(assert (=> b!79005 d!24950))

(assert (=> b!79014 d!24940))

(assert (=> b!79014 d!24942))

(declare-fun b!79113 () Bool)

(declare-fun e!51905 () Bool)

(declare-fun e!51906 () Bool)

(assert (=> b!79113 (= e!51905 e!51906)))

(declare-fun res!65476 () Bool)

(assert (=> b!79113 (=> (not res!65476) (not e!51906))))

(declare-fun lt!126012 () tuple2!7044)

(declare-fun lt!126013 () tuple2!7046)

(assert (=> b!79113 (= res!65476 (and (= (_2!3659 lt!126012) lt!125876) (= (_1!3659 lt!126012) (_2!3660 lt!126013))))))

(assert (=> b!79113 (= lt!126012 (readBitPure!0 (readerFrom!0 (_2!3660 lt!126013) (currentBit!3804 thiss!1107) (currentByte!3809 thiss!1107))))))

(declare-fun b!79112 () Bool)

(declare-fun res!65478 () Bool)

(assert (=> b!79112 (=> (not res!65478) (not e!51905))))

(assert (=> b!79112 (= res!65478 (isPrefixOf!0 thiss!1107 (_2!3660 lt!126013)))))

(declare-fun d!24962 () Bool)

(assert (=> d!24962 e!51905))

(declare-fun res!65479 () Bool)

(assert (=> d!24962 (=> (not res!65479) (not e!51905))))

(assert (=> d!24962 (= res!65479 (= (size!1557 (buf!1947 thiss!1107)) (size!1557 (buf!1947 (_2!3660 lt!126013)))))))

(declare-fun choose!16 (BitStream!2676 Bool) tuple2!7046)

(assert (=> d!24962 (= lt!126013 (choose!16 thiss!1107 lt!125876))))

(assert (=> d!24962 (validate_offset_bit!0 ((_ sign_extend 32) (size!1557 (buf!1947 thiss!1107))) ((_ sign_extend 32) (currentByte!3809 thiss!1107)) ((_ sign_extend 32) (currentBit!3804 thiss!1107)))))

(assert (=> d!24962 (= (appendBit!0 thiss!1107 lt!125876) lt!126013)))

(declare-fun b!79114 () Bool)

(assert (=> b!79114 (= e!51906 (= (bitIndex!0 (size!1557 (buf!1947 (_1!3659 lt!126012))) (currentByte!3809 (_1!3659 lt!126012)) (currentBit!3804 (_1!3659 lt!126012))) (bitIndex!0 (size!1557 (buf!1947 (_2!3660 lt!126013))) (currentByte!3809 (_2!3660 lt!126013)) (currentBit!3804 (_2!3660 lt!126013)))))))

(declare-fun b!79111 () Bool)

(declare-fun res!65477 () Bool)

(assert (=> b!79111 (=> (not res!65477) (not e!51905))))

(declare-fun lt!126014 () (_ BitVec 64))

(declare-fun lt!126015 () (_ BitVec 64))

(assert (=> b!79111 (= res!65477 (= (bitIndex!0 (size!1557 (buf!1947 (_2!3660 lt!126013))) (currentByte!3809 (_2!3660 lt!126013)) (currentBit!3804 (_2!3660 lt!126013))) (bvadd lt!126014 lt!126015)))))

(assert (=> b!79111 (or (not (= (bvand lt!126014 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!126015 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!126014 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!126014 lt!126015) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!79111 (= lt!126015 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!79111 (= lt!126014 (bitIndex!0 (size!1557 (buf!1947 thiss!1107)) (currentByte!3809 thiss!1107) (currentBit!3804 thiss!1107)))))

(assert (= (and d!24962 res!65479) b!79111))

(assert (= (and b!79111 res!65477) b!79112))

(assert (= (and b!79112 res!65478) b!79113))

(assert (= (and b!79113 res!65476) b!79114))

(declare-fun m!124555 () Bool)

(assert (=> b!79112 m!124555))

(declare-fun m!124557 () Bool)

(assert (=> b!79113 m!124557))

(assert (=> b!79113 m!124557))

(declare-fun m!124559 () Bool)

(assert (=> b!79113 m!124559))

(declare-fun m!124561 () Bool)

(assert (=> b!79111 m!124561))

(assert (=> b!79111 m!124441))

(declare-fun m!124563 () Bool)

(assert (=> d!24962 m!124563))

(assert (=> d!24962 m!124455))

(declare-fun m!124565 () Bool)

(assert (=> b!79114 m!124565))

(assert (=> b!79114 m!124561))

(assert (=> b!79009 d!24962))

(check-sat (not d!24950) (not d!24960) (not b!79059) (not d!24930) (not d!24962) (not d!24942) (not b!79114) (not d!24956) (not d!24944) (not d!24936) (not d!24940) (not b!79057) (not b!79111) (not b!79112) (not b!79075) (not d!24928) (not b!79113))
(check-sat)
