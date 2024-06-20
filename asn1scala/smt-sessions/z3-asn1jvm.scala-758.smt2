; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21744 () Bool)

(assert start!21744)

(declare-datatypes ((array!5002 0))(
  ( (array!5003 (arr!2869 (Array (_ BitVec 32) (_ BitVec 8))) (size!2276 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4026 0))(
  ( (BitStream!4027 (buf!2670 array!5002) (currentByte!5212 (_ BitVec 32)) (currentBit!5207 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9152 0))(
  ( (tuple2!9153 (_1!4833 BitStream!4026) (_2!4833 BitStream!4026)) )
))
(declare-fun lt!166816 () tuple2!9152)

(declare-datatypes ((tuple2!9154 0))(
  ( (tuple2!9155 (_1!4834 BitStream!4026) (_2!4834 (_ BitVec 64))) )
))
(declare-fun lt!166800 () tuple2!9154)

(declare-fun e!72066 () Bool)

(declare-fun lt!166823 () tuple2!9154)

(declare-fun lt!166810 () BitStream!4026)

(declare-fun lt!166794 () (_ BitVec 64))

(declare-fun lt!166822 () (_ BitVec 64))

(declare-fun b!109955 () Bool)

(declare-fun lt!166808 () tuple2!9152)

(assert (=> b!109955 (= e!72066 (and (= lt!166794 (bvsub lt!166822 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4833 lt!166816) lt!166810)) (and (= (_2!4834 lt!166823) (_2!4834 lt!166800)) (= (_1!4834 lt!166823) (_2!4833 lt!166808))))))))

(declare-fun e!72074 () Bool)

(declare-fun lt!166820 () (_ BitVec 64))

(declare-fun lt!166802 () (_ BitVec 64))

(declare-fun lt!166795 () (_ BitVec 64))

(declare-fun b!109956 () Bool)

(assert (=> b!109956 (= e!72074 (or (not (= (bvand lt!166820 lt!166802) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!166820 lt!166795) lt!166820)))))

(declare-fun b!109957 () Bool)

(declare-fun e!72068 () Bool)

(declare-datatypes ((tuple2!9156 0))(
  ( (tuple2!9157 (_1!4835 BitStream!4026) (_2!4835 Bool)) )
))
(declare-fun lt!166821 () tuple2!9156)

(declare-fun lt!166804 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109957 (= e!72068 (= (bitIndex!0 (size!2276 (buf!2670 (_1!4835 lt!166821))) (currentByte!5212 (_1!4835 lt!166821)) (currentBit!5207 (_1!4835 lt!166821))) lt!166804))))

(declare-fun b!109958 () Bool)

(declare-fun e!72071 () Bool)

(declare-fun e!72070 () Bool)

(assert (=> b!109958 (= e!72071 e!72070)))

(declare-fun res!90761 () Bool)

(assert (=> b!109958 (=> (not res!90761) (not e!72070))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!109958 (= res!90761 (and (= (bvand v!199 lt!166795) v!199) (bvslt i!615 nBits!396)))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109958 (= lt!166795 (onesLSBLong!0 nBits!396))))

(declare-fun b!109959 () Bool)

(declare-fun e!72069 () Bool)

(assert (=> b!109959 (= e!72069 e!72068)))

(declare-fun res!90759 () Bool)

(assert (=> b!109959 (=> (not res!90759) (not e!72068))))

(declare-fun lt!166799 () Bool)

(declare-datatypes ((Unit!6717 0))(
  ( (Unit!6718) )
))
(declare-datatypes ((tuple2!9158 0))(
  ( (tuple2!9159 (_1!4836 Unit!6717) (_2!4836 BitStream!4026)) )
))
(declare-fun lt!166796 () tuple2!9158)

(assert (=> b!109959 (= res!90759 (and (= (_2!4835 lt!166821) lt!166799) (= (_1!4835 lt!166821) (_2!4836 lt!166796))))))

(declare-fun thiss!1305 () BitStream!4026)

(declare-fun readBitPure!0 (BitStream!4026) tuple2!9156)

(declare-fun readerFrom!0 (BitStream!4026 (_ BitVec 32) (_ BitVec 32)) BitStream!4026)

(assert (=> b!109959 (= lt!166821 (readBitPure!0 (readerFrom!0 (_2!4836 lt!166796) (currentBit!5207 thiss!1305) (currentByte!5212 thiss!1305))))))

(declare-fun b!109960 () Bool)

(declare-fun e!72073 () Bool)

(assert (=> b!109960 (= e!72070 (not e!72073))))

(declare-fun res!90764 () Bool)

(assert (=> b!109960 (=> res!90764 e!72073)))

(assert (=> b!109960 (= res!90764 (not (= (_1!4834 lt!166800) (_2!4833 lt!166816))))))

(declare-fun lt!166797 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4026 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9154)

(assert (=> b!109960 (= lt!166800 (readNLeastSignificantBitsLoopPure!0 (_1!4833 lt!166816) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!166797))))

(declare-fun lt!166793 () tuple2!9158)

(declare-fun lt!166801 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!109960 (validate_offset_bits!1 ((_ sign_extend 32) (size!2276 (buf!2670 (_2!4836 lt!166793)))) ((_ sign_extend 32) (currentByte!5212 (_2!4836 lt!166796))) ((_ sign_extend 32) (currentBit!5207 (_2!4836 lt!166796))) lt!166801)))

(declare-fun lt!166803 () Unit!6717)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4026 array!5002 (_ BitVec 64)) Unit!6717)

(assert (=> b!109960 (= lt!166803 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4836 lt!166796) (buf!2670 (_2!4836 lt!166793)) lt!166801))))

(assert (=> b!109960 (= lt!166801 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!166798 () tuple2!9156)

(declare-fun lt!166809 () (_ BitVec 64))

(assert (=> b!109960 (= lt!166797 (bvor lt!166820 (ite (_2!4835 lt!166798) lt!166809 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109960 (= lt!166823 (readNLeastSignificantBitsLoopPure!0 (_1!4833 lt!166808) nBits!396 i!615 lt!166820))))

(declare-fun lt!166818 () (_ BitVec 64))

(assert (=> b!109960 (validate_offset_bits!1 ((_ sign_extend 32) (size!2276 (buf!2670 (_2!4836 lt!166793)))) ((_ sign_extend 32) (currentByte!5212 thiss!1305)) ((_ sign_extend 32) (currentBit!5207 thiss!1305)) lt!166818)))

(declare-fun lt!166805 () Unit!6717)

(assert (=> b!109960 (= lt!166805 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2670 (_2!4836 lt!166793)) lt!166818))))

(assert (=> b!109960 (= lt!166820 (bvand v!199 (bvnot lt!166802)))))

(assert (=> b!109960 (= lt!166802 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(assert (=> b!109960 (= (_2!4835 lt!166798) lt!166799)))

(assert (=> b!109960 (= lt!166798 (readBitPure!0 (_1!4833 lt!166808)))))

(declare-fun reader!0 (BitStream!4026 BitStream!4026) tuple2!9152)

(assert (=> b!109960 (= lt!166816 (reader!0 (_2!4836 lt!166796) (_2!4836 lt!166793)))))

(assert (=> b!109960 (= lt!166808 (reader!0 thiss!1305 (_2!4836 lt!166793)))))

(declare-fun e!72067 () Bool)

(assert (=> b!109960 e!72067))

(declare-fun res!90758 () Bool)

(assert (=> b!109960 (=> (not res!90758) (not e!72067))))

(declare-fun lt!166819 () tuple2!9156)

(declare-fun lt!166817 () tuple2!9156)

(assert (=> b!109960 (= res!90758 (= (bitIndex!0 (size!2276 (buf!2670 (_1!4835 lt!166819))) (currentByte!5212 (_1!4835 lt!166819)) (currentBit!5207 (_1!4835 lt!166819))) (bitIndex!0 (size!2276 (buf!2670 (_1!4835 lt!166817))) (currentByte!5212 (_1!4835 lt!166817)) (currentBit!5207 (_1!4835 lt!166817)))))))

(declare-fun lt!166814 () Unit!6717)

(declare-fun lt!166807 () BitStream!4026)

(declare-fun readBitPrefixLemma!0 (BitStream!4026 BitStream!4026) Unit!6717)

(assert (=> b!109960 (= lt!166814 (readBitPrefixLemma!0 lt!166807 (_2!4836 lt!166793)))))

(assert (=> b!109960 (= lt!166817 (readBitPure!0 (BitStream!4027 (buf!2670 (_2!4836 lt!166793)) (currentByte!5212 thiss!1305) (currentBit!5207 thiss!1305))))))

(assert (=> b!109960 (= lt!166819 (readBitPure!0 lt!166807))))

(assert (=> b!109960 (= lt!166807 (BitStream!4027 (buf!2670 (_2!4836 lt!166796)) (currentByte!5212 thiss!1305) (currentBit!5207 thiss!1305)))))

(declare-fun e!72076 () Bool)

(assert (=> b!109960 e!72076))

(declare-fun res!90760 () Bool)

(assert (=> b!109960 (=> (not res!90760) (not e!72076))))

(declare-fun isPrefixOf!0 (BitStream!4026 BitStream!4026) Bool)

(assert (=> b!109960 (= res!90760 (isPrefixOf!0 thiss!1305 (_2!4836 lt!166793)))))

(declare-fun lt!166811 () Unit!6717)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4026 BitStream!4026 BitStream!4026) Unit!6717)

(assert (=> b!109960 (= lt!166811 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4836 lt!166796) (_2!4836 lt!166793)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4026 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9158)

(assert (=> b!109960 (= lt!166793 (appendNLeastSignificantBitsLoop!0 (_2!4836 lt!166796) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!72072 () Bool)

(assert (=> b!109960 e!72072))

(declare-fun res!90756 () Bool)

(assert (=> b!109960 (=> (not res!90756) (not e!72072))))

(assert (=> b!109960 (= res!90756 (= (size!2276 (buf!2670 thiss!1305)) (size!2276 (buf!2670 (_2!4836 lt!166796)))))))

(declare-fun appendBit!0 (BitStream!4026 Bool) tuple2!9158)

(assert (=> b!109960 (= lt!166796 (appendBit!0 thiss!1305 lt!166799))))

(assert (=> b!109960 (= lt!166799 (not (= (bvand v!199 lt!166809) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109960 (= lt!166809 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!109962 () Bool)

(declare-fun res!90763 () Bool)

(assert (=> b!109962 (=> res!90763 e!72074)))

(assert (=> b!109962 (= res!90763 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2276 (buf!2670 (_1!4833 lt!166808)))) ((_ sign_extend 32) (currentByte!5212 (_1!4833 lt!166808))) ((_ sign_extend 32) (currentBit!5207 (_1!4833 lt!166808))) lt!166818)))))

(declare-fun b!109963 () Bool)

(assert (=> b!109963 (= e!72072 e!72069)))

(declare-fun res!90753 () Bool)

(assert (=> b!109963 (=> (not res!90753) (not e!72069))))

(declare-fun lt!166813 () (_ BitVec 64))

(assert (=> b!109963 (= res!90753 (= lt!166804 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!166813)))))

(assert (=> b!109963 (= lt!166804 (bitIndex!0 (size!2276 (buf!2670 (_2!4836 lt!166796))) (currentByte!5212 (_2!4836 lt!166796)) (currentBit!5207 (_2!4836 lt!166796))))))

(assert (=> b!109963 (= lt!166813 (bitIndex!0 (size!2276 (buf!2670 thiss!1305)) (currentByte!5212 thiss!1305) (currentBit!5207 thiss!1305)))))

(declare-fun b!109964 () Bool)

(declare-fun res!90755 () Bool)

(assert (=> b!109964 (=> (not res!90755) (not e!72076))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!109964 (= res!90755 (invariant!0 (currentBit!5207 thiss!1305) (currentByte!5212 thiss!1305) (size!2276 (buf!2670 (_2!4836 lt!166796)))))))

(declare-fun b!109965 () Bool)

(assert (=> b!109965 (= e!72073 e!72074)))

(declare-fun res!90766 () Bool)

(assert (=> b!109965 (=> res!90766 e!72074)))

(declare-fun lt!166812 () (_ BitVec 64))

(assert (=> b!109965 (= res!90766 (or (not (= (_1!4833 lt!166816) lt!166810)) (not (= (size!2276 (buf!2670 thiss!1305)) (size!2276 (buf!2670 (_2!4836 lt!166793))))) (not (= lt!166812 (bvadd lt!166794 lt!166818)))))))

(assert (=> b!109965 e!72066))

(declare-fun res!90754 () Bool)

(assert (=> b!109965 (=> (not res!90754) (not e!72066))))

(declare-fun withMovedBitIndex!0 (BitStream!4026 (_ BitVec 64)) BitStream!4026)

(assert (=> b!109965 (= res!90754 (= (_1!4833 lt!166816) (withMovedBitIndex!0 (_2!4833 lt!166816) (bvsub lt!166822 lt!166812))))))

(assert (=> b!109965 (= lt!166822 (bitIndex!0 (size!2276 (buf!2670 (_2!4836 lt!166796))) (currentByte!5212 (_2!4836 lt!166796)) (currentBit!5207 (_2!4836 lt!166796))))))

(assert (=> b!109965 (= (_1!4833 lt!166808) (withMovedBitIndex!0 (_2!4833 lt!166808) (bvsub lt!166794 lt!166812)))))

(assert (=> b!109965 (= lt!166812 (bitIndex!0 (size!2276 (buf!2670 (_2!4836 lt!166793))) (currentByte!5212 (_2!4836 lt!166793)) (currentBit!5207 (_2!4836 lt!166793))))))

(assert (=> b!109965 (= lt!166794 (bitIndex!0 (size!2276 (buf!2670 thiss!1305)) (currentByte!5212 thiss!1305) (currentBit!5207 thiss!1305)))))

(declare-fun lt!166815 () tuple2!9154)

(assert (=> b!109965 (and (= (_2!4834 lt!166823) (_2!4834 lt!166815)) (= (_1!4834 lt!166823) (_1!4834 lt!166815)))))

(declare-fun lt!166806 () Unit!6717)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4026 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6717)

(assert (=> b!109965 (= lt!166806 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4833 lt!166808) nBits!396 i!615 lt!166820))))

(assert (=> b!109965 (= lt!166815 (readNLeastSignificantBitsLoopPure!0 lt!166810 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!166797))))

(assert (=> b!109965 (= lt!166810 (withMovedBitIndex!0 (_1!4833 lt!166808) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!109966 () Bool)

(assert (=> b!109966 (= e!72067 (= (_2!4835 lt!166819) (_2!4835 lt!166817)))))

(declare-fun res!90765 () Bool)

(declare-fun e!72075 () Bool)

(assert (=> start!21744 (=> (not res!90765) (not e!72075))))

(assert (=> start!21744 (= res!90765 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21744 e!72075))

(assert (=> start!21744 true))

(declare-fun e!72077 () Bool)

(declare-fun inv!12 (BitStream!4026) Bool)

(assert (=> start!21744 (and (inv!12 thiss!1305) e!72077)))

(declare-fun b!109961 () Bool)

(declare-fun array_inv!2078 (array!5002) Bool)

(assert (=> b!109961 (= e!72077 (array_inv!2078 (buf!2670 thiss!1305)))))

(declare-fun b!109967 () Bool)

(assert (=> b!109967 (= e!72075 e!72071)))

(declare-fun res!90757 () Bool)

(assert (=> b!109967 (=> (not res!90757) (not e!72071))))

(assert (=> b!109967 (= res!90757 (validate_offset_bits!1 ((_ sign_extend 32) (size!2276 (buf!2670 thiss!1305))) ((_ sign_extend 32) (currentByte!5212 thiss!1305)) ((_ sign_extend 32) (currentBit!5207 thiss!1305)) lt!166818))))

(assert (=> b!109967 (= lt!166818 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!109968 () Bool)

(assert (=> b!109968 (= e!72076 (invariant!0 (currentBit!5207 thiss!1305) (currentByte!5212 thiss!1305) (size!2276 (buf!2670 (_2!4836 lt!166793)))))))

(declare-fun b!109969 () Bool)

(declare-fun res!90762 () Bool)

(assert (=> b!109969 (=> (not res!90762) (not e!72069))))

(assert (=> b!109969 (= res!90762 (isPrefixOf!0 thiss!1305 (_2!4836 lt!166796)))))

(assert (= (and start!21744 res!90765) b!109967))

(assert (= (and b!109967 res!90757) b!109958))

(assert (= (and b!109958 res!90761) b!109960))

(assert (= (and b!109960 res!90756) b!109963))

(assert (= (and b!109963 res!90753) b!109969))

(assert (= (and b!109969 res!90762) b!109959))

(assert (= (and b!109959 res!90759) b!109957))

(assert (= (and b!109960 res!90760) b!109964))

(assert (= (and b!109964 res!90755) b!109968))

(assert (= (and b!109960 res!90758) b!109966))

(assert (= (and b!109960 (not res!90764)) b!109965))

(assert (= (and b!109965 res!90754) b!109955))

(assert (= (and b!109965 (not res!90766)) b!109962))

(assert (= (and b!109962 (not res!90763)) b!109956))

(assert (= start!21744 b!109961))

(declare-fun m!163479 () Bool)

(assert (=> b!109963 m!163479))

(declare-fun m!163481 () Bool)

(assert (=> b!109963 m!163481))

(declare-fun m!163483 () Bool)

(assert (=> b!109959 m!163483))

(assert (=> b!109959 m!163483))

(declare-fun m!163485 () Bool)

(assert (=> b!109959 m!163485))

(declare-fun m!163487 () Bool)

(assert (=> b!109957 m!163487))

(declare-fun m!163489 () Bool)

(assert (=> b!109968 m!163489))

(declare-fun m!163491 () Bool)

(assert (=> b!109958 m!163491))

(declare-fun m!163493 () Bool)

(assert (=> b!109969 m!163493))

(declare-fun m!163495 () Bool)

(assert (=> start!21744 m!163495))

(assert (=> b!109965 m!163479))

(declare-fun m!163497 () Bool)

(assert (=> b!109965 m!163497))

(declare-fun m!163499 () Bool)

(assert (=> b!109965 m!163499))

(declare-fun m!163501 () Bool)

(assert (=> b!109965 m!163501))

(assert (=> b!109965 m!163481))

(declare-fun m!163503 () Bool)

(assert (=> b!109965 m!163503))

(declare-fun m!163505 () Bool)

(assert (=> b!109965 m!163505))

(declare-fun m!163507 () Bool)

(assert (=> b!109965 m!163507))

(declare-fun m!163509 () Bool)

(assert (=> b!109960 m!163509))

(declare-fun m!163511 () Bool)

(assert (=> b!109960 m!163511))

(declare-fun m!163513 () Bool)

(assert (=> b!109960 m!163513))

(declare-fun m!163515 () Bool)

(assert (=> b!109960 m!163515))

(declare-fun m!163517 () Bool)

(assert (=> b!109960 m!163517))

(declare-fun m!163519 () Bool)

(assert (=> b!109960 m!163519))

(declare-fun m!163521 () Bool)

(assert (=> b!109960 m!163521))

(declare-fun m!163523 () Bool)

(assert (=> b!109960 m!163523))

(declare-fun m!163525 () Bool)

(assert (=> b!109960 m!163525))

(declare-fun m!163527 () Bool)

(assert (=> b!109960 m!163527))

(declare-fun m!163529 () Bool)

(assert (=> b!109960 m!163529))

(declare-fun m!163531 () Bool)

(assert (=> b!109960 m!163531))

(declare-fun m!163533 () Bool)

(assert (=> b!109960 m!163533))

(declare-fun m!163535 () Bool)

(assert (=> b!109960 m!163535))

(declare-fun m!163537 () Bool)

(assert (=> b!109960 m!163537))

(declare-fun m!163539 () Bool)

(assert (=> b!109960 m!163539))

(declare-fun m!163541 () Bool)

(assert (=> b!109960 m!163541))

(declare-fun m!163543 () Bool)

(assert (=> b!109960 m!163543))

(declare-fun m!163545 () Bool)

(assert (=> b!109960 m!163545))

(declare-fun m!163547 () Bool)

(assert (=> b!109967 m!163547))

(declare-fun m!163549 () Bool)

(assert (=> b!109962 m!163549))

(declare-fun m!163551 () Bool)

(assert (=> b!109964 m!163551))

(declare-fun m!163553 () Bool)

(assert (=> b!109961 m!163553))

(check-sat (not b!109964) (not b!109960) (not b!109957) (not b!109968) (not b!109959) (not b!109967) (not b!109969) (not b!109962) (not start!21744) (not b!109958) (not b!109963) (not b!109961) (not b!109965))
(check-sat)
