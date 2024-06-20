; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53954 () Bool)

(assert start!53954)

(declare-fun b!251071 () Bool)

(declare-fun e!173990 () Bool)

(declare-fun e!173994 () Bool)

(assert (=> b!251071 (= e!173990 e!173994)))

(declare-fun res!210231 () Bool)

(assert (=> b!251071 (=> (not res!210231) (not e!173994))))

(declare-datatypes ((array!13671 0))(
  ( (array!13672 (arr!6983 (Array (_ BitVec 32) (_ BitVec 8))) (size!5996 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10914 0))(
  ( (BitStream!10915 (buf!6495 array!13671) (currentByte!11944 (_ BitVec 32)) (currentBit!11939 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18134 0))(
  ( (Unit!18135) )
))
(declare-datatypes ((tuple2!21540 0))(
  ( (tuple2!21541 (_1!11698 Unit!18134) (_2!11698 BitStream!10914)) )
))
(declare-fun lt!390063 () tuple2!21540)

(declare-datatypes ((tuple2!21542 0))(
  ( (tuple2!21543 (_1!11699 BitStream!10914) (_2!11699 Bool)) )
))
(declare-fun lt!390060 () tuple2!21542)

(declare-fun bit!26 () Bool)

(assert (=> b!251071 (= res!210231 (and (= (_2!11699 lt!390060) bit!26) (= (_1!11699 lt!390060) (_2!11698 lt!390063))))))

(declare-fun thiss!1005 () BitStream!10914)

(declare-fun readBitPure!0 (BitStream!10914) tuple2!21542)

(declare-fun readerFrom!0 (BitStream!10914 (_ BitVec 32) (_ BitVec 32)) BitStream!10914)

(assert (=> b!251071 (= lt!390060 (readBitPure!0 (readerFrom!0 (_2!11698 lt!390063) (currentBit!11939 thiss!1005) (currentByte!11944 thiss!1005))))))

(declare-fun res!210228 () Bool)

(declare-fun e!173995 () Bool)

(assert (=> start!53954 (=> (not res!210228) (not e!173995))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!53954 (= res!210228 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53954 e!173995))

(assert (=> start!53954 true))

(declare-fun e!173998 () Bool)

(declare-fun inv!12 (BitStream!10914) Bool)

(assert (=> start!53954 (and (inv!12 thiss!1005) e!173998)))

(declare-fun b!251072 () Bool)

(declare-fun res!210236 () Bool)

(assert (=> b!251072 (=> (not res!210236) (not e!173990))))

(declare-fun isPrefixOf!0 (BitStream!10914 BitStream!10914) Bool)

(assert (=> b!251072 (= res!210236 (isPrefixOf!0 thiss!1005 (_2!11698 lt!390063)))))

(declare-fun b!251073 () Bool)

(declare-fun e!173992 () Bool)

(assert (=> b!251073 (= e!173992 e!173990)))

(declare-fun res!210239 () Bool)

(assert (=> b!251073 (=> (not res!210239) (not e!173990))))

(declare-fun lt!390055 () (_ BitVec 64))

(declare-fun lt!390048 () (_ BitVec 64))

(assert (=> b!251073 (= res!210239 (= lt!390055 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!390048)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!251073 (= lt!390055 (bitIndex!0 (size!5996 (buf!6495 (_2!11698 lt!390063))) (currentByte!11944 (_2!11698 lt!390063)) (currentBit!11939 (_2!11698 lt!390063))))))

(assert (=> b!251073 (= lt!390048 (bitIndex!0 (size!5996 (buf!6495 thiss!1005)) (currentByte!11944 thiss!1005) (currentBit!11939 thiss!1005)))))

(declare-fun b!251074 () Bool)

(declare-fun e!173999 () Bool)

(declare-fun lt!390062 () tuple2!21540)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!251074 (= e!173999 (invariant!0 (currentBit!11939 thiss!1005) (currentByte!11944 thiss!1005) (size!5996 (buf!6495 (_2!11698 lt!390062)))))))

(declare-fun b!251075 () Bool)

(declare-datatypes ((tuple2!21544 0))(
  ( (tuple2!21545 (_1!11700 BitStream!10914) (_2!11700 BitStream!10914)) )
))
(declare-fun lt!390054 () tuple2!21544)

(assert (=> b!251075 (= e!173995 (not (= (_2!11699 (readBitPure!0 (_1!11700 lt!390054))) bit!26)))))

(declare-fun lt!390050 () tuple2!21544)

(declare-fun reader!0 (BitStream!10914 BitStream!10914) tuple2!21544)

(assert (=> b!251075 (= lt!390050 (reader!0 (_2!11698 lt!390063) (_2!11698 lt!390062)))))

(assert (=> b!251075 (= lt!390054 (reader!0 thiss!1005 (_2!11698 lt!390062)))))

(declare-fun e!173996 () Bool)

(assert (=> b!251075 e!173996))

(declare-fun res!210240 () Bool)

(assert (=> b!251075 (=> (not res!210240) (not e!173996))))

(declare-fun lt!390053 () tuple2!21542)

(declare-fun lt!390057 () tuple2!21542)

(assert (=> b!251075 (= res!210240 (= (bitIndex!0 (size!5996 (buf!6495 (_1!11699 lt!390053))) (currentByte!11944 (_1!11699 lt!390053)) (currentBit!11939 (_1!11699 lt!390053))) (bitIndex!0 (size!5996 (buf!6495 (_1!11699 lt!390057))) (currentByte!11944 (_1!11699 lt!390057)) (currentBit!11939 (_1!11699 lt!390057)))))))

(declare-fun lt!390059 () Unit!18134)

(declare-fun lt!390056 () BitStream!10914)

(declare-fun readBitPrefixLemma!0 (BitStream!10914 BitStream!10914) Unit!18134)

(assert (=> b!251075 (= lt!390059 (readBitPrefixLemma!0 lt!390056 (_2!11698 lt!390062)))))

(assert (=> b!251075 (= lt!390057 (readBitPure!0 (BitStream!10915 (buf!6495 (_2!11698 lt!390062)) (currentByte!11944 thiss!1005) (currentBit!11939 thiss!1005))))))

(assert (=> b!251075 (= lt!390053 (readBitPure!0 lt!390056))))

(assert (=> b!251075 (= lt!390056 (BitStream!10915 (buf!6495 (_2!11698 lt!390063)) (currentByte!11944 thiss!1005) (currentBit!11939 thiss!1005)))))

(assert (=> b!251075 e!173999))

(declare-fun res!210237 () Bool)

(assert (=> b!251075 (=> (not res!210237) (not e!173999))))

(assert (=> b!251075 (= res!210237 (isPrefixOf!0 thiss!1005 (_2!11698 lt!390062)))))

(declare-fun lt!390052 () Unit!18134)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10914 BitStream!10914 BitStream!10914) Unit!18134)

(assert (=> b!251075 (= lt!390052 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11698 lt!390063) (_2!11698 lt!390062)))))

(declare-fun e!173991 () Bool)

(assert (=> b!251075 e!173991))

(declare-fun res!210238 () Bool)

(assert (=> b!251075 (=> (not res!210238) (not e!173991))))

(assert (=> b!251075 (= res!210238 (= (size!5996 (buf!6495 (_2!11698 lt!390063))) (size!5996 (buf!6495 (_2!11698 lt!390062)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10914 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21540)

(assert (=> b!251075 (= lt!390062 (appendNBitsLoop!0 (_2!11698 lt!390063) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!251075 (validate_offset_bits!1 ((_ sign_extend 32) (size!5996 (buf!6495 (_2!11698 lt!390063)))) ((_ sign_extend 32) (currentByte!11944 (_2!11698 lt!390063))) ((_ sign_extend 32) (currentBit!11939 (_2!11698 lt!390063))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!390049 () Unit!18134)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10914 BitStream!10914 (_ BitVec 64) (_ BitVec 64)) Unit!18134)

(assert (=> b!251075 (= lt!390049 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11698 lt!390063) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!251075 e!173992))

(declare-fun res!210229 () Bool)

(assert (=> b!251075 (=> (not res!210229) (not e!173992))))

(assert (=> b!251075 (= res!210229 (= (size!5996 (buf!6495 thiss!1005)) (size!5996 (buf!6495 (_2!11698 lt!390063)))))))

(declare-fun appendBit!0 (BitStream!10914 Bool) tuple2!21540)

(assert (=> b!251075 (= lt!390063 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!251076 () Bool)

(declare-fun res!210232 () Bool)

(declare-fun e!173993 () Bool)

(assert (=> b!251076 (=> (not res!210232) (not e!173993))))

(assert (=> b!251076 (= res!210232 (isPrefixOf!0 (_2!11698 lt!390063) (_2!11698 lt!390062)))))

(declare-fun b!251077 () Bool)

(declare-fun res!210234 () Bool)

(assert (=> b!251077 (=> (not res!210234) (not e!173999))))

(assert (=> b!251077 (= res!210234 (invariant!0 (currentBit!11939 thiss!1005) (currentByte!11944 thiss!1005) (size!5996 (buf!6495 (_2!11698 lt!390063)))))))

(declare-fun b!251078 () Bool)

(assert (=> b!251078 (= e!173991 e!173993)))

(declare-fun res!210233 () Bool)

(assert (=> b!251078 (=> (not res!210233) (not e!173993))))

(declare-fun lt!390058 () (_ BitVec 64))

(assert (=> b!251078 (= res!210233 (= (bitIndex!0 (size!5996 (buf!6495 (_2!11698 lt!390062))) (currentByte!11944 (_2!11698 lt!390062)) (currentBit!11939 (_2!11698 lt!390062))) (bvadd (bitIndex!0 (size!5996 (buf!6495 (_2!11698 lt!390063))) (currentByte!11944 (_2!11698 lt!390063)) (currentBit!11939 (_2!11698 lt!390063))) lt!390058)))))

(assert (=> b!251078 (= lt!390058 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!251079 () Bool)

(assert (=> b!251079 (= e!173996 (= (_2!11699 lt!390053) (_2!11699 lt!390057)))))

(declare-fun b!251080 () Bool)

(declare-fun res!210235 () Bool)

(assert (=> b!251080 (=> (not res!210235) (not e!173995))))

(assert (=> b!251080 (= res!210235 (bvslt from!289 nBits!297))))

(declare-fun b!251081 () Bool)

(assert (=> b!251081 (= e!173994 (= (bitIndex!0 (size!5996 (buf!6495 (_1!11699 lt!390060))) (currentByte!11944 (_1!11699 lt!390060)) (currentBit!11939 (_1!11699 lt!390060))) lt!390055))))

(declare-fun b!251082 () Bool)

(declare-fun array_inv!5737 (array!13671) Bool)

(assert (=> b!251082 (= e!173998 (array_inv!5737 (buf!6495 thiss!1005)))))

(declare-fun b!251083 () Bool)

(declare-fun res!210230 () Bool)

(assert (=> b!251083 (=> (not res!210230) (not e!173995))))

(assert (=> b!251083 (= res!210230 (validate_offset_bits!1 ((_ sign_extend 32) (size!5996 (buf!6495 thiss!1005))) ((_ sign_extend 32) (currentByte!11944 thiss!1005)) ((_ sign_extend 32) (currentBit!11939 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!251084 () Bool)

(declare-fun lt!390047 () tuple2!21542)

(declare-fun lt!390061 () tuple2!21544)

(assert (=> b!251084 (= e!173993 (not (or (not (_2!11699 lt!390047)) (not (= (_1!11699 lt!390047) (_2!11700 lt!390061))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10914 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21542)

(assert (=> b!251084 (= lt!390047 (checkBitsLoopPure!0 (_1!11700 lt!390061) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!251084 (validate_offset_bits!1 ((_ sign_extend 32) (size!5996 (buf!6495 (_2!11698 lt!390062)))) ((_ sign_extend 32) (currentByte!11944 (_2!11698 lt!390063))) ((_ sign_extend 32) (currentBit!11939 (_2!11698 lt!390063))) lt!390058)))

(declare-fun lt!390051 () Unit!18134)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10914 array!13671 (_ BitVec 64)) Unit!18134)

(assert (=> b!251084 (= lt!390051 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11698 lt!390063) (buf!6495 (_2!11698 lt!390062)) lt!390058))))

(assert (=> b!251084 (= lt!390061 (reader!0 (_2!11698 lt!390063) (_2!11698 lt!390062)))))

(assert (= (and start!53954 res!210228) b!251083))

(assert (= (and b!251083 res!210230) b!251080))

(assert (= (and b!251080 res!210235) b!251075))

(assert (= (and b!251075 res!210229) b!251073))

(assert (= (and b!251073 res!210239) b!251072))

(assert (= (and b!251072 res!210236) b!251071))

(assert (= (and b!251071 res!210231) b!251081))

(assert (= (and b!251075 res!210238) b!251078))

(assert (= (and b!251078 res!210233) b!251076))

(assert (= (and b!251076 res!210232) b!251084))

(assert (= (and b!251075 res!210237) b!251077))

(assert (= (and b!251077 res!210234) b!251074))

(assert (= (and b!251075 res!210240) b!251079))

(assert (= start!53954 b!251082))

(declare-fun m!377715 () Bool)

(assert (=> b!251074 m!377715))

(declare-fun m!377717 () Bool)

(assert (=> b!251084 m!377717))

(declare-fun m!377719 () Bool)

(assert (=> b!251084 m!377719))

(declare-fun m!377721 () Bool)

(assert (=> b!251084 m!377721))

(declare-fun m!377723 () Bool)

(assert (=> b!251084 m!377723))

(declare-fun m!377725 () Bool)

(assert (=> b!251071 m!377725))

(assert (=> b!251071 m!377725))

(declare-fun m!377727 () Bool)

(assert (=> b!251071 m!377727))

(declare-fun m!377729 () Bool)

(assert (=> start!53954 m!377729))

(declare-fun m!377731 () Bool)

(assert (=> b!251081 m!377731))

(declare-fun m!377733 () Bool)

(assert (=> b!251073 m!377733))

(declare-fun m!377735 () Bool)

(assert (=> b!251073 m!377735))

(declare-fun m!377737 () Bool)

(assert (=> b!251082 m!377737))

(declare-fun m!377739 () Bool)

(assert (=> b!251076 m!377739))

(declare-fun m!377741 () Bool)

(assert (=> b!251075 m!377741))

(declare-fun m!377743 () Bool)

(assert (=> b!251075 m!377743))

(declare-fun m!377745 () Bool)

(assert (=> b!251075 m!377745))

(declare-fun m!377747 () Bool)

(assert (=> b!251075 m!377747))

(declare-fun m!377749 () Bool)

(assert (=> b!251075 m!377749))

(declare-fun m!377751 () Bool)

(assert (=> b!251075 m!377751))

(declare-fun m!377753 () Bool)

(assert (=> b!251075 m!377753))

(declare-fun m!377755 () Bool)

(assert (=> b!251075 m!377755))

(declare-fun m!377757 () Bool)

(assert (=> b!251075 m!377757))

(assert (=> b!251075 m!377723))

(declare-fun m!377759 () Bool)

(assert (=> b!251075 m!377759))

(declare-fun m!377761 () Bool)

(assert (=> b!251075 m!377761))

(declare-fun m!377763 () Bool)

(assert (=> b!251075 m!377763))

(declare-fun m!377765 () Bool)

(assert (=> b!251075 m!377765))

(declare-fun m!377767 () Bool)

(assert (=> b!251083 m!377767))

(declare-fun m!377769 () Bool)

(assert (=> b!251072 m!377769))

(declare-fun m!377771 () Bool)

(assert (=> b!251077 m!377771))

(declare-fun m!377773 () Bool)

(assert (=> b!251078 m!377773))

(assert (=> b!251078 m!377733))

(check-sat (not b!251078) (not start!53954) (not b!251084) (not b!251081) (not b!251073) (not b!251077) (not b!251083) (not b!251071) (not b!251074) (not b!251072) (not b!251075) (not b!251082) (not b!251076))
(check-sat)
(get-model)

(declare-fun d!84052 () Bool)

(declare-fun e!174032 () Bool)

(assert (=> d!84052 e!174032))

(declare-fun res!210284 () Bool)

(assert (=> d!84052 (=> (not res!210284) (not e!174032))))

(declare-fun lt!390132 () (_ BitVec 64))

(declare-fun lt!390128 () (_ BitVec 64))

(declare-fun lt!390131 () (_ BitVec 64))

(assert (=> d!84052 (= res!210284 (= lt!390131 (bvsub lt!390128 lt!390132)))))

(assert (=> d!84052 (or (= (bvand lt!390128 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390132 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!390128 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!390128 lt!390132) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!84052 (= lt!390132 (remainingBits!0 ((_ sign_extend 32) (size!5996 (buf!6495 (_2!11698 lt!390062)))) ((_ sign_extend 32) (currentByte!11944 (_2!11698 lt!390062))) ((_ sign_extend 32) (currentBit!11939 (_2!11698 lt!390062)))))))

(declare-fun lt!390127 () (_ BitVec 64))

(declare-fun lt!390129 () (_ BitVec 64))

(assert (=> d!84052 (= lt!390128 (bvmul lt!390127 lt!390129))))

(assert (=> d!84052 (or (= lt!390127 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!390129 (bvsdiv (bvmul lt!390127 lt!390129) lt!390127)))))

(assert (=> d!84052 (= lt!390129 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84052 (= lt!390127 ((_ sign_extend 32) (size!5996 (buf!6495 (_2!11698 lt!390062)))))))

(assert (=> d!84052 (= lt!390131 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11944 (_2!11698 lt!390062))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11939 (_2!11698 lt!390062)))))))

(assert (=> d!84052 (invariant!0 (currentBit!11939 (_2!11698 lt!390062)) (currentByte!11944 (_2!11698 lt!390062)) (size!5996 (buf!6495 (_2!11698 lt!390062))))))

(assert (=> d!84052 (= (bitIndex!0 (size!5996 (buf!6495 (_2!11698 lt!390062))) (currentByte!11944 (_2!11698 lt!390062)) (currentBit!11939 (_2!11698 lt!390062))) lt!390131)))

(declare-fun b!251131 () Bool)

(declare-fun res!210285 () Bool)

(assert (=> b!251131 (=> (not res!210285) (not e!174032))))

(assert (=> b!251131 (= res!210285 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!390131))))

(declare-fun b!251132 () Bool)

(declare-fun lt!390130 () (_ BitVec 64))

(assert (=> b!251132 (= e!174032 (bvsle lt!390131 (bvmul lt!390130 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!251132 (or (= lt!390130 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!390130 #b0000000000000000000000000000000000000000000000000000000000001000) lt!390130)))))

(assert (=> b!251132 (= lt!390130 ((_ sign_extend 32) (size!5996 (buf!6495 (_2!11698 lt!390062)))))))

(assert (= (and d!84052 res!210284) b!251131))

(assert (= (and b!251131 res!210285) b!251132))

(declare-fun m!377835 () Bool)

(assert (=> d!84052 m!377835))

(declare-fun m!377837 () Bool)

(assert (=> d!84052 m!377837))

(assert (=> b!251078 d!84052))

(declare-fun d!84054 () Bool)

(declare-fun e!174033 () Bool)

(assert (=> d!84054 e!174033))

(declare-fun res!210286 () Bool)

(assert (=> d!84054 (=> (not res!210286) (not e!174033))))

(declare-fun lt!390134 () (_ BitVec 64))

(declare-fun lt!390138 () (_ BitVec 64))

(declare-fun lt!390137 () (_ BitVec 64))

(assert (=> d!84054 (= res!210286 (= lt!390137 (bvsub lt!390134 lt!390138)))))

(assert (=> d!84054 (or (= (bvand lt!390134 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390138 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!390134 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!390134 lt!390138) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84054 (= lt!390138 (remainingBits!0 ((_ sign_extend 32) (size!5996 (buf!6495 (_2!11698 lt!390063)))) ((_ sign_extend 32) (currentByte!11944 (_2!11698 lt!390063))) ((_ sign_extend 32) (currentBit!11939 (_2!11698 lt!390063)))))))

(declare-fun lt!390133 () (_ BitVec 64))

(declare-fun lt!390135 () (_ BitVec 64))

(assert (=> d!84054 (= lt!390134 (bvmul lt!390133 lt!390135))))

(assert (=> d!84054 (or (= lt!390133 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!390135 (bvsdiv (bvmul lt!390133 lt!390135) lt!390133)))))

(assert (=> d!84054 (= lt!390135 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84054 (= lt!390133 ((_ sign_extend 32) (size!5996 (buf!6495 (_2!11698 lt!390063)))))))

(assert (=> d!84054 (= lt!390137 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11944 (_2!11698 lt!390063))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11939 (_2!11698 lt!390063)))))))

(assert (=> d!84054 (invariant!0 (currentBit!11939 (_2!11698 lt!390063)) (currentByte!11944 (_2!11698 lt!390063)) (size!5996 (buf!6495 (_2!11698 lt!390063))))))

(assert (=> d!84054 (= (bitIndex!0 (size!5996 (buf!6495 (_2!11698 lt!390063))) (currentByte!11944 (_2!11698 lt!390063)) (currentBit!11939 (_2!11698 lt!390063))) lt!390137)))

(declare-fun b!251133 () Bool)

(declare-fun res!210287 () Bool)

(assert (=> b!251133 (=> (not res!210287) (not e!174033))))

(assert (=> b!251133 (= res!210287 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!390137))))

(declare-fun b!251134 () Bool)

(declare-fun lt!390136 () (_ BitVec 64))

(assert (=> b!251134 (= e!174033 (bvsle lt!390137 (bvmul lt!390136 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!251134 (or (= lt!390136 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!390136 #b0000000000000000000000000000000000000000000000000000000000001000) lt!390136)))))

(assert (=> b!251134 (= lt!390136 ((_ sign_extend 32) (size!5996 (buf!6495 (_2!11698 lt!390063)))))))

(assert (= (and d!84054 res!210286) b!251133))

(assert (= (and b!251133 res!210287) b!251134))

(declare-fun m!377839 () Bool)

(assert (=> d!84054 m!377839))

(declare-fun m!377841 () Bool)

(assert (=> d!84054 m!377841))

(assert (=> b!251078 d!84054))

(declare-fun d!84056 () Bool)

(declare-datatypes ((tuple2!21552 0))(
  ( (tuple2!21553 (_1!11704 Bool) (_2!11704 BitStream!10914)) )
))
(declare-fun lt!390141 () tuple2!21552)

(declare-fun readBit!0 (BitStream!10914) tuple2!21552)

(assert (=> d!84056 (= lt!390141 (readBit!0 (readerFrom!0 (_2!11698 lt!390063) (currentBit!11939 thiss!1005) (currentByte!11944 thiss!1005))))))

(assert (=> d!84056 (= (readBitPure!0 (readerFrom!0 (_2!11698 lt!390063) (currentBit!11939 thiss!1005) (currentByte!11944 thiss!1005))) (tuple2!21543 (_2!11704 lt!390141) (_1!11704 lt!390141)))))

(declare-fun bs!21293 () Bool)

(assert (= bs!21293 d!84056))

(assert (=> bs!21293 m!377725))

(declare-fun m!377843 () Bool)

(assert (=> bs!21293 m!377843))

(assert (=> b!251071 d!84056))

(declare-fun d!84058 () Bool)

(declare-fun e!174036 () Bool)

(assert (=> d!84058 e!174036))

(declare-fun res!210291 () Bool)

(assert (=> d!84058 (=> (not res!210291) (not e!174036))))

(assert (=> d!84058 (= res!210291 (invariant!0 (currentBit!11939 (_2!11698 lt!390063)) (currentByte!11944 (_2!11698 lt!390063)) (size!5996 (buf!6495 (_2!11698 lt!390063)))))))

(assert (=> d!84058 (= (readerFrom!0 (_2!11698 lt!390063) (currentBit!11939 thiss!1005) (currentByte!11944 thiss!1005)) (BitStream!10915 (buf!6495 (_2!11698 lt!390063)) (currentByte!11944 thiss!1005) (currentBit!11939 thiss!1005)))))

(declare-fun b!251137 () Bool)

(assert (=> b!251137 (= e!174036 (invariant!0 (currentBit!11939 thiss!1005) (currentByte!11944 thiss!1005) (size!5996 (buf!6495 (_2!11698 lt!390063)))))))

(assert (= (and d!84058 res!210291) b!251137))

(assert (=> d!84058 m!377841))

(assert (=> b!251137 m!377771))

(assert (=> b!251071 d!84058))

(declare-fun d!84060 () Bool)

(declare-fun e!174037 () Bool)

(assert (=> d!84060 e!174037))

(declare-fun res!210292 () Bool)

(assert (=> d!84060 (=> (not res!210292) (not e!174037))))

(declare-fun lt!390143 () (_ BitVec 64))

(declare-fun lt!390146 () (_ BitVec 64))

(declare-fun lt!390147 () (_ BitVec 64))

(assert (=> d!84060 (= res!210292 (= lt!390146 (bvsub lt!390143 lt!390147)))))

(assert (=> d!84060 (or (= (bvand lt!390143 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390147 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!390143 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!390143 lt!390147) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84060 (= lt!390147 (remainingBits!0 ((_ sign_extend 32) (size!5996 (buf!6495 (_1!11699 lt!390060)))) ((_ sign_extend 32) (currentByte!11944 (_1!11699 lt!390060))) ((_ sign_extend 32) (currentBit!11939 (_1!11699 lt!390060)))))))

(declare-fun lt!390142 () (_ BitVec 64))

(declare-fun lt!390144 () (_ BitVec 64))

(assert (=> d!84060 (= lt!390143 (bvmul lt!390142 lt!390144))))

(assert (=> d!84060 (or (= lt!390142 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!390144 (bvsdiv (bvmul lt!390142 lt!390144) lt!390142)))))

(assert (=> d!84060 (= lt!390144 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84060 (= lt!390142 ((_ sign_extend 32) (size!5996 (buf!6495 (_1!11699 lt!390060)))))))

(assert (=> d!84060 (= lt!390146 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11944 (_1!11699 lt!390060))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11939 (_1!11699 lt!390060)))))))

(assert (=> d!84060 (invariant!0 (currentBit!11939 (_1!11699 lt!390060)) (currentByte!11944 (_1!11699 lt!390060)) (size!5996 (buf!6495 (_1!11699 lt!390060))))))

(assert (=> d!84060 (= (bitIndex!0 (size!5996 (buf!6495 (_1!11699 lt!390060))) (currentByte!11944 (_1!11699 lt!390060)) (currentBit!11939 (_1!11699 lt!390060))) lt!390146)))

(declare-fun b!251138 () Bool)

(declare-fun res!210293 () Bool)

(assert (=> b!251138 (=> (not res!210293) (not e!174037))))

(assert (=> b!251138 (= res!210293 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!390146))))

(declare-fun b!251139 () Bool)

(declare-fun lt!390145 () (_ BitVec 64))

(assert (=> b!251139 (= e!174037 (bvsle lt!390146 (bvmul lt!390145 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!251139 (or (= lt!390145 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!390145 #b0000000000000000000000000000000000000000000000000000000000001000) lt!390145)))))

(assert (=> b!251139 (= lt!390145 ((_ sign_extend 32) (size!5996 (buf!6495 (_1!11699 lt!390060)))))))

(assert (= (and d!84060 res!210292) b!251138))

(assert (= (and b!251138 res!210293) b!251139))

(declare-fun m!377845 () Bool)

(assert (=> d!84060 m!377845))

(declare-fun m!377847 () Bool)

(assert (=> d!84060 m!377847))

(assert (=> b!251081 d!84060))

(declare-fun d!84062 () Bool)

(assert (=> d!84062 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11939 thiss!1005) (currentByte!11944 thiss!1005) (size!5996 (buf!6495 thiss!1005))))))

(declare-fun bs!21294 () Bool)

(assert (= bs!21294 d!84062))

(declare-fun m!377849 () Bool)

(assert (=> bs!21294 m!377849))

(assert (=> start!53954 d!84062))

(declare-fun d!84064 () Bool)

(declare-fun res!210301 () Bool)

(declare-fun e!174042 () Bool)

(assert (=> d!84064 (=> (not res!210301) (not e!174042))))

(assert (=> d!84064 (= res!210301 (= (size!5996 (buf!6495 thiss!1005)) (size!5996 (buf!6495 (_2!11698 lt!390063)))))))

(assert (=> d!84064 (= (isPrefixOf!0 thiss!1005 (_2!11698 lt!390063)) e!174042)))

(declare-fun b!251146 () Bool)

(declare-fun res!210300 () Bool)

(assert (=> b!251146 (=> (not res!210300) (not e!174042))))

(assert (=> b!251146 (= res!210300 (bvsle (bitIndex!0 (size!5996 (buf!6495 thiss!1005)) (currentByte!11944 thiss!1005) (currentBit!11939 thiss!1005)) (bitIndex!0 (size!5996 (buf!6495 (_2!11698 lt!390063))) (currentByte!11944 (_2!11698 lt!390063)) (currentBit!11939 (_2!11698 lt!390063)))))))

(declare-fun b!251147 () Bool)

(declare-fun e!174043 () Bool)

(assert (=> b!251147 (= e!174042 e!174043)))

(declare-fun res!210302 () Bool)

(assert (=> b!251147 (=> res!210302 e!174043)))

(assert (=> b!251147 (= res!210302 (= (size!5996 (buf!6495 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!251148 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13671 array!13671 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!251148 (= e!174043 (arrayBitRangesEq!0 (buf!6495 thiss!1005) (buf!6495 (_2!11698 lt!390063)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5996 (buf!6495 thiss!1005)) (currentByte!11944 thiss!1005) (currentBit!11939 thiss!1005))))))

(assert (= (and d!84064 res!210301) b!251146))

(assert (= (and b!251146 res!210300) b!251147))

(assert (= (and b!251147 (not res!210302)) b!251148))

(assert (=> b!251146 m!377735))

(assert (=> b!251146 m!377733))

(assert (=> b!251148 m!377735))

(assert (=> b!251148 m!377735))

(declare-fun m!377851 () Bool)

(assert (=> b!251148 m!377851))

(assert (=> b!251072 d!84064))

(declare-fun d!84066 () Bool)

(assert (=> d!84066 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5996 (buf!6495 thiss!1005))) ((_ sign_extend 32) (currentByte!11944 thiss!1005)) ((_ sign_extend 32) (currentBit!11939 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5996 (buf!6495 thiss!1005))) ((_ sign_extend 32) (currentByte!11944 thiss!1005)) ((_ sign_extend 32) (currentBit!11939 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21295 () Bool)

(assert (= bs!21295 d!84066))

(declare-fun m!377853 () Bool)

(assert (=> bs!21295 m!377853))

(assert (=> b!251083 d!84066))

(declare-fun d!84068 () Bool)

(assert (=> d!84068 (= (array_inv!5737 (buf!6495 thiss!1005)) (bvsge (size!5996 (buf!6495 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!251082 d!84068))

(declare-fun d!84070 () Bool)

(declare-fun lt!390150 () tuple2!21552)

(declare-fun checkBitsLoop!0 (BitStream!10914 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21552)

(assert (=> d!84070 (= lt!390150 (checkBitsLoop!0 (_1!11700 lt!390061) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!84070 (= (checkBitsLoopPure!0 (_1!11700 lt!390061) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21543 (_2!11704 lt!390150) (_1!11704 lt!390150)))))

(declare-fun bs!21296 () Bool)

(assert (= bs!21296 d!84070))

(declare-fun m!377855 () Bool)

(assert (=> bs!21296 m!377855))

(assert (=> b!251084 d!84070))

(declare-fun d!84072 () Bool)

(assert (=> d!84072 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5996 (buf!6495 (_2!11698 lt!390062)))) ((_ sign_extend 32) (currentByte!11944 (_2!11698 lt!390063))) ((_ sign_extend 32) (currentBit!11939 (_2!11698 lt!390063))) lt!390058) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5996 (buf!6495 (_2!11698 lt!390062)))) ((_ sign_extend 32) (currentByte!11944 (_2!11698 lt!390063))) ((_ sign_extend 32) (currentBit!11939 (_2!11698 lt!390063)))) lt!390058))))

(declare-fun bs!21297 () Bool)

(assert (= bs!21297 d!84072))

(declare-fun m!377857 () Bool)

(assert (=> bs!21297 m!377857))

(assert (=> b!251084 d!84072))

(declare-fun d!84074 () Bool)

(assert (=> d!84074 (validate_offset_bits!1 ((_ sign_extend 32) (size!5996 (buf!6495 (_2!11698 lt!390062)))) ((_ sign_extend 32) (currentByte!11944 (_2!11698 lt!390063))) ((_ sign_extend 32) (currentBit!11939 (_2!11698 lt!390063))) lt!390058)))

(declare-fun lt!390153 () Unit!18134)

(declare-fun choose!9 (BitStream!10914 array!13671 (_ BitVec 64) BitStream!10914) Unit!18134)

(assert (=> d!84074 (= lt!390153 (choose!9 (_2!11698 lt!390063) (buf!6495 (_2!11698 lt!390062)) lt!390058 (BitStream!10915 (buf!6495 (_2!11698 lt!390062)) (currentByte!11944 (_2!11698 lt!390063)) (currentBit!11939 (_2!11698 lt!390063)))))))

(assert (=> d!84074 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11698 lt!390063) (buf!6495 (_2!11698 lt!390062)) lt!390058) lt!390153)))

(declare-fun bs!21298 () Bool)

(assert (= bs!21298 d!84074))

(assert (=> bs!21298 m!377719))

(declare-fun m!377859 () Bool)

(assert (=> bs!21298 m!377859))

(assert (=> b!251084 d!84074))

(declare-fun b!251159 () Bool)

(declare-fun e!174049 () Unit!18134)

(declare-fun Unit!18138 () Unit!18134)

(assert (=> b!251159 (= e!174049 Unit!18138)))

(declare-fun b!251160 () Bool)

(declare-fun res!210310 () Bool)

(declare-fun e!174048 () Bool)

(assert (=> b!251160 (=> (not res!210310) (not e!174048))))

(declare-fun lt!390194 () tuple2!21544)

(assert (=> b!251160 (= res!210310 (isPrefixOf!0 (_2!11700 lt!390194) (_2!11698 lt!390062)))))

(declare-fun b!251161 () Bool)

(declare-fun lt!390213 () (_ BitVec 64))

(declare-fun lt!390202 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!10914 (_ BitVec 64)) BitStream!10914)

(assert (=> b!251161 (= e!174048 (= (_1!11700 lt!390194) (withMovedBitIndex!0 (_2!11700 lt!390194) (bvsub lt!390213 lt!390202))))))

(assert (=> b!251161 (or (= (bvand lt!390213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390202 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!390213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!390213 lt!390202) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!251161 (= lt!390202 (bitIndex!0 (size!5996 (buf!6495 (_2!11698 lt!390062))) (currentByte!11944 (_2!11698 lt!390062)) (currentBit!11939 (_2!11698 lt!390062))))))

(assert (=> b!251161 (= lt!390213 (bitIndex!0 (size!5996 (buf!6495 (_2!11698 lt!390063))) (currentByte!11944 (_2!11698 lt!390063)) (currentBit!11939 (_2!11698 lt!390063))))))

(declare-fun d!84076 () Bool)

(assert (=> d!84076 e!174048))

(declare-fun res!210311 () Bool)

(assert (=> d!84076 (=> (not res!210311) (not e!174048))))

(assert (=> d!84076 (= res!210311 (isPrefixOf!0 (_1!11700 lt!390194) (_2!11700 lt!390194)))))

(declare-fun lt!390206 () BitStream!10914)

(assert (=> d!84076 (= lt!390194 (tuple2!21545 lt!390206 (_2!11698 lt!390062)))))

(declare-fun lt!390197 () Unit!18134)

(declare-fun lt!390205 () Unit!18134)

(assert (=> d!84076 (= lt!390197 lt!390205)))

(assert (=> d!84076 (isPrefixOf!0 lt!390206 (_2!11698 lt!390062))))

(assert (=> d!84076 (= lt!390205 (lemmaIsPrefixTransitive!0 lt!390206 (_2!11698 lt!390062) (_2!11698 lt!390062)))))

(declare-fun lt!390196 () Unit!18134)

(declare-fun lt!390211 () Unit!18134)

(assert (=> d!84076 (= lt!390196 lt!390211)))

(assert (=> d!84076 (isPrefixOf!0 lt!390206 (_2!11698 lt!390062))))

(assert (=> d!84076 (= lt!390211 (lemmaIsPrefixTransitive!0 lt!390206 (_2!11698 lt!390063) (_2!11698 lt!390062)))))

(declare-fun lt!390210 () Unit!18134)

(assert (=> d!84076 (= lt!390210 e!174049)))

(declare-fun c!11617 () Bool)

(assert (=> d!84076 (= c!11617 (not (= (size!5996 (buf!6495 (_2!11698 lt!390063))) #b00000000000000000000000000000000)))))

(declare-fun lt!390200 () Unit!18134)

(declare-fun lt!390204 () Unit!18134)

(assert (=> d!84076 (= lt!390200 lt!390204)))

(assert (=> d!84076 (isPrefixOf!0 (_2!11698 lt!390062) (_2!11698 lt!390062))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10914) Unit!18134)

(assert (=> d!84076 (= lt!390204 (lemmaIsPrefixRefl!0 (_2!11698 lt!390062)))))

(declare-fun lt!390199 () Unit!18134)

(declare-fun lt!390203 () Unit!18134)

(assert (=> d!84076 (= lt!390199 lt!390203)))

(assert (=> d!84076 (= lt!390203 (lemmaIsPrefixRefl!0 (_2!11698 lt!390062)))))

(declare-fun lt!390198 () Unit!18134)

(declare-fun lt!390201 () Unit!18134)

(assert (=> d!84076 (= lt!390198 lt!390201)))

(assert (=> d!84076 (isPrefixOf!0 lt!390206 lt!390206)))

(assert (=> d!84076 (= lt!390201 (lemmaIsPrefixRefl!0 lt!390206))))

(declare-fun lt!390207 () Unit!18134)

(declare-fun lt!390212 () Unit!18134)

(assert (=> d!84076 (= lt!390207 lt!390212)))

(assert (=> d!84076 (isPrefixOf!0 (_2!11698 lt!390063) (_2!11698 lt!390063))))

(assert (=> d!84076 (= lt!390212 (lemmaIsPrefixRefl!0 (_2!11698 lt!390063)))))

(assert (=> d!84076 (= lt!390206 (BitStream!10915 (buf!6495 (_2!11698 lt!390062)) (currentByte!11944 (_2!11698 lt!390063)) (currentBit!11939 (_2!11698 lt!390063))))))

(assert (=> d!84076 (isPrefixOf!0 (_2!11698 lt!390063) (_2!11698 lt!390062))))

(assert (=> d!84076 (= (reader!0 (_2!11698 lt!390063) (_2!11698 lt!390062)) lt!390194)))

(declare-fun b!251162 () Bool)

(declare-fun res!210309 () Bool)

(assert (=> b!251162 (=> (not res!210309) (not e!174048))))

(assert (=> b!251162 (= res!210309 (isPrefixOf!0 (_1!11700 lt!390194) (_2!11698 lt!390063)))))

(declare-fun b!251163 () Bool)

(declare-fun lt!390195 () Unit!18134)

(assert (=> b!251163 (= e!174049 lt!390195)))

(declare-fun lt!390208 () (_ BitVec 64))

(assert (=> b!251163 (= lt!390208 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!390209 () (_ BitVec 64))

(assert (=> b!251163 (= lt!390209 (bitIndex!0 (size!5996 (buf!6495 (_2!11698 lt!390063))) (currentByte!11944 (_2!11698 lt!390063)) (currentBit!11939 (_2!11698 lt!390063))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13671 array!13671 (_ BitVec 64) (_ BitVec 64)) Unit!18134)

(assert (=> b!251163 (= lt!390195 (arrayBitRangesEqSymmetric!0 (buf!6495 (_2!11698 lt!390063)) (buf!6495 (_2!11698 lt!390062)) lt!390208 lt!390209))))

(assert (=> b!251163 (arrayBitRangesEq!0 (buf!6495 (_2!11698 lt!390062)) (buf!6495 (_2!11698 lt!390063)) lt!390208 lt!390209)))

(assert (= (and d!84076 c!11617) b!251163))

(assert (= (and d!84076 (not c!11617)) b!251159))

(assert (= (and d!84076 res!210311) b!251162))

(assert (= (and b!251162 res!210309) b!251160))

(assert (= (and b!251160 res!210310) b!251161))

(declare-fun m!377861 () Bool)

(assert (=> d!84076 m!377861))

(declare-fun m!377863 () Bool)

(assert (=> d!84076 m!377863))

(declare-fun m!377865 () Bool)

(assert (=> d!84076 m!377865))

(declare-fun m!377867 () Bool)

(assert (=> d!84076 m!377867))

(declare-fun m!377869 () Bool)

(assert (=> d!84076 m!377869))

(declare-fun m!377871 () Bool)

(assert (=> d!84076 m!377871))

(declare-fun m!377873 () Bool)

(assert (=> d!84076 m!377873))

(declare-fun m!377875 () Bool)

(assert (=> d!84076 m!377875))

(declare-fun m!377877 () Bool)

(assert (=> d!84076 m!377877))

(declare-fun m!377879 () Bool)

(assert (=> d!84076 m!377879))

(assert (=> d!84076 m!377739))

(declare-fun m!377881 () Bool)

(assert (=> b!251162 m!377881))

(assert (=> b!251163 m!377733))

(declare-fun m!377883 () Bool)

(assert (=> b!251163 m!377883))

(declare-fun m!377885 () Bool)

(assert (=> b!251163 m!377885))

(declare-fun m!377887 () Bool)

(assert (=> b!251160 m!377887))

(declare-fun m!377889 () Bool)

(assert (=> b!251161 m!377889))

(assert (=> b!251161 m!377773))

(assert (=> b!251161 m!377733))

(assert (=> b!251084 d!84076))

(assert (=> b!251073 d!84054))

(declare-fun d!84078 () Bool)

(declare-fun e!174050 () Bool)

(assert (=> d!84078 e!174050))

(declare-fun res!210312 () Bool)

(assert (=> d!84078 (=> (not res!210312) (not e!174050))))

(declare-fun lt!390219 () (_ BitVec 64))

(declare-fun lt!390215 () (_ BitVec 64))

(declare-fun lt!390218 () (_ BitVec 64))

(assert (=> d!84078 (= res!210312 (= lt!390218 (bvsub lt!390215 lt!390219)))))

(assert (=> d!84078 (or (= (bvand lt!390215 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390219 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!390215 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!390215 lt!390219) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84078 (= lt!390219 (remainingBits!0 ((_ sign_extend 32) (size!5996 (buf!6495 thiss!1005))) ((_ sign_extend 32) (currentByte!11944 thiss!1005)) ((_ sign_extend 32) (currentBit!11939 thiss!1005))))))

(declare-fun lt!390214 () (_ BitVec 64))

(declare-fun lt!390216 () (_ BitVec 64))

(assert (=> d!84078 (= lt!390215 (bvmul lt!390214 lt!390216))))

(assert (=> d!84078 (or (= lt!390214 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!390216 (bvsdiv (bvmul lt!390214 lt!390216) lt!390214)))))

(assert (=> d!84078 (= lt!390216 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84078 (= lt!390214 ((_ sign_extend 32) (size!5996 (buf!6495 thiss!1005))))))

(assert (=> d!84078 (= lt!390218 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11944 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11939 thiss!1005))))))

(assert (=> d!84078 (invariant!0 (currentBit!11939 thiss!1005) (currentByte!11944 thiss!1005) (size!5996 (buf!6495 thiss!1005)))))

(assert (=> d!84078 (= (bitIndex!0 (size!5996 (buf!6495 thiss!1005)) (currentByte!11944 thiss!1005) (currentBit!11939 thiss!1005)) lt!390218)))

(declare-fun b!251164 () Bool)

(declare-fun res!210313 () Bool)

(assert (=> b!251164 (=> (not res!210313) (not e!174050))))

(assert (=> b!251164 (= res!210313 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!390218))))

(declare-fun b!251165 () Bool)

(declare-fun lt!390217 () (_ BitVec 64))

(assert (=> b!251165 (= e!174050 (bvsle lt!390218 (bvmul lt!390217 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!251165 (or (= lt!390217 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!390217 #b0000000000000000000000000000000000000000000000000000000000001000) lt!390217)))))

(assert (=> b!251165 (= lt!390217 ((_ sign_extend 32) (size!5996 (buf!6495 thiss!1005))))))

(assert (= (and d!84078 res!210312) b!251164))

(assert (= (and b!251164 res!210313) b!251165))

(assert (=> d!84078 m!377853))

(assert (=> d!84078 m!377849))

(assert (=> b!251073 d!84078))

(declare-fun d!84080 () Bool)

(declare-fun res!210315 () Bool)

(declare-fun e!174051 () Bool)

(assert (=> d!84080 (=> (not res!210315) (not e!174051))))

(assert (=> d!84080 (= res!210315 (= (size!5996 (buf!6495 thiss!1005)) (size!5996 (buf!6495 (_2!11698 lt!390062)))))))

(assert (=> d!84080 (= (isPrefixOf!0 thiss!1005 (_2!11698 lt!390062)) e!174051)))

(declare-fun b!251166 () Bool)

(declare-fun res!210314 () Bool)

(assert (=> b!251166 (=> (not res!210314) (not e!174051))))

(assert (=> b!251166 (= res!210314 (bvsle (bitIndex!0 (size!5996 (buf!6495 thiss!1005)) (currentByte!11944 thiss!1005) (currentBit!11939 thiss!1005)) (bitIndex!0 (size!5996 (buf!6495 (_2!11698 lt!390062))) (currentByte!11944 (_2!11698 lt!390062)) (currentBit!11939 (_2!11698 lt!390062)))))))

(declare-fun b!251167 () Bool)

(declare-fun e!174052 () Bool)

(assert (=> b!251167 (= e!174051 e!174052)))

(declare-fun res!210316 () Bool)

(assert (=> b!251167 (=> res!210316 e!174052)))

(assert (=> b!251167 (= res!210316 (= (size!5996 (buf!6495 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!251168 () Bool)

(assert (=> b!251168 (= e!174052 (arrayBitRangesEq!0 (buf!6495 thiss!1005) (buf!6495 (_2!11698 lt!390062)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5996 (buf!6495 thiss!1005)) (currentByte!11944 thiss!1005) (currentBit!11939 thiss!1005))))))

(assert (= (and d!84080 res!210315) b!251166))

(assert (= (and b!251166 res!210314) b!251167))

(assert (= (and b!251167 (not res!210316)) b!251168))

(assert (=> b!251166 m!377735))

(assert (=> b!251166 m!377773))

(assert (=> b!251168 m!377735))

(assert (=> b!251168 m!377735))

(declare-fun m!377891 () Bool)

(assert (=> b!251168 m!377891))

(assert (=> b!251075 d!84080))

(declare-fun d!84082 () Bool)

(declare-fun e!174057 () Bool)

(assert (=> d!84082 e!174057))

(declare-fun res!210327 () Bool)

(assert (=> d!84082 (=> (not res!210327) (not e!174057))))

(declare-fun lt!390231 () tuple2!21540)

(assert (=> d!84082 (= res!210327 (= (size!5996 (buf!6495 thiss!1005)) (size!5996 (buf!6495 (_2!11698 lt!390231)))))))

(declare-fun choose!16 (BitStream!10914 Bool) tuple2!21540)

(assert (=> d!84082 (= lt!390231 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!84082 (validate_offset_bit!0 ((_ sign_extend 32) (size!5996 (buf!6495 thiss!1005))) ((_ sign_extend 32) (currentByte!11944 thiss!1005)) ((_ sign_extend 32) (currentBit!11939 thiss!1005)))))

(assert (=> d!84082 (= (appendBit!0 thiss!1005 bit!26) lt!390231)))

(declare-fun b!251178 () Bool)

(declare-fun res!210325 () Bool)

(assert (=> b!251178 (=> (not res!210325) (not e!174057))))

(declare-fun lt!390230 () (_ BitVec 64))

(declare-fun lt!390229 () (_ BitVec 64))

(assert (=> b!251178 (= res!210325 (= (bitIndex!0 (size!5996 (buf!6495 (_2!11698 lt!390231))) (currentByte!11944 (_2!11698 lt!390231)) (currentBit!11939 (_2!11698 lt!390231))) (bvadd lt!390229 lt!390230)))))

(assert (=> b!251178 (or (not (= (bvand lt!390229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390230 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!390229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!390229 lt!390230) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!251178 (= lt!390230 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!251178 (= lt!390229 (bitIndex!0 (size!5996 (buf!6495 thiss!1005)) (currentByte!11944 thiss!1005) (currentBit!11939 thiss!1005)))))

(declare-fun b!251179 () Bool)

(declare-fun res!210326 () Bool)

(assert (=> b!251179 (=> (not res!210326) (not e!174057))))

(assert (=> b!251179 (= res!210326 (isPrefixOf!0 thiss!1005 (_2!11698 lt!390231)))))

(declare-fun b!251181 () Bool)

(declare-fun e!174058 () Bool)

(declare-fun lt!390228 () tuple2!21542)

(assert (=> b!251181 (= e!174058 (= (bitIndex!0 (size!5996 (buf!6495 (_1!11699 lt!390228))) (currentByte!11944 (_1!11699 lt!390228)) (currentBit!11939 (_1!11699 lt!390228))) (bitIndex!0 (size!5996 (buf!6495 (_2!11698 lt!390231))) (currentByte!11944 (_2!11698 lt!390231)) (currentBit!11939 (_2!11698 lt!390231)))))))

(declare-fun b!251180 () Bool)

(assert (=> b!251180 (= e!174057 e!174058)))

(declare-fun res!210328 () Bool)

(assert (=> b!251180 (=> (not res!210328) (not e!174058))))

(assert (=> b!251180 (= res!210328 (and (= (_2!11699 lt!390228) bit!26) (= (_1!11699 lt!390228) (_2!11698 lt!390231))))))

(assert (=> b!251180 (= lt!390228 (readBitPure!0 (readerFrom!0 (_2!11698 lt!390231) (currentBit!11939 thiss!1005) (currentByte!11944 thiss!1005))))))

(assert (= (and d!84082 res!210327) b!251178))

(assert (= (and b!251178 res!210325) b!251179))

(assert (= (and b!251179 res!210326) b!251180))

(assert (= (and b!251180 res!210328) b!251181))

(declare-fun m!377893 () Bool)

(assert (=> d!84082 m!377893))

(declare-fun m!377895 () Bool)

(assert (=> d!84082 m!377895))

(declare-fun m!377897 () Bool)

(assert (=> b!251179 m!377897))

(declare-fun m!377899 () Bool)

(assert (=> b!251180 m!377899))

(assert (=> b!251180 m!377899))

(declare-fun m!377901 () Bool)

(assert (=> b!251180 m!377901))

(declare-fun m!377903 () Bool)

(assert (=> b!251181 m!377903))

(declare-fun m!377905 () Bool)

(assert (=> b!251181 m!377905))

(assert (=> b!251178 m!377905))

(assert (=> b!251178 m!377735))

(assert (=> b!251075 d!84082))

(declare-fun d!84084 () Bool)

(declare-fun lt!390232 () tuple2!21552)

(assert (=> d!84084 (= lt!390232 (readBit!0 (_1!11700 lt!390054)))))

(assert (=> d!84084 (= (readBitPure!0 (_1!11700 lt!390054)) (tuple2!21543 (_2!11704 lt!390232) (_1!11704 lt!390232)))))

(declare-fun bs!21299 () Bool)

(assert (= bs!21299 d!84084))

(declare-fun m!377907 () Bool)

(assert (=> bs!21299 m!377907))

(assert (=> b!251075 d!84084))

(declare-fun d!84086 () Bool)

(declare-fun e!174061 () Bool)

(assert (=> d!84086 e!174061))

(declare-fun res!210331 () Bool)

(assert (=> d!84086 (=> (not res!210331) (not e!174061))))

(assert (=> d!84086 (= res!210331 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!390235 () Unit!18134)

(declare-fun choose!27 (BitStream!10914 BitStream!10914 (_ BitVec 64) (_ BitVec 64)) Unit!18134)

(assert (=> d!84086 (= lt!390235 (choose!27 thiss!1005 (_2!11698 lt!390063) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!84086 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!84086 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11698 lt!390063) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!390235)))

(declare-fun b!251184 () Bool)

(assert (=> b!251184 (= e!174061 (validate_offset_bits!1 ((_ sign_extend 32) (size!5996 (buf!6495 (_2!11698 lt!390063)))) ((_ sign_extend 32) (currentByte!11944 (_2!11698 lt!390063))) ((_ sign_extend 32) (currentBit!11939 (_2!11698 lt!390063))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!84086 res!210331) b!251184))

(declare-fun m!377909 () Bool)

(assert (=> d!84086 m!377909))

(assert (=> b!251184 m!377751))

(assert (=> b!251075 d!84086))

(declare-fun b!251185 () Bool)

(declare-fun e!174063 () Unit!18134)

(declare-fun Unit!18139 () Unit!18134)

(assert (=> b!251185 (= e!174063 Unit!18139)))

(declare-fun b!251186 () Bool)

(declare-fun res!210333 () Bool)

(declare-fun e!174062 () Bool)

(assert (=> b!251186 (=> (not res!210333) (not e!174062))))

(declare-fun lt!390236 () tuple2!21544)

(assert (=> b!251186 (= res!210333 (isPrefixOf!0 (_2!11700 lt!390236) (_2!11698 lt!390062)))))

(declare-fun lt!390244 () (_ BitVec 64))

(declare-fun b!251187 () Bool)

(declare-fun lt!390255 () (_ BitVec 64))

(assert (=> b!251187 (= e!174062 (= (_1!11700 lt!390236) (withMovedBitIndex!0 (_2!11700 lt!390236) (bvsub lt!390255 lt!390244))))))

(assert (=> b!251187 (or (= (bvand lt!390255 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390244 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!390255 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!390255 lt!390244) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!251187 (= lt!390244 (bitIndex!0 (size!5996 (buf!6495 (_2!11698 lt!390062))) (currentByte!11944 (_2!11698 lt!390062)) (currentBit!11939 (_2!11698 lt!390062))))))

(assert (=> b!251187 (= lt!390255 (bitIndex!0 (size!5996 (buf!6495 thiss!1005)) (currentByte!11944 thiss!1005) (currentBit!11939 thiss!1005)))))

(declare-fun d!84088 () Bool)

(assert (=> d!84088 e!174062))

(declare-fun res!210334 () Bool)

(assert (=> d!84088 (=> (not res!210334) (not e!174062))))

(assert (=> d!84088 (= res!210334 (isPrefixOf!0 (_1!11700 lt!390236) (_2!11700 lt!390236)))))

(declare-fun lt!390248 () BitStream!10914)

(assert (=> d!84088 (= lt!390236 (tuple2!21545 lt!390248 (_2!11698 lt!390062)))))

(declare-fun lt!390239 () Unit!18134)

(declare-fun lt!390247 () Unit!18134)

(assert (=> d!84088 (= lt!390239 lt!390247)))

(assert (=> d!84088 (isPrefixOf!0 lt!390248 (_2!11698 lt!390062))))

(assert (=> d!84088 (= lt!390247 (lemmaIsPrefixTransitive!0 lt!390248 (_2!11698 lt!390062) (_2!11698 lt!390062)))))

(declare-fun lt!390238 () Unit!18134)

(declare-fun lt!390253 () Unit!18134)

(assert (=> d!84088 (= lt!390238 lt!390253)))

(assert (=> d!84088 (isPrefixOf!0 lt!390248 (_2!11698 lt!390062))))

(assert (=> d!84088 (= lt!390253 (lemmaIsPrefixTransitive!0 lt!390248 thiss!1005 (_2!11698 lt!390062)))))

(declare-fun lt!390252 () Unit!18134)

(assert (=> d!84088 (= lt!390252 e!174063)))

(declare-fun c!11618 () Bool)

(assert (=> d!84088 (= c!11618 (not (= (size!5996 (buf!6495 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!390242 () Unit!18134)

(declare-fun lt!390246 () Unit!18134)

(assert (=> d!84088 (= lt!390242 lt!390246)))

(assert (=> d!84088 (isPrefixOf!0 (_2!11698 lt!390062) (_2!11698 lt!390062))))

(assert (=> d!84088 (= lt!390246 (lemmaIsPrefixRefl!0 (_2!11698 lt!390062)))))

(declare-fun lt!390241 () Unit!18134)

(declare-fun lt!390245 () Unit!18134)

(assert (=> d!84088 (= lt!390241 lt!390245)))

(assert (=> d!84088 (= lt!390245 (lemmaIsPrefixRefl!0 (_2!11698 lt!390062)))))

(declare-fun lt!390240 () Unit!18134)

(declare-fun lt!390243 () Unit!18134)

(assert (=> d!84088 (= lt!390240 lt!390243)))

(assert (=> d!84088 (isPrefixOf!0 lt!390248 lt!390248)))

(assert (=> d!84088 (= lt!390243 (lemmaIsPrefixRefl!0 lt!390248))))

(declare-fun lt!390249 () Unit!18134)

(declare-fun lt!390254 () Unit!18134)

(assert (=> d!84088 (= lt!390249 lt!390254)))

(assert (=> d!84088 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!84088 (= lt!390254 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!84088 (= lt!390248 (BitStream!10915 (buf!6495 (_2!11698 lt!390062)) (currentByte!11944 thiss!1005) (currentBit!11939 thiss!1005)))))

(assert (=> d!84088 (isPrefixOf!0 thiss!1005 (_2!11698 lt!390062))))

(assert (=> d!84088 (= (reader!0 thiss!1005 (_2!11698 lt!390062)) lt!390236)))

(declare-fun b!251188 () Bool)

(declare-fun res!210332 () Bool)

(assert (=> b!251188 (=> (not res!210332) (not e!174062))))

(assert (=> b!251188 (= res!210332 (isPrefixOf!0 (_1!11700 lt!390236) thiss!1005))))

(declare-fun b!251189 () Bool)

(declare-fun lt!390237 () Unit!18134)

(assert (=> b!251189 (= e!174063 lt!390237)))

(declare-fun lt!390250 () (_ BitVec 64))

(assert (=> b!251189 (= lt!390250 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!390251 () (_ BitVec 64))

(assert (=> b!251189 (= lt!390251 (bitIndex!0 (size!5996 (buf!6495 thiss!1005)) (currentByte!11944 thiss!1005) (currentBit!11939 thiss!1005)))))

(assert (=> b!251189 (= lt!390237 (arrayBitRangesEqSymmetric!0 (buf!6495 thiss!1005) (buf!6495 (_2!11698 lt!390062)) lt!390250 lt!390251))))

(assert (=> b!251189 (arrayBitRangesEq!0 (buf!6495 (_2!11698 lt!390062)) (buf!6495 thiss!1005) lt!390250 lt!390251)))

(assert (= (and d!84088 c!11618) b!251189))

(assert (= (and d!84088 (not c!11618)) b!251185))

(assert (= (and d!84088 res!210334) b!251188))

(assert (= (and b!251188 res!210332) b!251186))

(assert (= (and b!251186 res!210333) b!251187))

(declare-fun m!377911 () Bool)

(assert (=> d!84088 m!377911))

(declare-fun m!377913 () Bool)

(assert (=> d!84088 m!377913))

(declare-fun m!377915 () Bool)

(assert (=> d!84088 m!377915))

(declare-fun m!377917 () Bool)

(assert (=> d!84088 m!377917))

(assert (=> d!84088 m!377869))

(declare-fun m!377919 () Bool)

(assert (=> d!84088 m!377919))

(declare-fun m!377921 () Bool)

(assert (=> d!84088 m!377921))

(declare-fun m!377923 () Bool)

(assert (=> d!84088 m!377923))

(assert (=> d!84088 m!377877))

(declare-fun m!377925 () Bool)

(assert (=> d!84088 m!377925))

(assert (=> d!84088 m!377753))

(declare-fun m!377927 () Bool)

(assert (=> b!251188 m!377927))

(assert (=> b!251189 m!377735))

(declare-fun m!377929 () Bool)

(assert (=> b!251189 m!377929))

(declare-fun m!377931 () Bool)

(assert (=> b!251189 m!377931))

(declare-fun m!377933 () Bool)

(assert (=> b!251186 m!377933))

(declare-fun m!377935 () Bool)

(assert (=> b!251187 m!377935))

(assert (=> b!251187 m!377773))

(assert (=> b!251187 m!377735))

(assert (=> b!251075 d!84088))

(declare-fun d!84090 () Bool)

(declare-fun lt!390256 () tuple2!21552)

(assert (=> d!84090 (= lt!390256 (readBit!0 lt!390056))))

(assert (=> d!84090 (= (readBitPure!0 lt!390056) (tuple2!21543 (_2!11704 lt!390256) (_1!11704 lt!390256)))))

(declare-fun bs!21300 () Bool)

(assert (= bs!21300 d!84090))

(declare-fun m!377937 () Bool)

(assert (=> bs!21300 m!377937))

(assert (=> b!251075 d!84090))

(declare-fun d!84092 () Bool)

(declare-fun e!174066 () Bool)

(assert (=> d!84092 e!174066))

(declare-fun res!210337 () Bool)

(assert (=> d!84092 (=> (not res!210337) (not e!174066))))

(declare-fun lt!390268 () tuple2!21542)

(declare-fun lt!390265 () tuple2!21542)

(assert (=> d!84092 (= res!210337 (= (bitIndex!0 (size!5996 (buf!6495 (_1!11699 lt!390268))) (currentByte!11944 (_1!11699 lt!390268)) (currentBit!11939 (_1!11699 lt!390268))) (bitIndex!0 (size!5996 (buf!6495 (_1!11699 lt!390265))) (currentByte!11944 (_1!11699 lt!390265)) (currentBit!11939 (_1!11699 lt!390265)))))))

(declare-fun lt!390266 () BitStream!10914)

(declare-fun lt!390267 () Unit!18134)

(declare-fun choose!50 (BitStream!10914 BitStream!10914 BitStream!10914 tuple2!21542 tuple2!21542 BitStream!10914 Bool tuple2!21542 tuple2!21542 BitStream!10914 Bool) Unit!18134)

(assert (=> d!84092 (= lt!390267 (choose!50 lt!390056 (_2!11698 lt!390062) lt!390266 lt!390268 (tuple2!21543 (_1!11699 lt!390268) (_2!11699 lt!390268)) (_1!11699 lt!390268) (_2!11699 lt!390268) lt!390265 (tuple2!21543 (_1!11699 lt!390265) (_2!11699 lt!390265)) (_1!11699 lt!390265) (_2!11699 lt!390265)))))

(assert (=> d!84092 (= lt!390265 (readBitPure!0 lt!390266))))

(assert (=> d!84092 (= lt!390268 (readBitPure!0 lt!390056))))

(assert (=> d!84092 (= lt!390266 (BitStream!10915 (buf!6495 (_2!11698 lt!390062)) (currentByte!11944 lt!390056) (currentBit!11939 lt!390056)))))

(assert (=> d!84092 (invariant!0 (currentBit!11939 lt!390056) (currentByte!11944 lt!390056) (size!5996 (buf!6495 (_2!11698 lt!390062))))))

(assert (=> d!84092 (= (readBitPrefixLemma!0 lt!390056 (_2!11698 lt!390062)) lt!390267)))

(declare-fun b!251192 () Bool)

(assert (=> b!251192 (= e!174066 (= (_2!11699 lt!390268) (_2!11699 lt!390265)))))

(assert (= (and d!84092 res!210337) b!251192))

(declare-fun m!377939 () Bool)

(assert (=> d!84092 m!377939))

(declare-fun m!377941 () Bool)

(assert (=> d!84092 m!377941))

(assert (=> d!84092 m!377761))

(declare-fun m!377943 () Bool)

(assert (=> d!84092 m!377943))

(declare-fun m!377945 () Bool)

(assert (=> d!84092 m!377945))

(declare-fun m!377947 () Bool)

(assert (=> d!84092 m!377947))

(assert (=> b!251075 d!84092))

(declare-fun d!84094 () Bool)

(declare-fun e!174067 () Bool)

(assert (=> d!84094 e!174067))

(declare-fun res!210338 () Bool)

(assert (=> d!84094 (=> (not res!210338) (not e!174067))))

(declare-fun lt!390270 () (_ BitVec 64))

(declare-fun lt!390273 () (_ BitVec 64))

(declare-fun lt!390274 () (_ BitVec 64))

(assert (=> d!84094 (= res!210338 (= lt!390273 (bvsub lt!390270 lt!390274)))))

(assert (=> d!84094 (or (= (bvand lt!390270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390274 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!390270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!390270 lt!390274) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84094 (= lt!390274 (remainingBits!0 ((_ sign_extend 32) (size!5996 (buf!6495 (_1!11699 lt!390053)))) ((_ sign_extend 32) (currentByte!11944 (_1!11699 lt!390053))) ((_ sign_extend 32) (currentBit!11939 (_1!11699 lt!390053)))))))

(declare-fun lt!390269 () (_ BitVec 64))

(declare-fun lt!390271 () (_ BitVec 64))

(assert (=> d!84094 (= lt!390270 (bvmul lt!390269 lt!390271))))

(assert (=> d!84094 (or (= lt!390269 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!390271 (bvsdiv (bvmul lt!390269 lt!390271) lt!390269)))))

(assert (=> d!84094 (= lt!390271 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84094 (= lt!390269 ((_ sign_extend 32) (size!5996 (buf!6495 (_1!11699 lt!390053)))))))

(assert (=> d!84094 (= lt!390273 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11944 (_1!11699 lt!390053))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11939 (_1!11699 lt!390053)))))))

(assert (=> d!84094 (invariant!0 (currentBit!11939 (_1!11699 lt!390053)) (currentByte!11944 (_1!11699 lt!390053)) (size!5996 (buf!6495 (_1!11699 lt!390053))))))

(assert (=> d!84094 (= (bitIndex!0 (size!5996 (buf!6495 (_1!11699 lt!390053))) (currentByte!11944 (_1!11699 lt!390053)) (currentBit!11939 (_1!11699 lt!390053))) lt!390273)))

(declare-fun b!251193 () Bool)

(declare-fun res!210339 () Bool)

(assert (=> b!251193 (=> (not res!210339) (not e!174067))))

(assert (=> b!251193 (= res!210339 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!390273))))

(declare-fun b!251194 () Bool)

(declare-fun lt!390272 () (_ BitVec 64))

(assert (=> b!251194 (= e!174067 (bvsle lt!390273 (bvmul lt!390272 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!251194 (or (= lt!390272 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!390272 #b0000000000000000000000000000000000000000000000000000000000001000) lt!390272)))))

(assert (=> b!251194 (= lt!390272 ((_ sign_extend 32) (size!5996 (buf!6495 (_1!11699 lt!390053)))))))

(assert (= (and d!84094 res!210338) b!251193))

(assert (= (and b!251193 res!210339) b!251194))

(declare-fun m!377949 () Bool)

(assert (=> d!84094 m!377949))

(declare-fun m!377951 () Bool)

(assert (=> d!84094 m!377951))

(assert (=> b!251075 d!84094))

(declare-fun d!84096 () Bool)

(declare-fun e!174073 () Bool)

(assert (=> d!84096 e!174073))

(declare-fun res!210350 () Bool)

(assert (=> d!84096 (=> (not res!210350) (not e!174073))))

(declare-fun lt!390298 () tuple2!21540)

(assert (=> d!84096 (= res!210350 (= (size!5996 (buf!6495 (_2!11698 lt!390063))) (size!5996 (buf!6495 (_2!11698 lt!390298)))))))

(declare-fun choose!51 (BitStream!10914 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21540)

(assert (=> d!84096 (= lt!390298 (choose!51 (_2!11698 lt!390063) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!84096 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!84096 (= (appendNBitsLoop!0 (_2!11698 lt!390063) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!390298)))

(declare-fun b!251205 () Bool)

(declare-fun lt!390292 () tuple2!21542)

(declare-fun lt!390296 () tuple2!21544)

(assert (=> b!251205 (= e!174073 (and (_2!11699 lt!390292) (= (_1!11699 lt!390292) (_2!11700 lt!390296))))))

(assert (=> b!251205 (= lt!390292 (checkBitsLoopPure!0 (_1!11700 lt!390296) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!390293 () Unit!18134)

(declare-fun lt!390294 () Unit!18134)

(assert (=> b!251205 (= lt!390293 lt!390294)))

(declare-fun lt!390297 () (_ BitVec 64))

(assert (=> b!251205 (validate_offset_bits!1 ((_ sign_extend 32) (size!5996 (buf!6495 (_2!11698 lt!390298)))) ((_ sign_extend 32) (currentByte!11944 (_2!11698 lt!390063))) ((_ sign_extend 32) (currentBit!11939 (_2!11698 lt!390063))) lt!390297)))

(assert (=> b!251205 (= lt!390294 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11698 lt!390063) (buf!6495 (_2!11698 lt!390298)) lt!390297))))

(declare-fun e!174072 () Bool)

(assert (=> b!251205 e!174072))

(declare-fun res!210349 () Bool)

(assert (=> b!251205 (=> (not res!210349) (not e!174072))))

(assert (=> b!251205 (= res!210349 (and (= (size!5996 (buf!6495 (_2!11698 lt!390063))) (size!5996 (buf!6495 (_2!11698 lt!390298)))) (bvsge lt!390297 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!251205 (= lt!390297 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!251205 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!251205 (= lt!390296 (reader!0 (_2!11698 lt!390063) (_2!11698 lt!390298)))))

(declare-fun b!251206 () Bool)

(assert (=> b!251206 (= e!174072 (validate_offset_bits!1 ((_ sign_extend 32) (size!5996 (buf!6495 (_2!11698 lt!390063)))) ((_ sign_extend 32) (currentByte!11944 (_2!11698 lt!390063))) ((_ sign_extend 32) (currentBit!11939 (_2!11698 lt!390063))) lt!390297))))

(declare-fun b!251203 () Bool)

(declare-fun res!210348 () Bool)

(assert (=> b!251203 (=> (not res!210348) (not e!174073))))

(declare-fun lt!390291 () (_ BitVec 64))

(declare-fun lt!390295 () (_ BitVec 64))

(assert (=> b!251203 (= res!210348 (= (bitIndex!0 (size!5996 (buf!6495 (_2!11698 lt!390298))) (currentByte!11944 (_2!11698 lt!390298)) (currentBit!11939 (_2!11698 lt!390298))) (bvadd lt!390291 lt!390295)))))

(assert (=> b!251203 (or (not (= (bvand lt!390291 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390295 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!390291 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!390291 lt!390295) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!251203 (= lt!390295 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!251203 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!251203 (= lt!390291 (bitIndex!0 (size!5996 (buf!6495 (_2!11698 lt!390063))) (currentByte!11944 (_2!11698 lt!390063)) (currentBit!11939 (_2!11698 lt!390063))))))

(declare-fun b!251204 () Bool)

(declare-fun res!210351 () Bool)

(assert (=> b!251204 (=> (not res!210351) (not e!174073))))

(assert (=> b!251204 (= res!210351 (isPrefixOf!0 (_2!11698 lt!390063) (_2!11698 lt!390298)))))

(assert (= (and d!84096 res!210350) b!251203))

(assert (= (and b!251203 res!210348) b!251204))

(assert (= (and b!251204 res!210351) b!251205))

(assert (= (and b!251205 res!210349) b!251206))

(declare-fun m!377953 () Bool)

(assert (=> b!251203 m!377953))

(assert (=> b!251203 m!377733))

(declare-fun m!377955 () Bool)

(assert (=> b!251206 m!377955))

(declare-fun m!377957 () Bool)

(assert (=> b!251204 m!377957))

(declare-fun m!377959 () Bool)

(assert (=> b!251205 m!377959))

(declare-fun m!377961 () Bool)

(assert (=> b!251205 m!377961))

(declare-fun m!377963 () Bool)

(assert (=> b!251205 m!377963))

(declare-fun m!377965 () Bool)

(assert (=> b!251205 m!377965))

(declare-fun m!377967 () Bool)

(assert (=> d!84096 m!377967))

(assert (=> b!251075 d!84096))

(declare-fun d!84098 () Bool)

(declare-fun lt!390299 () tuple2!21552)

(assert (=> d!84098 (= lt!390299 (readBit!0 (BitStream!10915 (buf!6495 (_2!11698 lt!390062)) (currentByte!11944 thiss!1005) (currentBit!11939 thiss!1005))))))

(assert (=> d!84098 (= (readBitPure!0 (BitStream!10915 (buf!6495 (_2!11698 lt!390062)) (currentByte!11944 thiss!1005) (currentBit!11939 thiss!1005))) (tuple2!21543 (_2!11704 lt!390299) (_1!11704 lt!390299)))))

(declare-fun bs!21301 () Bool)

(assert (= bs!21301 d!84098))

(declare-fun m!377969 () Bool)

(assert (=> bs!21301 m!377969))

(assert (=> b!251075 d!84098))

(assert (=> b!251075 d!84076))

(declare-fun d!84100 () Bool)

(assert (=> d!84100 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5996 (buf!6495 (_2!11698 lt!390063)))) ((_ sign_extend 32) (currentByte!11944 (_2!11698 lt!390063))) ((_ sign_extend 32) (currentBit!11939 (_2!11698 lt!390063))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5996 (buf!6495 (_2!11698 lt!390063)))) ((_ sign_extend 32) (currentByte!11944 (_2!11698 lt!390063))) ((_ sign_extend 32) (currentBit!11939 (_2!11698 lt!390063)))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21302 () Bool)

(assert (= bs!21302 d!84100))

(assert (=> bs!21302 m!377839))

(assert (=> b!251075 d!84100))

(declare-fun d!84102 () Bool)

(assert (=> d!84102 (isPrefixOf!0 thiss!1005 (_2!11698 lt!390062))))

(declare-fun lt!390302 () Unit!18134)

(declare-fun choose!30 (BitStream!10914 BitStream!10914 BitStream!10914) Unit!18134)

(assert (=> d!84102 (= lt!390302 (choose!30 thiss!1005 (_2!11698 lt!390063) (_2!11698 lt!390062)))))

(assert (=> d!84102 (isPrefixOf!0 thiss!1005 (_2!11698 lt!390063))))

(assert (=> d!84102 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11698 lt!390063) (_2!11698 lt!390062)) lt!390302)))

(declare-fun bs!21303 () Bool)

(assert (= bs!21303 d!84102))

(assert (=> bs!21303 m!377753))

(declare-fun m!377971 () Bool)

(assert (=> bs!21303 m!377971))

(assert (=> bs!21303 m!377769))

(assert (=> b!251075 d!84102))

(declare-fun d!84104 () Bool)

(declare-fun e!174074 () Bool)

(assert (=> d!84104 e!174074))

(declare-fun res!210352 () Bool)

(assert (=> d!84104 (=> (not res!210352) (not e!174074))))

(declare-fun lt!390304 () (_ BitVec 64))

(declare-fun lt!390308 () (_ BitVec 64))

(declare-fun lt!390307 () (_ BitVec 64))

(assert (=> d!84104 (= res!210352 (= lt!390307 (bvsub lt!390304 lt!390308)))))

(assert (=> d!84104 (or (= (bvand lt!390304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390308 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!390304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!390304 lt!390308) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84104 (= lt!390308 (remainingBits!0 ((_ sign_extend 32) (size!5996 (buf!6495 (_1!11699 lt!390057)))) ((_ sign_extend 32) (currentByte!11944 (_1!11699 lt!390057))) ((_ sign_extend 32) (currentBit!11939 (_1!11699 lt!390057)))))))

(declare-fun lt!390303 () (_ BitVec 64))

(declare-fun lt!390305 () (_ BitVec 64))

(assert (=> d!84104 (= lt!390304 (bvmul lt!390303 lt!390305))))

(assert (=> d!84104 (or (= lt!390303 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!390305 (bvsdiv (bvmul lt!390303 lt!390305) lt!390303)))))

(assert (=> d!84104 (= lt!390305 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84104 (= lt!390303 ((_ sign_extend 32) (size!5996 (buf!6495 (_1!11699 lt!390057)))))))

(assert (=> d!84104 (= lt!390307 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11944 (_1!11699 lt!390057))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11939 (_1!11699 lt!390057)))))))

(assert (=> d!84104 (invariant!0 (currentBit!11939 (_1!11699 lt!390057)) (currentByte!11944 (_1!11699 lt!390057)) (size!5996 (buf!6495 (_1!11699 lt!390057))))))

(assert (=> d!84104 (= (bitIndex!0 (size!5996 (buf!6495 (_1!11699 lt!390057))) (currentByte!11944 (_1!11699 lt!390057)) (currentBit!11939 (_1!11699 lt!390057))) lt!390307)))

(declare-fun b!251207 () Bool)

(declare-fun res!210353 () Bool)

(assert (=> b!251207 (=> (not res!210353) (not e!174074))))

(assert (=> b!251207 (= res!210353 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!390307))))

(declare-fun b!251208 () Bool)

(declare-fun lt!390306 () (_ BitVec 64))

(assert (=> b!251208 (= e!174074 (bvsle lt!390307 (bvmul lt!390306 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!251208 (or (= lt!390306 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!390306 #b0000000000000000000000000000000000000000000000000000000000001000) lt!390306)))))

(assert (=> b!251208 (= lt!390306 ((_ sign_extend 32) (size!5996 (buf!6495 (_1!11699 lt!390057)))))))

(assert (= (and d!84104 res!210352) b!251207))

(assert (= (and b!251207 res!210353) b!251208))

(declare-fun m!377973 () Bool)

(assert (=> d!84104 m!377973))

(declare-fun m!377975 () Bool)

(assert (=> d!84104 m!377975))

(assert (=> b!251075 d!84104))

(declare-fun d!84106 () Bool)

(assert (=> d!84106 (= (invariant!0 (currentBit!11939 thiss!1005) (currentByte!11944 thiss!1005) (size!5996 (buf!6495 (_2!11698 lt!390062)))) (and (bvsge (currentBit!11939 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11939 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11944 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11944 thiss!1005) (size!5996 (buf!6495 (_2!11698 lt!390062)))) (and (= (currentBit!11939 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11944 thiss!1005) (size!5996 (buf!6495 (_2!11698 lt!390062))))))))))

(assert (=> b!251074 d!84106))

(declare-fun d!84108 () Bool)

(declare-fun res!210355 () Bool)

(declare-fun e!174075 () Bool)

(assert (=> d!84108 (=> (not res!210355) (not e!174075))))

(assert (=> d!84108 (= res!210355 (= (size!5996 (buf!6495 (_2!11698 lt!390063))) (size!5996 (buf!6495 (_2!11698 lt!390062)))))))

(assert (=> d!84108 (= (isPrefixOf!0 (_2!11698 lt!390063) (_2!11698 lt!390062)) e!174075)))

(declare-fun b!251209 () Bool)

(declare-fun res!210354 () Bool)

(assert (=> b!251209 (=> (not res!210354) (not e!174075))))

(assert (=> b!251209 (= res!210354 (bvsle (bitIndex!0 (size!5996 (buf!6495 (_2!11698 lt!390063))) (currentByte!11944 (_2!11698 lt!390063)) (currentBit!11939 (_2!11698 lt!390063))) (bitIndex!0 (size!5996 (buf!6495 (_2!11698 lt!390062))) (currentByte!11944 (_2!11698 lt!390062)) (currentBit!11939 (_2!11698 lt!390062)))))))

(declare-fun b!251210 () Bool)

(declare-fun e!174076 () Bool)

(assert (=> b!251210 (= e!174075 e!174076)))

(declare-fun res!210356 () Bool)

(assert (=> b!251210 (=> res!210356 e!174076)))

(assert (=> b!251210 (= res!210356 (= (size!5996 (buf!6495 (_2!11698 lt!390063))) #b00000000000000000000000000000000))))

(declare-fun b!251211 () Bool)

(assert (=> b!251211 (= e!174076 (arrayBitRangesEq!0 (buf!6495 (_2!11698 lt!390063)) (buf!6495 (_2!11698 lt!390062)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5996 (buf!6495 (_2!11698 lt!390063))) (currentByte!11944 (_2!11698 lt!390063)) (currentBit!11939 (_2!11698 lt!390063)))))))

(assert (= (and d!84108 res!210355) b!251209))

(assert (= (and b!251209 res!210354) b!251210))

(assert (= (and b!251210 (not res!210356)) b!251211))

(assert (=> b!251209 m!377733))

(assert (=> b!251209 m!377773))

(assert (=> b!251211 m!377733))

(assert (=> b!251211 m!377733))

(declare-fun m!377977 () Bool)

(assert (=> b!251211 m!377977))

(assert (=> b!251076 d!84108))

(declare-fun d!84110 () Bool)

(assert (=> d!84110 (= (invariant!0 (currentBit!11939 thiss!1005) (currentByte!11944 thiss!1005) (size!5996 (buf!6495 (_2!11698 lt!390063)))) (and (bvsge (currentBit!11939 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11939 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11944 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11944 thiss!1005) (size!5996 (buf!6495 (_2!11698 lt!390063)))) (and (= (currentBit!11939 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11944 thiss!1005) (size!5996 (buf!6495 (_2!11698 lt!390063))))))))))

(assert (=> b!251077 d!84110))

(check-sat (not b!251178) (not b!251211) (not d!84086) (not d!84084) (not d!84100) (not d!84092) (not b!251162) (not b!251168) (not d!84074) (not d!84060) (not d!84090) (not d!84054) (not b!251179) (not b!251188) (not b!251137) (not b!251161) (not d!84078) (not b!251181) (not d!84070) (not d!84052) (not d!84094) (not d!84102) (not b!251206) (not d!84058) (not d!84062) (not b!251209) (not b!251163) (not b!251187) (not b!251166) (not b!251146) (not d!84076) (not b!251204) (not d!84066) (not d!84098) (not d!84082) (not d!84088) (not d!84096) (not d!84104) (not d!84072) (not b!251148) (not d!84056) (not b!251189) (not b!251203) (not b!251205) (not b!251160) (not b!251186) (not b!251180) (not b!251184))
