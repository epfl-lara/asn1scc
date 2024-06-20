; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18674 () Bool)

(assert start!18674)

(declare-fun b!92809 () Bool)

(declare-fun res!76602 () Bool)

(declare-fun e!60975 () Bool)

(assert (=> b!92809 (=> (not res!76602) (not e!60975))))

(declare-datatypes ((array!4346 0))(
  ( (array!4347 (arr!2590 (Array (_ BitVec 32) (_ BitVec 8))) (size!1967 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3468 0))(
  ( (BitStream!3469 (buf!2343 array!4346) (currentByte!4668 (_ BitVec 32)) (currentBit!4663 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3468)

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!92809 (= res!76602 (validate_offset_bits!1 ((_ sign_extend 32) (size!1967 (buf!2343 bitStream1!8))) ((_ sign_extend 32) (currentByte!4668 bitStream1!8)) ((_ sign_extend 32) (currentBit!4663 bitStream1!8)) nBits!484))))

(declare-fun b!92810 () Bool)

(declare-fun res!76607 () Bool)

(assert (=> b!92810 (=> (not res!76607) (not e!60975))))

(declare-fun bitStream2!8 () BitStream!3468)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!92810 (= res!76607 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1967 (buf!2343 bitStream1!8)) (currentByte!4668 bitStream1!8) (currentBit!4663 bitStream1!8))) (bitIndex!0 (size!1967 (buf!2343 bitStream2!8)) (currentByte!4668 bitStream2!8) (currentBit!4663 bitStream2!8))))))

(declare-fun b!92811 () Bool)

(declare-fun e!60981 () Bool)

(declare-fun array_inv!1799 (array!4346) Bool)

(assert (=> b!92811 (= e!60981 (array_inv!1799 (buf!2343 bitStream1!8)))))

(declare-fun b!92812 () Bool)

(declare-fun res!76601 () Bool)

(assert (=> b!92812 (=> (not res!76601) (not e!60975))))

(declare-fun base!8 () BitStream!3468)

(declare-fun isPrefixOf!0 (BitStream!3468 BitStream!3468) Bool)

(assert (=> b!92812 (= res!76601 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun res!76605 () Bool)

(assert (=> start!18674 (=> (not res!76605) (not e!60975))))

(assert (=> start!18674 (= res!76605 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18674 e!60975))

(assert (=> start!18674 true))

(declare-fun inv!12 (BitStream!3468) Bool)

(assert (=> start!18674 (and (inv!12 bitStream1!8) e!60981)))

(declare-fun e!60977 () Bool)

(assert (=> start!18674 (and (inv!12 bitStream2!8) e!60977)))

(declare-fun e!60979 () Bool)

(assert (=> start!18674 (and (inv!12 base!8) e!60979)))

(declare-fun b!92813 () Bool)

(declare-fun res!76606 () Bool)

(assert (=> b!92813 (=> (not res!76606) (not e!60975))))

(assert (=> b!92813 (= res!76606 (and (= (buf!2343 bitStream1!8) (buf!2343 bitStream2!8)) (= (buf!2343 bitStream1!8) (buf!2343 base!8))))))

(declare-fun b!92814 () Bool)

(declare-fun res!76599 () Bool)

(assert (=> b!92814 (=> (not res!76599) (not e!60975))))

(assert (=> b!92814 (= res!76599 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!92815 () Bool)

(assert (=> b!92815 (= e!60977 (array_inv!1799 (buf!2343 bitStream2!8)))))

(declare-fun b!92816 () Bool)

(declare-fun res!76603 () Bool)

(assert (=> b!92816 (=> (not res!76603) (not e!60975))))

(declare-datatypes ((List!840 0))(
  ( (Nil!837) (Cons!836 (h!955 Bool) (t!1590 List!840)) )
))
(declare-fun listBits!13 () List!840)

(declare-fun length!431 (List!840) Int)

(assert (=> b!92816 (= res!76603 (> (length!431 listBits!13) 0))))

(declare-fun b!92817 () Bool)

(assert (=> b!92817 (= e!60975 (and (bvsle ((_ sign_extend 32) (size!1967 (buf!2343 bitStream2!8))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4668 bitStream2!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4663 bitStream2!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!1967 (buf!2343 bitStream2!8))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4668 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4663 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!92818 () Bool)

(declare-fun res!76604 () Bool)

(assert (=> b!92818 (=> (not res!76604) (not e!60975))))

(assert (=> b!92818 (= res!76604 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!92819 () Bool)

(assert (=> b!92819 (= e!60979 (array_inv!1799 (buf!2343 base!8)))))

(declare-fun b!92820 () Bool)

(declare-fun res!76600 () Bool)

(assert (=> b!92820 (=> (not res!76600) (not e!60975))))

(assert (=> b!92820 (= res!76600 (bvslt (bitIndex!0 (size!1967 (buf!2343 base!8)) (currentByte!4668 base!8) (currentBit!4663 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(assert (= (and start!18674 res!76605) b!92816))

(assert (= (and b!92816 res!76603) b!92818))

(assert (= (and b!92818 res!76604) b!92812))

(assert (= (and b!92812 res!76601) b!92814))

(assert (= (and b!92814 res!76599) b!92813))

(assert (= (and b!92813 res!76606) b!92820))

(assert (= (and b!92820 res!76600) b!92810))

(assert (= (and b!92810 res!76607) b!92809))

(assert (= (and b!92809 res!76602) b!92817))

(assert (= start!18674 b!92811))

(assert (= start!18674 b!92815))

(assert (= start!18674 b!92819))

(declare-fun m!136701 () Bool)

(assert (=> b!92818 m!136701))

(declare-fun m!136703 () Bool)

(assert (=> b!92810 m!136703))

(declare-fun m!136705 () Bool)

(assert (=> b!92810 m!136705))

(declare-fun m!136707 () Bool)

(assert (=> b!92820 m!136707))

(declare-fun m!136709 () Bool)

(assert (=> b!92809 m!136709))

(declare-fun m!136711 () Bool)

(assert (=> b!92812 m!136711))

(declare-fun m!136713 () Bool)

(assert (=> b!92819 m!136713))

(declare-fun m!136715 () Bool)

(assert (=> b!92816 m!136715))

(declare-fun m!136717 () Bool)

(assert (=> b!92814 m!136717))

(declare-fun m!136719 () Bool)

(assert (=> b!92815 m!136719))

(declare-fun m!136721 () Bool)

(assert (=> start!18674 m!136721))

(declare-fun m!136723 () Bool)

(assert (=> start!18674 m!136723))

(declare-fun m!136725 () Bool)

(assert (=> start!18674 m!136725))

(declare-fun m!136727 () Bool)

(assert (=> b!92811 m!136727))

(check-sat (not b!92820) (not b!92816) (not b!92818) (not b!92819) (not b!92809) (not b!92810) (not b!92812) (not b!92811) (not b!92815) (not start!18674) (not b!92814))
(check-sat)
(get-model)

(declare-fun d!28890 () Bool)

(assert (=> d!28890 (= (array_inv!1799 (buf!2343 bitStream2!8)) (bvsge (size!1967 (buf!2343 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!92815 d!28890))

(declare-fun d!28892 () Bool)

(declare-fun e!61005 () Bool)

(assert (=> d!28892 e!61005))

(declare-fun res!76640 () Bool)

(assert (=> d!28892 (=> (not res!76640) (not e!61005))))

(declare-fun lt!138241 () (_ BitVec 64))

(declare-fun lt!138243 () (_ BitVec 64))

(declare-fun lt!138244 () (_ BitVec 64))

(assert (=> d!28892 (= res!76640 (= lt!138241 (bvsub lt!138244 lt!138243)))))

(assert (=> d!28892 (or (= (bvand lt!138244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138243 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138244 lt!138243) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!28892 (= lt!138243 (remainingBits!0 ((_ sign_extend 32) (size!1967 (buf!2343 bitStream1!8))) ((_ sign_extend 32) (currentByte!4668 bitStream1!8)) ((_ sign_extend 32) (currentBit!4663 bitStream1!8))))))

(declare-fun lt!138246 () (_ BitVec 64))

(declare-fun lt!138242 () (_ BitVec 64))

(assert (=> d!28892 (= lt!138244 (bvmul lt!138246 lt!138242))))

(assert (=> d!28892 (or (= lt!138246 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138242 (bvsdiv (bvmul lt!138246 lt!138242) lt!138246)))))

(assert (=> d!28892 (= lt!138242 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28892 (= lt!138246 ((_ sign_extend 32) (size!1967 (buf!2343 bitStream1!8))))))

(assert (=> d!28892 (= lt!138241 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4668 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4663 bitStream1!8))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!28892 (invariant!0 (currentBit!4663 bitStream1!8) (currentByte!4668 bitStream1!8) (size!1967 (buf!2343 bitStream1!8)))))

(assert (=> d!28892 (= (bitIndex!0 (size!1967 (buf!2343 bitStream1!8)) (currentByte!4668 bitStream1!8) (currentBit!4663 bitStream1!8)) lt!138241)))

(declare-fun b!92861 () Bool)

(declare-fun res!76639 () Bool)

(assert (=> b!92861 (=> (not res!76639) (not e!61005))))

(assert (=> b!92861 (= res!76639 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138241))))

(declare-fun b!92862 () Bool)

(declare-fun lt!138245 () (_ BitVec 64))

(assert (=> b!92862 (= e!61005 (bvsle lt!138241 (bvmul lt!138245 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92862 (or (= lt!138245 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138245 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138245)))))

(assert (=> b!92862 (= lt!138245 ((_ sign_extend 32) (size!1967 (buf!2343 bitStream1!8))))))

(assert (= (and d!28892 res!76640) b!92861))

(assert (= (and b!92861 res!76639) b!92862))

(declare-fun m!136757 () Bool)

(assert (=> d!28892 m!136757))

(declare-fun m!136759 () Bool)

(assert (=> d!28892 m!136759))

(assert (=> b!92810 d!28892))

(declare-fun d!28894 () Bool)

(declare-fun e!61006 () Bool)

(assert (=> d!28894 e!61006))

(declare-fun res!76642 () Bool)

(assert (=> d!28894 (=> (not res!76642) (not e!61006))))

(declare-fun lt!138250 () (_ BitVec 64))

(declare-fun lt!138249 () (_ BitVec 64))

(declare-fun lt!138247 () (_ BitVec 64))

(assert (=> d!28894 (= res!76642 (= lt!138247 (bvsub lt!138250 lt!138249)))))

(assert (=> d!28894 (or (= (bvand lt!138250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138249 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138250 lt!138249) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28894 (= lt!138249 (remainingBits!0 ((_ sign_extend 32) (size!1967 (buf!2343 bitStream2!8))) ((_ sign_extend 32) (currentByte!4668 bitStream2!8)) ((_ sign_extend 32) (currentBit!4663 bitStream2!8))))))

(declare-fun lt!138252 () (_ BitVec 64))

(declare-fun lt!138248 () (_ BitVec 64))

(assert (=> d!28894 (= lt!138250 (bvmul lt!138252 lt!138248))))

(assert (=> d!28894 (or (= lt!138252 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138248 (bvsdiv (bvmul lt!138252 lt!138248) lt!138252)))))

(assert (=> d!28894 (= lt!138248 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28894 (= lt!138252 ((_ sign_extend 32) (size!1967 (buf!2343 bitStream2!8))))))

(assert (=> d!28894 (= lt!138247 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4668 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4663 bitStream2!8))))))

(assert (=> d!28894 (invariant!0 (currentBit!4663 bitStream2!8) (currentByte!4668 bitStream2!8) (size!1967 (buf!2343 bitStream2!8)))))

(assert (=> d!28894 (= (bitIndex!0 (size!1967 (buf!2343 bitStream2!8)) (currentByte!4668 bitStream2!8) (currentBit!4663 bitStream2!8)) lt!138247)))

(declare-fun b!92863 () Bool)

(declare-fun res!76641 () Bool)

(assert (=> b!92863 (=> (not res!76641) (not e!61006))))

(assert (=> b!92863 (= res!76641 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138247))))

(declare-fun b!92864 () Bool)

(declare-fun lt!138251 () (_ BitVec 64))

(assert (=> b!92864 (= e!61006 (bvsle lt!138247 (bvmul lt!138251 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92864 (or (= lt!138251 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138251 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138251)))))

(assert (=> b!92864 (= lt!138251 ((_ sign_extend 32) (size!1967 (buf!2343 bitStream2!8))))))

(assert (= (and d!28894 res!76642) b!92863))

(assert (= (and b!92863 res!76641) b!92864))

(declare-fun m!136761 () Bool)

(assert (=> d!28894 m!136761))

(declare-fun m!136763 () Bool)

(assert (=> d!28894 m!136763))

(assert (=> b!92810 d!28894))

(declare-fun d!28896 () Bool)

(declare-fun size!1969 (List!840) Int)

(assert (=> d!28896 (= (length!431 listBits!13) (size!1969 listBits!13))))

(declare-fun bs!7115 () Bool)

(assert (= bs!7115 d!28896))

(declare-fun m!136765 () Bool)

(assert (=> bs!7115 m!136765))

(assert (=> b!92816 d!28896))

(declare-fun d!28898 () Bool)

(assert (=> d!28898 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4663 bitStream1!8) (currentByte!4668 bitStream1!8) (size!1967 (buf!2343 bitStream1!8))))))

(declare-fun bs!7116 () Bool)

(assert (= bs!7116 d!28898))

(assert (=> bs!7116 m!136759))

(assert (=> start!18674 d!28898))

(declare-fun d!28900 () Bool)

(assert (=> d!28900 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4663 bitStream2!8) (currentByte!4668 bitStream2!8) (size!1967 (buf!2343 bitStream2!8))))))

(declare-fun bs!7117 () Bool)

(assert (= bs!7117 d!28900))

(assert (=> bs!7117 m!136763))

(assert (=> start!18674 d!28900))

(declare-fun d!28902 () Bool)

(assert (=> d!28902 (= (inv!12 base!8) (invariant!0 (currentBit!4663 base!8) (currentByte!4668 base!8) (size!1967 (buf!2343 base!8))))))

(declare-fun bs!7118 () Bool)

(assert (= bs!7118 d!28902))

(declare-fun m!136767 () Bool)

(assert (=> bs!7118 m!136767))

(assert (=> start!18674 d!28902))

(declare-fun d!28904 () Bool)

(assert (=> d!28904 (= (array_inv!1799 (buf!2343 base!8)) (bvsge (size!1967 (buf!2343 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!92819 d!28904))

(declare-fun d!28906 () Bool)

(declare-fun res!76650 () Bool)

(declare-fun e!61012 () Bool)

(assert (=> d!28906 (=> (not res!76650) (not e!61012))))

(assert (=> d!28906 (= res!76650 (= (size!1967 (buf!2343 bitStream1!8)) (size!1967 (buf!2343 bitStream2!8))))))

(assert (=> d!28906 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!61012)))

(declare-fun b!92871 () Bool)

(declare-fun res!76649 () Bool)

(assert (=> b!92871 (=> (not res!76649) (not e!61012))))

(assert (=> b!92871 (= res!76649 (bvsle (bitIndex!0 (size!1967 (buf!2343 bitStream1!8)) (currentByte!4668 bitStream1!8) (currentBit!4663 bitStream1!8)) (bitIndex!0 (size!1967 (buf!2343 bitStream2!8)) (currentByte!4668 bitStream2!8) (currentBit!4663 bitStream2!8))))))

(declare-fun b!92872 () Bool)

(declare-fun e!61011 () Bool)

(assert (=> b!92872 (= e!61012 e!61011)))

(declare-fun res!76651 () Bool)

(assert (=> b!92872 (=> res!76651 e!61011)))

(assert (=> b!92872 (= res!76651 (= (size!1967 (buf!2343 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!92873 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4346 array!4346 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!92873 (= e!61011 (arrayBitRangesEq!0 (buf!2343 bitStream1!8) (buf!2343 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1967 (buf!2343 bitStream1!8)) (currentByte!4668 bitStream1!8) (currentBit!4663 bitStream1!8))))))

(assert (= (and d!28906 res!76650) b!92871))

(assert (= (and b!92871 res!76649) b!92872))

(assert (= (and b!92872 (not res!76651)) b!92873))

(assert (=> b!92871 m!136703))

(assert (=> b!92871 m!136705))

(assert (=> b!92873 m!136703))

(assert (=> b!92873 m!136703))

(declare-fun m!136769 () Bool)

(assert (=> b!92873 m!136769))

(assert (=> b!92814 d!28906))

(declare-fun d!28908 () Bool)

(assert (=> d!28908 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1967 (buf!2343 bitStream1!8))) ((_ sign_extend 32) (currentByte!4668 bitStream1!8)) ((_ sign_extend 32) (currentBit!4663 bitStream1!8)) nBits!484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1967 (buf!2343 bitStream1!8))) ((_ sign_extend 32) (currentByte!4668 bitStream1!8)) ((_ sign_extend 32) (currentBit!4663 bitStream1!8))) nBits!484))))

(declare-fun bs!7119 () Bool)

(assert (= bs!7119 d!28908))

(assert (=> bs!7119 m!136757))

(assert (=> b!92809 d!28908))

(declare-fun d!28910 () Bool)

(declare-fun e!61013 () Bool)

(assert (=> d!28910 e!61013))

(declare-fun res!76653 () Bool)

(assert (=> d!28910 (=> (not res!76653) (not e!61013))))

(declare-fun lt!138256 () (_ BitVec 64))

(declare-fun lt!138253 () (_ BitVec 64))

(declare-fun lt!138255 () (_ BitVec 64))

(assert (=> d!28910 (= res!76653 (= lt!138253 (bvsub lt!138256 lt!138255)))))

(assert (=> d!28910 (or (= (bvand lt!138256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138255 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138256 lt!138255) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28910 (= lt!138255 (remainingBits!0 ((_ sign_extend 32) (size!1967 (buf!2343 base!8))) ((_ sign_extend 32) (currentByte!4668 base!8)) ((_ sign_extend 32) (currentBit!4663 base!8))))))

(declare-fun lt!138258 () (_ BitVec 64))

(declare-fun lt!138254 () (_ BitVec 64))

(assert (=> d!28910 (= lt!138256 (bvmul lt!138258 lt!138254))))

(assert (=> d!28910 (or (= lt!138258 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138254 (bvsdiv (bvmul lt!138258 lt!138254) lt!138258)))))

(assert (=> d!28910 (= lt!138254 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28910 (= lt!138258 ((_ sign_extend 32) (size!1967 (buf!2343 base!8))))))

(assert (=> d!28910 (= lt!138253 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4668 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4663 base!8))))))

(assert (=> d!28910 (invariant!0 (currentBit!4663 base!8) (currentByte!4668 base!8) (size!1967 (buf!2343 base!8)))))

(assert (=> d!28910 (= (bitIndex!0 (size!1967 (buf!2343 base!8)) (currentByte!4668 base!8) (currentBit!4663 base!8)) lt!138253)))

(declare-fun b!92874 () Bool)

(declare-fun res!76652 () Bool)

(assert (=> b!92874 (=> (not res!76652) (not e!61013))))

(assert (=> b!92874 (= res!76652 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138253))))

(declare-fun b!92875 () Bool)

(declare-fun lt!138257 () (_ BitVec 64))

(assert (=> b!92875 (= e!61013 (bvsle lt!138253 (bvmul lt!138257 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92875 (or (= lt!138257 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138257 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138257)))))

(assert (=> b!92875 (= lt!138257 ((_ sign_extend 32) (size!1967 (buf!2343 base!8))))))

(assert (= (and d!28910 res!76653) b!92874))

(assert (= (and b!92874 res!76652) b!92875))

(declare-fun m!136771 () Bool)

(assert (=> d!28910 m!136771))

(assert (=> d!28910 m!136767))

(assert (=> b!92820 d!28910))

(declare-fun d!28912 () Bool)

(declare-fun res!76655 () Bool)

(declare-fun e!61015 () Bool)

(assert (=> d!28912 (=> (not res!76655) (not e!61015))))

(assert (=> d!28912 (= res!76655 (= (size!1967 (buf!2343 bitStream1!8)) (size!1967 (buf!2343 base!8))))))

(assert (=> d!28912 (= (isPrefixOf!0 bitStream1!8 base!8) e!61015)))

(declare-fun b!92876 () Bool)

(declare-fun res!76654 () Bool)

(assert (=> b!92876 (=> (not res!76654) (not e!61015))))

(assert (=> b!92876 (= res!76654 (bvsle (bitIndex!0 (size!1967 (buf!2343 bitStream1!8)) (currentByte!4668 bitStream1!8) (currentBit!4663 bitStream1!8)) (bitIndex!0 (size!1967 (buf!2343 base!8)) (currentByte!4668 base!8) (currentBit!4663 base!8))))))

(declare-fun b!92877 () Bool)

(declare-fun e!61014 () Bool)

(assert (=> b!92877 (= e!61015 e!61014)))

(declare-fun res!76656 () Bool)

(assert (=> b!92877 (=> res!76656 e!61014)))

(assert (=> b!92877 (= res!76656 (= (size!1967 (buf!2343 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!92878 () Bool)

(assert (=> b!92878 (= e!61014 (arrayBitRangesEq!0 (buf!2343 bitStream1!8) (buf!2343 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1967 (buf!2343 bitStream1!8)) (currentByte!4668 bitStream1!8) (currentBit!4663 bitStream1!8))))))

(assert (= (and d!28912 res!76655) b!92876))

(assert (= (and b!92876 res!76654) b!92877))

(assert (= (and b!92877 (not res!76656)) b!92878))

(assert (=> b!92876 m!136703))

(assert (=> b!92876 m!136707))

(assert (=> b!92878 m!136703))

(assert (=> b!92878 m!136703))

(declare-fun m!136773 () Bool)

(assert (=> b!92878 m!136773))

(assert (=> b!92818 d!28912))

(declare-fun d!28914 () Bool)

(assert (=> d!28914 (= (array_inv!1799 (buf!2343 bitStream1!8)) (bvsge (size!1967 (buf!2343 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!92811 d!28914))

(declare-fun d!28916 () Bool)

(declare-fun res!76658 () Bool)

(declare-fun e!61017 () Bool)

(assert (=> d!28916 (=> (not res!76658) (not e!61017))))

(assert (=> d!28916 (= res!76658 (= (size!1967 (buf!2343 bitStream2!8)) (size!1967 (buf!2343 base!8))))))

(assert (=> d!28916 (= (isPrefixOf!0 bitStream2!8 base!8) e!61017)))

(declare-fun b!92879 () Bool)

(declare-fun res!76657 () Bool)

(assert (=> b!92879 (=> (not res!76657) (not e!61017))))

(assert (=> b!92879 (= res!76657 (bvsle (bitIndex!0 (size!1967 (buf!2343 bitStream2!8)) (currentByte!4668 bitStream2!8) (currentBit!4663 bitStream2!8)) (bitIndex!0 (size!1967 (buf!2343 base!8)) (currentByte!4668 base!8) (currentBit!4663 base!8))))))

(declare-fun b!92880 () Bool)

(declare-fun e!61016 () Bool)

(assert (=> b!92880 (= e!61017 e!61016)))

(declare-fun res!76659 () Bool)

(assert (=> b!92880 (=> res!76659 e!61016)))

(assert (=> b!92880 (= res!76659 (= (size!1967 (buf!2343 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!92881 () Bool)

(assert (=> b!92881 (= e!61016 (arrayBitRangesEq!0 (buf!2343 bitStream2!8) (buf!2343 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1967 (buf!2343 bitStream2!8)) (currentByte!4668 bitStream2!8) (currentBit!4663 bitStream2!8))))))

(assert (= (and d!28916 res!76658) b!92879))

(assert (= (and b!92879 res!76657) b!92880))

(assert (= (and b!92880 (not res!76659)) b!92881))

(assert (=> b!92879 m!136705))

(assert (=> b!92879 m!136707))

(assert (=> b!92881 m!136705))

(assert (=> b!92881 m!136705))

(declare-fun m!136775 () Bool)

(assert (=> b!92881 m!136775))

(assert (=> b!92812 d!28916))

(check-sat (not d!28900) (not d!28892) (not b!92873) (not b!92879) (not b!92878) (not d!28902) (not b!92871) (not d!28908) (not b!92876) (not d!28910) (not d!28894) (not b!92881) (not d!28896) (not d!28898))
(check-sat)
(get-model)

(declare-fun d!28974 () Bool)

(assert (=> d!28974 (= (invariant!0 (currentBit!4663 bitStream2!8) (currentByte!4668 bitStream2!8) (size!1967 (buf!2343 bitStream2!8))) (and (bvsge (currentBit!4663 bitStream2!8) #b00000000000000000000000000000000) (bvslt (currentBit!4663 bitStream2!8) #b00000000000000000000000000001000) (bvsge (currentByte!4668 bitStream2!8) #b00000000000000000000000000000000) (or (bvslt (currentByte!4668 bitStream2!8) (size!1967 (buf!2343 bitStream2!8))) (and (= (currentBit!4663 bitStream2!8) #b00000000000000000000000000000000) (= (currentByte!4668 bitStream2!8) (size!1967 (buf!2343 bitStream2!8)))))))))

(assert (=> d!28900 d!28974))

(declare-fun d!28976 () Bool)

(assert (=> d!28976 (= (remainingBits!0 ((_ sign_extend 32) (size!1967 (buf!2343 bitStream1!8))) ((_ sign_extend 32) (currentByte!4668 bitStream1!8)) ((_ sign_extend 32) (currentBit!4663 bitStream1!8))) (bvsub (bvmul ((_ sign_extend 32) (size!1967 (buf!2343 bitStream1!8))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4668 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4663 bitStream1!8)))))))

(assert (=> d!28892 d!28976))

(declare-fun d!28978 () Bool)

(assert (=> d!28978 (= (invariant!0 (currentBit!4663 bitStream1!8) (currentByte!4668 bitStream1!8) (size!1967 (buf!2343 bitStream1!8))) (and (bvsge (currentBit!4663 bitStream1!8) #b00000000000000000000000000000000) (bvslt (currentBit!4663 bitStream1!8) #b00000000000000000000000000001000) (bvsge (currentByte!4668 bitStream1!8) #b00000000000000000000000000000000) (or (bvslt (currentByte!4668 bitStream1!8) (size!1967 (buf!2343 bitStream1!8))) (and (= (currentBit!4663 bitStream1!8) #b00000000000000000000000000000000) (= (currentByte!4668 bitStream1!8) (size!1967 (buf!2343 bitStream1!8)))))))))

(assert (=> d!28892 d!28978))

(declare-fun b!92946 () Bool)

(declare-fun res!76720 () Bool)

(declare-fun lt!138326 () (_ BitVec 32))

(assert (=> b!92946 (= res!76720 (= lt!138326 #b00000000000000000000000000000000))))

(declare-fun e!61063 () Bool)

(assert (=> b!92946 (=> res!76720 e!61063)))

(declare-fun e!61064 () Bool)

(assert (=> b!92946 (= e!61064 e!61063)))

(declare-fun b!92947 () Bool)

(declare-fun e!61061 () Bool)

(declare-fun e!61060 () Bool)

(assert (=> b!92947 (= e!61061 e!61060)))

(declare-fun c!5896 () Bool)

(declare-datatypes ((tuple4!50 0))(
  ( (tuple4!51 (_1!4055 (_ BitVec 32)) (_2!4055 (_ BitVec 32)) (_3!246 (_ BitVec 32)) (_4!25 (_ BitVec 32))) )
))
(declare-fun lt!138325 () tuple4!50)

(assert (=> b!92947 (= c!5896 (= (_3!246 lt!138325) (_4!25 lt!138325)))))

(declare-fun d!28980 () Bool)

(declare-fun res!76724 () Bool)

(declare-fun e!61065 () Bool)

(assert (=> d!28980 (=> res!76724 e!61065)))

(assert (=> d!28980 (= res!76724 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1967 (buf!2343 bitStream1!8)) (currentByte!4668 bitStream1!8) (currentBit!4663 bitStream1!8))))))

(assert (=> d!28980 (= (arrayBitRangesEq!0 (buf!2343 bitStream1!8) (buf!2343 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1967 (buf!2343 bitStream1!8)) (currentByte!4668 bitStream1!8) (currentBit!4663 bitStream1!8))) e!61065)))

(declare-fun b!92948 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!92948 (= e!61063 (byteRangesEq!0 (select (arr!2590 (buf!2343 bitStream1!8)) (_4!25 lt!138325)) (select (arr!2590 (buf!2343 base!8)) (_4!25 lt!138325)) #b00000000000000000000000000000000 lt!138326))))

(declare-fun lt!138327 () (_ BitVec 32))

(declare-fun call!1157 () Bool)

(declare-fun bm!1154 () Bool)

(assert (=> bm!1154 (= call!1157 (byteRangesEq!0 (select (arr!2590 (buf!2343 bitStream1!8)) (_3!246 lt!138325)) (select (arr!2590 (buf!2343 base!8)) (_3!246 lt!138325)) lt!138327 (ite c!5896 lt!138326 #b00000000000000000000000000001000)))))

(declare-fun b!92949 () Bool)

(assert (=> b!92949 (= e!61065 e!61061)))

(declare-fun res!76723 () Bool)

(assert (=> b!92949 (=> (not res!76723) (not e!61061))))

(declare-fun e!61062 () Bool)

(assert (=> b!92949 (= res!76723 e!61062)))

(declare-fun res!76721 () Bool)

(assert (=> b!92949 (=> res!76721 e!61062)))

(assert (=> b!92949 (= res!76721 (bvsge (_1!4055 lt!138325) (_2!4055 lt!138325)))))

(assert (=> b!92949 (= lt!138326 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1967 (buf!2343 bitStream1!8)) (currentByte!4668 bitStream1!8) (currentBit!4663 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92949 (= lt!138327 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!50)

(assert (=> b!92949 (= lt!138325 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1967 (buf!2343 bitStream1!8)) (currentByte!4668 bitStream1!8) (currentBit!4663 bitStream1!8))))))

(declare-fun b!92950 () Bool)

(declare-fun arrayRangesEq!26 (array!4346 array!4346 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!92950 (= e!61062 (arrayRangesEq!26 (buf!2343 bitStream1!8) (buf!2343 base!8) (_1!4055 lt!138325) (_2!4055 lt!138325)))))

(declare-fun b!92951 () Bool)

(assert (=> b!92951 (= e!61060 call!1157)))

(declare-fun b!92952 () Bool)

(assert (=> b!92952 (= e!61060 e!61064)))

(declare-fun res!76722 () Bool)

(assert (=> b!92952 (= res!76722 call!1157)))

(assert (=> b!92952 (=> (not res!76722) (not e!61064))))

(assert (= (and d!28980 (not res!76724)) b!92949))

(assert (= (and b!92949 (not res!76721)) b!92950))

(assert (= (and b!92949 res!76723) b!92947))

(assert (= (and b!92947 c!5896) b!92951))

(assert (= (and b!92947 (not c!5896)) b!92952))

(assert (= (and b!92952 res!76722) b!92946))

(assert (= (and b!92946 (not res!76720)) b!92948))

(assert (= (or b!92951 b!92952) bm!1154))

(declare-fun m!136817 () Bool)

(assert (=> b!92948 m!136817))

(declare-fun m!136819 () Bool)

(assert (=> b!92948 m!136819))

(assert (=> b!92948 m!136817))

(assert (=> b!92948 m!136819))

(declare-fun m!136821 () Bool)

(assert (=> b!92948 m!136821))

(declare-fun m!136823 () Bool)

(assert (=> bm!1154 m!136823))

(declare-fun m!136825 () Bool)

(assert (=> bm!1154 m!136825))

(assert (=> bm!1154 m!136823))

(assert (=> bm!1154 m!136825))

(declare-fun m!136827 () Bool)

(assert (=> bm!1154 m!136827))

(assert (=> b!92949 m!136703))

(declare-fun m!136829 () Bool)

(assert (=> b!92949 m!136829))

(declare-fun m!136831 () Bool)

(assert (=> b!92950 m!136831))

(assert (=> b!92878 d!28980))

(assert (=> b!92878 d!28892))

(assert (=> d!28908 d!28976))

(declare-fun d!28982 () Bool)

(assert (=> d!28982 (= (remainingBits!0 ((_ sign_extend 32) (size!1967 (buf!2343 bitStream2!8))) ((_ sign_extend 32) (currentByte!4668 bitStream2!8)) ((_ sign_extend 32) (currentBit!4663 bitStream2!8))) (bvsub (bvmul ((_ sign_extend 32) (size!1967 (buf!2343 bitStream2!8))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4668 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4663 bitStream2!8)))))))

(assert (=> d!28894 d!28982))

(assert (=> d!28894 d!28974))

(assert (=> b!92879 d!28894))

(assert (=> b!92879 d!28910))

(assert (=> b!92876 d!28892))

(assert (=> b!92876 d!28910))

(declare-fun d!28984 () Bool)

(declare-fun lt!138330 () Int)

(assert (=> d!28984 (>= lt!138330 0)))

(declare-fun e!61068 () Int)

(assert (=> d!28984 (= lt!138330 e!61068)))

(declare-fun c!5899 () Bool)

(get-info :version)

(assert (=> d!28984 (= c!5899 ((_ is Nil!837) listBits!13))))

(assert (=> d!28984 (= (size!1969 listBits!13) lt!138330)))

(declare-fun b!92957 () Bool)

(assert (=> b!92957 (= e!61068 0)))

(declare-fun b!92958 () Bool)

(assert (=> b!92958 (= e!61068 (+ 1 (size!1969 (t!1590 listBits!13))))))

(assert (= (and d!28984 c!5899) b!92957))

(assert (= (and d!28984 (not c!5899)) b!92958))

(declare-fun m!136833 () Bool)

(assert (=> b!92958 m!136833))

(assert (=> d!28896 d!28984))

(declare-fun d!28986 () Bool)

(assert (=> d!28986 (= (remainingBits!0 ((_ sign_extend 32) (size!1967 (buf!2343 base!8))) ((_ sign_extend 32) (currentByte!4668 base!8)) ((_ sign_extend 32) (currentBit!4663 base!8))) (bvsub (bvmul ((_ sign_extend 32) (size!1967 (buf!2343 base!8))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4668 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4663 base!8)))))))

(assert (=> d!28910 d!28986))

(declare-fun d!28988 () Bool)

(assert (=> d!28988 (= (invariant!0 (currentBit!4663 base!8) (currentByte!4668 base!8) (size!1967 (buf!2343 base!8))) (and (bvsge (currentBit!4663 base!8) #b00000000000000000000000000000000) (bvslt (currentBit!4663 base!8) #b00000000000000000000000000001000) (bvsge (currentByte!4668 base!8) #b00000000000000000000000000000000) (or (bvslt (currentByte!4668 base!8) (size!1967 (buf!2343 base!8))) (and (= (currentBit!4663 base!8) #b00000000000000000000000000000000) (= (currentByte!4668 base!8) (size!1967 (buf!2343 base!8)))))))))

(assert (=> d!28910 d!28988))

(assert (=> d!28898 d!28978))

(declare-fun b!92959 () Bool)

(declare-fun res!76725 () Bool)

(declare-fun lt!138332 () (_ BitVec 32))

(assert (=> b!92959 (= res!76725 (= lt!138332 #b00000000000000000000000000000000))))

(declare-fun e!61072 () Bool)

(assert (=> b!92959 (=> res!76725 e!61072)))

(declare-fun e!61073 () Bool)

(assert (=> b!92959 (= e!61073 e!61072)))

(declare-fun b!92960 () Bool)

(declare-fun e!61070 () Bool)

(declare-fun e!61069 () Bool)

(assert (=> b!92960 (= e!61070 e!61069)))

(declare-fun c!5900 () Bool)

(declare-fun lt!138331 () tuple4!50)

(assert (=> b!92960 (= c!5900 (= (_3!246 lt!138331) (_4!25 lt!138331)))))

(declare-fun d!28990 () Bool)

(declare-fun res!76729 () Bool)

(declare-fun e!61074 () Bool)

(assert (=> d!28990 (=> res!76729 e!61074)))

(assert (=> d!28990 (= res!76729 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1967 (buf!2343 bitStream1!8)) (currentByte!4668 bitStream1!8) (currentBit!4663 bitStream1!8))))))

(assert (=> d!28990 (= (arrayBitRangesEq!0 (buf!2343 bitStream1!8) (buf!2343 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1967 (buf!2343 bitStream1!8)) (currentByte!4668 bitStream1!8) (currentBit!4663 bitStream1!8))) e!61074)))

(declare-fun b!92961 () Bool)

(assert (=> b!92961 (= e!61072 (byteRangesEq!0 (select (arr!2590 (buf!2343 bitStream1!8)) (_4!25 lt!138331)) (select (arr!2590 (buf!2343 bitStream2!8)) (_4!25 lt!138331)) #b00000000000000000000000000000000 lt!138332))))

(declare-fun call!1158 () Bool)

(declare-fun lt!138333 () (_ BitVec 32))

(declare-fun bm!1155 () Bool)

(assert (=> bm!1155 (= call!1158 (byteRangesEq!0 (select (arr!2590 (buf!2343 bitStream1!8)) (_3!246 lt!138331)) (select (arr!2590 (buf!2343 bitStream2!8)) (_3!246 lt!138331)) lt!138333 (ite c!5900 lt!138332 #b00000000000000000000000000001000)))))

(declare-fun b!92962 () Bool)

(assert (=> b!92962 (= e!61074 e!61070)))

(declare-fun res!76728 () Bool)

(assert (=> b!92962 (=> (not res!76728) (not e!61070))))

(declare-fun e!61071 () Bool)

(assert (=> b!92962 (= res!76728 e!61071)))

(declare-fun res!76726 () Bool)

(assert (=> b!92962 (=> res!76726 e!61071)))

(assert (=> b!92962 (= res!76726 (bvsge (_1!4055 lt!138331) (_2!4055 lt!138331)))))

(assert (=> b!92962 (= lt!138332 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1967 (buf!2343 bitStream1!8)) (currentByte!4668 bitStream1!8) (currentBit!4663 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92962 (= lt!138333 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92962 (= lt!138331 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1967 (buf!2343 bitStream1!8)) (currentByte!4668 bitStream1!8) (currentBit!4663 bitStream1!8))))))

(declare-fun b!92963 () Bool)

(assert (=> b!92963 (= e!61071 (arrayRangesEq!26 (buf!2343 bitStream1!8) (buf!2343 bitStream2!8) (_1!4055 lt!138331) (_2!4055 lt!138331)))))

(declare-fun b!92964 () Bool)

(assert (=> b!92964 (= e!61069 call!1158)))

(declare-fun b!92965 () Bool)

(assert (=> b!92965 (= e!61069 e!61073)))

(declare-fun res!76727 () Bool)

(assert (=> b!92965 (= res!76727 call!1158)))

(assert (=> b!92965 (=> (not res!76727) (not e!61073))))

(assert (= (and d!28990 (not res!76729)) b!92962))

(assert (= (and b!92962 (not res!76726)) b!92963))

(assert (= (and b!92962 res!76728) b!92960))

(assert (= (and b!92960 c!5900) b!92964))

(assert (= (and b!92960 (not c!5900)) b!92965))

(assert (= (and b!92965 res!76727) b!92959))

(assert (= (and b!92959 (not res!76725)) b!92961))

(assert (= (or b!92964 b!92965) bm!1155))

(declare-fun m!136835 () Bool)

(assert (=> b!92961 m!136835))

(declare-fun m!136837 () Bool)

(assert (=> b!92961 m!136837))

(assert (=> b!92961 m!136835))

(assert (=> b!92961 m!136837))

(declare-fun m!136839 () Bool)

(assert (=> b!92961 m!136839))

(declare-fun m!136841 () Bool)

(assert (=> bm!1155 m!136841))

(declare-fun m!136843 () Bool)

(assert (=> bm!1155 m!136843))

(assert (=> bm!1155 m!136841))

(assert (=> bm!1155 m!136843))

(declare-fun m!136845 () Bool)

(assert (=> bm!1155 m!136845))

(assert (=> b!92962 m!136703))

(assert (=> b!92962 m!136829))

(declare-fun m!136847 () Bool)

(assert (=> b!92963 m!136847))

(assert (=> b!92873 d!28990))

(assert (=> b!92873 d!28892))

(declare-fun b!92966 () Bool)

(declare-fun res!76730 () Bool)

(declare-fun lt!138335 () (_ BitVec 32))

(assert (=> b!92966 (= res!76730 (= lt!138335 #b00000000000000000000000000000000))))

(declare-fun e!61078 () Bool)

(assert (=> b!92966 (=> res!76730 e!61078)))

(declare-fun e!61079 () Bool)

(assert (=> b!92966 (= e!61079 e!61078)))

(declare-fun b!92967 () Bool)

(declare-fun e!61076 () Bool)

(declare-fun e!61075 () Bool)

(assert (=> b!92967 (= e!61076 e!61075)))

(declare-fun c!5901 () Bool)

(declare-fun lt!138334 () tuple4!50)

(assert (=> b!92967 (= c!5901 (= (_3!246 lt!138334) (_4!25 lt!138334)))))

(declare-fun d!28992 () Bool)

(declare-fun res!76734 () Bool)

(declare-fun e!61080 () Bool)

(assert (=> d!28992 (=> res!76734 e!61080)))

(assert (=> d!28992 (= res!76734 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1967 (buf!2343 bitStream2!8)) (currentByte!4668 bitStream2!8) (currentBit!4663 bitStream2!8))))))

(assert (=> d!28992 (= (arrayBitRangesEq!0 (buf!2343 bitStream2!8) (buf!2343 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1967 (buf!2343 bitStream2!8)) (currentByte!4668 bitStream2!8) (currentBit!4663 bitStream2!8))) e!61080)))

(declare-fun b!92968 () Bool)

(assert (=> b!92968 (= e!61078 (byteRangesEq!0 (select (arr!2590 (buf!2343 bitStream2!8)) (_4!25 lt!138334)) (select (arr!2590 (buf!2343 base!8)) (_4!25 lt!138334)) #b00000000000000000000000000000000 lt!138335))))

(declare-fun lt!138336 () (_ BitVec 32))

(declare-fun call!1159 () Bool)

(declare-fun bm!1156 () Bool)

(assert (=> bm!1156 (= call!1159 (byteRangesEq!0 (select (arr!2590 (buf!2343 bitStream2!8)) (_3!246 lt!138334)) (select (arr!2590 (buf!2343 base!8)) (_3!246 lt!138334)) lt!138336 (ite c!5901 lt!138335 #b00000000000000000000000000001000)))))

(declare-fun b!92969 () Bool)

(assert (=> b!92969 (= e!61080 e!61076)))

(declare-fun res!76733 () Bool)

(assert (=> b!92969 (=> (not res!76733) (not e!61076))))

(declare-fun e!61077 () Bool)

(assert (=> b!92969 (= res!76733 e!61077)))

(declare-fun res!76731 () Bool)

(assert (=> b!92969 (=> res!76731 e!61077)))

(assert (=> b!92969 (= res!76731 (bvsge (_1!4055 lt!138334) (_2!4055 lt!138334)))))

(assert (=> b!92969 (= lt!138335 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1967 (buf!2343 bitStream2!8)) (currentByte!4668 bitStream2!8) (currentBit!4663 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92969 (= lt!138336 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92969 (= lt!138334 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1967 (buf!2343 bitStream2!8)) (currentByte!4668 bitStream2!8) (currentBit!4663 bitStream2!8))))))

(declare-fun b!92970 () Bool)

(assert (=> b!92970 (= e!61077 (arrayRangesEq!26 (buf!2343 bitStream2!8) (buf!2343 base!8) (_1!4055 lt!138334) (_2!4055 lt!138334)))))

(declare-fun b!92971 () Bool)

(assert (=> b!92971 (= e!61075 call!1159)))

(declare-fun b!92972 () Bool)

(assert (=> b!92972 (= e!61075 e!61079)))

(declare-fun res!76732 () Bool)

(assert (=> b!92972 (= res!76732 call!1159)))

(assert (=> b!92972 (=> (not res!76732) (not e!61079))))

(assert (= (and d!28992 (not res!76734)) b!92969))

(assert (= (and b!92969 (not res!76731)) b!92970))

(assert (= (and b!92969 res!76733) b!92967))

(assert (= (and b!92967 c!5901) b!92971))

(assert (= (and b!92967 (not c!5901)) b!92972))

(assert (= (and b!92972 res!76732) b!92966))

(assert (= (and b!92966 (not res!76730)) b!92968))

(assert (= (or b!92971 b!92972) bm!1156))

(declare-fun m!136849 () Bool)

(assert (=> b!92968 m!136849))

(declare-fun m!136851 () Bool)

(assert (=> b!92968 m!136851))

(assert (=> b!92968 m!136849))

(assert (=> b!92968 m!136851))

(declare-fun m!136853 () Bool)

(assert (=> b!92968 m!136853))

(declare-fun m!136855 () Bool)

(assert (=> bm!1156 m!136855))

(declare-fun m!136857 () Bool)

(assert (=> bm!1156 m!136857))

(assert (=> bm!1156 m!136855))

(assert (=> bm!1156 m!136857))

(declare-fun m!136859 () Bool)

(assert (=> bm!1156 m!136859))

(assert (=> b!92969 m!136705))

(declare-fun m!136861 () Bool)

(assert (=> b!92969 m!136861))

(declare-fun m!136863 () Bool)

(assert (=> b!92970 m!136863))

(assert (=> b!92881 d!28992))

(assert (=> b!92881 d!28894))

(assert (=> b!92871 d!28892))

(assert (=> b!92871 d!28894))

(assert (=> d!28902 d!28988))

(check-sat (not b!92950) (not b!92961) (not bm!1156) (not b!92958) (not b!92970) (not b!92948) (not bm!1155) (not b!92963) (not b!92968) (not bm!1154) (not b!92962) (not b!92949) (not b!92969))
(check-sat)
