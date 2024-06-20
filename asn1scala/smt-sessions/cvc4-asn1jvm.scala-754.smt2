; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21614 () Bool)

(assert start!21614)

(declare-fun b!109128 () Bool)

(declare-fun e!71489 () Bool)

(declare-fun e!71494 () Bool)

(assert (=> b!109128 (= e!71489 (not e!71494))))

(declare-fun res!90019 () Bool)

(assert (=> b!109128 (=> res!90019 e!71494)))

(declare-datatypes ((array!4977 0))(
  ( (array!4978 (arr!2858 (Array (_ BitVec 32) (_ BitVec 8))) (size!2265 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4004 0))(
  ( (BitStream!4005 (buf!2656 array!4977) (currentByte!5192 (_ BitVec 32)) (currentBit!5187 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9052 0))(
  ( (tuple2!9053 (_1!4783 BitStream!4004) (_2!4783 (_ BitVec 64))) )
))
(declare-fun lt!164845 () tuple2!9052)

(declare-datatypes ((tuple2!9054 0))(
  ( (tuple2!9055 (_1!4784 BitStream!4004) (_2!4784 BitStream!4004)) )
))
(declare-fun lt!164827 () tuple2!9054)

(assert (=> b!109128 (= res!90019 (not (= (_1!4783 lt!164845) (_2!4784 lt!164827))))))

(declare-fun lt!164835 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4004 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9052)

(assert (=> b!109128 (= lt!164845 (readNLeastSignificantBitsLoopPure!0 (_1!4784 lt!164827) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!164835))))

(declare-datatypes ((Unit!6671 0))(
  ( (Unit!6672) )
))
(declare-datatypes ((tuple2!9056 0))(
  ( (tuple2!9057 (_1!4785 Unit!6671) (_2!4785 BitStream!4004)) )
))
(declare-fun lt!164834 () tuple2!9056)

(declare-fun lt!164843 () tuple2!9056)

(declare-fun lt!164824 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!109128 (validate_offset_bits!1 ((_ sign_extend 32) (size!2265 (buf!2656 (_2!4785 lt!164834)))) ((_ sign_extend 32) (currentByte!5192 (_2!4785 lt!164843))) ((_ sign_extend 32) (currentBit!5187 (_2!4785 lt!164843))) lt!164824)))

(declare-fun lt!164821 () Unit!6671)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4004 array!4977 (_ BitVec 64)) Unit!6671)

(assert (=> b!109128 (= lt!164821 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4785 lt!164843) (buf!2656 (_2!4785 lt!164834)) lt!164824))))

(assert (=> b!109128 (= lt!164824 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!164839 () (_ BitVec 64))

(declare-fun lt!164828 () (_ BitVec 64))

(declare-datatypes ((tuple2!9058 0))(
  ( (tuple2!9059 (_1!4786 BitStream!4004) (_2!4786 Bool)) )
))
(declare-fun lt!164838 () tuple2!9058)

(assert (=> b!109128 (= lt!164835 (bvor lt!164839 (ite (_2!4786 lt!164838) lt!164828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!164836 () tuple2!9052)

(declare-fun lt!164822 () tuple2!9054)

(assert (=> b!109128 (= lt!164836 (readNLeastSignificantBitsLoopPure!0 (_1!4784 lt!164822) nBits!396 i!615 lt!164839))))

(declare-fun thiss!1305 () BitStream!4004)

(declare-fun lt!164842 () (_ BitVec 64))

(assert (=> b!109128 (validate_offset_bits!1 ((_ sign_extend 32) (size!2265 (buf!2656 (_2!4785 lt!164834)))) ((_ sign_extend 32) (currentByte!5192 thiss!1305)) ((_ sign_extend 32) (currentBit!5187 thiss!1305)) lt!164842)))

(declare-fun lt!164846 () Unit!6671)

(assert (=> b!109128 (= lt!164846 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2656 (_2!4785 lt!164834)) lt!164842))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109128 (= lt!164839 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!164830 () Bool)

(assert (=> b!109128 (= (_2!4786 lt!164838) lt!164830)))

(declare-fun readBitPure!0 (BitStream!4004) tuple2!9058)

(assert (=> b!109128 (= lt!164838 (readBitPure!0 (_1!4784 lt!164822)))))

(declare-fun reader!0 (BitStream!4004 BitStream!4004) tuple2!9054)

(assert (=> b!109128 (= lt!164827 (reader!0 (_2!4785 lt!164843) (_2!4785 lt!164834)))))

(assert (=> b!109128 (= lt!164822 (reader!0 thiss!1305 (_2!4785 lt!164834)))))

(declare-fun e!71493 () Bool)

(assert (=> b!109128 e!71493))

(declare-fun res!90025 () Bool)

(assert (=> b!109128 (=> (not res!90025) (not e!71493))))

(declare-fun lt!164818 () tuple2!9058)

(declare-fun lt!164823 () tuple2!9058)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109128 (= res!90025 (= (bitIndex!0 (size!2265 (buf!2656 (_1!4786 lt!164818))) (currentByte!5192 (_1!4786 lt!164818)) (currentBit!5187 (_1!4786 lt!164818))) (bitIndex!0 (size!2265 (buf!2656 (_1!4786 lt!164823))) (currentByte!5192 (_1!4786 lt!164823)) (currentBit!5187 (_1!4786 lt!164823)))))))

(declare-fun lt!164841 () Unit!6671)

(declare-fun lt!164844 () BitStream!4004)

(declare-fun readBitPrefixLemma!0 (BitStream!4004 BitStream!4004) Unit!6671)

(assert (=> b!109128 (= lt!164841 (readBitPrefixLemma!0 lt!164844 (_2!4785 lt!164834)))))

(assert (=> b!109128 (= lt!164823 (readBitPure!0 (BitStream!4005 (buf!2656 (_2!4785 lt!164834)) (currentByte!5192 thiss!1305) (currentBit!5187 thiss!1305))))))

(assert (=> b!109128 (= lt!164818 (readBitPure!0 lt!164844))))

(assert (=> b!109128 (= lt!164844 (BitStream!4005 (buf!2656 (_2!4785 lt!164843)) (currentByte!5192 thiss!1305) (currentBit!5187 thiss!1305)))))

(declare-fun e!71492 () Bool)

(assert (=> b!109128 e!71492))

(declare-fun res!90031 () Bool)

(assert (=> b!109128 (=> (not res!90031) (not e!71492))))

(declare-fun isPrefixOf!0 (BitStream!4004 BitStream!4004) Bool)

(assert (=> b!109128 (= res!90031 (isPrefixOf!0 thiss!1305 (_2!4785 lt!164834)))))

(declare-fun lt!164840 () Unit!6671)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4004 BitStream!4004 BitStream!4004) Unit!6671)

(assert (=> b!109128 (= lt!164840 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4785 lt!164843) (_2!4785 lt!164834)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4004 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9056)

(assert (=> b!109128 (= lt!164834 (appendNLeastSignificantBitsLoop!0 (_2!4785 lt!164843) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!71491 () Bool)

(assert (=> b!109128 e!71491))

(declare-fun res!90027 () Bool)

(assert (=> b!109128 (=> (not res!90027) (not e!71491))))

(assert (=> b!109128 (= res!90027 (= (size!2265 (buf!2656 thiss!1305)) (size!2265 (buf!2656 (_2!4785 lt!164843)))))))

(declare-fun appendBit!0 (BitStream!4004 Bool) tuple2!9056)

(assert (=> b!109128 (= lt!164843 (appendBit!0 thiss!1305 lt!164830))))

(assert (=> b!109128 (= lt!164830 (not (= (bvand v!199 lt!164828) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109128 (= lt!164828 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!109129 () Bool)

(declare-fun res!90020 () Bool)

(assert (=> b!109129 (=> (not res!90020) (not e!71489))))

(assert (=> b!109129 (= res!90020 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!109130 () Bool)

(declare-fun e!71488 () Bool)

(assert (=> b!109130 (= e!71488 e!71489)))

(declare-fun res!90029 () Bool)

(assert (=> b!109130 (=> (not res!90029) (not e!71489))))

(assert (=> b!109130 (= res!90029 (validate_offset_bits!1 ((_ sign_extend 32) (size!2265 (buf!2656 thiss!1305))) ((_ sign_extend 32) (currentByte!5192 thiss!1305)) ((_ sign_extend 32) (currentBit!5187 thiss!1305)) lt!164842))))

(assert (=> b!109130 (= lt!164842 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!109131 () Bool)

(declare-fun res!90021 () Bool)

(assert (=> b!109131 (=> (not res!90021) (not e!71489))))

(assert (=> b!109131 (= res!90021 (bvslt i!615 nBits!396))))

(declare-fun b!109132 () Bool)

(declare-fun res!90028 () Bool)

(assert (=> b!109132 (=> (not res!90028) (not e!71492))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!109132 (= res!90028 (invariant!0 (currentBit!5187 thiss!1305) (currentByte!5192 thiss!1305) (size!2265 (buf!2656 (_2!4785 lt!164843)))))))

(declare-fun b!109133 () Bool)

(declare-fun res!90022 () Bool)

(declare-fun e!71497 () Bool)

(assert (=> b!109133 (=> (not res!90022) (not e!71497))))

(assert (=> b!109133 (= res!90022 (isPrefixOf!0 thiss!1305 (_2!4785 lt!164843)))))

(declare-fun b!109134 () Bool)

(declare-fun e!71496 () Bool)

(assert (=> b!109134 (= e!71497 e!71496)))

(declare-fun res!90030 () Bool)

(assert (=> b!109134 (=> (not res!90030) (not e!71496))))

(declare-fun lt!164825 () tuple2!9058)

(assert (=> b!109134 (= res!90030 (and (= (_2!4786 lt!164825) lt!164830) (= (_1!4786 lt!164825) (_2!4785 lt!164843))))))

(declare-fun readerFrom!0 (BitStream!4004 (_ BitVec 32) (_ BitVec 32)) BitStream!4004)

(assert (=> b!109134 (= lt!164825 (readBitPure!0 (readerFrom!0 (_2!4785 lt!164843) (currentBit!5187 thiss!1305) (currentByte!5192 thiss!1305))))))

(declare-fun lt!164837 () (_ BitVec 64))

(declare-fun b!109135 () Bool)

(declare-fun lt!164820 () (_ BitVec 64))

(declare-fun e!71495 () Bool)

(declare-fun lt!164819 () BitStream!4004)

(assert (=> b!109135 (= e!71495 (and (= lt!164820 (bvsub lt!164837 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4784 lt!164827) lt!164819)) (and (= (_2!4783 lt!164836) (_2!4783 lt!164845)) (= (_1!4783 lt!164836) (_2!4784 lt!164822))))))))

(declare-fun res!90024 () Bool)

(assert (=> start!21614 (=> (not res!90024) (not e!71488))))

(assert (=> start!21614 (= res!90024 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21614 e!71488))

(assert (=> start!21614 true))

(declare-fun e!71498 () Bool)

(declare-fun inv!12 (BitStream!4004) Bool)

(assert (=> start!21614 (and (inv!12 thiss!1305) e!71498)))

(declare-fun b!109136 () Bool)

(declare-fun array_inv!2067 (array!4977) Bool)

(assert (=> b!109136 (= e!71498 (array_inv!2067 (buf!2656 thiss!1305)))))

(declare-fun b!109137 () Bool)

(assert (=> b!109137 (= e!71492 (invariant!0 (currentBit!5187 thiss!1305) (currentByte!5192 thiss!1305) (size!2265 (buf!2656 (_2!4785 lt!164834)))))))

(declare-fun b!109138 () Bool)

(assert (=> b!109138 (= e!71491 e!71497)))

(declare-fun res!90023 () Bool)

(assert (=> b!109138 (=> (not res!90023) (not e!71497))))

(declare-fun lt!164826 () (_ BitVec 64))

(declare-fun lt!164833 () (_ BitVec 64))

(assert (=> b!109138 (= res!90023 (= lt!164826 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!164833)))))

(assert (=> b!109138 (= lt!164826 (bitIndex!0 (size!2265 (buf!2656 (_2!4785 lt!164843))) (currentByte!5192 (_2!4785 lt!164843)) (currentBit!5187 (_2!4785 lt!164843))))))

(assert (=> b!109138 (= lt!164833 (bitIndex!0 (size!2265 (buf!2656 thiss!1305)) (currentByte!5192 thiss!1305) (currentBit!5187 thiss!1305)))))

(declare-fun b!109139 () Bool)

(assert (=> b!109139 (= e!71493 (= (_2!4786 lt!164818) (_2!4786 lt!164823)))))

(declare-fun b!109140 () Bool)

(assert (=> b!109140 (= e!71494 true)))

(assert (=> b!109140 e!71495))

(declare-fun res!90026 () Bool)

(assert (=> b!109140 (=> (not res!90026) (not e!71495))))

(declare-fun lt!164832 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4004 (_ BitVec 64)) BitStream!4004)

(assert (=> b!109140 (= res!90026 (= (_1!4784 lt!164827) (withMovedBitIndex!0 (_2!4784 lt!164827) (bvsub lt!164837 lt!164832))))))

(assert (=> b!109140 (= lt!164837 (bitIndex!0 (size!2265 (buf!2656 (_2!4785 lt!164843))) (currentByte!5192 (_2!4785 lt!164843)) (currentBit!5187 (_2!4785 lt!164843))))))

(assert (=> b!109140 (= (_1!4784 lt!164822) (withMovedBitIndex!0 (_2!4784 lt!164822) (bvsub lt!164820 lt!164832)))))

(assert (=> b!109140 (= lt!164832 (bitIndex!0 (size!2265 (buf!2656 (_2!4785 lt!164834))) (currentByte!5192 (_2!4785 lt!164834)) (currentBit!5187 (_2!4785 lt!164834))))))

(assert (=> b!109140 (= lt!164820 (bitIndex!0 (size!2265 (buf!2656 thiss!1305)) (currentByte!5192 thiss!1305) (currentBit!5187 thiss!1305)))))

(declare-fun lt!164829 () tuple2!9052)

(assert (=> b!109140 (and (= (_2!4783 lt!164836) (_2!4783 lt!164829)) (= (_1!4783 lt!164836) (_1!4783 lt!164829)))))

(declare-fun lt!164831 () Unit!6671)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4004 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6671)

(assert (=> b!109140 (= lt!164831 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4784 lt!164822) nBits!396 i!615 lt!164839))))

(assert (=> b!109140 (= lt!164829 (readNLeastSignificantBitsLoopPure!0 lt!164819 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!164835))))

(assert (=> b!109140 (= lt!164819 (withMovedBitIndex!0 (_1!4784 lt!164822) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!109141 () Bool)

(assert (=> b!109141 (= e!71496 (= (bitIndex!0 (size!2265 (buf!2656 (_1!4786 lt!164825))) (currentByte!5192 (_1!4786 lt!164825)) (currentBit!5187 (_1!4786 lt!164825))) lt!164826))))

(assert (= (and start!21614 res!90024) b!109130))

(assert (= (and b!109130 res!90029) b!109129))

(assert (= (and b!109129 res!90020) b!109131))

(assert (= (and b!109131 res!90021) b!109128))

(assert (= (and b!109128 res!90027) b!109138))

(assert (= (and b!109138 res!90023) b!109133))

(assert (= (and b!109133 res!90022) b!109134))

(assert (= (and b!109134 res!90030) b!109141))

(assert (= (and b!109128 res!90031) b!109132))

(assert (= (and b!109132 res!90028) b!109137))

(assert (= (and b!109128 res!90025) b!109139))

(assert (= (and b!109128 (not res!90019)) b!109140))

(assert (= (and b!109140 res!90026) b!109135))

(assert (= start!21614 b!109136))

(declare-fun m!161913 () Bool)

(assert (=> start!21614 m!161913))

(declare-fun m!161915 () Bool)

(assert (=> b!109134 m!161915))

(assert (=> b!109134 m!161915))

(declare-fun m!161917 () Bool)

(assert (=> b!109134 m!161917))

(declare-fun m!161919 () Bool)

(assert (=> b!109133 m!161919))

(declare-fun m!161921 () Bool)

(assert (=> b!109137 m!161921))

(declare-fun m!161923 () Bool)

(assert (=> b!109128 m!161923))

(declare-fun m!161925 () Bool)

(assert (=> b!109128 m!161925))

(declare-fun m!161927 () Bool)

(assert (=> b!109128 m!161927))

(declare-fun m!161929 () Bool)

(assert (=> b!109128 m!161929))

(declare-fun m!161931 () Bool)

(assert (=> b!109128 m!161931))

(declare-fun m!161933 () Bool)

(assert (=> b!109128 m!161933))

(declare-fun m!161935 () Bool)

(assert (=> b!109128 m!161935))

(declare-fun m!161937 () Bool)

(assert (=> b!109128 m!161937))

(declare-fun m!161939 () Bool)

(assert (=> b!109128 m!161939))

(declare-fun m!161941 () Bool)

(assert (=> b!109128 m!161941))

(declare-fun m!161943 () Bool)

(assert (=> b!109128 m!161943))

(declare-fun m!161945 () Bool)

(assert (=> b!109128 m!161945))

(declare-fun m!161947 () Bool)

(assert (=> b!109128 m!161947))

(declare-fun m!161949 () Bool)

(assert (=> b!109128 m!161949))

(declare-fun m!161951 () Bool)

(assert (=> b!109128 m!161951))

(declare-fun m!161953 () Bool)

(assert (=> b!109128 m!161953))

(declare-fun m!161955 () Bool)

(assert (=> b!109128 m!161955))

(declare-fun m!161957 () Bool)

(assert (=> b!109128 m!161957))

(declare-fun m!161959 () Bool)

(assert (=> b!109128 m!161959))

(declare-fun m!161961 () Bool)

(assert (=> b!109138 m!161961))

(declare-fun m!161963 () Bool)

(assert (=> b!109138 m!161963))

(assert (=> b!109140 m!161961))

(declare-fun m!161965 () Bool)

(assert (=> b!109140 m!161965))

(declare-fun m!161967 () Bool)

(assert (=> b!109140 m!161967))

(declare-fun m!161969 () Bool)

(assert (=> b!109140 m!161969))

(assert (=> b!109140 m!161963))

(declare-fun m!161971 () Bool)

(assert (=> b!109140 m!161971))

(declare-fun m!161973 () Bool)

(assert (=> b!109140 m!161973))

(declare-fun m!161975 () Bool)

(assert (=> b!109140 m!161975))

(declare-fun m!161977 () Bool)

(assert (=> b!109129 m!161977))

(declare-fun m!161979 () Bool)

(assert (=> b!109141 m!161979))

(declare-fun m!161981 () Bool)

(assert (=> b!109136 m!161981))

(declare-fun m!161983 () Bool)

(assert (=> b!109132 m!161983))

(declare-fun m!161985 () Bool)

(assert (=> b!109130 m!161985))

(push 1)

(assert (not b!109134))

(assert (not b!109136))

(assert (not b!109133))

(assert (not b!109130))

(assert (not b!109140))

(assert (not b!109128))

(assert (not b!109132))

(assert (not b!109129))

(assert (not start!21614))

(assert (not b!109137))

(assert (not b!109138))

(assert (not b!109141))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

