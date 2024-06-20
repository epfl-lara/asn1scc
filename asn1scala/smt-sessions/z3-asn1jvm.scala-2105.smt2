; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53354 () Bool)

(assert start!53354)

(declare-fun b!247746 () Bool)

(declare-fun e!171659 () Bool)

(declare-datatypes ((array!13524 0))(
  ( (array!13525 (arr!6917 (Array (_ BitVec 32) (_ BitVec 8))) (size!5930 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10782 0))(
  ( (BitStream!10783 (buf!6414 array!13524) (currentByte!11827 (_ BitVec 32)) (currentBit!11822 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10782)

(declare-fun array_inv!5671 (array!13524) Bool)

(assert (=> b!247746 (= e!171659 (array_inv!5671 (buf!6414 thiss!1005)))))

(declare-fun b!247747 () Bool)

(declare-fun res!207333 () Bool)

(declare-fun e!171658 () Bool)

(assert (=> b!247747 (=> (not res!207333) (not e!171658))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247747 (= res!207333 (validate_offset_bits!1 ((_ sign_extend 32) (size!5930 (buf!6414 thiss!1005))) ((_ sign_extend 32) (currentByte!11827 thiss!1005)) ((_ sign_extend 32) (currentBit!11822 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!247748 () Bool)

(declare-fun e!171660 () Bool)

(declare-fun e!171662 () Bool)

(assert (=> b!247748 (= e!171660 e!171662)))

(declare-fun res!207329 () Bool)

(assert (=> b!247748 (=> res!207329 e!171662)))

(declare-fun lt!386027 () (_ BitVec 64))

(assert (=> b!247748 (= res!207329 (not (= lt!386027 (bvadd lt!386027 (bvsub nBits!297 from!289)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!247748 (= lt!386027 (bitIndex!0 (size!5930 (buf!6414 thiss!1005)) (currentByte!11827 thiss!1005) (currentBit!11822 thiss!1005)))))

(declare-fun b!247749 () Bool)

(declare-fun res!207332 () Bool)

(assert (=> b!247749 (=> (not res!207332) (not e!171658))))

(assert (=> b!247749 (= res!207332 (bvsge from!289 nBits!297))))

(declare-fun res!207331 () Bool)

(assert (=> start!53354 (=> (not res!207331) (not e!171658))))

(assert (=> start!53354 (= res!207331 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53354 e!171658))

(assert (=> start!53354 true))

(declare-fun inv!12 (BitStream!10782) Bool)

(assert (=> start!53354 (and (inv!12 thiss!1005) e!171659)))

(declare-fun b!247750 () Bool)

(assert (=> b!247750 (= e!171658 (not e!171660))))

(declare-fun res!207330 () Bool)

(assert (=> b!247750 (=> res!207330 e!171660)))

(assert (=> b!247750 (= res!207330 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!10782 BitStream!10782) Bool)

(assert (=> b!247750 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!17978 0))(
  ( (Unit!17979) )
))
(declare-fun lt!386026 () Unit!17978)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10782) Unit!17978)

(assert (=> b!247750 (= lt!386026 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-datatypes ((tuple2!21248 0))(
  ( (tuple2!21249 (_1!11546 BitStream!10782) (_2!11546 BitStream!10782)) )
))
(declare-fun lt!386025 () tuple2!21248)

(declare-fun b!247751 () Bool)

(assert (=> b!247751 (= e!171662 (validate_offset_bits!1 ((_ sign_extend 32) (size!5930 (buf!6414 (_1!11546 lt!386025)))) ((_ sign_extend 32) (currentByte!11827 (_1!11546 lt!386025))) ((_ sign_extend 32) (currentBit!11822 (_1!11546 lt!386025))) (bvsub nBits!297 from!289)))))

(declare-fun lt!386028 () Unit!17978)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10782 array!13524 (_ BitVec 64)) Unit!17978)

(assert (=> b!247751 (= lt!386028 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6414 thiss!1005) (bvsub nBits!297 from!289)))))

(declare-fun reader!0 (BitStream!10782 BitStream!10782) tuple2!21248)

(assert (=> b!247751 (= lt!386025 (reader!0 thiss!1005 thiss!1005))))

(assert (= (and start!53354 res!207331) b!247747))

(assert (= (and b!247747 res!207333) b!247749))

(assert (= (and b!247749 res!207332) b!247750))

(assert (= (and b!247750 (not res!207330)) b!247748))

(assert (= (and b!247748 (not res!207329)) b!247751))

(assert (= start!53354 b!247746))

(declare-fun m!373407 () Bool)

(assert (=> b!247751 m!373407))

(declare-fun m!373409 () Bool)

(assert (=> b!247751 m!373409))

(declare-fun m!373411 () Bool)

(assert (=> b!247751 m!373411))

(declare-fun m!373413 () Bool)

(assert (=> b!247747 m!373413))

(declare-fun m!373415 () Bool)

(assert (=> b!247746 m!373415))

(declare-fun m!373417 () Bool)

(assert (=> start!53354 m!373417))

(declare-fun m!373419 () Bool)

(assert (=> b!247750 m!373419))

(declare-fun m!373421 () Bool)

(assert (=> b!247750 m!373421))

(declare-fun m!373423 () Bool)

(assert (=> b!247748 m!373423))

(check-sat (not b!247750) (not start!53354) (not b!247751) (not b!247746) (not b!247747) (not b!247748))
(check-sat)
(get-model)

(declare-fun d!82942 () Bool)

(declare-fun e!171698 () Bool)

(assert (=> d!82942 e!171698))

(declare-fun res!207383 () Bool)

(assert (=> d!82942 (=> (not res!207383) (not e!171698))))

(declare-fun lt!386220 () (_ BitVec 64))

(declare-fun lt!386219 () (_ BitVec 64))

(declare-fun lt!386217 () (_ BitVec 64))

(assert (=> d!82942 (= res!207383 (= lt!386219 (bvsub lt!386220 lt!386217)))))

(assert (=> d!82942 (or (= (bvand lt!386220 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!386217 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!386220 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!386220 lt!386217) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!82942 (= lt!386217 (remainingBits!0 ((_ sign_extend 32) (size!5930 (buf!6414 thiss!1005))) ((_ sign_extend 32) (currentByte!11827 thiss!1005)) ((_ sign_extend 32) (currentBit!11822 thiss!1005))))))

(declare-fun lt!386218 () (_ BitVec 64))

(declare-fun lt!386215 () (_ BitVec 64))

(assert (=> d!82942 (= lt!386220 (bvmul lt!386218 lt!386215))))

(assert (=> d!82942 (or (= lt!386218 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!386215 (bvsdiv (bvmul lt!386218 lt!386215) lt!386218)))))

(assert (=> d!82942 (= lt!386215 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82942 (= lt!386218 ((_ sign_extend 32) (size!5930 (buf!6414 thiss!1005))))))

(assert (=> d!82942 (= lt!386219 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11827 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11822 thiss!1005))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!82942 (invariant!0 (currentBit!11822 thiss!1005) (currentByte!11827 thiss!1005) (size!5930 (buf!6414 thiss!1005)))))

(assert (=> d!82942 (= (bitIndex!0 (size!5930 (buf!6414 thiss!1005)) (currentByte!11827 thiss!1005) (currentBit!11822 thiss!1005)) lt!386219)))

(declare-fun b!247816 () Bool)

(declare-fun res!207384 () Bool)

(assert (=> b!247816 (=> (not res!207384) (not e!171698))))

(assert (=> b!247816 (= res!207384 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!386219))))

(declare-fun b!247817 () Bool)

(declare-fun lt!386216 () (_ BitVec 64))

(assert (=> b!247817 (= e!171698 (bvsle lt!386219 (bvmul lt!386216 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!247817 (or (= lt!386216 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!386216 #b0000000000000000000000000000000000000000000000000000000000001000) lt!386216)))))

(assert (=> b!247817 (= lt!386216 ((_ sign_extend 32) (size!5930 (buf!6414 thiss!1005))))))

(assert (= (and d!82942 res!207383) b!247816))

(assert (= (and b!247816 res!207384) b!247817))

(declare-fun m!373499 () Bool)

(assert (=> d!82942 m!373499))

(declare-fun m!373501 () Bool)

(assert (=> d!82942 m!373501))

(assert (=> b!247748 d!82942))

(declare-fun d!82954 () Bool)

(declare-fun res!207409 () Bool)

(declare-fun e!171715 () Bool)

(assert (=> d!82954 (=> (not res!207409) (not e!171715))))

(assert (=> d!82954 (= res!207409 (= (size!5930 (buf!6414 thiss!1005)) (size!5930 (buf!6414 thiss!1005))))))

(assert (=> d!82954 (= (isPrefixOf!0 thiss!1005 thiss!1005) e!171715)))

(declare-fun b!247842 () Bool)

(declare-fun res!207410 () Bool)

(assert (=> b!247842 (=> (not res!207410) (not e!171715))))

(assert (=> b!247842 (= res!207410 (bvsle (bitIndex!0 (size!5930 (buf!6414 thiss!1005)) (currentByte!11827 thiss!1005) (currentBit!11822 thiss!1005)) (bitIndex!0 (size!5930 (buf!6414 thiss!1005)) (currentByte!11827 thiss!1005) (currentBit!11822 thiss!1005))))))

(declare-fun b!247843 () Bool)

(declare-fun e!171716 () Bool)

(assert (=> b!247843 (= e!171715 e!171716)))

(declare-fun res!207411 () Bool)

(assert (=> b!247843 (=> res!207411 e!171716)))

(assert (=> b!247843 (= res!207411 (= (size!5930 (buf!6414 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!247844 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13524 array!13524 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247844 (= e!171716 (arrayBitRangesEq!0 (buf!6414 thiss!1005) (buf!6414 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5930 (buf!6414 thiss!1005)) (currentByte!11827 thiss!1005) (currentBit!11822 thiss!1005))))))

(assert (= (and d!82954 res!207409) b!247842))

(assert (= (and b!247842 res!207410) b!247843))

(assert (= (and b!247843 (not res!207411)) b!247844))

(assert (=> b!247842 m!373423))

(assert (=> b!247842 m!373423))

(assert (=> b!247844 m!373423))

(assert (=> b!247844 m!373423))

(declare-fun m!373509 () Bool)

(assert (=> b!247844 m!373509))

(assert (=> b!247750 d!82954))

(declare-fun d!82960 () Bool)

(assert (=> d!82960 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-fun lt!386229 () Unit!17978)

(declare-fun choose!11 (BitStream!10782) Unit!17978)

(assert (=> d!82960 (= lt!386229 (choose!11 thiss!1005))))

(assert (=> d!82960 (= (lemmaIsPrefixRefl!0 thiss!1005) lt!386229)))

(declare-fun bs!21030 () Bool)

(assert (= bs!21030 d!82960))

(assert (=> bs!21030 m!373419))

(declare-fun m!373513 () Bool)

(assert (=> bs!21030 m!373513))

(assert (=> b!247750 d!82960))

(declare-fun d!82962 () Bool)

(assert (=> d!82962 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11822 thiss!1005) (currentByte!11827 thiss!1005) (size!5930 (buf!6414 thiss!1005))))))

(declare-fun bs!21031 () Bool)

(assert (= bs!21031 d!82962))

(assert (=> bs!21031 m!373501))

(assert (=> start!53354 d!82962))

(declare-fun d!82964 () Bool)

(assert (=> d!82964 (= (array_inv!5671 (buf!6414 thiss!1005)) (bvsge (size!5930 (buf!6414 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!247746 d!82964))

(declare-fun d!82966 () Bool)

(assert (=> d!82966 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5930 (buf!6414 (_1!11546 lt!386025)))) ((_ sign_extend 32) (currentByte!11827 (_1!11546 lt!386025))) ((_ sign_extend 32) (currentBit!11822 (_1!11546 lt!386025))) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5930 (buf!6414 (_1!11546 lt!386025)))) ((_ sign_extend 32) (currentByte!11827 (_1!11546 lt!386025))) ((_ sign_extend 32) (currentBit!11822 (_1!11546 lt!386025)))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21032 () Bool)

(assert (= bs!21032 d!82966))

(declare-fun m!373515 () Bool)

(assert (=> bs!21032 m!373515))

(assert (=> b!247751 d!82966))

(declare-fun d!82968 () Bool)

(assert (=> d!82968 (validate_offset_bits!1 ((_ sign_extend 32) (size!5930 (buf!6414 thiss!1005))) ((_ sign_extend 32) (currentByte!11827 thiss!1005)) ((_ sign_extend 32) (currentBit!11822 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!386232 () Unit!17978)

(declare-fun choose!9 (BitStream!10782 array!13524 (_ BitVec 64) BitStream!10782) Unit!17978)

(assert (=> d!82968 (= lt!386232 (choose!9 thiss!1005 (buf!6414 thiss!1005) (bvsub nBits!297 from!289) (BitStream!10783 (buf!6414 thiss!1005) (currentByte!11827 thiss!1005) (currentBit!11822 thiss!1005))))))

(assert (=> d!82968 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6414 thiss!1005) (bvsub nBits!297 from!289)) lt!386232)))

(declare-fun bs!21033 () Bool)

(assert (= bs!21033 d!82968))

(assert (=> bs!21033 m!373413))

(declare-fun m!373517 () Bool)

(assert (=> bs!21033 m!373517))

(assert (=> b!247751 d!82968))

(declare-fun b!247855 () Bool)

(declare-fun res!207420 () Bool)

(declare-fun e!171722 () Bool)

(assert (=> b!247855 (=> (not res!207420) (not e!171722))))

(declare-fun lt!386286 () tuple2!21248)

(assert (=> b!247855 (= res!207420 (isPrefixOf!0 (_2!11546 lt!386286) thiss!1005))))

(declare-fun b!247856 () Bool)

(declare-fun res!207418 () Bool)

(assert (=> b!247856 (=> (not res!207418) (not e!171722))))

(assert (=> b!247856 (= res!207418 (isPrefixOf!0 (_1!11546 lt!386286) thiss!1005))))

(declare-fun d!82970 () Bool)

(assert (=> d!82970 e!171722))

(declare-fun res!207419 () Bool)

(assert (=> d!82970 (=> (not res!207419) (not e!171722))))

(assert (=> d!82970 (= res!207419 (isPrefixOf!0 (_1!11546 lt!386286) (_2!11546 lt!386286)))))

(declare-fun lt!386291 () BitStream!10782)

(assert (=> d!82970 (= lt!386286 (tuple2!21249 lt!386291 thiss!1005))))

(declare-fun lt!386276 () Unit!17978)

(declare-fun lt!386284 () Unit!17978)

(assert (=> d!82970 (= lt!386276 lt!386284)))

(assert (=> d!82970 (isPrefixOf!0 lt!386291 thiss!1005)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10782 BitStream!10782 BitStream!10782) Unit!17978)

(assert (=> d!82970 (= lt!386284 (lemmaIsPrefixTransitive!0 lt!386291 thiss!1005 thiss!1005))))

(declare-fun lt!386289 () Unit!17978)

(declare-fun lt!386288 () Unit!17978)

(assert (=> d!82970 (= lt!386289 lt!386288)))

(assert (=> d!82970 (isPrefixOf!0 lt!386291 thiss!1005)))

(assert (=> d!82970 (= lt!386288 (lemmaIsPrefixTransitive!0 lt!386291 thiss!1005 thiss!1005))))

(declare-fun lt!386281 () Unit!17978)

(declare-fun e!171721 () Unit!17978)

(assert (=> d!82970 (= lt!386281 e!171721)))

(declare-fun c!11521 () Bool)

(assert (=> d!82970 (= c!11521 (not (= (size!5930 (buf!6414 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!386277 () Unit!17978)

(declare-fun lt!386282 () Unit!17978)

(assert (=> d!82970 (= lt!386277 lt!386282)))

(assert (=> d!82970 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!82970 (= lt!386282 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun lt!386275 () Unit!17978)

(declare-fun lt!386279 () Unit!17978)

(assert (=> d!82970 (= lt!386275 lt!386279)))

(assert (=> d!82970 (= lt!386279 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun lt!386278 () Unit!17978)

(declare-fun lt!386274 () Unit!17978)

(assert (=> d!82970 (= lt!386278 lt!386274)))

(assert (=> d!82970 (isPrefixOf!0 lt!386291 lt!386291)))

(assert (=> d!82970 (= lt!386274 (lemmaIsPrefixRefl!0 lt!386291))))

(declare-fun lt!386280 () Unit!17978)

(declare-fun lt!386290 () Unit!17978)

(assert (=> d!82970 (= lt!386280 lt!386290)))

(assert (=> d!82970 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!82970 (= lt!386290 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!82970 (= lt!386291 (BitStream!10783 (buf!6414 thiss!1005) (currentByte!11827 thiss!1005) (currentBit!11822 thiss!1005)))))

(assert (=> d!82970 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!82970 (= (reader!0 thiss!1005 thiss!1005) lt!386286)))

(declare-fun b!247857 () Bool)

(declare-fun lt!386285 () (_ BitVec 64))

(declare-fun lt!386273 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!10782 (_ BitVec 64)) BitStream!10782)

(assert (=> b!247857 (= e!171722 (= (_1!11546 lt!386286) (withMovedBitIndex!0 (_2!11546 lt!386286) (bvsub lt!386285 lt!386273))))))

(assert (=> b!247857 (or (= (bvand lt!386285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!386273 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!386285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!386285 lt!386273) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!247857 (= lt!386273 (bitIndex!0 (size!5930 (buf!6414 thiss!1005)) (currentByte!11827 thiss!1005) (currentBit!11822 thiss!1005)))))

(assert (=> b!247857 (= lt!386285 (bitIndex!0 (size!5930 (buf!6414 thiss!1005)) (currentByte!11827 thiss!1005) (currentBit!11822 thiss!1005)))))

(declare-fun b!247858 () Bool)

(declare-fun lt!386283 () Unit!17978)

(assert (=> b!247858 (= e!171721 lt!386283)))

(declare-fun lt!386292 () (_ BitVec 64))

(assert (=> b!247858 (= lt!386292 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!386287 () (_ BitVec 64))

(assert (=> b!247858 (= lt!386287 (bitIndex!0 (size!5930 (buf!6414 thiss!1005)) (currentByte!11827 thiss!1005) (currentBit!11822 thiss!1005)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13524 array!13524 (_ BitVec 64) (_ BitVec 64)) Unit!17978)

(assert (=> b!247858 (= lt!386283 (arrayBitRangesEqSymmetric!0 (buf!6414 thiss!1005) (buf!6414 thiss!1005) lt!386292 lt!386287))))

(assert (=> b!247858 (arrayBitRangesEq!0 (buf!6414 thiss!1005) (buf!6414 thiss!1005) lt!386292 lt!386287)))

(declare-fun b!247859 () Bool)

(declare-fun Unit!17984 () Unit!17978)

(assert (=> b!247859 (= e!171721 Unit!17984)))

(assert (= (and d!82970 c!11521) b!247858))

(assert (= (and d!82970 (not c!11521)) b!247859))

(assert (= (and d!82970 res!207419) b!247856))

(assert (= (and b!247856 res!207418) b!247855))

(assert (= (and b!247855 res!207420) b!247857))

(assert (=> b!247858 m!373423))

(declare-fun m!373519 () Bool)

(assert (=> b!247858 m!373519))

(declare-fun m!373521 () Bool)

(assert (=> b!247858 m!373521))

(declare-fun m!373523 () Bool)

(assert (=> b!247856 m!373523))

(declare-fun m!373525 () Bool)

(assert (=> b!247855 m!373525))

(declare-fun m!373527 () Bool)

(assert (=> b!247857 m!373527))

(assert (=> b!247857 m!373423))

(assert (=> b!247857 m!373423))

(declare-fun m!373529 () Bool)

(assert (=> d!82970 m!373529))

(declare-fun m!373531 () Bool)

(assert (=> d!82970 m!373531))

(declare-fun m!373533 () Bool)

(assert (=> d!82970 m!373533))

(declare-fun m!373535 () Bool)

(assert (=> d!82970 m!373535))

(assert (=> d!82970 m!373421))

(assert (=> d!82970 m!373419))

(assert (=> d!82970 m!373421))

(assert (=> d!82970 m!373419))

(declare-fun m!373537 () Bool)

(assert (=> d!82970 m!373537))

(assert (=> d!82970 m!373419))

(assert (=> d!82970 m!373529))

(assert (=> b!247751 d!82970))

(declare-fun d!82972 () Bool)

(assert (=> d!82972 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5930 (buf!6414 thiss!1005))) ((_ sign_extend 32) (currentByte!11827 thiss!1005)) ((_ sign_extend 32) (currentBit!11822 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5930 (buf!6414 thiss!1005))) ((_ sign_extend 32) (currentByte!11827 thiss!1005)) ((_ sign_extend 32) (currentBit!11822 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21034 () Bool)

(assert (= bs!21034 d!82972))

(assert (=> bs!21034 m!373499))

(assert (=> b!247747 d!82972))

(check-sat (not b!247855) (not d!82966) (not d!82942) (not b!247857) (not b!247842) (not d!82960) (not b!247858) (not d!82970) (not b!247844) (not d!82962) (not b!247856) (not d!82972) (not d!82968))
(check-sat)
