; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23104 () Bool)

(assert start!23104)

(declare-fun b!117194 () Bool)

(declare-fun res!96938 () Bool)

(declare-fun e!76820 () Bool)

(assert (=> b!117194 (=> (not res!96938) (not e!76820))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!117194 (= res!96938 (bvslt i!615 nBits!396))))

(declare-fun b!117195 () Bool)

(declare-fun e!76819 () Bool)

(declare-datatypes ((array!5275 0))(
  ( (array!5276 (arr!2986 (Array (_ BitVec 32) (_ BitVec 8))) (size!2393 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4260 0))(
  ( (BitStream!4261 (buf!2806 array!5275) (currentByte!5449 (_ BitVec 32)) (currentBit!5444 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9756 0))(
  ( (tuple2!9757 (_1!5143 BitStream!4260) (_2!5143 Bool)) )
))
(declare-fun lt!179454 () tuple2!9756)

(declare-fun lt!179447 () tuple2!9756)

(assert (=> b!117195 (= e!76819 (= (_2!5143 lt!179454) (_2!5143 lt!179447)))))

(declare-fun b!117196 () Bool)

(declare-fun res!96931 () Bool)

(assert (=> b!117196 (=> (not res!96931) (not e!76820))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117196 (= res!96931 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!117197 () Bool)

(declare-fun e!76818 () Bool)

(declare-fun thiss!1305 () BitStream!4260)

(declare-datatypes ((Unit!7209 0))(
  ( (Unit!7210) )
))
(declare-datatypes ((tuple2!9758 0))(
  ( (tuple2!9759 (_1!5144 Unit!7209) (_2!5144 BitStream!4260)) )
))
(declare-fun lt!179450 () tuple2!9758)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!117197 (= e!76818 (invariant!0 (currentBit!5444 thiss!1305) (currentByte!5449 thiss!1305) (size!2393 (buf!2806 (_2!5144 lt!179450)))))))

(declare-fun b!117198 () Bool)

(declare-fun e!76821 () Bool)

(declare-fun lt!179453 () tuple2!9756)

(declare-fun lt!179442 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117198 (= e!76821 (= (bitIndex!0 (size!2393 (buf!2806 (_1!5143 lt!179453))) (currentByte!5449 (_1!5143 lt!179453)) (currentBit!5444 (_1!5143 lt!179453))) lt!179442))))

(declare-fun lt!179449 () tuple2!9758)

(declare-fun b!117199 () Bool)

(assert (=> b!117199 (= e!76820 (not (or (not (= (size!2393 (buf!2806 (_2!5144 lt!179449))) (size!2393 (buf!2806 (_2!5144 lt!179450))))) (bvsge ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9760 0))(
  ( (tuple2!9761 (_1!5145 BitStream!4260) (_2!5145 (_ BitVec 64))) )
))
(declare-fun lt!179439 () tuple2!9760)

(declare-datatypes ((tuple2!9762 0))(
  ( (tuple2!9763 (_1!5146 BitStream!4260) (_2!5146 BitStream!4260)) )
))
(declare-fun lt!179443 () tuple2!9762)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4260 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9760)

(assert (=> b!117199 (= lt!179439 (readNLeastSignificantBitsLoopPure!0 (_1!5146 lt!179443) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(declare-fun lt!179451 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!117199 (validate_offset_bits!1 ((_ sign_extend 32) (size!2393 (buf!2806 (_2!5144 lt!179450)))) ((_ sign_extend 32) (currentByte!5449 thiss!1305)) ((_ sign_extend 32) (currentBit!5444 thiss!1305)) lt!179451)))

(declare-fun lt!179440 () Unit!7209)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4260 array!5275 (_ BitVec 64)) Unit!7209)

(assert (=> b!117199 (= lt!179440 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2806 (_2!5144 lt!179450)) lt!179451))))

(declare-fun lt!179446 () Bool)

(declare-fun readBitPure!0 (BitStream!4260) tuple2!9756)

(assert (=> b!117199 (= (_2!5143 (readBitPure!0 (_1!5146 lt!179443))) lt!179446)))

(declare-fun lt!179441 () tuple2!9762)

(declare-fun reader!0 (BitStream!4260 BitStream!4260) tuple2!9762)

(assert (=> b!117199 (= lt!179441 (reader!0 (_2!5144 lt!179449) (_2!5144 lt!179450)))))

(assert (=> b!117199 (= lt!179443 (reader!0 thiss!1305 (_2!5144 lt!179450)))))

(assert (=> b!117199 e!76819))

(declare-fun res!96939 () Bool)

(assert (=> b!117199 (=> (not res!96939) (not e!76819))))

(assert (=> b!117199 (= res!96939 (= (bitIndex!0 (size!2393 (buf!2806 (_1!5143 lt!179454))) (currentByte!5449 (_1!5143 lt!179454)) (currentBit!5444 (_1!5143 lt!179454))) (bitIndex!0 (size!2393 (buf!2806 (_1!5143 lt!179447))) (currentByte!5449 (_1!5143 lt!179447)) (currentBit!5444 (_1!5143 lt!179447)))))))

(declare-fun lt!179452 () Unit!7209)

(declare-fun lt!179445 () BitStream!4260)

(declare-fun readBitPrefixLemma!0 (BitStream!4260 BitStream!4260) Unit!7209)

(assert (=> b!117199 (= lt!179452 (readBitPrefixLemma!0 lt!179445 (_2!5144 lt!179450)))))

(assert (=> b!117199 (= lt!179447 (readBitPure!0 (BitStream!4261 (buf!2806 (_2!5144 lt!179450)) (currentByte!5449 thiss!1305) (currentBit!5444 thiss!1305))))))

(assert (=> b!117199 (= lt!179454 (readBitPure!0 lt!179445))))

(assert (=> b!117199 (= lt!179445 (BitStream!4261 (buf!2806 (_2!5144 lt!179449)) (currentByte!5449 thiss!1305) (currentBit!5444 thiss!1305)))))

(assert (=> b!117199 e!76818))

(declare-fun res!96932 () Bool)

(assert (=> b!117199 (=> (not res!96932) (not e!76818))))

(declare-fun isPrefixOf!0 (BitStream!4260 BitStream!4260) Bool)

(assert (=> b!117199 (= res!96932 (isPrefixOf!0 thiss!1305 (_2!5144 lt!179450)))))

(declare-fun lt!179448 () Unit!7209)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4260 BitStream!4260 BitStream!4260) Unit!7209)

(assert (=> b!117199 (= lt!179448 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5144 lt!179449) (_2!5144 lt!179450)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4260 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9758)

(assert (=> b!117199 (= lt!179450 (appendNLeastSignificantBitsLoop!0 (_2!5144 lt!179449) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!76824 () Bool)

(assert (=> b!117199 e!76824))

(declare-fun res!96936 () Bool)

(assert (=> b!117199 (=> (not res!96936) (not e!76824))))

(assert (=> b!117199 (= res!96936 (= (size!2393 (buf!2806 thiss!1305)) (size!2393 (buf!2806 (_2!5144 lt!179449)))))))

(declare-fun appendBit!0 (BitStream!4260 Bool) tuple2!9758)

(assert (=> b!117199 (= lt!179449 (appendBit!0 thiss!1305 lt!179446))))

(assert (=> b!117199 (= lt!179446 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!96929 () Bool)

(declare-fun e!76822 () Bool)

(assert (=> start!23104 (=> (not res!96929) (not e!76822))))

(assert (=> start!23104 (= res!96929 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23104 e!76822))

(assert (=> start!23104 true))

(declare-fun e!76817 () Bool)

(declare-fun inv!12 (BitStream!4260) Bool)

(assert (=> start!23104 (and (inv!12 thiss!1305) e!76817)))

(declare-fun b!117200 () Bool)

(declare-fun res!96930 () Bool)

(declare-fun e!76823 () Bool)

(assert (=> b!117200 (=> (not res!96930) (not e!76823))))

(assert (=> b!117200 (= res!96930 (isPrefixOf!0 thiss!1305 (_2!5144 lt!179449)))))

(declare-fun b!117201 () Bool)

(assert (=> b!117201 (= e!76823 e!76821)))

(declare-fun res!96933 () Bool)

(assert (=> b!117201 (=> (not res!96933) (not e!76821))))

(assert (=> b!117201 (= res!96933 (and (= (_2!5143 lt!179453) lt!179446) (= (_1!5143 lt!179453) (_2!5144 lt!179449))))))

(declare-fun readerFrom!0 (BitStream!4260 (_ BitVec 32) (_ BitVec 32)) BitStream!4260)

(assert (=> b!117201 (= lt!179453 (readBitPure!0 (readerFrom!0 (_2!5144 lt!179449) (currentBit!5444 thiss!1305) (currentByte!5449 thiss!1305))))))

(declare-fun b!117202 () Bool)

(declare-fun array_inv!2195 (array!5275) Bool)

(assert (=> b!117202 (= e!76817 (array_inv!2195 (buf!2806 thiss!1305)))))

(declare-fun b!117203 () Bool)

(declare-fun res!96935 () Bool)

(assert (=> b!117203 (=> (not res!96935) (not e!76818))))

(assert (=> b!117203 (= res!96935 (invariant!0 (currentBit!5444 thiss!1305) (currentByte!5449 thiss!1305) (size!2393 (buf!2806 (_2!5144 lt!179449)))))))

(declare-fun b!117204 () Bool)

(assert (=> b!117204 (= e!76822 e!76820)))

(declare-fun res!96937 () Bool)

(assert (=> b!117204 (=> (not res!96937) (not e!76820))))

(assert (=> b!117204 (= res!96937 (validate_offset_bits!1 ((_ sign_extend 32) (size!2393 (buf!2806 thiss!1305))) ((_ sign_extend 32) (currentByte!5449 thiss!1305)) ((_ sign_extend 32) (currentBit!5444 thiss!1305)) lt!179451))))

(assert (=> b!117204 (= lt!179451 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!117205 () Bool)

(assert (=> b!117205 (= e!76824 e!76823)))

(declare-fun res!96934 () Bool)

(assert (=> b!117205 (=> (not res!96934) (not e!76823))))

(declare-fun lt!179444 () (_ BitVec 64))

(assert (=> b!117205 (= res!96934 (= lt!179442 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!179444)))))

(assert (=> b!117205 (= lt!179442 (bitIndex!0 (size!2393 (buf!2806 (_2!5144 lt!179449))) (currentByte!5449 (_2!5144 lt!179449)) (currentBit!5444 (_2!5144 lt!179449))))))

(assert (=> b!117205 (= lt!179444 (bitIndex!0 (size!2393 (buf!2806 thiss!1305)) (currentByte!5449 thiss!1305) (currentBit!5444 thiss!1305)))))

(assert (= (and start!23104 res!96929) b!117204))

(assert (= (and b!117204 res!96937) b!117196))

(assert (= (and b!117196 res!96931) b!117194))

(assert (= (and b!117194 res!96938) b!117199))

(assert (= (and b!117199 res!96936) b!117205))

(assert (= (and b!117205 res!96934) b!117200))

(assert (= (and b!117200 res!96930) b!117201))

(assert (= (and b!117201 res!96933) b!117198))

(assert (= (and b!117199 res!96932) b!117203))

(assert (= (and b!117203 res!96935) b!117197))

(assert (= (and b!117199 res!96939) b!117195))

(assert (= start!23104 b!117202))

(declare-fun m!175669 () Bool)

(assert (=> b!117199 m!175669))

(declare-fun m!175671 () Bool)

(assert (=> b!117199 m!175671))

(declare-fun m!175673 () Bool)

(assert (=> b!117199 m!175673))

(declare-fun m!175675 () Bool)

(assert (=> b!117199 m!175675))

(declare-fun m!175677 () Bool)

(assert (=> b!117199 m!175677))

(declare-fun m!175679 () Bool)

(assert (=> b!117199 m!175679))

(declare-fun m!175681 () Bool)

(assert (=> b!117199 m!175681))

(declare-fun m!175683 () Bool)

(assert (=> b!117199 m!175683))

(declare-fun m!175685 () Bool)

(assert (=> b!117199 m!175685))

(declare-fun m!175687 () Bool)

(assert (=> b!117199 m!175687))

(declare-fun m!175689 () Bool)

(assert (=> b!117199 m!175689))

(declare-fun m!175691 () Bool)

(assert (=> b!117199 m!175691))

(declare-fun m!175693 () Bool)

(assert (=> b!117199 m!175693))

(declare-fun m!175695 () Bool)

(assert (=> b!117199 m!175695))

(declare-fun m!175697 () Bool)

(assert (=> b!117199 m!175697))

(declare-fun m!175699 () Bool)

(assert (=> b!117199 m!175699))

(declare-fun m!175701 () Bool)

(assert (=> b!117201 m!175701))

(assert (=> b!117201 m!175701))

(declare-fun m!175703 () Bool)

(assert (=> b!117201 m!175703))

(declare-fun m!175705 () Bool)

(assert (=> b!117204 m!175705))

(declare-fun m!175707 () Bool)

(assert (=> b!117196 m!175707))

(declare-fun m!175709 () Bool)

(assert (=> b!117202 m!175709))

(declare-fun m!175711 () Bool)

(assert (=> start!23104 m!175711))

(declare-fun m!175713 () Bool)

(assert (=> b!117197 m!175713))

(declare-fun m!175715 () Bool)

(assert (=> b!117198 m!175715))

(declare-fun m!175717 () Bool)

(assert (=> b!117200 m!175717))

(declare-fun m!175719 () Bool)

(assert (=> b!117203 m!175719))

(declare-fun m!175721 () Bool)

(assert (=> b!117205 m!175721))

(declare-fun m!175723 () Bool)

(assert (=> b!117205 m!175723))

(check-sat (not b!117203) (not b!117204) (not b!117196) (not b!117198) (not start!23104) (not b!117205) (not b!117202) (not b!117197) (not b!117200) (not b!117199) (not b!117201))
(check-sat)
