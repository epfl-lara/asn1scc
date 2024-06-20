; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21588 () Bool)

(assert start!21588)

(declare-fun b!108582 () Bool)

(declare-fun res!89522 () Bool)

(declare-fun e!71061 () Bool)

(assert (=> b!108582 (=> (not res!89522) (not e!71061))))

(declare-datatypes ((array!4951 0))(
  ( (array!4952 (arr!2845 (Array (_ BitVec 32) (_ BitVec 8))) (size!2252 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3978 0))(
  ( (BitStream!3979 (buf!2643 array!4951) (currentByte!5179 (_ BitVec 32)) (currentBit!5174 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3978)

(declare-datatypes ((Unit!6645 0))(
  ( (Unit!6646) )
))
(declare-datatypes ((tuple2!8948 0))(
  ( (tuple2!8949 (_1!4731 Unit!6645) (_2!4731 BitStream!3978)) )
))
(declare-fun lt!163704 () tuple2!8948)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!108582 (= res!89522 (invariant!0 (currentBit!5174 thiss!1305) (currentByte!5179 thiss!1305) (size!2252 (buf!2643 (_2!4731 lt!163704)))))))

(declare-fun b!108583 () Bool)

(declare-fun e!71069 () Bool)

(declare-fun e!71060 () Bool)

(assert (=> b!108583 (= e!71069 e!71060)))

(declare-fun res!89518 () Bool)

(assert (=> b!108583 (=> (not res!89518) (not e!71060))))

(declare-fun lt!163691 () (_ BitVec 64))

(declare-fun lt!163695 () (_ BitVec 64))

(assert (=> b!108583 (= res!89518 (= lt!163691 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!163695)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108583 (= lt!163691 (bitIndex!0 (size!2252 (buf!2643 (_2!4731 lt!163704))) (currentByte!5179 (_2!4731 lt!163704)) (currentBit!5174 (_2!4731 lt!163704))))))

(assert (=> b!108583 (= lt!163695 (bitIndex!0 (size!2252 (buf!2643 thiss!1305)) (currentByte!5179 thiss!1305) (currentBit!5174 thiss!1305)))))

(declare-fun b!108585 () Bool)

(declare-fun res!89520 () Bool)

(declare-fun e!71066 () Bool)

(assert (=> b!108585 (=> (not res!89520) (not e!71066))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108585 (= res!89520 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!108586 () Bool)

(declare-fun res!89512 () Bool)

(assert (=> b!108586 (=> (not res!89512) (not e!71066))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!108586 (= res!89512 (bvslt i!615 nBits!396))))

(declare-fun b!108587 () Bool)

(declare-fun e!71064 () Bool)

(assert (=> b!108587 (= e!71064 e!71066)))

(declare-fun res!89517 () Bool)

(assert (=> b!108587 (=> (not res!89517) (not e!71066))))

(declare-fun lt!163692 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!108587 (= res!89517 (validate_offset_bits!1 ((_ sign_extend 32) (size!2252 (buf!2643 thiss!1305))) ((_ sign_extend 32) (currentByte!5179 thiss!1305)) ((_ sign_extend 32) (currentBit!5174 thiss!1305)) lt!163692))))

(assert (=> b!108587 (= lt!163692 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!108588 () Bool)

(declare-fun res!89521 () Bool)

(assert (=> b!108588 (=> (not res!89521) (not e!71060))))

(declare-fun isPrefixOf!0 (BitStream!3978 BitStream!3978) Bool)

(assert (=> b!108588 (= res!89521 (isPrefixOf!0 thiss!1305 (_2!4731 lt!163704)))))

(declare-fun b!108589 () Bool)

(declare-fun e!71062 () Bool)

(declare-datatypes ((tuple2!8950 0))(
  ( (tuple2!8951 (_1!4732 BitStream!3978) (_2!4732 Bool)) )
))
(declare-fun lt!163712 () tuple2!8950)

(assert (=> b!108589 (= e!71062 (= (bitIndex!0 (size!2252 (buf!2643 (_1!4732 lt!163712))) (currentByte!5179 (_1!4732 lt!163712)) (currentBit!5174 (_1!4732 lt!163712))) lt!163691))))

(declare-fun b!108590 () Bool)

(declare-fun e!71063 () Bool)

(assert (=> b!108590 (= e!71066 (not e!71063))))

(declare-fun res!89519 () Bool)

(assert (=> b!108590 (=> res!89519 e!71063)))

(declare-datatypes ((tuple2!8952 0))(
  ( (tuple2!8953 (_1!4733 BitStream!3978) (_2!4733 (_ BitVec 64))) )
))
(declare-fun lt!163688 () tuple2!8952)

(declare-datatypes ((tuple2!8954 0))(
  ( (tuple2!8955 (_1!4734 BitStream!3978) (_2!4734 BitStream!3978)) )
))
(declare-fun lt!163690 () tuple2!8954)

(assert (=> b!108590 (= res!89519 (not (= (_1!4733 lt!163688) (_2!4734 lt!163690))))))

(declare-fun lt!163709 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3978 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8952)

(assert (=> b!108590 (= lt!163688 (readNLeastSignificantBitsLoopPure!0 (_1!4734 lt!163690) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!163709))))

(declare-fun lt!163713 () tuple2!8948)

(declare-fun lt!163706 () (_ BitVec 64))

(assert (=> b!108590 (validate_offset_bits!1 ((_ sign_extend 32) (size!2252 (buf!2643 (_2!4731 lt!163713)))) ((_ sign_extend 32) (currentByte!5179 (_2!4731 lt!163704))) ((_ sign_extend 32) (currentBit!5174 (_2!4731 lt!163704))) lt!163706)))

(declare-fun lt!163689 () Unit!6645)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3978 array!4951 (_ BitVec 64)) Unit!6645)

(assert (=> b!108590 (= lt!163689 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4731 lt!163704) (buf!2643 (_2!4731 lt!163713)) lt!163706))))

(assert (=> b!108590 (= lt!163706 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!163703 () tuple2!8950)

(declare-fun lt!163710 () (_ BitVec 64))

(declare-fun lt!163697 () (_ BitVec 64))

(assert (=> b!108590 (= lt!163709 (bvor lt!163697 (ite (_2!4732 lt!163703) lt!163710 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!163698 () tuple2!8952)

(declare-fun lt!163694 () tuple2!8954)

(assert (=> b!108590 (= lt!163698 (readNLeastSignificantBitsLoopPure!0 (_1!4734 lt!163694) nBits!396 i!615 lt!163697))))

(assert (=> b!108590 (validate_offset_bits!1 ((_ sign_extend 32) (size!2252 (buf!2643 (_2!4731 lt!163713)))) ((_ sign_extend 32) (currentByte!5179 thiss!1305)) ((_ sign_extend 32) (currentBit!5174 thiss!1305)) lt!163692)))

(declare-fun lt!163702 () Unit!6645)

(assert (=> b!108590 (= lt!163702 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2643 (_2!4731 lt!163713)) lt!163692))))

(assert (=> b!108590 (= lt!163697 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!163693 () Bool)

(assert (=> b!108590 (= (_2!4732 lt!163703) lt!163693)))

(declare-fun readBitPure!0 (BitStream!3978) tuple2!8950)

(assert (=> b!108590 (= lt!163703 (readBitPure!0 (_1!4734 lt!163694)))))

(declare-fun reader!0 (BitStream!3978 BitStream!3978) tuple2!8954)

(assert (=> b!108590 (= lt!163690 (reader!0 (_2!4731 lt!163704) (_2!4731 lt!163713)))))

(assert (=> b!108590 (= lt!163694 (reader!0 thiss!1305 (_2!4731 lt!163713)))))

(declare-fun e!71065 () Bool)

(assert (=> b!108590 e!71065))

(declare-fun res!89524 () Bool)

(assert (=> b!108590 (=> (not res!89524) (not e!71065))))

(declare-fun lt!163705 () tuple2!8950)

(declare-fun lt!163700 () tuple2!8950)

(assert (=> b!108590 (= res!89524 (= (bitIndex!0 (size!2252 (buf!2643 (_1!4732 lt!163705))) (currentByte!5179 (_1!4732 lt!163705)) (currentBit!5174 (_1!4732 lt!163705))) (bitIndex!0 (size!2252 (buf!2643 (_1!4732 lt!163700))) (currentByte!5179 (_1!4732 lt!163700)) (currentBit!5174 (_1!4732 lt!163700)))))))

(declare-fun lt!163687 () Unit!6645)

(declare-fun lt!163701 () BitStream!3978)

(declare-fun readBitPrefixLemma!0 (BitStream!3978 BitStream!3978) Unit!6645)

(assert (=> b!108590 (= lt!163687 (readBitPrefixLemma!0 lt!163701 (_2!4731 lt!163713)))))

(assert (=> b!108590 (= lt!163700 (readBitPure!0 (BitStream!3979 (buf!2643 (_2!4731 lt!163713)) (currentByte!5179 thiss!1305) (currentBit!5174 thiss!1305))))))

(assert (=> b!108590 (= lt!163705 (readBitPure!0 lt!163701))))

(assert (=> b!108590 (= lt!163701 (BitStream!3979 (buf!2643 (_2!4731 lt!163704)) (currentByte!5179 thiss!1305) (currentBit!5174 thiss!1305)))))

(assert (=> b!108590 e!71061))

(declare-fun res!89515 () Bool)

(assert (=> b!108590 (=> (not res!89515) (not e!71061))))

(assert (=> b!108590 (= res!89515 (isPrefixOf!0 thiss!1305 (_2!4731 lt!163713)))))

(declare-fun lt!163715 () Unit!6645)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3978 BitStream!3978 BitStream!3978) Unit!6645)

(assert (=> b!108590 (= lt!163715 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4731 lt!163704) (_2!4731 lt!163713)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3978 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8948)

(assert (=> b!108590 (= lt!163713 (appendNLeastSignificantBitsLoop!0 (_2!4731 lt!163704) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!108590 e!71069))

(declare-fun res!89516 () Bool)

(assert (=> b!108590 (=> (not res!89516) (not e!71069))))

(assert (=> b!108590 (= res!89516 (= (size!2252 (buf!2643 thiss!1305)) (size!2252 (buf!2643 (_2!4731 lt!163704)))))))

(declare-fun appendBit!0 (BitStream!3978 Bool) tuple2!8948)

(assert (=> b!108590 (= lt!163704 (appendBit!0 thiss!1305 lt!163693))))

(assert (=> b!108590 (= lt!163693 (not (= (bvand v!199 lt!163710) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108590 (= lt!163710 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!108591 () Bool)

(assert (=> b!108591 (= e!71065 (= (_2!4732 lt!163705) (_2!4732 lt!163700)))))

(declare-fun b!108592 () Bool)

(assert (=> b!108592 (= e!71061 (invariant!0 (currentBit!5174 thiss!1305) (currentByte!5179 thiss!1305) (size!2252 (buf!2643 (_2!4731 lt!163713)))))))

(declare-fun b!108593 () Bool)

(assert (=> b!108593 (= e!71060 e!71062)))

(declare-fun res!89523 () Bool)

(assert (=> b!108593 (=> (not res!89523) (not e!71062))))

(assert (=> b!108593 (= res!89523 (and (= (_2!4732 lt!163712) lt!163693) (= (_1!4732 lt!163712) (_2!4731 lt!163704))))))

(declare-fun readerFrom!0 (BitStream!3978 (_ BitVec 32) (_ BitVec 32)) BitStream!3978)

(assert (=> b!108593 (= lt!163712 (readBitPure!0 (readerFrom!0 (_2!4731 lt!163704) (currentBit!5174 thiss!1305) (currentByte!5179 thiss!1305))))))

(declare-fun res!89514 () Bool)

(assert (=> start!21588 (=> (not res!89514) (not e!71064))))

(assert (=> start!21588 (= res!89514 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21588 e!71064))

(assert (=> start!21588 true))

(declare-fun e!71068 () Bool)

(declare-fun inv!12 (BitStream!3978) Bool)

(assert (=> start!21588 (and (inv!12 thiss!1305) e!71068)))

(declare-fun b!108584 () Bool)

(declare-fun lt!163711 () (_ BitVec 64))

(declare-fun lt!163696 () BitStream!3978)

(declare-fun lt!163714 () (_ BitVec 64))

(declare-fun e!71067 () Bool)

(assert (=> b!108584 (= e!71067 (and (= lt!163711 (bvsub lt!163714 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4734 lt!163690) lt!163696)) (and (= (_2!4733 lt!163698) (_2!4733 lt!163688)) (= (_1!4733 lt!163698) (_2!4734 lt!163694))))))))

(declare-fun b!108594 () Bool)

(declare-fun array_inv!2054 (array!4951) Bool)

(assert (=> b!108594 (= e!71068 (array_inv!2054 (buf!2643 thiss!1305)))))

(declare-fun b!108595 () Bool)

(assert (=> b!108595 (= e!71063 true)))

(assert (=> b!108595 e!71067))

(declare-fun res!89513 () Bool)

(assert (=> b!108595 (=> (not res!89513) (not e!71067))))

(declare-fun lt!163707 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3978 (_ BitVec 64)) BitStream!3978)

(assert (=> b!108595 (= res!89513 (= (_1!4734 lt!163690) (withMovedBitIndex!0 (_2!4734 lt!163690) (bvsub lt!163714 lt!163707))))))

(assert (=> b!108595 (= lt!163714 (bitIndex!0 (size!2252 (buf!2643 (_2!4731 lt!163704))) (currentByte!5179 (_2!4731 lt!163704)) (currentBit!5174 (_2!4731 lt!163704))))))

(assert (=> b!108595 (= (_1!4734 lt!163694) (withMovedBitIndex!0 (_2!4734 lt!163694) (bvsub lt!163711 lt!163707)))))

(assert (=> b!108595 (= lt!163707 (bitIndex!0 (size!2252 (buf!2643 (_2!4731 lt!163713))) (currentByte!5179 (_2!4731 lt!163713)) (currentBit!5174 (_2!4731 lt!163713))))))

(assert (=> b!108595 (= lt!163711 (bitIndex!0 (size!2252 (buf!2643 thiss!1305)) (currentByte!5179 thiss!1305) (currentBit!5174 thiss!1305)))))

(declare-fun lt!163708 () tuple2!8952)

(assert (=> b!108595 (and (= (_2!4733 lt!163698) (_2!4733 lt!163708)) (= (_1!4733 lt!163698) (_1!4733 lt!163708)))))

(declare-fun lt!163699 () Unit!6645)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3978 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6645)

(assert (=> b!108595 (= lt!163699 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4734 lt!163694) nBits!396 i!615 lt!163697))))

(assert (=> b!108595 (= lt!163708 (readNLeastSignificantBitsLoopPure!0 lt!163696 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!163709))))

(assert (=> b!108595 (= lt!163696 (withMovedBitIndex!0 (_1!4734 lt!163694) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and start!21588 res!89514) b!108587))

(assert (= (and b!108587 res!89517) b!108585))

(assert (= (and b!108585 res!89520) b!108586))

(assert (= (and b!108586 res!89512) b!108590))

(assert (= (and b!108590 res!89516) b!108583))

(assert (= (and b!108583 res!89518) b!108588))

(assert (= (and b!108588 res!89521) b!108593))

(assert (= (and b!108593 res!89523) b!108589))

(assert (= (and b!108590 res!89515) b!108582))

(assert (= (and b!108582 res!89522) b!108592))

(assert (= (and b!108590 res!89524) b!108591))

(assert (= (and b!108590 (not res!89519)) b!108595))

(assert (= (and b!108595 res!89513) b!108584))

(assert (= start!21588 b!108594))

(declare-fun m!160951 () Bool)

(assert (=> b!108592 m!160951))

(declare-fun m!160953 () Bool)

(assert (=> b!108595 m!160953))

(declare-fun m!160955 () Bool)

(assert (=> b!108595 m!160955))

(declare-fun m!160957 () Bool)

(assert (=> b!108595 m!160957))

(declare-fun m!160959 () Bool)

(assert (=> b!108595 m!160959))

(declare-fun m!160961 () Bool)

(assert (=> b!108595 m!160961))

(declare-fun m!160963 () Bool)

(assert (=> b!108595 m!160963))

(declare-fun m!160965 () Bool)

(assert (=> b!108595 m!160965))

(declare-fun m!160967 () Bool)

(assert (=> b!108595 m!160967))

(declare-fun m!160969 () Bool)

(assert (=> b!108589 m!160969))

(declare-fun m!160971 () Bool)

(assert (=> b!108587 m!160971))

(declare-fun m!160973 () Bool)

(assert (=> b!108588 m!160973))

(declare-fun m!160975 () Bool)

(assert (=> b!108582 m!160975))

(declare-fun m!160977 () Bool)

(assert (=> b!108594 m!160977))

(assert (=> b!108583 m!160959))

(assert (=> b!108583 m!160965))

(declare-fun m!160979 () Bool)

(assert (=> b!108593 m!160979))

(assert (=> b!108593 m!160979))

(declare-fun m!160981 () Bool)

(assert (=> b!108593 m!160981))

(declare-fun m!160983 () Bool)

(assert (=> b!108585 m!160983))

(declare-fun m!160985 () Bool)

(assert (=> start!21588 m!160985))

(declare-fun m!160987 () Bool)

(assert (=> b!108590 m!160987))

(declare-fun m!160989 () Bool)

(assert (=> b!108590 m!160989))

(declare-fun m!160991 () Bool)

(assert (=> b!108590 m!160991))

(declare-fun m!160993 () Bool)

(assert (=> b!108590 m!160993))

(declare-fun m!160995 () Bool)

(assert (=> b!108590 m!160995))

(declare-fun m!160997 () Bool)

(assert (=> b!108590 m!160997))

(declare-fun m!160999 () Bool)

(assert (=> b!108590 m!160999))

(declare-fun m!161001 () Bool)

(assert (=> b!108590 m!161001))

(declare-fun m!161003 () Bool)

(assert (=> b!108590 m!161003))

(declare-fun m!161005 () Bool)

(assert (=> b!108590 m!161005))

(declare-fun m!161007 () Bool)

(assert (=> b!108590 m!161007))

(declare-fun m!161009 () Bool)

(assert (=> b!108590 m!161009))

(declare-fun m!161011 () Bool)

(assert (=> b!108590 m!161011))

(declare-fun m!161013 () Bool)

(assert (=> b!108590 m!161013))

(declare-fun m!161015 () Bool)

(assert (=> b!108590 m!161015))

(declare-fun m!161017 () Bool)

(assert (=> b!108590 m!161017))

(declare-fun m!161019 () Bool)

(assert (=> b!108590 m!161019))

(declare-fun m!161021 () Bool)

(assert (=> b!108590 m!161021))

(declare-fun m!161023 () Bool)

(assert (=> b!108590 m!161023))

(check-sat (not start!21588) (not b!108583) (not b!108593) (not b!108585) (not b!108592) (not b!108595) (not b!108582) (not b!108589) (not b!108594) (not b!108587) (not b!108588) (not b!108590))
