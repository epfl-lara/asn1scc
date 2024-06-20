; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54114 () Bool)

(assert start!54114)

(declare-fun b!252674 () Bool)

(declare-fun e!175100 () Bool)

(declare-datatypes ((array!13738 0))(
  ( (array!13739 (arr!7015 (Array (_ BitVec 32) (_ BitVec 8))) (size!6028 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10978 0))(
  ( (BitStream!10979 (buf!6530 array!13738) (currentByte!11985 (_ BitVec 32)) (currentBit!11980 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21738 0))(
  ( (tuple2!21739 (_1!11797 BitStream!10978) (_2!11797 Bool)) )
))
(declare-fun lt!392431 () tuple2!21738)

(declare-fun lt!392428 () tuple2!21738)

(assert (=> b!252674 (= e!175100 (= (_2!11797 lt!392431) (_2!11797 lt!392428)))))

(declare-fun b!252675 () Bool)

(declare-fun res!211714 () Bool)

(declare-fun e!175103 () Bool)

(assert (=> b!252675 (=> (not res!211714) (not e!175103))))

(declare-fun thiss!1005 () BitStream!10978)

(declare-datatypes ((Unit!18204 0))(
  ( (Unit!18205) )
))
(declare-datatypes ((tuple2!21740 0))(
  ( (tuple2!21741 (_1!11798 Unit!18204) (_2!11798 BitStream!10978)) )
))
(declare-fun lt!392415 () tuple2!21740)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!252675 (= res!211714 (invariant!0 (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005) (size!6028 (buf!6530 (_2!11798 lt!392415)))))))

(declare-fun b!252676 () Bool)

(declare-fun res!211722 () Bool)

(declare-fun e!175102 () Bool)

(assert (=> b!252676 (=> (not res!211722) (not e!175102))))

(declare-fun lt!392425 () tuple2!21740)

(declare-fun isPrefixOf!0 (BitStream!10978 BitStream!10978) Bool)

(assert (=> b!252676 (= res!211722 (isPrefixOf!0 (_2!11798 lt!392415) (_2!11798 lt!392425)))))

(declare-fun b!252677 () Bool)

(declare-fun e!175094 () Bool)

(declare-fun array_inv!5769 (array!13738) Bool)

(assert (=> b!252677 (= e!175094 (array_inv!5769 (buf!6530 thiss!1005)))))

(declare-fun b!252678 () Bool)

(declare-fun res!211713 () Bool)

(declare-fun e!175096 () Bool)

(assert (=> b!252678 (=> (not res!211713) (not e!175096))))

(assert (=> b!252678 (= res!211713 (isPrefixOf!0 thiss!1005 (_2!11798 lt!392415)))))

(declare-fun b!252679 () Bool)

(declare-fun lt!392416 () tuple2!21738)

(declare-datatypes ((tuple2!21742 0))(
  ( (tuple2!21743 (_1!11799 BitStream!10978) (_2!11799 BitStream!10978)) )
))
(declare-fun lt!392424 () tuple2!21742)

(assert (=> b!252679 (= e!175102 (not (or (not (_2!11797 lt!392416)) (not (= (_1!11797 lt!392416) (_2!11799 lt!392424))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10978 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21738)

(assert (=> b!252679 (= lt!392416 (checkBitsLoopPure!0 (_1!11799 lt!392424) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!392419 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!252679 (validate_offset_bits!1 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392425)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415))) lt!392419)))

(declare-fun lt!392422 () Unit!18204)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10978 array!13738 (_ BitVec 64)) Unit!18204)

(assert (=> b!252679 (= lt!392422 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11798 lt!392415) (buf!6530 (_2!11798 lt!392425)) lt!392419))))

(declare-fun reader!0 (BitStream!10978 BitStream!10978) tuple2!21742)

(assert (=> b!252679 (= lt!392424 (reader!0 (_2!11798 lt!392415) (_2!11798 lt!392425)))))

(declare-fun b!252680 () Bool)

(declare-fun e!175093 () Bool)

(declare-fun lt!392427 () tuple2!21738)

(declare-fun lt!392421 () tuple2!21738)

(assert (=> b!252680 (= e!175093 (= (_2!11797 lt!392427) (_2!11797 lt!392421)))))

(declare-fun b!252681 () Bool)

(declare-fun e!175098 () Bool)

(assert (=> b!252681 (= e!175098 e!175102)))

(declare-fun res!211715 () Bool)

(assert (=> b!252681 (=> (not res!211715) (not e!175102))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!252681 (= res!211715 (= (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392425))) (currentByte!11985 (_2!11798 lt!392425)) (currentBit!11980 (_2!11798 lt!392425))) (bvadd (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392415))) (currentByte!11985 (_2!11798 lt!392415)) (currentBit!11980 (_2!11798 lt!392415))) lt!392419)))))

(assert (=> b!252681 (= lt!392419 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun res!211712 () Bool)

(declare-fun e!175097 () Bool)

(assert (=> start!54114 (=> (not res!211712) (not e!175097))))

(assert (=> start!54114 (= res!211712 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54114 e!175097))

(assert (=> start!54114 true))

(declare-fun inv!12 (BitStream!10978) Bool)

(assert (=> start!54114 (and (inv!12 thiss!1005) e!175094)))

(declare-fun b!252682 () Bool)

(assert (=> b!252682 (= e!175097 (not e!175100))))

(declare-fun res!211723 () Bool)

(assert (=> b!252682 (=> res!211723 e!175100)))

(declare-fun lt!392429 () tuple2!21742)

(assert (=> b!252682 (= res!211723 (not (= (_1!11797 lt!392428) (_2!11799 lt!392429))))))

(assert (=> b!252682 (= lt!392428 (checkBitsLoopPure!0 (_1!11799 lt!392429) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!392433 () (_ BitVec 64))

(assert (=> b!252682 (validate_offset_bits!1 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392425)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415))) lt!392433)))

(declare-fun lt!392418 () Unit!18204)

(assert (=> b!252682 (= lt!392418 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11798 lt!392415) (buf!6530 (_2!11798 lt!392425)) lt!392433))))

(declare-fun lt!392423 () tuple2!21742)

(assert (=> b!252682 (= lt!392431 (checkBitsLoopPure!0 (_1!11799 lt!392423) nBits!297 bit!26 from!289))))

(assert (=> b!252682 (validate_offset_bits!1 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392425)))) ((_ sign_extend 32) (currentByte!11985 thiss!1005)) ((_ sign_extend 32) (currentBit!11980 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!392434 () Unit!18204)

(assert (=> b!252682 (= lt!392434 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6530 (_2!11798 lt!392425)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10978) tuple2!21738)

(assert (=> b!252682 (= (_2!11797 (readBitPure!0 (_1!11799 lt!392423))) bit!26)))

(assert (=> b!252682 (= lt!392429 (reader!0 (_2!11798 lt!392415) (_2!11798 lt!392425)))))

(assert (=> b!252682 (= lt!392423 (reader!0 thiss!1005 (_2!11798 lt!392425)))))

(assert (=> b!252682 e!175093))

(declare-fun res!211719 () Bool)

(assert (=> b!252682 (=> (not res!211719) (not e!175093))))

(assert (=> b!252682 (= res!211719 (= (bitIndex!0 (size!6028 (buf!6530 (_1!11797 lt!392427))) (currentByte!11985 (_1!11797 lt!392427)) (currentBit!11980 (_1!11797 lt!392427))) (bitIndex!0 (size!6028 (buf!6530 (_1!11797 lt!392421))) (currentByte!11985 (_1!11797 lt!392421)) (currentBit!11980 (_1!11797 lt!392421)))))))

(declare-fun lt!392435 () Unit!18204)

(declare-fun lt!392417 () BitStream!10978)

(declare-fun readBitPrefixLemma!0 (BitStream!10978 BitStream!10978) Unit!18204)

(assert (=> b!252682 (= lt!392435 (readBitPrefixLemma!0 lt!392417 (_2!11798 lt!392425)))))

(assert (=> b!252682 (= lt!392421 (readBitPure!0 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005))))))

(assert (=> b!252682 (= lt!392427 (readBitPure!0 lt!392417))))

(assert (=> b!252682 (= lt!392417 (BitStream!10979 (buf!6530 (_2!11798 lt!392415)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)))))

(assert (=> b!252682 e!175103))

(declare-fun res!211717 () Bool)

(assert (=> b!252682 (=> (not res!211717) (not e!175103))))

(assert (=> b!252682 (= res!211717 (isPrefixOf!0 thiss!1005 (_2!11798 lt!392425)))))

(declare-fun lt!392436 () Unit!18204)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10978 BitStream!10978 BitStream!10978) Unit!18204)

(assert (=> b!252682 (= lt!392436 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11798 lt!392415) (_2!11798 lt!392425)))))

(assert (=> b!252682 e!175098))

(declare-fun res!211718 () Bool)

(assert (=> b!252682 (=> (not res!211718) (not e!175098))))

(assert (=> b!252682 (= res!211718 (= (size!6028 (buf!6530 (_2!11798 lt!392415))) (size!6028 (buf!6530 (_2!11798 lt!392425)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10978 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21740)

(assert (=> b!252682 (= lt!392425 (appendNBitsLoop!0 (_2!11798 lt!392415) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!252682 (validate_offset_bits!1 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392415)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415))) lt!392433)))

(assert (=> b!252682 (= lt!392433 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!392430 () Unit!18204)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10978 BitStream!10978 (_ BitVec 64) (_ BitVec 64)) Unit!18204)

(assert (=> b!252682 (= lt!392430 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11798 lt!392415) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!175095 () Bool)

(assert (=> b!252682 e!175095))

(declare-fun res!211724 () Bool)

(assert (=> b!252682 (=> (not res!211724) (not e!175095))))

(assert (=> b!252682 (= res!211724 (= (size!6028 (buf!6530 thiss!1005)) (size!6028 (buf!6530 (_2!11798 lt!392415)))))))

(declare-fun appendBit!0 (BitStream!10978 Bool) tuple2!21740)

(assert (=> b!252682 (= lt!392415 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!252683 () Bool)

(assert (=> b!252683 (= e!175095 e!175096)))

(declare-fun res!211725 () Bool)

(assert (=> b!252683 (=> (not res!211725) (not e!175096))))

(declare-fun lt!392420 () (_ BitVec 64))

(declare-fun lt!392432 () (_ BitVec 64))

(assert (=> b!252683 (= res!211725 (= lt!392420 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!392432)))))

(assert (=> b!252683 (= lt!392420 (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392415))) (currentByte!11985 (_2!11798 lt!392415)) (currentBit!11980 (_2!11798 lt!392415))))))

(assert (=> b!252683 (= lt!392432 (bitIndex!0 (size!6028 (buf!6530 thiss!1005)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)))))

(declare-fun b!252684 () Bool)

(declare-fun res!211721 () Bool)

(assert (=> b!252684 (=> res!211721 e!175100)))

(declare-fun withMovedBitIndex!0 (BitStream!10978 (_ BitVec 64)) BitStream!10978)

(assert (=> b!252684 (= res!211721 (not (= (_1!11799 lt!392429) (withMovedBitIndex!0 (_1!11799 lt!392423) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!252685 () Bool)

(declare-fun res!211716 () Bool)

(assert (=> b!252685 (=> (not res!211716) (not e!175097))))

(assert (=> b!252685 (= res!211716 (bvslt from!289 nBits!297))))

(declare-fun b!252686 () Bool)

(declare-fun e!175101 () Bool)

(declare-fun lt!392426 () tuple2!21738)

(assert (=> b!252686 (= e!175101 (= (bitIndex!0 (size!6028 (buf!6530 (_1!11797 lt!392426))) (currentByte!11985 (_1!11797 lt!392426)) (currentBit!11980 (_1!11797 lt!392426))) lt!392420))))

(declare-fun b!252687 () Bool)

(declare-fun res!211720 () Bool)

(assert (=> b!252687 (=> (not res!211720) (not e!175097))))

(assert (=> b!252687 (= res!211720 (validate_offset_bits!1 ((_ sign_extend 32) (size!6028 (buf!6530 thiss!1005))) ((_ sign_extend 32) (currentByte!11985 thiss!1005)) ((_ sign_extend 32) (currentBit!11980 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!252688 () Bool)

(assert (=> b!252688 (= e!175096 e!175101)))

(declare-fun res!211711 () Bool)

(assert (=> b!252688 (=> (not res!211711) (not e!175101))))

(assert (=> b!252688 (= res!211711 (and (= (_2!11797 lt!392426) bit!26) (= (_1!11797 lt!392426) (_2!11798 lt!392415))))))

(declare-fun readerFrom!0 (BitStream!10978 (_ BitVec 32) (_ BitVec 32)) BitStream!10978)

(assert (=> b!252688 (= lt!392426 (readBitPure!0 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005))))))

(declare-fun b!252689 () Bool)

(assert (=> b!252689 (= e!175103 (invariant!0 (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005) (size!6028 (buf!6530 (_2!11798 lt!392425)))))))

(assert (= (and start!54114 res!211712) b!252687))

(assert (= (and b!252687 res!211720) b!252685))

(assert (= (and b!252685 res!211716) b!252682))

(assert (= (and b!252682 res!211724) b!252683))

(assert (= (and b!252683 res!211725) b!252678))

(assert (= (and b!252678 res!211713) b!252688))

(assert (= (and b!252688 res!211711) b!252686))

(assert (= (and b!252682 res!211718) b!252681))

(assert (= (and b!252681 res!211715) b!252676))

(assert (= (and b!252676 res!211722) b!252679))

(assert (= (and b!252682 res!211717) b!252675))

(assert (= (and b!252675 res!211714) b!252689))

(assert (= (and b!252682 res!211719) b!252680))

(assert (= (and b!252682 (not res!211723)) b!252684))

(assert (= (and b!252684 (not res!211721)) b!252674))

(assert (= start!54114 b!252677))

(declare-fun m!380187 () Bool)

(assert (=> b!252677 m!380187))

(declare-fun m!380189 () Bool)

(assert (=> b!252689 m!380189))

(declare-fun m!380191 () Bool)

(assert (=> b!252678 m!380191))

(declare-fun m!380193 () Bool)

(assert (=> b!252681 m!380193))

(declare-fun m!380195 () Bool)

(assert (=> b!252681 m!380195))

(declare-fun m!380197 () Bool)

(assert (=> b!252688 m!380197))

(assert (=> b!252688 m!380197))

(declare-fun m!380199 () Bool)

(assert (=> b!252688 m!380199))

(declare-fun m!380201 () Bool)

(assert (=> b!252676 m!380201))

(declare-fun m!380203 () Bool)

(assert (=> b!252679 m!380203))

(declare-fun m!380205 () Bool)

(assert (=> b!252679 m!380205))

(declare-fun m!380207 () Bool)

(assert (=> b!252679 m!380207))

(declare-fun m!380209 () Bool)

(assert (=> b!252679 m!380209))

(declare-fun m!380211 () Bool)

(assert (=> b!252675 m!380211))

(declare-fun m!380213 () Bool)

(assert (=> b!252684 m!380213))

(declare-fun m!380215 () Bool)

(assert (=> b!252687 m!380215))

(assert (=> b!252683 m!380195))

(declare-fun m!380217 () Bool)

(assert (=> b!252683 m!380217))

(declare-fun m!380219 () Bool)

(assert (=> b!252682 m!380219))

(declare-fun m!380221 () Bool)

(assert (=> b!252682 m!380221))

(declare-fun m!380223 () Bool)

(assert (=> b!252682 m!380223))

(declare-fun m!380225 () Bool)

(assert (=> b!252682 m!380225))

(declare-fun m!380227 () Bool)

(assert (=> b!252682 m!380227))

(declare-fun m!380229 () Bool)

(assert (=> b!252682 m!380229))

(declare-fun m!380231 () Bool)

(assert (=> b!252682 m!380231))

(declare-fun m!380233 () Bool)

(assert (=> b!252682 m!380233))

(declare-fun m!380235 () Bool)

(assert (=> b!252682 m!380235))

(declare-fun m!380237 () Bool)

(assert (=> b!252682 m!380237))

(declare-fun m!380239 () Bool)

(assert (=> b!252682 m!380239))

(declare-fun m!380241 () Bool)

(assert (=> b!252682 m!380241))

(declare-fun m!380243 () Bool)

(assert (=> b!252682 m!380243))

(declare-fun m!380245 () Bool)

(assert (=> b!252682 m!380245))

(declare-fun m!380247 () Bool)

(assert (=> b!252682 m!380247))

(declare-fun m!380249 () Bool)

(assert (=> b!252682 m!380249))

(assert (=> b!252682 m!380209))

(declare-fun m!380251 () Bool)

(assert (=> b!252682 m!380251))

(declare-fun m!380253 () Bool)

(assert (=> b!252682 m!380253))

(declare-fun m!380255 () Bool)

(assert (=> b!252682 m!380255))

(declare-fun m!380257 () Bool)

(assert (=> b!252686 m!380257))

(declare-fun m!380259 () Bool)

(assert (=> start!54114 m!380259))

(push 1)

(assert (not b!252683))

(assert (not b!252678))

(assert (not b!252684))

(assert (not b!252689))

(assert (not b!252679))

(assert (not start!54114))

(assert (not b!252687))

(assert (not b!252682))

(assert (not b!252688))

(assert (not b!252675))

(assert (not b!252686))

(assert (not b!252677))

(assert (not b!252676))

(assert (not b!252681))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!84254 () Bool)

(assert (=> d!84254 (= (invariant!0 (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005) (size!6028 (buf!6530 (_2!11798 lt!392415)))) (and (bvsge (currentBit!11980 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11980 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11985 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11985 thiss!1005) (size!6028 (buf!6530 (_2!11798 lt!392415)))) (and (= (currentBit!11980 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11985 thiss!1005) (size!6028 (buf!6530 (_2!11798 lt!392415))))))))))

(assert (=> b!252675 d!84254))

(declare-fun d!84256 () Bool)

(declare-fun e!175172 () Bool)

(assert (=> d!84256 e!175172))

(declare-fun res!211818 () Bool)

(assert (=> d!84256 (=> (not res!211818) (not e!175172))))

(declare-fun lt!392574 () (_ BitVec 64))

(declare-fun lt!392573 () BitStream!10978)

(assert (=> d!84256 (= res!211818 (= (bvadd lt!392574 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!6028 (buf!6530 lt!392573)) (currentByte!11985 lt!392573) (currentBit!11980 lt!392573))))))

(assert (=> d!84256 (or (not (= (bvand lt!392574 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!392574 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!392574 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84256 (= lt!392574 (bitIndex!0 (size!6028 (buf!6530 (_1!11799 lt!392423))) (currentByte!11985 (_1!11799 lt!392423)) (currentBit!11980 (_1!11799 lt!392423))))))

(declare-fun moveBitIndex!0 (BitStream!10978 (_ BitVec 64)) tuple2!21740)

(assert (=> d!84256 (= lt!392573 (_2!11798 (moveBitIndex!0 (_1!11799 lt!392423) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!10978 (_ BitVec 64)) Bool)

(assert (=> d!84256 (moveBitIndexPrecond!0 (_1!11799 lt!392423) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!84256 (= (withMovedBitIndex!0 (_1!11799 lt!392423) #b0000000000000000000000000000000000000000000000000000000000000001) lt!392573)))

(declare-fun b!252788 () Bool)

(assert (=> b!252788 (= e!175172 (= (size!6028 (buf!6530 (_1!11799 lt!392423))) (size!6028 (buf!6530 lt!392573))))))

(assert (= (and d!84256 res!211818) b!252788))

(declare-fun m!380409 () Bool)

(assert (=> d!84256 m!380409))

(declare-fun m!380411 () Bool)

(assert (=> d!84256 m!380411))

(declare-fun m!380413 () Bool)

(assert (=> d!84256 m!380413))

(declare-fun m!380415 () Bool)

(assert (=> d!84256 m!380415))

(assert (=> b!252684 d!84256))

(declare-fun d!84258 () Bool)

(declare-datatypes ((tuple2!21756 0))(
  ( (tuple2!21757 (_1!11806 Bool) (_2!11806 BitStream!10978)) )
))
(declare-fun lt!392577 () tuple2!21756)

(declare-fun readBit!0 (BitStream!10978) tuple2!21756)

(assert (=> d!84258 (= lt!392577 (readBit!0 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005))))))

(assert (=> d!84258 (= (readBitPure!0 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005))) (tuple2!21739 (_2!11806 lt!392577) (_1!11806 lt!392577)))))

(declare-fun bs!21359 () Bool)

(assert (= bs!21359 d!84258))

(assert (=> bs!21359 m!380197))

(declare-fun m!380417 () Bool)

(assert (=> bs!21359 m!380417))

(assert (=> b!252688 d!84258))

(declare-fun d!84260 () Bool)

(declare-fun e!175175 () Bool)

(assert (=> d!84260 e!175175))

(declare-fun res!211822 () Bool)

(assert (=> d!84260 (=> (not res!211822) (not e!175175))))

(assert (=> d!84260 (= res!211822 (invariant!0 (currentBit!11980 (_2!11798 lt!392415)) (currentByte!11985 (_2!11798 lt!392415)) (size!6028 (buf!6530 (_2!11798 lt!392415)))))))

(assert (=> d!84260 (= (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005)) (BitStream!10979 (buf!6530 (_2!11798 lt!392415)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)))))

(declare-fun b!252791 () Bool)

(assert (=> b!252791 (= e!175175 (invariant!0 (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005) (size!6028 (buf!6530 (_2!11798 lt!392415)))))))

(assert (= (and d!84260 res!211822) b!252791))

(declare-fun m!380419 () Bool)

(assert (=> d!84260 m!380419))

(assert (=> b!252791 m!380211))

(assert (=> b!252688 d!84260))

(declare-fun d!84262 () Bool)

(assert (=> d!84262 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005) (size!6028 (buf!6530 thiss!1005))))))

(declare-fun bs!21360 () Bool)

(assert (= bs!21360 d!84262))

(declare-fun m!380421 () Bool)

(assert (=> bs!21360 m!380421))

(assert (=> start!54114 d!84262))

(declare-fun d!84264 () Bool)

(assert (=> d!84264 (= (array_inv!5769 (buf!6530 thiss!1005)) (bvsge (size!6028 (buf!6530 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!252677 d!84264))

(declare-fun d!84266 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!84266 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6028 (buf!6530 thiss!1005))) ((_ sign_extend 32) (currentByte!11985 thiss!1005)) ((_ sign_extend 32) (currentBit!11980 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 thiss!1005))) ((_ sign_extend 32) (currentByte!11985 thiss!1005)) ((_ sign_extend 32) (currentBit!11980 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21361 () Bool)

(assert (= bs!21361 d!84266))

(declare-fun m!380423 () Bool)

(assert (=> bs!21361 m!380423))

(assert (=> b!252687 d!84266))

(declare-fun d!84268 () Bool)

(declare-fun res!211830 () Bool)

(declare-fun e!175181 () Bool)

(assert (=> d!84268 (=> (not res!211830) (not e!175181))))

(assert (=> d!84268 (= res!211830 (= (size!6028 (buf!6530 (_2!11798 lt!392415))) (size!6028 (buf!6530 (_2!11798 lt!392425)))))))

(assert (=> d!84268 (= (isPrefixOf!0 (_2!11798 lt!392415) (_2!11798 lt!392425)) e!175181)))

(declare-fun b!252798 () Bool)

(declare-fun res!211829 () Bool)

(assert (=> b!252798 (=> (not res!211829) (not e!175181))))

(assert (=> b!252798 (= res!211829 (bvsle (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392415))) (currentByte!11985 (_2!11798 lt!392415)) (currentBit!11980 (_2!11798 lt!392415))) (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392425))) (currentByte!11985 (_2!11798 lt!392425)) (currentBit!11980 (_2!11798 lt!392425)))))))

(declare-fun b!252799 () Bool)

(declare-fun e!175180 () Bool)

(assert (=> b!252799 (= e!175181 e!175180)))

(declare-fun res!211831 () Bool)

(assert (=> b!252799 (=> res!211831 e!175180)))

(assert (=> b!252799 (= res!211831 (= (size!6028 (buf!6530 (_2!11798 lt!392415))) #b00000000000000000000000000000000))))

(declare-fun b!252800 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13738 array!13738 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!252800 (= e!175180 (arrayBitRangesEq!0 (buf!6530 (_2!11798 lt!392415)) (buf!6530 (_2!11798 lt!392425)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392415))) (currentByte!11985 (_2!11798 lt!392415)) (currentBit!11980 (_2!11798 lt!392415)))))))

(assert (= (and d!84268 res!211830) b!252798))

(assert (= (and b!252798 res!211829) b!252799))

(assert (= (and b!252799 (not res!211831)) b!252800))

(assert (=> b!252798 m!380195))

(assert (=> b!252798 m!380193))

(assert (=> b!252800 m!380195))

(assert (=> b!252800 m!380195))

(declare-fun m!380425 () Bool)

(assert (=> b!252800 m!380425))

(assert (=> b!252676 d!84268))

(declare-fun d!84270 () Bool)

(declare-fun e!175184 () Bool)

(assert (=> d!84270 e!175184))

(declare-fun res!211837 () Bool)

(assert (=> d!84270 (=> (not res!211837) (not e!175184))))

(declare-fun lt!392593 () (_ BitVec 64))

(declare-fun lt!392590 () (_ BitVec 64))

(declare-fun lt!392594 () (_ BitVec 64))

(assert (=> d!84270 (= res!211837 (= lt!392593 (bvsub lt!392590 lt!392594)))))

(assert (=> d!84270 (or (= (bvand lt!392590 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!392594 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!392590 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!392590 lt!392594) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84270 (= lt!392594 (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11797 lt!392426)))) ((_ sign_extend 32) (currentByte!11985 (_1!11797 lt!392426))) ((_ sign_extend 32) (currentBit!11980 (_1!11797 lt!392426)))))))

(declare-fun lt!392595 () (_ BitVec 64))

(declare-fun lt!392592 () (_ BitVec 64))

(assert (=> d!84270 (= lt!392590 (bvmul lt!392595 lt!392592))))

(assert (=> d!84270 (or (= lt!392595 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!392592 (bvsdiv (bvmul lt!392595 lt!392592) lt!392595)))))

(assert (=> d!84270 (= lt!392592 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84270 (= lt!392595 ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11797 lt!392426)))))))

(assert (=> d!84270 (= lt!392593 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11985 (_1!11797 lt!392426))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11980 (_1!11797 lt!392426)))))))

(assert (=> d!84270 (invariant!0 (currentBit!11980 (_1!11797 lt!392426)) (currentByte!11985 (_1!11797 lt!392426)) (size!6028 (buf!6530 (_1!11797 lt!392426))))))

(assert (=> d!84270 (= (bitIndex!0 (size!6028 (buf!6530 (_1!11797 lt!392426))) (currentByte!11985 (_1!11797 lt!392426)) (currentBit!11980 (_1!11797 lt!392426))) lt!392593)))

(declare-fun b!252805 () Bool)

(declare-fun res!211836 () Bool)

(assert (=> b!252805 (=> (not res!211836) (not e!175184))))

(assert (=> b!252805 (= res!211836 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!392593))))

(declare-fun b!252806 () Bool)

(declare-fun lt!392591 () (_ BitVec 64))

(assert (=> b!252806 (= e!175184 (bvsle lt!392593 (bvmul lt!392591 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!252806 (or (= lt!392591 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!392591 #b0000000000000000000000000000000000000000000000000000000000001000) lt!392591)))))

(assert (=> b!252806 (= lt!392591 ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11797 lt!392426)))))))

(assert (= (and d!84270 res!211837) b!252805))

(assert (= (and b!252805 res!211836) b!252806))

(declare-fun m!380427 () Bool)

(assert (=> d!84270 m!380427))

(declare-fun m!380429 () Bool)

(assert (=> d!84270 m!380429))

(assert (=> b!252686 d!84270))

(declare-fun d!84272 () Bool)

(declare-fun lt!392598 () tuple2!21756)

(declare-fun checkBitsLoop!0 (BitStream!10978 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21756)

(assert (=> d!84272 (= lt!392598 (checkBitsLoop!0 (_1!11799 lt!392424) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!84272 (= (checkBitsLoopPure!0 (_1!11799 lt!392424) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21739 (_2!11806 lt!392598) (_1!11806 lt!392598)))))

(declare-fun bs!21362 () Bool)

(assert (= bs!21362 d!84272))

(declare-fun m!380431 () Bool)

(assert (=> bs!21362 m!380431))

(assert (=> b!252679 d!84272))

(declare-fun d!84274 () Bool)

(assert (=> d!84274 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392425)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415))) lt!392419) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392425)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415)))) lt!392419))))

(declare-fun bs!21363 () Bool)

(assert (= bs!21363 d!84274))

(declare-fun m!380433 () Bool)

(assert (=> bs!21363 m!380433))

(assert (=> b!252679 d!84274))

(declare-fun d!84276 () Bool)

(assert (=> d!84276 (validate_offset_bits!1 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392425)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415))) lt!392419)))

(declare-fun lt!392601 () Unit!18204)

(declare-fun choose!9 (BitStream!10978 array!13738 (_ BitVec 64) BitStream!10978) Unit!18204)

(assert (=> d!84276 (= lt!392601 (choose!9 (_2!11798 lt!392415) (buf!6530 (_2!11798 lt!392425)) lt!392419 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 (_2!11798 lt!392415)) (currentBit!11980 (_2!11798 lt!392415)))))))

(assert (=> d!84276 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11798 lt!392415) (buf!6530 (_2!11798 lt!392425)) lt!392419) lt!392601)))

(declare-fun bs!21364 () Bool)

(assert (= bs!21364 d!84276))

(assert (=> bs!21364 m!380205))

(declare-fun m!380435 () Bool)

(assert (=> bs!21364 m!380435))

(assert (=> b!252679 d!84276))

(declare-fun b!252817 () Bool)

(declare-fun e!175189 () Unit!18204)

(declare-fun Unit!18210 () Unit!18204)

(assert (=> b!252817 (= e!175189 Unit!18210)))

(declare-fun b!252819 () Bool)

(declare-fun res!211845 () Bool)

(declare-fun e!175190 () Bool)

(assert (=> b!252819 (=> (not res!211845) (not e!175190))))

(declare-fun lt!392647 () tuple2!21742)

(assert (=> b!252819 (= res!211845 (isPrefixOf!0 (_2!11799 lt!392647) (_2!11798 lt!392425)))))

(declare-fun b!252818 () Bool)

(declare-fun res!211844 () Bool)

(assert (=> b!252818 (=> (not res!211844) (not e!175190))))

(assert (=> b!252818 (= res!211844 (isPrefixOf!0 (_1!11799 lt!392647) (_2!11798 lt!392415)))))

(declare-fun d!84278 () Bool)

(assert (=> d!84278 e!175190))

(declare-fun res!211846 () Bool)

(assert (=> d!84278 (=> (not res!211846) (not e!175190))))

(assert (=> d!84278 (= res!211846 (isPrefixOf!0 (_1!11799 lt!392647) (_2!11799 lt!392647)))))

(declare-fun lt!392651 () BitStream!10978)

(assert (=> d!84278 (= lt!392647 (tuple2!21743 lt!392651 (_2!11798 lt!392425)))))

(declare-fun lt!392645 () Unit!18204)

(declare-fun lt!392643 () Unit!18204)

(assert (=> d!84278 (= lt!392645 lt!392643)))

(assert (=> d!84278 (isPrefixOf!0 lt!392651 (_2!11798 lt!392425))))

(assert (=> d!84278 (= lt!392643 (lemmaIsPrefixTransitive!0 lt!392651 (_2!11798 lt!392425) (_2!11798 lt!392425)))))

(declare-fun lt!392650 () Unit!18204)

(declare-fun lt!392661 () Unit!18204)

(assert (=> d!84278 (= lt!392650 lt!392661)))

(assert (=> d!84278 (isPrefixOf!0 lt!392651 (_2!11798 lt!392425))))

(assert (=> d!84278 (= lt!392661 (lemmaIsPrefixTransitive!0 lt!392651 (_2!11798 lt!392415) (_2!11798 lt!392425)))))

(declare-fun lt!392642 () Unit!18204)

(assert (=> d!84278 (= lt!392642 e!175189)))

(declare-fun c!11629 () Bool)

(assert (=> d!84278 (= c!11629 (not (= (size!6028 (buf!6530 (_2!11798 lt!392415))) #b00000000000000000000000000000000)))))

(declare-fun lt!392657 () Unit!18204)

(declare-fun lt!392658 () Unit!18204)

(assert (=> d!84278 (= lt!392657 lt!392658)))

(assert (=> d!84278 (isPrefixOf!0 (_2!11798 lt!392425) (_2!11798 lt!392425))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10978) Unit!18204)

(assert (=> d!84278 (= lt!392658 (lemmaIsPrefixRefl!0 (_2!11798 lt!392425)))))

(declare-fun lt!392660 () Unit!18204)

(declare-fun lt!392652 () Unit!18204)

(assert (=> d!84278 (= lt!392660 lt!392652)))

(assert (=> d!84278 (= lt!392652 (lemmaIsPrefixRefl!0 (_2!11798 lt!392425)))))

(declare-fun lt!392653 () Unit!18204)

(declare-fun lt!392655 () Unit!18204)

(assert (=> d!84278 (= lt!392653 lt!392655)))

(assert (=> d!84278 (isPrefixOf!0 lt!392651 lt!392651)))

(assert (=> d!84278 (= lt!392655 (lemmaIsPrefixRefl!0 lt!392651))))

(declare-fun lt!392654 () Unit!18204)

(declare-fun lt!392648 () Unit!18204)

(assert (=> d!84278 (= lt!392654 lt!392648)))

(assert (=> d!84278 (isPrefixOf!0 (_2!11798 lt!392415) (_2!11798 lt!392415))))

(assert (=> d!84278 (= lt!392648 (lemmaIsPrefixRefl!0 (_2!11798 lt!392415)))))

(assert (=> d!84278 (= lt!392651 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 (_2!11798 lt!392415)) (currentBit!11980 (_2!11798 lt!392415))))))

(assert (=> d!84278 (isPrefixOf!0 (_2!11798 lt!392415) (_2!11798 lt!392425))))

(assert (=> d!84278 (= (reader!0 (_2!11798 lt!392415) (_2!11798 lt!392425)) lt!392647)))

(declare-fun lt!392649 () (_ BitVec 64))

(declare-fun b!252820 () Bool)

(declare-fun lt!392656 () (_ BitVec 64))

(assert (=> b!252820 (= e!175190 (= (_1!11799 lt!392647) (withMovedBitIndex!0 (_2!11799 lt!392647) (bvsub lt!392649 lt!392656))))))

(assert (=> b!252820 (or (= (bvand lt!392649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!392656 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!392649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!392649 lt!392656) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!252820 (= lt!392656 (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392425))) (currentByte!11985 (_2!11798 lt!392425)) (currentBit!11980 (_2!11798 lt!392425))))))

(assert (=> b!252820 (= lt!392649 (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392415))) (currentByte!11985 (_2!11798 lt!392415)) (currentBit!11980 (_2!11798 lt!392415))))))

(declare-fun b!252821 () Bool)

(declare-fun lt!392644 () Unit!18204)

(assert (=> b!252821 (= e!175189 lt!392644)))

(declare-fun lt!392646 () (_ BitVec 64))

(assert (=> b!252821 (= lt!392646 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!392659 () (_ BitVec 64))

(assert (=> b!252821 (= lt!392659 (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392415))) (currentByte!11985 (_2!11798 lt!392415)) (currentBit!11980 (_2!11798 lt!392415))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13738 array!13738 (_ BitVec 64) (_ BitVec 64)) Unit!18204)

(assert (=> b!252821 (= lt!392644 (arrayBitRangesEqSymmetric!0 (buf!6530 (_2!11798 lt!392415)) (buf!6530 (_2!11798 lt!392425)) lt!392646 lt!392659))))

(assert (=> b!252821 (arrayBitRangesEq!0 (buf!6530 (_2!11798 lt!392425)) (buf!6530 (_2!11798 lt!392415)) lt!392646 lt!392659)))

(assert (= (and d!84278 c!11629) b!252821))

(assert (= (and d!84278 (not c!11629)) b!252817))

(assert (= (and d!84278 res!211846) b!252818))

(assert (= (and b!252818 res!211844) b!252819))

(assert (= (and b!252819 res!211845) b!252820))

(declare-fun m!380437 () Bool)

(assert (=> d!84278 m!380437))

(declare-fun m!380439 () Bool)

(assert (=> d!84278 m!380439))

(declare-fun m!380441 () Bool)

(assert (=> d!84278 m!380441))

(declare-fun m!380443 () Bool)

(assert (=> d!84278 m!380443))

(declare-fun m!380445 () Bool)

(assert (=> d!84278 m!380445))

(declare-fun m!380447 () Bool)

(assert (=> d!84278 m!380447))

(declare-fun m!380449 () Bool)

(assert (=> d!84278 m!380449))

(declare-fun m!380451 () Bool)

(assert (=> d!84278 m!380451))

(assert (=> d!84278 m!380201))

(declare-fun m!380453 () Bool)

(assert (=> d!84278 m!380453))

(declare-fun m!380455 () Bool)

(assert (=> d!84278 m!380455))

(declare-fun m!380457 () Bool)

(assert (=> b!252820 m!380457))

(assert (=> b!252820 m!380193))

(assert (=> b!252820 m!380195))

(declare-fun m!380459 () Bool)

(assert (=> b!252818 m!380459))

(assert (=> b!252821 m!380195))

(declare-fun m!380461 () Bool)

(assert (=> b!252821 m!380461))

(declare-fun m!380463 () Bool)

(assert (=> b!252821 m!380463))

(declare-fun m!380465 () Bool)

(assert (=> b!252819 m!380465))

(assert (=> b!252679 d!84278))

(declare-fun d!84280 () Bool)

(assert (=> d!84280 (= (invariant!0 (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005) (size!6028 (buf!6530 (_2!11798 lt!392425)))) (and (bvsge (currentBit!11980 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11980 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11985 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11985 thiss!1005) (size!6028 (buf!6530 (_2!11798 lt!392425)))) (and (= (currentBit!11980 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11985 thiss!1005) (size!6028 (buf!6530 (_2!11798 lt!392425))))))))))

(assert (=> b!252689 d!84280))

(declare-fun d!84282 () Bool)

(declare-fun res!211848 () Bool)

(declare-fun e!175192 () Bool)

(assert (=> d!84282 (=> (not res!211848) (not e!175192))))

(assert (=> d!84282 (= res!211848 (= (size!6028 (buf!6530 thiss!1005)) (size!6028 (buf!6530 (_2!11798 lt!392415)))))))

(assert (=> d!84282 (= (isPrefixOf!0 thiss!1005 (_2!11798 lt!392415)) e!175192)))

(declare-fun b!252822 () Bool)

(declare-fun res!211847 () Bool)

(assert (=> b!252822 (=> (not res!211847) (not e!175192))))

(assert (=> b!252822 (= res!211847 (bvsle (bitIndex!0 (size!6028 (buf!6530 thiss!1005)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)) (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392415))) (currentByte!11985 (_2!11798 lt!392415)) (currentBit!11980 (_2!11798 lt!392415)))))))

(declare-fun b!252823 () Bool)

(declare-fun e!175191 () Bool)

(assert (=> b!252823 (= e!175192 e!175191)))

(declare-fun res!211849 () Bool)

(assert (=> b!252823 (=> res!211849 e!175191)))

(assert (=> b!252823 (= res!211849 (= (size!6028 (buf!6530 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!252824 () Bool)

(assert (=> b!252824 (= e!175191 (arrayBitRangesEq!0 (buf!6530 thiss!1005) (buf!6530 (_2!11798 lt!392415)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6028 (buf!6530 thiss!1005)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005))))))

(assert (= (and d!84282 res!211848) b!252822))

(assert (= (and b!252822 res!211847) b!252823))

(assert (= (and b!252823 (not res!211849)) b!252824))

(assert (=> b!252822 m!380217))

(assert (=> b!252822 m!380195))

(assert (=> b!252824 m!380217))

(assert (=> b!252824 m!380217))

(declare-fun m!380467 () Bool)

(assert (=> b!252824 m!380467))

(assert (=> b!252678 d!84282))

(declare-fun d!84284 () Bool)

(declare-fun e!175193 () Bool)

(assert (=> d!84284 e!175193))

(declare-fun res!211851 () Bool)

(assert (=> d!84284 (=> (not res!211851) (not e!175193))))

(declare-fun lt!392666 () (_ BitVec 64))

(declare-fun lt!392665 () (_ BitVec 64))

(declare-fun lt!392662 () (_ BitVec 64))

(assert (=> d!84284 (= res!211851 (= lt!392665 (bvsub lt!392662 lt!392666)))))

(assert (=> d!84284 (or (= (bvand lt!392662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!392666 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!392662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!392662 lt!392666) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84284 (= lt!392666 (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392415)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415)))))))

(declare-fun lt!392667 () (_ BitVec 64))

(declare-fun lt!392664 () (_ BitVec 64))

(assert (=> d!84284 (= lt!392662 (bvmul lt!392667 lt!392664))))

(assert (=> d!84284 (or (= lt!392667 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!392664 (bvsdiv (bvmul lt!392667 lt!392664) lt!392667)))))

(assert (=> d!84284 (= lt!392664 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84284 (= lt!392667 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392415)))))))

(assert (=> d!84284 (= lt!392665 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415)))))))

(assert (=> d!84284 (invariant!0 (currentBit!11980 (_2!11798 lt!392415)) (currentByte!11985 (_2!11798 lt!392415)) (size!6028 (buf!6530 (_2!11798 lt!392415))))))

(assert (=> d!84284 (= (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392415))) (currentByte!11985 (_2!11798 lt!392415)) (currentBit!11980 (_2!11798 lt!392415))) lt!392665)))

(declare-fun b!252825 () Bool)

(declare-fun res!211850 () Bool)

(assert (=> b!252825 (=> (not res!211850) (not e!175193))))

(assert (=> b!252825 (= res!211850 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!392665))))

(declare-fun b!252826 () Bool)

(declare-fun lt!392663 () (_ BitVec 64))

(assert (=> b!252826 (= e!175193 (bvsle lt!392665 (bvmul lt!392663 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!252826 (or (= lt!392663 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!392663 #b0000000000000000000000000000000000000000000000000000000000001000) lt!392663)))))

(assert (=> b!252826 (= lt!392663 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392415)))))))

(assert (= (and d!84284 res!211851) b!252825))

(assert (= (and b!252825 res!211850) b!252826))

(declare-fun m!380469 () Bool)

(assert (=> d!84284 m!380469))

(assert (=> d!84284 m!380419))

(assert (=> b!252683 d!84284))

(declare-fun d!84286 () Bool)

(declare-fun e!175194 () Bool)

(assert (=> d!84286 e!175194))

(declare-fun res!211853 () Bool)

(assert (=> d!84286 (=> (not res!211853) (not e!175194))))

(declare-fun lt!392672 () (_ BitVec 64))

(declare-fun lt!392668 () (_ BitVec 64))

(declare-fun lt!392671 () (_ BitVec 64))

(assert (=> d!84286 (= res!211853 (= lt!392671 (bvsub lt!392668 lt!392672)))))

(assert (=> d!84286 (or (= (bvand lt!392668 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!392672 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!392668 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!392668 lt!392672) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84286 (= lt!392672 (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 thiss!1005))) ((_ sign_extend 32) (currentByte!11985 thiss!1005)) ((_ sign_extend 32) (currentBit!11980 thiss!1005))))))

(declare-fun lt!392673 () (_ BitVec 64))

(declare-fun lt!392670 () (_ BitVec 64))

(assert (=> d!84286 (= lt!392668 (bvmul lt!392673 lt!392670))))

(assert (=> d!84286 (or (= lt!392673 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!392670 (bvsdiv (bvmul lt!392673 lt!392670) lt!392673)))))

(assert (=> d!84286 (= lt!392670 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84286 (= lt!392673 ((_ sign_extend 32) (size!6028 (buf!6530 thiss!1005))))))

(assert (=> d!84286 (= lt!392671 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11985 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11980 thiss!1005))))))

(assert (=> d!84286 (invariant!0 (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005) (size!6028 (buf!6530 thiss!1005)))))

(assert (=> d!84286 (= (bitIndex!0 (size!6028 (buf!6530 thiss!1005)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)) lt!392671)))

(declare-fun b!252827 () Bool)

(declare-fun res!211852 () Bool)

(assert (=> b!252827 (=> (not res!211852) (not e!175194))))

(assert (=> b!252827 (= res!211852 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!392671))))

(declare-fun b!252828 () Bool)

(declare-fun lt!392669 () (_ BitVec 64))

(assert (=> b!252828 (= e!175194 (bvsle lt!392671 (bvmul lt!392669 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!252828 (or (= lt!392669 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!392669 #b0000000000000000000000000000000000000000000000000000000000001000) lt!392669)))))

(assert (=> b!252828 (= lt!392669 ((_ sign_extend 32) (size!6028 (buf!6530 thiss!1005))))))

(assert (= (and d!84286 res!211853) b!252827))

(assert (= (and b!252827 res!211852) b!252828))

(assert (=> d!84286 m!380423))

(assert (=> d!84286 m!380421))

(assert (=> b!252683 d!84286))

(declare-fun d!84288 () Bool)

(declare-fun e!175195 () Bool)

(assert (=> d!84288 e!175195))

(declare-fun res!211855 () Bool)

(assert (=> d!84288 (=> (not res!211855) (not e!175195))))

(declare-fun lt!392674 () (_ BitVec 64))

(declare-fun lt!392678 () (_ BitVec 64))

(declare-fun lt!392677 () (_ BitVec 64))

(assert (=> d!84288 (= res!211855 (= lt!392677 (bvsub lt!392674 lt!392678)))))

(assert (=> d!84288 (or (= (bvand lt!392674 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!392678 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!392674 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!392674 lt!392678) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84288 (= lt!392678 (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11797 lt!392427)))) ((_ sign_extend 32) (currentByte!11985 (_1!11797 lt!392427))) ((_ sign_extend 32) (currentBit!11980 (_1!11797 lt!392427)))))))

(declare-fun lt!392679 () (_ BitVec 64))

(declare-fun lt!392676 () (_ BitVec 64))

(assert (=> d!84288 (= lt!392674 (bvmul lt!392679 lt!392676))))

(assert (=> d!84288 (or (= lt!392679 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!392676 (bvsdiv (bvmul lt!392679 lt!392676) lt!392679)))))

(assert (=> d!84288 (= lt!392676 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84288 (= lt!392679 ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11797 lt!392427)))))))

(assert (=> d!84288 (= lt!392677 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11985 (_1!11797 lt!392427))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11980 (_1!11797 lt!392427)))))))

(assert (=> d!84288 (invariant!0 (currentBit!11980 (_1!11797 lt!392427)) (currentByte!11985 (_1!11797 lt!392427)) (size!6028 (buf!6530 (_1!11797 lt!392427))))))

(assert (=> d!84288 (= (bitIndex!0 (size!6028 (buf!6530 (_1!11797 lt!392427))) (currentByte!11985 (_1!11797 lt!392427)) (currentBit!11980 (_1!11797 lt!392427))) lt!392677)))

(declare-fun b!252829 () Bool)

(declare-fun res!211854 () Bool)

(assert (=> b!252829 (=> (not res!211854) (not e!175195))))

(assert (=> b!252829 (= res!211854 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!392677))))

(declare-fun b!252830 () Bool)

(declare-fun lt!392675 () (_ BitVec 64))

(assert (=> b!252830 (= e!175195 (bvsle lt!392677 (bvmul lt!392675 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!252830 (or (= lt!392675 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!392675 #b0000000000000000000000000000000000000000000000000000000000001000) lt!392675)))))

(assert (=> b!252830 (= lt!392675 ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11797 lt!392427)))))))

(assert (= (and d!84288 res!211855) b!252829))

(assert (= (and b!252829 res!211854) b!252830))

(declare-fun m!380471 () Bool)

(assert (=> d!84288 m!380471))

(declare-fun m!380473 () Bool)

(assert (=> d!84288 m!380473))

(assert (=> b!252682 d!84288))

(declare-fun d!84290 () Bool)

(declare-fun lt!392680 () tuple2!21756)

(assert (=> d!84290 (= lt!392680 (readBit!0 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005))))))

(assert (=> d!84290 (= (readBitPure!0 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005))) (tuple2!21739 (_2!11806 lt!392680) (_1!11806 lt!392680)))))

(declare-fun bs!21365 () Bool)

(assert (= bs!21365 d!84290))

(declare-fun m!380475 () Bool)

(assert (=> bs!21365 m!380475))

(assert (=> b!252682 d!84290))

(assert (=> b!252682 d!84278))

(declare-fun d!84292 () Bool)

(assert (=> d!84292 (validate_offset_bits!1 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392425)))) ((_ sign_extend 32) (currentByte!11985 thiss!1005)) ((_ sign_extend 32) (currentBit!11980 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!392681 () Unit!18204)

(assert (=> d!84292 (= lt!392681 (choose!9 thiss!1005 (buf!6530 (_2!11798 lt!392425)) (bvsub nBits!297 from!289) (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005))))))

(assert (=> d!84292 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6530 (_2!11798 lt!392425)) (bvsub nBits!297 from!289)) lt!392681)))

(declare-fun bs!21366 () Bool)

(assert (= bs!21366 d!84292))

(assert (=> bs!21366 m!380245))

(declare-fun m!380477 () Bool)

(assert (=> bs!21366 m!380477))

(assert (=> b!252682 d!84292))

(declare-fun d!84294 () Bool)

(declare-fun res!211857 () Bool)

(declare-fun e!175197 () Bool)

(assert (=> d!84294 (=> (not res!211857) (not e!175197))))

(assert (=> d!84294 (= res!211857 (= (size!6028 (buf!6530 thiss!1005)) (size!6028 (buf!6530 (_2!11798 lt!392425)))))))

(assert (=> d!84294 (= (isPrefixOf!0 thiss!1005 (_2!11798 lt!392425)) e!175197)))

(declare-fun b!252831 () Bool)

(declare-fun res!211856 () Bool)

(assert (=> b!252831 (=> (not res!211856) (not e!175197))))

(assert (=> b!252831 (= res!211856 (bvsle (bitIndex!0 (size!6028 (buf!6530 thiss!1005)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)) (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392425))) (currentByte!11985 (_2!11798 lt!392425)) (currentBit!11980 (_2!11798 lt!392425)))))))

(declare-fun b!252832 () Bool)

(declare-fun e!175196 () Bool)

(assert (=> b!252832 (= e!175197 e!175196)))

(declare-fun res!211858 () Bool)

(assert (=> b!252832 (=> res!211858 e!175196)))

(assert (=> b!252832 (= res!211858 (= (size!6028 (buf!6530 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!252833 () Bool)

(assert (=> b!252833 (= e!175196 (arrayBitRangesEq!0 (buf!6530 thiss!1005) (buf!6530 (_2!11798 lt!392425)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6028 (buf!6530 thiss!1005)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005))))))

(assert (= (and d!84294 res!211857) b!252831))

(assert (= (and b!252831 res!211856) b!252832))

(assert (= (and b!252832 (not res!211858)) b!252833))

(assert (=> b!252831 m!380217))

(assert (=> b!252831 m!380193))

(assert (=> b!252833 m!380217))

(assert (=> b!252833 m!380217))

(declare-fun m!380479 () Bool)

(assert (=> b!252833 m!380479))

(assert (=> b!252682 d!84294))

(declare-fun d!84296 () Bool)

(assert (=> d!84296 (validate_offset_bits!1 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392425)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415))) lt!392433)))

(declare-fun lt!392682 () Unit!18204)

(assert (=> d!84296 (= lt!392682 (choose!9 (_2!11798 lt!392415) (buf!6530 (_2!11798 lt!392425)) lt!392433 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 (_2!11798 lt!392415)) (currentBit!11980 (_2!11798 lt!392415)))))))

(assert (=> d!84296 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11798 lt!392415) (buf!6530 (_2!11798 lt!392425)) lt!392433) lt!392682)))

(declare-fun bs!21367 () Bool)

(assert (= bs!21367 d!84296))

(assert (=> bs!21367 m!380229))

(declare-fun m!380481 () Bool)

(assert (=> bs!21367 m!380481))

(assert (=> b!252682 d!84296))

(declare-fun b!252846 () Bool)

(declare-fun e!175202 () Bool)

(declare-fun lt!392694 () tuple2!21738)

(declare-fun lt!392692 () tuple2!21740)

(assert (=> b!252846 (= e!175202 (= (bitIndex!0 (size!6028 (buf!6530 (_1!11797 lt!392694))) (currentByte!11985 (_1!11797 lt!392694)) (currentBit!11980 (_1!11797 lt!392694))) (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392692))) (currentByte!11985 (_2!11798 lt!392692)) (currentBit!11980 (_2!11798 lt!392692)))))))

(declare-fun b!252843 () Bool)

(declare-fun res!211870 () Bool)

(declare-fun e!175203 () Bool)

(assert (=> b!252843 (=> (not res!211870) (not e!175203))))

(declare-fun lt!392693 () (_ BitVec 64))

(declare-fun lt!392691 () (_ BitVec 64))

(assert (=> b!252843 (= res!211870 (= (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392692))) (currentByte!11985 (_2!11798 lt!392692)) (currentBit!11980 (_2!11798 lt!392692))) (bvadd lt!392691 lt!392693)))))

(assert (=> b!252843 (or (not (= (bvand lt!392691 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!392693 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!392691 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!392691 lt!392693) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!252843 (= lt!392693 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!252843 (= lt!392691 (bitIndex!0 (size!6028 (buf!6530 thiss!1005)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)))))

(declare-fun d!84298 () Bool)

(assert (=> d!84298 e!175203))

(declare-fun res!211868 () Bool)

(assert (=> d!84298 (=> (not res!211868) (not e!175203))))

(assert (=> d!84298 (= res!211868 (= (size!6028 (buf!6530 thiss!1005)) (size!6028 (buf!6530 (_2!11798 lt!392692)))))))

(declare-fun choose!16 (BitStream!10978 Bool) tuple2!21740)

(assert (=> d!84298 (= lt!392692 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!84298 (validate_offset_bit!0 ((_ sign_extend 32) (size!6028 (buf!6530 thiss!1005))) ((_ sign_extend 32) (currentByte!11985 thiss!1005)) ((_ sign_extend 32) (currentBit!11980 thiss!1005)))))

(assert (=> d!84298 (= (appendBit!0 thiss!1005 bit!26) lt!392692)))

(declare-fun b!252844 () Bool)

(declare-fun res!211869 () Bool)

(assert (=> b!252844 (=> (not res!211869) (not e!175203))))

(assert (=> b!252844 (= res!211869 (isPrefixOf!0 thiss!1005 (_2!11798 lt!392692)))))

(declare-fun b!252845 () Bool)

(assert (=> b!252845 (= e!175203 e!175202)))

(declare-fun res!211867 () Bool)

(assert (=> b!252845 (=> (not res!211867) (not e!175202))))

(assert (=> b!252845 (= res!211867 (and (= (_2!11797 lt!392694) bit!26) (= (_1!11797 lt!392694) (_2!11798 lt!392692))))))

(assert (=> b!252845 (= lt!392694 (readBitPure!0 (readerFrom!0 (_2!11798 lt!392692) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005))))))

(assert (= (and d!84298 res!211868) b!252843))

(assert (= (and b!252843 res!211870) b!252844))

(assert (= (and b!252844 res!211869) b!252845))

(assert (= (and b!252845 res!211867) b!252846))

(declare-fun m!380483 () Bool)

(assert (=> b!252843 m!380483))

(assert (=> b!252843 m!380217))

(declare-fun m!380485 () Bool)

(assert (=> d!84298 m!380485))

(declare-fun m!380487 () Bool)

(assert (=> d!84298 m!380487))

(declare-fun m!380489 () Bool)

(assert (=> b!252844 m!380489))

(declare-fun m!380491 () Bool)

(assert (=> b!252845 m!380491))

(assert (=> b!252845 m!380491))

(declare-fun m!380493 () Bool)

(assert (=> b!252845 m!380493))

(declare-fun m!380495 () Bool)

(assert (=> b!252846 m!380495))

(assert (=> b!252846 m!380483))

(assert (=> b!252682 d!84298))

(declare-fun d!84300 () Bool)

(declare-fun lt!392695 () tuple2!21756)

(assert (=> d!84300 (= lt!392695 (readBit!0 lt!392417))))

(assert (=> d!84300 (= (readBitPure!0 lt!392417) (tuple2!21739 (_2!11806 lt!392695) (_1!11806 lt!392695)))))

(declare-fun bs!21368 () Bool)

(assert (= bs!21368 d!84300))

(declare-fun m!380497 () Bool)

(assert (=> bs!21368 m!380497))

(assert (=> b!252682 d!84300))

(declare-fun d!84302 () Bool)

(declare-fun e!175204 () Bool)

(assert (=> d!84302 e!175204))

(declare-fun res!211872 () Bool)

(assert (=> d!84302 (=> (not res!211872) (not e!175204))))

(declare-fun lt!392696 () (_ BitVec 64))

(declare-fun lt!392700 () (_ BitVec 64))

(declare-fun lt!392699 () (_ BitVec 64))

(assert (=> d!84302 (= res!211872 (= lt!392699 (bvsub lt!392696 lt!392700)))))

(assert (=> d!84302 (or (= (bvand lt!392696 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!392700 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!392696 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!392696 lt!392700) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84302 (= lt!392700 (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11797 lt!392421)))) ((_ sign_extend 32) (currentByte!11985 (_1!11797 lt!392421))) ((_ sign_extend 32) (currentBit!11980 (_1!11797 lt!392421)))))))

(declare-fun lt!392701 () (_ BitVec 64))

(declare-fun lt!392698 () (_ BitVec 64))

(assert (=> d!84302 (= lt!392696 (bvmul lt!392701 lt!392698))))

(assert (=> d!84302 (or (= lt!392701 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!392698 (bvsdiv (bvmul lt!392701 lt!392698) lt!392701)))))

(assert (=> d!84302 (= lt!392698 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84302 (= lt!392701 ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11797 lt!392421)))))))

(assert (=> d!84302 (= lt!392699 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11985 (_1!11797 lt!392421))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11980 (_1!11797 lt!392421)))))))

(assert (=> d!84302 (invariant!0 (currentBit!11980 (_1!11797 lt!392421)) (currentByte!11985 (_1!11797 lt!392421)) (size!6028 (buf!6530 (_1!11797 lt!392421))))))

(assert (=> d!84302 (= (bitIndex!0 (size!6028 (buf!6530 (_1!11797 lt!392421))) (currentByte!11985 (_1!11797 lt!392421)) (currentBit!11980 (_1!11797 lt!392421))) lt!392699)))

(declare-fun b!252847 () Bool)

(declare-fun res!211871 () Bool)

(assert (=> b!252847 (=> (not res!211871) (not e!175204))))

(assert (=> b!252847 (= res!211871 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!392699))))

(declare-fun b!252848 () Bool)

(declare-fun lt!392697 () (_ BitVec 64))

(assert (=> b!252848 (= e!175204 (bvsle lt!392699 (bvmul lt!392697 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!252848 (or (= lt!392697 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!392697 #b0000000000000000000000000000000000000000000000000000000000001000) lt!392697)))))

(assert (=> b!252848 (= lt!392697 ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11797 lt!392421)))))))

(assert (= (and d!84302 res!211872) b!252847))

(assert (= (and b!252847 res!211871) b!252848))

(declare-fun m!380499 () Bool)

(assert (=> d!84302 m!380499))

(declare-fun m!380501 () Bool)

(assert (=> d!84302 m!380501))

(assert (=> b!252682 d!84302))

(declare-fun d!84304 () Bool)

(assert (=> d!84304 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392415)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415))) lt!392433) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392415)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415)))) lt!392433))))

(declare-fun bs!21369 () Bool)

(assert (= bs!21369 d!84304))

(assert (=> bs!21369 m!380469))

(assert (=> b!252682 d!84304))

(declare-fun d!84306 () Bool)

(assert (=> d!84306 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392425)))) ((_ sign_extend 32) (currentByte!11985 thiss!1005)) ((_ sign_extend 32) (currentBit!11980 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392425)))) ((_ sign_extend 32) (currentByte!11985 thiss!1005)) ((_ sign_extend 32) (currentBit!11980 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21370 () Bool)

(assert (= bs!21370 d!84306))

(declare-fun m!380503 () Bool)

(assert (=> bs!21370 m!380503))

(assert (=> b!252682 d!84306))

(declare-fun d!84308 () Bool)

(declare-fun e!175207 () Bool)

(assert (=> d!84308 e!175207))

(declare-fun res!211875 () Bool)

(assert (=> d!84308 (=> (not res!211875) (not e!175207))))

(assert (=> d!84308 (= res!211875 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!392704 () Unit!18204)

(declare-fun choose!27 (BitStream!10978 BitStream!10978 (_ BitVec 64) (_ BitVec 64)) Unit!18204)

(assert (=> d!84308 (= lt!392704 (choose!27 thiss!1005 (_2!11798 lt!392415) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!84308 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!84308 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11798 lt!392415) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!392704)))

(declare-fun b!252851 () Bool)

(assert (=> b!252851 (= e!175207 (validate_offset_bits!1 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392415)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!84308 res!211875) b!252851))

(declare-fun m!380505 () Bool)

(assert (=> d!84308 m!380505))

(declare-fun m!380507 () Bool)

(assert (=> b!252851 m!380507))

(assert (=> b!252682 d!84308))

(declare-fun b!252852 () Bool)

(declare-fun e!175208 () Unit!18204)

(declare-fun Unit!18211 () Unit!18204)

(assert (=> b!252852 (= e!175208 Unit!18211)))

(declare-fun b!252854 () Bool)

(declare-fun res!211877 () Bool)

(declare-fun e!175209 () Bool)

(assert (=> b!252854 (=> (not res!211877) (not e!175209))))

(declare-fun lt!392710 () tuple2!21742)

(assert (=> b!252854 (= res!211877 (isPrefixOf!0 (_2!11799 lt!392710) (_2!11798 lt!392425)))))

(declare-fun b!252853 () Bool)

(declare-fun res!211876 () Bool)

(assert (=> b!252853 (=> (not res!211876) (not e!175209))))

(assert (=> b!252853 (= res!211876 (isPrefixOf!0 (_1!11799 lt!392710) thiss!1005))))

(declare-fun d!84310 () Bool)

(assert (=> d!84310 e!175209))

(declare-fun res!211878 () Bool)

(assert (=> d!84310 (=> (not res!211878) (not e!175209))))

(assert (=> d!84310 (= res!211878 (isPrefixOf!0 (_1!11799 lt!392710) (_2!11799 lt!392710)))))

(declare-fun lt!392714 () BitStream!10978)

(assert (=> d!84310 (= lt!392710 (tuple2!21743 lt!392714 (_2!11798 lt!392425)))))

(declare-fun lt!392708 () Unit!18204)

(declare-fun lt!392706 () Unit!18204)

(assert (=> d!84310 (= lt!392708 lt!392706)))

(assert (=> d!84310 (isPrefixOf!0 lt!392714 (_2!11798 lt!392425))))

(assert (=> d!84310 (= lt!392706 (lemmaIsPrefixTransitive!0 lt!392714 (_2!11798 lt!392425) (_2!11798 lt!392425)))))

(declare-fun lt!392713 () Unit!18204)

(declare-fun lt!392724 () Unit!18204)

(assert (=> d!84310 (= lt!392713 lt!392724)))

(assert (=> d!84310 (isPrefixOf!0 lt!392714 (_2!11798 lt!392425))))

(assert (=> d!84310 (= lt!392724 (lemmaIsPrefixTransitive!0 lt!392714 thiss!1005 (_2!11798 lt!392425)))))

(declare-fun lt!392705 () Unit!18204)

(assert (=> d!84310 (= lt!392705 e!175208)))

(declare-fun c!11630 () Bool)

(assert (=> d!84310 (= c!11630 (not (= (size!6028 (buf!6530 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!392720 () Unit!18204)

(declare-fun lt!392721 () Unit!18204)

(assert (=> d!84310 (= lt!392720 lt!392721)))

(assert (=> d!84310 (isPrefixOf!0 (_2!11798 lt!392425) (_2!11798 lt!392425))))

(assert (=> d!84310 (= lt!392721 (lemmaIsPrefixRefl!0 (_2!11798 lt!392425)))))

(declare-fun lt!392723 () Unit!18204)

(declare-fun lt!392715 () Unit!18204)

(assert (=> d!84310 (= lt!392723 lt!392715)))

(assert (=> d!84310 (= lt!392715 (lemmaIsPrefixRefl!0 (_2!11798 lt!392425)))))

(declare-fun lt!392716 () Unit!18204)

(declare-fun lt!392718 () Unit!18204)

(assert (=> d!84310 (= lt!392716 lt!392718)))

(assert (=> d!84310 (isPrefixOf!0 lt!392714 lt!392714)))

(assert (=> d!84310 (= lt!392718 (lemmaIsPrefixRefl!0 lt!392714))))

(declare-fun lt!392717 () Unit!18204)

(declare-fun lt!392711 () Unit!18204)

(assert (=> d!84310 (= lt!392717 lt!392711)))

(assert (=> d!84310 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!84310 (= lt!392711 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!84310 (= lt!392714 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)))))

(assert (=> d!84310 (isPrefixOf!0 thiss!1005 (_2!11798 lt!392425))))

(assert (=> d!84310 (= (reader!0 thiss!1005 (_2!11798 lt!392425)) lt!392710)))

(declare-fun lt!392712 () (_ BitVec 64))

(declare-fun b!252855 () Bool)

(declare-fun lt!392719 () (_ BitVec 64))

(assert (=> b!252855 (= e!175209 (= (_1!11799 lt!392710) (withMovedBitIndex!0 (_2!11799 lt!392710) (bvsub lt!392712 lt!392719))))))

(assert (=> b!252855 (or (= (bvand lt!392712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!392719 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!392712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!392712 lt!392719) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!252855 (= lt!392719 (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392425))) (currentByte!11985 (_2!11798 lt!392425)) (currentBit!11980 (_2!11798 lt!392425))))))

(assert (=> b!252855 (= lt!392712 (bitIndex!0 (size!6028 (buf!6530 thiss!1005)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)))))

(declare-fun b!252856 () Bool)

(declare-fun lt!392707 () Unit!18204)

(assert (=> b!252856 (= e!175208 lt!392707)))

(declare-fun lt!392709 () (_ BitVec 64))

(assert (=> b!252856 (= lt!392709 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!392722 () (_ BitVec 64))

(assert (=> b!252856 (= lt!392722 (bitIndex!0 (size!6028 (buf!6530 thiss!1005)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)))))

(assert (=> b!252856 (= lt!392707 (arrayBitRangesEqSymmetric!0 (buf!6530 thiss!1005) (buf!6530 (_2!11798 lt!392425)) lt!392709 lt!392722))))

(assert (=> b!252856 (arrayBitRangesEq!0 (buf!6530 (_2!11798 lt!392425)) (buf!6530 thiss!1005) lt!392709 lt!392722)))

(assert (= (and d!84310 c!11630) b!252856))

(assert (= (and d!84310 (not c!11630)) b!252852))

(assert (= (and d!84310 res!211878) b!252853))

(assert (= (and b!252853 res!211876) b!252854))

(assert (= (and b!252854 res!211877) b!252855))

(declare-fun m!380509 () Bool)

(assert (=> d!84310 m!380509))

(declare-fun m!380511 () Bool)

(assert (=> d!84310 m!380511))

(declare-fun m!380513 () Bool)

(assert (=> d!84310 m!380513))

(assert (=> d!84310 m!380443))

(declare-fun m!380515 () Bool)

(assert (=> d!84310 m!380515))

(declare-fun m!380517 () Bool)

(assert (=> d!84310 m!380517))

(declare-fun m!380519 () Bool)

(assert (=> d!84310 m!380519))

(declare-fun m!380521 () Bool)

(assert (=> d!84310 m!380521))

(assert (=> d!84310 m!380221))

(assert (=> d!84310 m!380453))

(declare-fun m!380523 () Bool)

(assert (=> d!84310 m!380523))

(declare-fun m!380525 () Bool)

(assert (=> b!252855 m!380525))

(assert (=> b!252855 m!380193))

(assert (=> b!252855 m!380217))

(declare-fun m!380527 () Bool)

(assert (=> b!252853 m!380527))

(assert (=> b!252856 m!380217))

(declare-fun m!380529 () Bool)

(assert (=> b!252856 m!380529))

(declare-fun m!380531 () Bool)

(assert (=> b!252856 m!380531))

(declare-fun m!380533 () Bool)

(assert (=> b!252854 m!380533))

(assert (=> b!252682 d!84310))

(declare-fun d!84312 () Bool)

(assert (=> d!84312 (isPrefixOf!0 thiss!1005 (_2!11798 lt!392425))))

(declare-fun lt!392727 () Unit!18204)

(declare-fun choose!30 (BitStream!10978 BitStream!10978 BitStream!10978) Unit!18204)

(assert (=> d!84312 (= lt!392727 (choose!30 thiss!1005 (_2!11798 lt!392415) (_2!11798 lt!392425)))))

(assert (=> d!84312 (isPrefixOf!0 thiss!1005 (_2!11798 lt!392415))))

(assert (=> d!84312 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11798 lt!392415) (_2!11798 lt!392425)) lt!392727)))

(declare-fun bs!21371 () Bool)

(assert (= bs!21371 d!84312))

(assert (=> bs!21371 m!380221))

(declare-fun m!380535 () Bool)

(assert (=> bs!21371 m!380535))

(assert (=> bs!21371 m!380191))

(assert (=> b!252682 d!84312))

(declare-fun b!252866 () Bool)

(declare-fun res!211888 () Bool)

(declare-fun e!175215 () Bool)

(assert (=> b!252866 (=> (not res!211888) (not e!175215))))

(declare-fun lt!392756 () tuple2!21740)

(assert (=> b!252866 (= res!211888 (isPrefixOf!0 (_2!11798 lt!392415) (_2!11798 lt!392756)))))

(declare-fun b!252868 () Bool)

(declare-fun e!175214 () Bool)

(declare-fun lt!392753 () (_ BitVec 64))

(assert (=> b!252868 (= e!175214 (validate_offset_bits!1 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392415)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415))) lt!392753))))

(declare-fun b!252867 () Bool)

(declare-fun lt!392750 () tuple2!21738)

(declare-fun lt!392752 () tuple2!21742)

(assert (=> b!252867 (= e!175215 (and (_2!11797 lt!392750) (= (_1!11797 lt!392750) (_2!11799 lt!392752))))))

(assert (=> b!252867 (= lt!392750 (checkBitsLoopPure!0 (_1!11799 lt!392752) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!392755 () Unit!18204)

(declare-fun lt!392751 () Unit!18204)

(assert (=> b!252867 (= lt!392755 lt!392751)))

(assert (=> b!252867 (validate_offset_bits!1 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392756)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415))) lt!392753)))

(assert (=> b!252867 (= lt!392751 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11798 lt!392415) (buf!6530 (_2!11798 lt!392756)) lt!392753))))

(assert (=> b!252867 e!175214))

(declare-fun res!211889 () Bool)

(assert (=> b!252867 (=> (not res!211889) (not e!175214))))

(assert (=> b!252867 (= res!211889 (and (= (size!6028 (buf!6530 (_2!11798 lt!392415))) (size!6028 (buf!6530 (_2!11798 lt!392756)))) (bvsge lt!392753 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!252867 (= lt!392753 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!252867 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!252867 (= lt!392752 (reader!0 (_2!11798 lt!392415) (_2!11798 lt!392756)))))

(declare-fun d!84316 () Bool)

(assert (=> d!84316 e!175215))

(declare-fun res!211887 () Bool)

(assert (=> d!84316 (=> (not res!211887) (not e!175215))))

(assert (=> d!84316 (= res!211887 (= (size!6028 (buf!6530 (_2!11798 lt!392415))) (size!6028 (buf!6530 (_2!11798 lt!392756)))))))

(declare-fun choose!51 (BitStream!10978 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21740)

(assert (=> d!84316 (= lt!392756 (choose!51 (_2!11798 lt!392415) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!84316 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!84316 (= (appendNBitsLoop!0 (_2!11798 lt!392415) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!392756)))

(declare-fun b!252865 () Bool)

(declare-fun res!211890 () Bool)

(assert (=> b!252865 (=> (not res!211890) (not e!175215))))

(declare-fun lt!392754 () (_ BitVec 64))

(declare-fun lt!392757 () (_ BitVec 64))

(assert (=> b!252865 (= res!211890 (= (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392756))) (currentByte!11985 (_2!11798 lt!392756)) (currentBit!11980 (_2!11798 lt!392756))) (bvadd lt!392754 lt!392757)))))

(assert (=> b!252865 (or (not (= (bvand lt!392754 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!392757 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!392754 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!392754 lt!392757) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!252865 (= lt!392757 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!252865 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!252865 (= lt!392754 (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392415))) (currentByte!11985 (_2!11798 lt!392415)) (currentBit!11980 (_2!11798 lt!392415))))))

(assert (= (and d!84316 res!211887) b!252865))

(assert (= (and b!252865 res!211890) b!252866))

(assert (= (and b!252866 res!211888) b!252867))

(assert (= (and b!252867 res!211889) b!252868))

(declare-fun m!380543 () Bool)

(assert (=> b!252868 m!380543))

(declare-fun m!380545 () Bool)

(assert (=> b!252866 m!380545))

(declare-fun m!380547 () Bool)

(assert (=> d!84316 m!380547))

(declare-fun m!380549 () Bool)

(assert (=> b!252867 m!380549))

(declare-fun m!380551 () Bool)

(assert (=> b!252867 m!380551))

(declare-fun m!380553 () Bool)

(assert (=> b!252867 m!380553))

(declare-fun m!380555 () Bool)

(assert (=> b!252867 m!380555))

(declare-fun m!380557 () Bool)

(assert (=> b!252865 m!380557))

(assert (=> b!252865 m!380195))

(assert (=> b!252682 d!84316))

(declare-fun lt!392782 () tuple2!21756)

(declare-fun d!84326 () Bool)

(assert (=> d!84326 (= lt!392782 (checkBitsLoop!0 (_1!11799 lt!392429) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!84326 (= (checkBitsLoopPure!0 (_1!11799 lt!392429) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21739 (_2!11806 lt!392782) (_1!11806 lt!392782)))))

(declare-fun bs!21375 () Bool)

(assert (= bs!21375 d!84326))

(declare-fun m!380559 () Bool)

(assert (=> bs!21375 m!380559))

(assert (=> b!252682 d!84326))

(declare-fun lt!392787 () tuple2!21756)

(declare-fun d!84328 () Bool)

(assert (=> d!84328 (= lt!392787 (checkBitsLoop!0 (_1!11799 lt!392423) nBits!297 bit!26 from!289))))

(assert (=> d!84328 (= (checkBitsLoopPure!0 (_1!11799 lt!392423) nBits!297 bit!26 from!289) (tuple2!21739 (_2!11806 lt!392787) (_1!11806 lt!392787)))))

(declare-fun bs!21376 () Bool)

(assert (= bs!21376 d!84328))

(declare-fun m!380561 () Bool)

(assert (=> bs!21376 m!380561))

(assert (=> b!252682 d!84328))

(declare-fun d!84330 () Bool)

(assert (=> d!84330 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392425)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415))) lt!392433) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392425)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415)))) lt!392433))))

(declare-fun bs!21377 () Bool)

(assert (= bs!21377 d!84330))

(assert (=> bs!21377 m!380433))

(assert (=> b!252682 d!84330))

(declare-fun d!84332 () Bool)

(declare-fun e!175224 () Bool)

(assert (=> d!84332 e!175224))

(declare-fun res!211902 () Bool)

(assert (=> d!84332 (=> (not res!211902) (not e!175224))))

(declare-fun lt!392831 () tuple2!21738)

(declare-fun lt!392828 () tuple2!21738)

(assert (=> d!84332 (= res!211902 (= (bitIndex!0 (size!6028 (buf!6530 (_1!11797 lt!392831))) (currentByte!11985 (_1!11797 lt!392831)) (currentBit!11980 (_1!11797 lt!392831))) (bitIndex!0 (size!6028 (buf!6530 (_1!11797 lt!392828))) (currentByte!11985 (_1!11797 lt!392828)) (currentBit!11980 (_1!11797 lt!392828)))))))

(declare-fun lt!392830 () Unit!18204)

(declare-fun lt!392829 () BitStream!10978)

(declare-fun choose!50 (BitStream!10978 BitStream!10978 BitStream!10978 tuple2!21738 tuple2!21738 BitStream!10978 Bool tuple2!21738 tuple2!21738 BitStream!10978 Bool) Unit!18204)

(assert (=> d!84332 (= lt!392830 (choose!50 lt!392417 (_2!11798 lt!392425) lt!392829 lt!392831 (tuple2!21739 (_1!11797 lt!392831) (_2!11797 lt!392831)) (_1!11797 lt!392831) (_2!11797 lt!392831) lt!392828 (tuple2!21739 (_1!11797 lt!392828) (_2!11797 lt!392828)) (_1!11797 lt!392828) (_2!11797 lt!392828)))))

(assert (=> d!84332 (= lt!392828 (readBitPure!0 lt!392829))))

(assert (=> d!84332 (= lt!392831 (readBitPure!0 lt!392417))))

(assert (=> d!84332 (= lt!392829 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 lt!392417) (currentBit!11980 lt!392417)))))

(assert (=> d!84332 (invariant!0 (currentBit!11980 lt!392417) (currentByte!11985 lt!392417) (size!6028 (buf!6530 (_2!11798 lt!392425))))))

(assert (=> d!84332 (= (readBitPrefixLemma!0 lt!392417 (_2!11798 lt!392425)) lt!392830)))

(declare-fun b!252886 () Bool)

(assert (=> b!252886 (= e!175224 (= (_2!11797 lt!392831) (_2!11797 lt!392828)))))

(assert (= (and d!84332 res!211902) b!252886))

(declare-fun m!380593 () Bool)

(assert (=> d!84332 m!380593))

(declare-fun m!380595 () Bool)

(assert (=> d!84332 m!380595))

(declare-fun m!380597 () Bool)

(assert (=> d!84332 m!380597))

(declare-fun m!380599 () Bool)

(assert (=> d!84332 m!380599))

(assert (=> d!84332 m!380251))

(declare-fun m!380601 () Bool)

(assert (=> d!84332 m!380601))

(assert (=> b!252682 d!84332))

(declare-fun d!84336 () Bool)

(declare-fun lt!392834 () tuple2!21756)

(assert (=> d!84336 (= lt!392834 (readBit!0 (_1!11799 lt!392423)))))

(assert (=> d!84336 (= (readBitPure!0 (_1!11799 lt!392423)) (tuple2!21739 (_2!11806 lt!392834) (_1!11806 lt!392834)))))

(declare-fun bs!21378 () Bool)

(assert (= bs!21378 d!84336))

(declare-fun m!380603 () Bool)

(assert (=> bs!21378 m!380603))

(assert (=> b!252682 d!84336))

(declare-fun d!84338 () Bool)

(declare-fun e!175225 () Bool)

(assert (=> d!84338 e!175225))

(declare-fun res!211904 () Bool)

(assert (=> d!84338 (=> (not res!211904) (not e!175225))))

(declare-fun lt!392839 () (_ BitVec 64))

(declare-fun lt!392840 () (_ BitVec 64))

(declare-fun lt!392836 () (_ BitVec 64))

(assert (=> d!84338 (= res!211904 (= lt!392839 (bvsub lt!392836 lt!392840)))))

(assert (=> d!84338 (or (= (bvand lt!392836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!392840 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!392836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!392836 lt!392840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84338 (= lt!392840 (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392425)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392425))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392425)))))))

(declare-fun lt!392841 () (_ BitVec 64))

(declare-fun lt!392838 () (_ BitVec 64))

(assert (=> d!84338 (= lt!392836 (bvmul lt!392841 lt!392838))))

(assert (=> d!84338 (or (= lt!392841 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!392838 (bvsdiv (bvmul lt!392841 lt!392838) lt!392841)))))

(assert (=> d!84338 (= lt!392838 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84338 (= lt!392841 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392425)))))))

(assert (=> d!84338 (= lt!392839 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392425))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392425)))))))

(assert (=> d!84338 (invariant!0 (currentBit!11980 (_2!11798 lt!392425)) (currentByte!11985 (_2!11798 lt!392425)) (size!6028 (buf!6530 (_2!11798 lt!392425))))))

(assert (=> d!84338 (= (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392425))) (currentByte!11985 (_2!11798 lt!392425)) (currentBit!11980 (_2!11798 lt!392425))) lt!392839)))

(declare-fun b!252887 () Bool)

(declare-fun res!211903 () Bool)

(assert (=> b!252887 (=> (not res!211903) (not e!175225))))

(assert (=> b!252887 (= res!211903 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!392839))))

(declare-fun b!252888 () Bool)

(declare-fun lt!392837 () (_ BitVec 64))

(assert (=> b!252888 (= e!175225 (bvsle lt!392839 (bvmul lt!392837 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!252888 (or (= lt!392837 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!392837 #b0000000000000000000000000000000000000000000000000000000000001000) lt!392837)))))

(assert (=> b!252888 (= lt!392837 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392425)))))))

(assert (= (and d!84338 res!211904) b!252887))

(assert (= (and b!252887 res!211903) b!252888))

(declare-fun m!380607 () Bool)

(assert (=> d!84338 m!380607))

(declare-fun m!380609 () Bool)

(assert (=> d!84338 m!380609))

(assert (=> b!252681 d!84338))

(assert (=> b!252681 d!84284))

(push 1)

(assert (not b!252856))

(assert (not d!84290))

(assert (not b!252791))

(assert (not d!84262))

(assert (not b!252822))

(assert (not b!252854))

(assert (not b!252867))

(assert (not b!252800))

(assert (not b!252824))

(assert (not d!84276))

(assert (not d!84284))

(assert (not d!84328))

(assert (not b!252843))

(assert (not d!84312))

(assert (not d!84288))

(assert (not d!84292))

(assert (not d!84326))

(assert (not b!252821))

(assert (not b!252846))

(assert (not d!84306))

(assert (not d!84258))

(assert (not d!84272))

(assert (not d!84310))

(assert (not b!252845))

(assert (not b!252866))

(assert (not d!84330))

(assert (not d!84278))

(assert (not d!84300))

(assert (not d!84336))

(assert (not d!84302))

(assert (not d!84338))

(assert (not b!252853))

(assert (not b!252818))

(assert (not d!84308))

(assert (not b!252855))

(assert (not b!252819))

(assert (not d!84332))

(assert (not d!84266))

(assert (not d!84316))

(assert (not d!84286))

(assert (not d!84274))

(assert (not b!252798))

(assert (not d!84270))

(assert (not b!252833))

(assert (not d!84256))

(assert (not b!252844))

(assert (not b!252868))

(assert (not b!252831))

(assert (not b!252820))

(assert (not b!252851))

(assert (not d!84260))

(assert (not d!84304))

(assert (not b!252865))

(assert (not d!84298))

(assert (not d!84296))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!84808 () Bool)

(assert (=> d!84808 (= (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392425)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415)))) (bvsub (bvmul ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392425)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415))))))))

(assert (=> d!84330 d!84808))

(declare-fun d!84810 () Bool)

(assert (=> d!84810 (= (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11797 lt!392421)))) ((_ sign_extend 32) (currentByte!11985 (_1!11797 lt!392421))) ((_ sign_extend 32) (currentBit!11980 (_1!11797 lt!392421)))) (bvsub (bvmul ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11797 lt!392421)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11985 (_1!11797 lt!392421))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11980 (_1!11797 lt!392421))))))))

(assert (=> d!84302 d!84810))

(declare-fun d!84812 () Bool)

(assert (=> d!84812 (= (invariant!0 (currentBit!11980 (_1!11797 lt!392421)) (currentByte!11985 (_1!11797 lt!392421)) (size!6028 (buf!6530 (_1!11797 lt!392421)))) (and (bvsge (currentBit!11980 (_1!11797 lt!392421)) #b00000000000000000000000000000000) (bvslt (currentBit!11980 (_1!11797 lt!392421)) #b00000000000000000000000000001000) (bvsge (currentByte!11985 (_1!11797 lt!392421)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11985 (_1!11797 lt!392421)) (size!6028 (buf!6530 (_1!11797 lt!392421)))) (and (= (currentBit!11980 (_1!11797 lt!392421)) #b00000000000000000000000000000000) (= (currentByte!11985 (_1!11797 lt!392421)) (size!6028 (buf!6530 (_1!11797 lt!392421))))))))))

(assert (=> d!84302 d!84812))

(declare-fun d!84814 () Bool)

(assert (=> d!84814 (= (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 thiss!1005))) ((_ sign_extend 32) (currentByte!11985 thiss!1005)) ((_ sign_extend 32) (currentBit!11980 thiss!1005))) (bvsub (bvmul ((_ sign_extend 32) (size!6028 (buf!6530 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11985 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11980 thiss!1005)))))))

(assert (=> d!84286 d!84814))

(declare-fun d!84816 () Bool)

(assert (=> d!84816 (= (invariant!0 (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005) (size!6028 (buf!6530 thiss!1005))) (and (bvsge (currentBit!11980 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11980 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11985 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11985 thiss!1005) (size!6028 (buf!6530 thiss!1005))) (and (= (currentBit!11980 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11985 thiss!1005) (size!6028 (buf!6530 thiss!1005)))))))))

(assert (=> d!84286 d!84816))

(declare-fun d!84818 () Bool)

(declare-fun lt!393683 () tuple2!21756)

(assert (=> d!84818 (= lt!393683 (readBit!0 (readerFrom!0 (_2!11798 lt!392692) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005))))))

(assert (=> d!84818 (= (readBitPure!0 (readerFrom!0 (_2!11798 lt!392692) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005))) (tuple2!21739 (_2!11806 lt!393683) (_1!11806 lt!393683)))))

(declare-fun bs!21460 () Bool)

(assert (= bs!21460 d!84818))

(assert (=> bs!21460 m!380491))

(declare-fun m!381589 () Bool)

(assert (=> bs!21460 m!381589))

(assert (=> b!252845 d!84818))

(declare-fun d!84820 () Bool)

(declare-fun e!175624 () Bool)

(assert (=> d!84820 e!175624))

(declare-fun res!212384 () Bool)

(assert (=> d!84820 (=> (not res!212384) (not e!175624))))

(assert (=> d!84820 (= res!212384 (invariant!0 (currentBit!11980 (_2!11798 lt!392692)) (currentByte!11985 (_2!11798 lt!392692)) (size!6028 (buf!6530 (_2!11798 lt!392692)))))))

(assert (=> d!84820 (= (readerFrom!0 (_2!11798 lt!392692) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005)) (BitStream!10979 (buf!6530 (_2!11798 lt!392692)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)))))

(declare-fun b!253466 () Bool)

(assert (=> b!253466 (= e!175624 (invariant!0 (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005) (size!6028 (buf!6530 (_2!11798 lt!392692)))))))

(assert (= (and d!84820 res!212384) b!253466))

(declare-fun m!381591 () Bool)

(assert (=> d!84820 m!381591))

(declare-fun m!381593 () Bool)

(assert (=> b!253466 m!381593))

(assert (=> b!252845 d!84820))

(declare-fun call!3983 () Bool)

(declare-fun lt!393692 () (_ BitVec 32))

(declare-datatypes ((tuple4!300 0))(
  ( (tuple4!301 (_1!11811 (_ BitVec 32)) (_2!11811 (_ BitVec 32)) (_3!930 (_ BitVec 32)) (_4!150 (_ BitVec 32))) )
))
(declare-fun lt!393691 () tuple4!300)

(declare-fun lt!393690 () (_ BitVec 32))

(declare-fun bm!3980 () Bool)

(declare-fun c!11677 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3980 (= call!3983 (byteRangesEq!0 (select (arr!7015 (buf!6530 thiss!1005)) (_3!930 lt!393691)) (select (arr!7015 (buf!6530 (_2!11798 lt!392415))) (_3!930 lt!393691)) lt!393692 (ite c!11677 lt!393690 #b00000000000000000000000000001000)))))

(declare-fun b!253481 () Bool)

(declare-fun res!212396 () Bool)

(assert (=> b!253481 (= res!212396 (= lt!393690 #b00000000000000000000000000000000))))

(declare-fun e!175641 () Bool)

(assert (=> b!253481 (=> res!212396 e!175641)))

(declare-fun e!175642 () Bool)

(assert (=> b!253481 (= e!175642 e!175641)))

(declare-fun d!84822 () Bool)

(declare-fun res!212397 () Bool)

(declare-fun e!175637 () Bool)

(assert (=> d!84822 (=> res!212397 e!175637)))

(assert (=> d!84822 (= res!212397 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6028 (buf!6530 thiss!1005)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005))))))

(assert (=> d!84822 (= (arrayBitRangesEq!0 (buf!6530 thiss!1005) (buf!6530 (_2!11798 lt!392415)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6028 (buf!6530 thiss!1005)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005))) e!175637)))

(declare-fun b!253482 () Bool)

(declare-fun e!175638 () Bool)

(assert (=> b!253482 (= e!175637 e!175638)))

(declare-fun res!212395 () Bool)

(assert (=> b!253482 (=> (not res!212395) (not e!175638))))

(declare-fun e!175640 () Bool)

(assert (=> b!253482 (= res!212395 e!175640)))

(declare-fun res!212399 () Bool)

(assert (=> b!253482 (=> res!212399 e!175640)))

(assert (=> b!253482 (= res!212399 (bvsge (_1!11811 lt!393691) (_2!11811 lt!393691)))))

(assert (=> b!253482 (= lt!393690 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6028 (buf!6530 thiss!1005)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253482 (= lt!393692 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!300)

(assert (=> b!253482 (= lt!393691 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6028 (buf!6530 thiss!1005)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005))))))

(declare-fun b!253483 () Bool)

(declare-fun e!175639 () Bool)

(assert (=> b!253483 (= e!175638 e!175639)))

(assert (=> b!253483 (= c!11677 (= (_3!930 lt!393691) (_4!150 lt!393691)))))

(declare-fun b!253484 () Bool)

(declare-fun arrayRangesEq!927 (array!13738 array!13738 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!253484 (= e!175640 (arrayRangesEq!927 (buf!6530 thiss!1005) (buf!6530 (_2!11798 lt!392415)) (_1!11811 lt!393691) (_2!11811 lt!393691)))))

(declare-fun b!253485 () Bool)

(assert (=> b!253485 (= e!175639 call!3983)))

(declare-fun b!253486 () Bool)

(assert (=> b!253486 (= e!175641 (byteRangesEq!0 (select (arr!7015 (buf!6530 thiss!1005)) (_4!150 lt!393691)) (select (arr!7015 (buf!6530 (_2!11798 lt!392415))) (_4!150 lt!393691)) #b00000000000000000000000000000000 lt!393690))))

(declare-fun b!253487 () Bool)

(assert (=> b!253487 (= e!175639 e!175642)))

(declare-fun res!212398 () Bool)

(assert (=> b!253487 (= res!212398 call!3983)))

(assert (=> b!253487 (=> (not res!212398) (not e!175642))))

(assert (= (and d!84822 (not res!212397)) b!253482))

(assert (= (and b!253482 (not res!212399)) b!253484))

(assert (= (and b!253482 res!212395) b!253483))

(assert (= (and b!253483 c!11677) b!253485))

(assert (= (and b!253483 (not c!11677)) b!253487))

(assert (= (and b!253487 res!212398) b!253481))

(assert (= (and b!253481 (not res!212396)) b!253486))

(assert (= (or b!253485 b!253487) bm!3980))

(declare-fun m!381595 () Bool)

(assert (=> bm!3980 m!381595))

(declare-fun m!381597 () Bool)

(assert (=> bm!3980 m!381597))

(assert (=> bm!3980 m!381595))

(assert (=> bm!3980 m!381597))

(declare-fun m!381599 () Bool)

(assert (=> bm!3980 m!381599))

(assert (=> b!253482 m!380217))

(declare-fun m!381601 () Bool)

(assert (=> b!253482 m!381601))

(declare-fun m!381603 () Bool)

(assert (=> b!253484 m!381603))

(declare-fun m!381605 () Bool)

(assert (=> b!253486 m!381605))

(declare-fun m!381607 () Bool)

(assert (=> b!253486 m!381607))

(assert (=> b!253486 m!381605))

(assert (=> b!253486 m!381607))

(declare-fun m!381609 () Bool)

(assert (=> b!253486 m!381609))

(assert (=> b!252824 d!84822))

(assert (=> b!252824 d!84286))

(declare-fun d!84824 () Bool)

(declare-fun res!212401 () Bool)

(declare-fun e!175644 () Bool)

(assert (=> d!84824 (=> (not res!212401) (not e!175644))))

(assert (=> d!84824 (= res!212401 (= (size!6028 (buf!6530 (_2!11799 lt!392647))) (size!6028 (buf!6530 (_2!11798 lt!392425)))))))

(assert (=> d!84824 (= (isPrefixOf!0 (_2!11799 lt!392647) (_2!11798 lt!392425)) e!175644)))

(declare-fun b!253488 () Bool)

(declare-fun res!212400 () Bool)

(assert (=> b!253488 (=> (not res!212400) (not e!175644))))

(assert (=> b!253488 (= res!212400 (bvsle (bitIndex!0 (size!6028 (buf!6530 (_2!11799 lt!392647))) (currentByte!11985 (_2!11799 lt!392647)) (currentBit!11980 (_2!11799 lt!392647))) (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392425))) (currentByte!11985 (_2!11798 lt!392425)) (currentBit!11980 (_2!11798 lt!392425)))))))

(declare-fun b!253489 () Bool)

(declare-fun e!175643 () Bool)

(assert (=> b!253489 (= e!175644 e!175643)))

(declare-fun res!212402 () Bool)

(assert (=> b!253489 (=> res!212402 e!175643)))

(assert (=> b!253489 (= res!212402 (= (size!6028 (buf!6530 (_2!11799 lt!392647))) #b00000000000000000000000000000000))))

(declare-fun b!253490 () Bool)

(assert (=> b!253490 (= e!175643 (arrayBitRangesEq!0 (buf!6530 (_2!11799 lt!392647)) (buf!6530 (_2!11798 lt!392425)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6028 (buf!6530 (_2!11799 lt!392647))) (currentByte!11985 (_2!11799 lt!392647)) (currentBit!11980 (_2!11799 lt!392647)))))))

(assert (= (and d!84824 res!212401) b!253488))

(assert (= (and b!253488 res!212400) b!253489))

(assert (= (and b!253489 (not res!212402)) b!253490))

(declare-fun m!381611 () Bool)

(assert (=> b!253488 m!381611))

(assert (=> b!253488 m!380193))

(assert (=> b!253490 m!381611))

(assert (=> b!253490 m!381611))

(declare-fun m!381613 () Bool)

(assert (=> b!253490 m!381613))

(assert (=> b!252819 d!84824))

(assert (=> b!252822 d!84286))

(assert (=> b!252822 d!84284))

(assert (=> d!84266 d!84814))

(assert (=> b!252831 d!84286))

(assert (=> b!252831 d!84338))

(declare-fun d!84826 () Bool)

(declare-fun e!175651 () Bool)

(assert (=> d!84826 e!175651))

(declare-fun res!212405 () Bool)

(assert (=> d!84826 (=> (not res!212405) (not e!175651))))

(declare-fun increaseBitIndex!0 (BitStream!10978) tuple2!21740)

(assert (=> d!84826 (= res!212405 (= (buf!6530 (_2!11798 (increaseBitIndex!0 (_1!11799 lt!392423)))) (buf!6530 (_1!11799 lt!392423))))))

(declare-fun lt!393709 () Bool)

(assert (=> d!84826 (= lt!393709 (not (= (bvand ((_ sign_extend 24) (select (arr!7015 (buf!6530 (_1!11799 lt!392423))) (currentByte!11985 (_1!11799 lt!392423)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11980 (_1!11799 lt!392423))))) #b00000000000000000000000000000000)))))

(declare-fun lt!393708 () tuple2!21756)

(assert (=> d!84826 (= lt!393708 (tuple2!21757 (not (= (bvand ((_ sign_extend 24) (select (arr!7015 (buf!6530 (_1!11799 lt!392423))) (currentByte!11985 (_1!11799 lt!392423)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11980 (_1!11799 lt!392423))))) #b00000000000000000000000000000000)) (_2!11798 (increaseBitIndex!0 (_1!11799 lt!392423)))))))

(assert (=> d!84826 (validate_offset_bit!0 ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11799 lt!392423)))) ((_ sign_extend 32) (currentByte!11985 (_1!11799 lt!392423))) ((_ sign_extend 32) (currentBit!11980 (_1!11799 lt!392423))))))

(assert (=> d!84826 (= (readBit!0 (_1!11799 lt!392423)) lt!393708)))

(declare-fun lt!393711 () (_ BitVec 64))

(declare-fun lt!393713 () (_ BitVec 64))

(declare-fun b!253493 () Bool)

(assert (=> b!253493 (= e!175651 (= (bitIndex!0 (size!6028 (buf!6530 (_2!11798 (increaseBitIndex!0 (_1!11799 lt!392423))))) (currentByte!11985 (_2!11798 (increaseBitIndex!0 (_1!11799 lt!392423)))) (currentBit!11980 (_2!11798 (increaseBitIndex!0 (_1!11799 lt!392423))))) (bvadd lt!393713 lt!393711)))))

(assert (=> b!253493 (or (not (= (bvand lt!393713 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393711 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393713 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393713 lt!393711) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253493 (= lt!393711 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!253493 (= lt!393713 (bitIndex!0 (size!6028 (buf!6530 (_1!11799 lt!392423))) (currentByte!11985 (_1!11799 lt!392423)) (currentBit!11980 (_1!11799 lt!392423))))))

(declare-fun lt!393707 () Bool)

(assert (=> b!253493 (= lt!393707 (not (= (bvand ((_ sign_extend 24) (select (arr!7015 (buf!6530 (_1!11799 lt!392423))) (currentByte!11985 (_1!11799 lt!392423)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11980 (_1!11799 lt!392423))))) #b00000000000000000000000000000000)))))

(declare-fun lt!393712 () Bool)

(assert (=> b!253493 (= lt!393712 (not (= (bvand ((_ sign_extend 24) (select (arr!7015 (buf!6530 (_1!11799 lt!392423))) (currentByte!11985 (_1!11799 lt!392423)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11980 (_1!11799 lt!392423))))) #b00000000000000000000000000000000)))))

(declare-fun lt!393710 () Bool)

(assert (=> b!253493 (= lt!393710 (not (= (bvand ((_ sign_extend 24) (select (arr!7015 (buf!6530 (_1!11799 lt!392423))) (currentByte!11985 (_1!11799 lt!392423)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11980 (_1!11799 lt!392423))))) #b00000000000000000000000000000000)))))

(assert (= (and d!84826 res!212405) b!253493))

(declare-fun m!381615 () Bool)

(assert (=> d!84826 m!381615))

(declare-fun m!381617 () Bool)

(assert (=> d!84826 m!381617))

(declare-fun m!381619 () Bool)

(assert (=> d!84826 m!381619))

(declare-fun m!381621 () Bool)

(assert (=> d!84826 m!381621))

(declare-fun m!381623 () Bool)

(assert (=> b!253493 m!381623))

(assert (=> b!253493 m!381619))

(assert (=> b!253493 m!381617))

(assert (=> b!253493 m!381615))

(assert (=> b!253493 m!380411))

(assert (=> d!84336 d!84826))

(assert (=> b!252791 d!84254))

(declare-fun d!84828 () Bool)

(assert (=> d!84828 (validate_offset_bits!1 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392415)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!84828 true))

(declare-fun _$1!333 () Unit!18204)

(assert (=> d!84828 (= (choose!27 thiss!1005 (_2!11798 lt!392415) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) _$1!333)))

(declare-fun bs!21461 () Bool)

(assert (= bs!21461 d!84828))

(assert (=> bs!21461 m!380507))

(assert (=> d!84308 d!84828))

(assert (=> b!252821 d!84284))

(declare-fun d!84830 () Bool)

(assert (=> d!84830 (arrayBitRangesEq!0 (buf!6530 (_2!11798 lt!392425)) (buf!6530 (_2!11798 lt!392415)) lt!392646 lt!392659)))

(declare-fun lt!393716 () Unit!18204)

(declare-fun choose!8 (array!13738 array!13738 (_ BitVec 64) (_ BitVec 64)) Unit!18204)

(assert (=> d!84830 (= lt!393716 (choose!8 (buf!6530 (_2!11798 lt!392415)) (buf!6530 (_2!11798 lt!392425)) lt!392646 lt!392659))))

(assert (=> d!84830 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!392646) (bvsle lt!392646 lt!392659))))

(assert (=> d!84830 (= (arrayBitRangesEqSymmetric!0 (buf!6530 (_2!11798 lt!392415)) (buf!6530 (_2!11798 lt!392425)) lt!392646 lt!392659) lt!393716)))

(declare-fun bs!21462 () Bool)

(assert (= bs!21462 d!84830))

(assert (=> bs!21462 m!380463))

(declare-fun m!381625 () Bool)

(assert (=> bs!21462 m!381625))

(assert (=> b!252821 d!84830))

(declare-fun lt!393717 () (_ BitVec 32))

(declare-fun call!3984 () Bool)

(declare-fun lt!393718 () tuple4!300)

(declare-fun c!11678 () Bool)

(declare-fun bm!3981 () Bool)

(declare-fun lt!393719 () (_ BitVec 32))

(assert (=> bm!3981 (= call!3984 (byteRangesEq!0 (select (arr!7015 (buf!6530 (_2!11798 lt!392425))) (_3!930 lt!393718)) (select (arr!7015 (buf!6530 (_2!11798 lt!392415))) (_3!930 lt!393718)) lt!393719 (ite c!11678 lt!393717 #b00000000000000000000000000001000)))))

(declare-fun b!253494 () Bool)

(declare-fun res!212407 () Bool)

(assert (=> b!253494 (= res!212407 (= lt!393717 #b00000000000000000000000000000000))))

(declare-fun e!175656 () Bool)

(assert (=> b!253494 (=> res!212407 e!175656)))

(declare-fun e!175657 () Bool)

(assert (=> b!253494 (= e!175657 e!175656)))

(declare-fun d!84832 () Bool)

(declare-fun res!212408 () Bool)

(declare-fun e!175652 () Bool)

(assert (=> d!84832 (=> res!212408 e!175652)))

(assert (=> d!84832 (= res!212408 (bvsge lt!392646 lt!392659))))

(assert (=> d!84832 (= (arrayBitRangesEq!0 (buf!6530 (_2!11798 lt!392425)) (buf!6530 (_2!11798 lt!392415)) lt!392646 lt!392659) e!175652)))

(declare-fun b!253495 () Bool)

(declare-fun e!175653 () Bool)

(assert (=> b!253495 (= e!175652 e!175653)))

(declare-fun res!212406 () Bool)

(assert (=> b!253495 (=> (not res!212406) (not e!175653))))

(declare-fun e!175655 () Bool)

(assert (=> b!253495 (= res!212406 e!175655)))

(declare-fun res!212410 () Bool)

(assert (=> b!253495 (=> res!212410 e!175655)))

(assert (=> b!253495 (= res!212410 (bvsge (_1!11811 lt!393718) (_2!11811 lt!393718)))))

(assert (=> b!253495 (= lt!393717 ((_ extract 31 0) (bvsrem lt!392659 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253495 (= lt!393719 ((_ extract 31 0) (bvsrem lt!392646 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253495 (= lt!393718 (arrayBitIndices!0 lt!392646 lt!392659))))

(declare-fun b!253496 () Bool)

(declare-fun e!175654 () Bool)

(assert (=> b!253496 (= e!175653 e!175654)))

(assert (=> b!253496 (= c!11678 (= (_3!930 lt!393718) (_4!150 lt!393718)))))

(declare-fun b!253497 () Bool)

(assert (=> b!253497 (= e!175655 (arrayRangesEq!927 (buf!6530 (_2!11798 lt!392425)) (buf!6530 (_2!11798 lt!392415)) (_1!11811 lt!393718) (_2!11811 lt!393718)))))

(declare-fun b!253498 () Bool)

(assert (=> b!253498 (= e!175654 call!3984)))

(declare-fun b!253499 () Bool)

(assert (=> b!253499 (= e!175656 (byteRangesEq!0 (select (arr!7015 (buf!6530 (_2!11798 lt!392425))) (_4!150 lt!393718)) (select (arr!7015 (buf!6530 (_2!11798 lt!392415))) (_4!150 lt!393718)) #b00000000000000000000000000000000 lt!393717))))

(declare-fun b!253500 () Bool)

(assert (=> b!253500 (= e!175654 e!175657)))

(declare-fun res!212409 () Bool)

(assert (=> b!253500 (= res!212409 call!3984)))

(assert (=> b!253500 (=> (not res!212409) (not e!175657))))

(assert (= (and d!84832 (not res!212408)) b!253495))

(assert (= (and b!253495 (not res!212410)) b!253497))

(assert (= (and b!253495 res!212406) b!253496))

(assert (= (and b!253496 c!11678) b!253498))

(assert (= (and b!253496 (not c!11678)) b!253500))

(assert (= (and b!253500 res!212409) b!253494))

(assert (= (and b!253494 (not res!212407)) b!253499))

(assert (= (or b!253498 b!253500) bm!3981))

(declare-fun m!381627 () Bool)

(assert (=> bm!3981 m!381627))

(declare-fun m!381629 () Bool)

(assert (=> bm!3981 m!381629))

(assert (=> bm!3981 m!381627))

(assert (=> bm!3981 m!381629))

(declare-fun m!381631 () Bool)

(assert (=> bm!3981 m!381631))

(declare-fun m!381633 () Bool)

(assert (=> b!253495 m!381633))

(declare-fun m!381635 () Bool)

(assert (=> b!253497 m!381635))

(declare-fun m!381637 () Bool)

(assert (=> b!253499 m!381637))

(declare-fun m!381639 () Bool)

(assert (=> b!253499 m!381639))

(assert (=> b!253499 m!381637))

(assert (=> b!253499 m!381639))

(declare-fun m!381641 () Bool)

(assert (=> b!253499 m!381641))

(assert (=> b!252821 d!84832))

(declare-fun lt!393720 () (_ BitVec 32))

(declare-fun lt!393721 () tuple4!300)

(declare-fun bm!3982 () Bool)

(declare-fun c!11679 () Bool)

(declare-fun call!3985 () Bool)

(declare-fun lt!393722 () (_ BitVec 32))

(assert (=> bm!3982 (= call!3985 (byteRangesEq!0 (select (arr!7015 (buf!6530 thiss!1005)) (_3!930 lt!393721)) (select (arr!7015 (buf!6530 (_2!11798 lt!392425))) (_3!930 lt!393721)) lt!393722 (ite c!11679 lt!393720 #b00000000000000000000000000001000)))))

(declare-fun b!253501 () Bool)

(declare-fun res!212412 () Bool)

(assert (=> b!253501 (= res!212412 (= lt!393720 #b00000000000000000000000000000000))))

(declare-fun e!175662 () Bool)

(assert (=> b!253501 (=> res!212412 e!175662)))

(declare-fun e!175663 () Bool)

(assert (=> b!253501 (= e!175663 e!175662)))

(declare-fun d!84834 () Bool)

(declare-fun res!212413 () Bool)

(declare-fun e!175658 () Bool)

(assert (=> d!84834 (=> res!212413 e!175658)))

(assert (=> d!84834 (= res!212413 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6028 (buf!6530 thiss!1005)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005))))))

(assert (=> d!84834 (= (arrayBitRangesEq!0 (buf!6530 thiss!1005) (buf!6530 (_2!11798 lt!392425)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6028 (buf!6530 thiss!1005)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005))) e!175658)))

(declare-fun b!253502 () Bool)

(declare-fun e!175659 () Bool)

(assert (=> b!253502 (= e!175658 e!175659)))

(declare-fun res!212411 () Bool)

(assert (=> b!253502 (=> (not res!212411) (not e!175659))))

(declare-fun e!175661 () Bool)

(assert (=> b!253502 (= res!212411 e!175661)))

(declare-fun res!212415 () Bool)

(assert (=> b!253502 (=> res!212415 e!175661)))

(assert (=> b!253502 (= res!212415 (bvsge (_1!11811 lt!393721) (_2!11811 lt!393721)))))

(assert (=> b!253502 (= lt!393720 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6028 (buf!6530 thiss!1005)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253502 (= lt!393722 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253502 (= lt!393721 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6028 (buf!6530 thiss!1005)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005))))))

(declare-fun b!253503 () Bool)

(declare-fun e!175660 () Bool)

(assert (=> b!253503 (= e!175659 e!175660)))

(assert (=> b!253503 (= c!11679 (= (_3!930 lt!393721) (_4!150 lt!393721)))))

(declare-fun b!253504 () Bool)

(assert (=> b!253504 (= e!175661 (arrayRangesEq!927 (buf!6530 thiss!1005) (buf!6530 (_2!11798 lt!392425)) (_1!11811 lt!393721) (_2!11811 lt!393721)))))

(declare-fun b!253505 () Bool)

(assert (=> b!253505 (= e!175660 call!3985)))

(declare-fun b!253506 () Bool)

(assert (=> b!253506 (= e!175662 (byteRangesEq!0 (select (arr!7015 (buf!6530 thiss!1005)) (_4!150 lt!393721)) (select (arr!7015 (buf!6530 (_2!11798 lt!392425))) (_4!150 lt!393721)) #b00000000000000000000000000000000 lt!393720))))

(declare-fun b!253507 () Bool)

(assert (=> b!253507 (= e!175660 e!175663)))

(declare-fun res!212414 () Bool)

(assert (=> b!253507 (= res!212414 call!3985)))

(assert (=> b!253507 (=> (not res!212414) (not e!175663))))

(assert (= (and d!84834 (not res!212413)) b!253502))

(assert (= (and b!253502 (not res!212415)) b!253504))

(assert (= (and b!253502 res!212411) b!253503))

(assert (= (and b!253503 c!11679) b!253505))

(assert (= (and b!253503 (not c!11679)) b!253507))

(assert (= (and b!253507 res!212414) b!253501))

(assert (= (and b!253501 (not res!212412)) b!253506))

(assert (= (or b!253505 b!253507) bm!3982))

(declare-fun m!381643 () Bool)

(assert (=> bm!3982 m!381643))

(declare-fun m!381645 () Bool)

(assert (=> bm!3982 m!381645))

(assert (=> bm!3982 m!381643))

(assert (=> bm!3982 m!381645))

(declare-fun m!381647 () Bool)

(assert (=> bm!3982 m!381647))

(assert (=> b!253502 m!380217))

(assert (=> b!253502 m!381601))

(declare-fun m!381649 () Bool)

(assert (=> b!253504 m!381649))

(declare-fun m!381651 () Bool)

(assert (=> b!253506 m!381651))

(declare-fun m!381653 () Bool)

(assert (=> b!253506 m!381653))

(assert (=> b!253506 m!381651))

(assert (=> b!253506 m!381653))

(declare-fun m!381655 () Bool)

(assert (=> b!253506 m!381655))

(assert (=> b!252833 d!84834))

(assert (=> b!252833 d!84286))

(declare-fun d!84836 () Bool)

(assert (=> d!84836 (= (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392415)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415)))) (bvsub (bvmul ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392415)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415))))))))

(assert (=> d!84284 d!84836))

(declare-fun d!84838 () Bool)

(assert (=> d!84838 (= (invariant!0 (currentBit!11980 (_2!11798 lt!392415)) (currentByte!11985 (_2!11798 lt!392415)) (size!6028 (buf!6530 (_2!11798 lt!392415)))) (and (bvsge (currentBit!11980 (_2!11798 lt!392415)) #b00000000000000000000000000000000) (bvslt (currentBit!11980 (_2!11798 lt!392415)) #b00000000000000000000000000001000) (bvsge (currentByte!11985 (_2!11798 lt!392415)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11985 (_2!11798 lt!392415)) (size!6028 (buf!6530 (_2!11798 lt!392415)))) (and (= (currentBit!11980 (_2!11798 lt!392415)) #b00000000000000000000000000000000) (= (currentByte!11985 (_2!11798 lt!392415)) (size!6028 (buf!6530 (_2!11798 lt!392415))))))))))

(assert (=> d!84284 d!84838))

(assert (=> d!84262 d!84816))

(declare-fun d!84840 () Bool)

(declare-fun res!212417 () Bool)

(declare-fun e!175665 () Bool)

(assert (=> d!84840 (=> (not res!212417) (not e!175665))))

(assert (=> d!84840 (= res!212417 (= (size!6028 (buf!6530 (_2!11798 lt!392415))) (size!6028 (buf!6530 (_2!11798 lt!392756)))))))

(assert (=> d!84840 (= (isPrefixOf!0 (_2!11798 lt!392415) (_2!11798 lt!392756)) e!175665)))

(declare-fun b!253508 () Bool)

(declare-fun res!212416 () Bool)

(assert (=> b!253508 (=> (not res!212416) (not e!175665))))

(assert (=> b!253508 (= res!212416 (bvsle (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392415))) (currentByte!11985 (_2!11798 lt!392415)) (currentBit!11980 (_2!11798 lt!392415))) (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392756))) (currentByte!11985 (_2!11798 lt!392756)) (currentBit!11980 (_2!11798 lt!392756)))))))

(declare-fun b!253509 () Bool)

(declare-fun e!175664 () Bool)

(assert (=> b!253509 (= e!175665 e!175664)))

(declare-fun res!212418 () Bool)

(assert (=> b!253509 (=> res!212418 e!175664)))

(assert (=> b!253509 (= res!212418 (= (size!6028 (buf!6530 (_2!11798 lt!392415))) #b00000000000000000000000000000000))))

(declare-fun b!253510 () Bool)

(assert (=> b!253510 (= e!175664 (arrayBitRangesEq!0 (buf!6530 (_2!11798 lt!392415)) (buf!6530 (_2!11798 lt!392756)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392415))) (currentByte!11985 (_2!11798 lt!392415)) (currentBit!11980 (_2!11798 lt!392415)))))))

(assert (= (and d!84840 res!212417) b!253508))

(assert (= (and b!253508 res!212416) b!253509))

(assert (= (and b!253509 (not res!212418)) b!253510))

(assert (=> b!253508 m!380195))

(assert (=> b!253508 m!380557))

(assert (=> b!253510 m!380195))

(assert (=> b!253510 m!380195))

(declare-fun m!381657 () Bool)

(assert (=> b!253510 m!381657))

(assert (=> b!252866 d!84840))

(declare-fun d!84842 () Bool)

(assert (=> d!84842 (isPrefixOf!0 lt!392651 (_2!11798 lt!392425))))

(declare-fun lt!393723 () Unit!18204)

(assert (=> d!84842 (= lt!393723 (choose!30 lt!392651 (_2!11798 lt!392415) (_2!11798 lt!392425)))))

(assert (=> d!84842 (isPrefixOf!0 lt!392651 (_2!11798 lt!392415))))

(assert (=> d!84842 (= (lemmaIsPrefixTransitive!0 lt!392651 (_2!11798 lt!392415) (_2!11798 lt!392425)) lt!393723)))

(declare-fun bs!21463 () Bool)

(assert (= bs!21463 d!84842))

(assert (=> bs!21463 m!380439))

(declare-fun m!381659 () Bool)

(assert (=> bs!21463 m!381659))

(declare-fun m!381661 () Bool)

(assert (=> bs!21463 m!381661))

(assert (=> d!84278 d!84842))

(declare-fun d!84844 () Bool)

(assert (=> d!84844 (isPrefixOf!0 (_2!11798 lt!392425) (_2!11798 lt!392425))))

(declare-fun lt!393726 () Unit!18204)

(declare-fun choose!11 (BitStream!10978) Unit!18204)

(assert (=> d!84844 (= lt!393726 (choose!11 (_2!11798 lt!392425)))))

(assert (=> d!84844 (= (lemmaIsPrefixRefl!0 (_2!11798 lt!392425)) lt!393726)))

(declare-fun bs!21465 () Bool)

(assert (= bs!21465 d!84844))

(assert (=> bs!21465 m!380443))

(declare-fun m!381663 () Bool)

(assert (=> bs!21465 m!381663))

(assert (=> d!84278 d!84844))

(declare-fun d!84846 () Bool)

(declare-fun res!212420 () Bool)

(declare-fun e!175667 () Bool)

(assert (=> d!84846 (=> (not res!212420) (not e!175667))))

(assert (=> d!84846 (= res!212420 (= (size!6028 (buf!6530 lt!392651)) (size!6028 (buf!6530 (_2!11798 lt!392425)))))))

(assert (=> d!84846 (= (isPrefixOf!0 lt!392651 (_2!11798 lt!392425)) e!175667)))

(declare-fun b!253511 () Bool)

(declare-fun res!212419 () Bool)

(assert (=> b!253511 (=> (not res!212419) (not e!175667))))

(assert (=> b!253511 (= res!212419 (bvsle (bitIndex!0 (size!6028 (buf!6530 lt!392651)) (currentByte!11985 lt!392651) (currentBit!11980 lt!392651)) (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392425))) (currentByte!11985 (_2!11798 lt!392425)) (currentBit!11980 (_2!11798 lt!392425)))))))

(declare-fun b!253512 () Bool)

(declare-fun e!175666 () Bool)

(assert (=> b!253512 (= e!175667 e!175666)))

(declare-fun res!212421 () Bool)

(assert (=> b!253512 (=> res!212421 e!175666)))

(assert (=> b!253512 (= res!212421 (= (size!6028 (buf!6530 lt!392651)) #b00000000000000000000000000000000))))

(declare-fun b!253513 () Bool)

(assert (=> b!253513 (= e!175666 (arrayBitRangesEq!0 (buf!6530 lt!392651) (buf!6530 (_2!11798 lt!392425)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6028 (buf!6530 lt!392651)) (currentByte!11985 lt!392651) (currentBit!11980 lt!392651))))))

(assert (= (and d!84846 res!212420) b!253511))

(assert (= (and b!253511 res!212419) b!253512))

(assert (= (and b!253512 (not res!212421)) b!253513))

(declare-fun m!381665 () Bool)

(assert (=> b!253511 m!381665))

(assert (=> b!253511 m!380193))

(assert (=> b!253513 m!381665))

(assert (=> b!253513 m!381665))

(declare-fun m!381667 () Bool)

(assert (=> b!253513 m!381667))

(assert (=> d!84278 d!84846))

(declare-fun d!84848 () Bool)

(declare-fun res!212423 () Bool)

(declare-fun e!175669 () Bool)

(assert (=> d!84848 (=> (not res!212423) (not e!175669))))

(assert (=> d!84848 (= res!212423 (= (size!6028 (buf!6530 (_2!11798 lt!392415))) (size!6028 (buf!6530 (_2!11798 lt!392415)))))))

(assert (=> d!84848 (= (isPrefixOf!0 (_2!11798 lt!392415) (_2!11798 lt!392415)) e!175669)))

(declare-fun b!253514 () Bool)

(declare-fun res!212422 () Bool)

(assert (=> b!253514 (=> (not res!212422) (not e!175669))))

(assert (=> b!253514 (= res!212422 (bvsle (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392415))) (currentByte!11985 (_2!11798 lt!392415)) (currentBit!11980 (_2!11798 lt!392415))) (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392415))) (currentByte!11985 (_2!11798 lt!392415)) (currentBit!11980 (_2!11798 lt!392415)))))))

(declare-fun b!253515 () Bool)

(declare-fun e!175668 () Bool)

(assert (=> b!253515 (= e!175669 e!175668)))

(declare-fun res!212424 () Bool)

(assert (=> b!253515 (=> res!212424 e!175668)))

(assert (=> b!253515 (= res!212424 (= (size!6028 (buf!6530 (_2!11798 lt!392415))) #b00000000000000000000000000000000))))

(declare-fun b!253516 () Bool)

(assert (=> b!253516 (= e!175668 (arrayBitRangesEq!0 (buf!6530 (_2!11798 lt!392415)) (buf!6530 (_2!11798 lt!392415)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392415))) (currentByte!11985 (_2!11798 lt!392415)) (currentBit!11980 (_2!11798 lt!392415)))))))

(assert (= (and d!84848 res!212423) b!253514))

(assert (= (and b!253514 res!212422) b!253515))

(assert (= (and b!253515 (not res!212424)) b!253516))

(assert (=> b!253514 m!380195))

(assert (=> b!253514 m!380195))

(assert (=> b!253516 m!380195))

(assert (=> b!253516 m!380195))

(declare-fun m!381669 () Bool)

(assert (=> b!253516 m!381669))

(assert (=> d!84278 d!84848))

(declare-fun d!84850 () Bool)

(declare-fun res!212426 () Bool)

(declare-fun e!175671 () Bool)

(assert (=> d!84850 (=> (not res!212426) (not e!175671))))

(assert (=> d!84850 (= res!212426 (= (size!6028 (buf!6530 (_2!11798 lt!392425))) (size!6028 (buf!6530 (_2!11798 lt!392425)))))))

(assert (=> d!84850 (= (isPrefixOf!0 (_2!11798 lt!392425) (_2!11798 lt!392425)) e!175671)))

(declare-fun b!253517 () Bool)

(declare-fun res!212425 () Bool)

(assert (=> b!253517 (=> (not res!212425) (not e!175671))))

(assert (=> b!253517 (= res!212425 (bvsle (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392425))) (currentByte!11985 (_2!11798 lt!392425)) (currentBit!11980 (_2!11798 lt!392425))) (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392425))) (currentByte!11985 (_2!11798 lt!392425)) (currentBit!11980 (_2!11798 lt!392425)))))))

(declare-fun b!253518 () Bool)

(declare-fun e!175670 () Bool)

(assert (=> b!253518 (= e!175671 e!175670)))

(declare-fun res!212427 () Bool)

(assert (=> b!253518 (=> res!212427 e!175670)))

(assert (=> b!253518 (= res!212427 (= (size!6028 (buf!6530 (_2!11798 lt!392425))) #b00000000000000000000000000000000))))

(declare-fun b!253519 () Bool)

(assert (=> b!253519 (= e!175670 (arrayBitRangesEq!0 (buf!6530 (_2!11798 lt!392425)) (buf!6530 (_2!11798 lt!392425)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392425))) (currentByte!11985 (_2!11798 lt!392425)) (currentBit!11980 (_2!11798 lt!392425)))))))

(assert (= (and d!84850 res!212426) b!253517))

(assert (= (and b!253517 res!212425) b!253518))

(assert (= (and b!253518 (not res!212427)) b!253519))

(assert (=> b!253517 m!380193))

(assert (=> b!253517 m!380193))

(assert (=> b!253519 m!380193))

(assert (=> b!253519 m!380193))

(declare-fun m!381671 () Bool)

(assert (=> b!253519 m!381671))

(assert (=> d!84278 d!84850))

(assert (=> d!84278 d!84268))

(declare-fun d!84852 () Bool)

(declare-fun res!212429 () Bool)

(declare-fun e!175673 () Bool)

(assert (=> d!84852 (=> (not res!212429) (not e!175673))))

(assert (=> d!84852 (= res!212429 (= (size!6028 (buf!6530 lt!392651)) (size!6028 (buf!6530 lt!392651))))))

(assert (=> d!84852 (= (isPrefixOf!0 lt!392651 lt!392651) e!175673)))

(declare-fun b!253520 () Bool)

(declare-fun res!212428 () Bool)

(assert (=> b!253520 (=> (not res!212428) (not e!175673))))

(assert (=> b!253520 (= res!212428 (bvsle (bitIndex!0 (size!6028 (buf!6530 lt!392651)) (currentByte!11985 lt!392651) (currentBit!11980 lt!392651)) (bitIndex!0 (size!6028 (buf!6530 lt!392651)) (currentByte!11985 lt!392651) (currentBit!11980 lt!392651))))))

(declare-fun b!253521 () Bool)

(declare-fun e!175672 () Bool)

(assert (=> b!253521 (= e!175673 e!175672)))

(declare-fun res!212430 () Bool)

(assert (=> b!253521 (=> res!212430 e!175672)))

(assert (=> b!253521 (= res!212430 (= (size!6028 (buf!6530 lt!392651)) #b00000000000000000000000000000000))))

(declare-fun b!253522 () Bool)

(assert (=> b!253522 (= e!175672 (arrayBitRangesEq!0 (buf!6530 lt!392651) (buf!6530 lt!392651) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6028 (buf!6530 lt!392651)) (currentByte!11985 lt!392651) (currentBit!11980 lt!392651))))))

(assert (= (and d!84852 res!212429) b!253520))

(assert (= (and b!253520 res!212428) b!253521))

(assert (= (and b!253521 (not res!212430)) b!253522))

(assert (=> b!253520 m!381665))

(assert (=> b!253520 m!381665))

(assert (=> b!253522 m!381665))

(assert (=> b!253522 m!381665))

(declare-fun m!381673 () Bool)

(assert (=> b!253522 m!381673))

(assert (=> d!84278 d!84852))

(declare-fun d!84854 () Bool)

(declare-fun res!212432 () Bool)

(declare-fun e!175675 () Bool)

(assert (=> d!84854 (=> (not res!212432) (not e!175675))))

(assert (=> d!84854 (= res!212432 (= (size!6028 (buf!6530 (_1!11799 lt!392647))) (size!6028 (buf!6530 (_2!11799 lt!392647)))))))

(assert (=> d!84854 (= (isPrefixOf!0 (_1!11799 lt!392647) (_2!11799 lt!392647)) e!175675)))

(declare-fun b!253523 () Bool)

(declare-fun res!212431 () Bool)

(assert (=> b!253523 (=> (not res!212431) (not e!175675))))

(assert (=> b!253523 (= res!212431 (bvsle (bitIndex!0 (size!6028 (buf!6530 (_1!11799 lt!392647))) (currentByte!11985 (_1!11799 lt!392647)) (currentBit!11980 (_1!11799 lt!392647))) (bitIndex!0 (size!6028 (buf!6530 (_2!11799 lt!392647))) (currentByte!11985 (_2!11799 lt!392647)) (currentBit!11980 (_2!11799 lt!392647)))))))

(declare-fun b!253524 () Bool)

(declare-fun e!175674 () Bool)

(assert (=> b!253524 (= e!175675 e!175674)))

(declare-fun res!212433 () Bool)

(assert (=> b!253524 (=> res!212433 e!175674)))

(assert (=> b!253524 (= res!212433 (= (size!6028 (buf!6530 (_1!11799 lt!392647))) #b00000000000000000000000000000000))))

(declare-fun b!253525 () Bool)

(assert (=> b!253525 (= e!175674 (arrayBitRangesEq!0 (buf!6530 (_1!11799 lt!392647)) (buf!6530 (_2!11799 lt!392647)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6028 (buf!6530 (_1!11799 lt!392647))) (currentByte!11985 (_1!11799 lt!392647)) (currentBit!11980 (_1!11799 lt!392647)))))))

(assert (= (and d!84854 res!212432) b!253523))

(assert (= (and b!253523 res!212431) b!253524))

(assert (= (and b!253524 (not res!212433)) b!253525))

(declare-fun m!381675 () Bool)

(assert (=> b!253523 m!381675))

(assert (=> b!253523 m!381611))

(assert (=> b!253525 m!381675))

(assert (=> b!253525 m!381675))

(declare-fun m!381677 () Bool)

(assert (=> b!253525 m!381677))

(assert (=> d!84278 d!84854))

(declare-fun d!84856 () Bool)

(assert (=> d!84856 (isPrefixOf!0 (_2!11798 lt!392415) (_2!11798 lt!392415))))

(declare-fun lt!393727 () Unit!18204)

(assert (=> d!84856 (= lt!393727 (choose!11 (_2!11798 lt!392415)))))

(assert (=> d!84856 (= (lemmaIsPrefixRefl!0 (_2!11798 lt!392415)) lt!393727)))

(declare-fun bs!21466 () Bool)

(assert (= bs!21466 d!84856))

(assert (=> bs!21466 m!380441))

(declare-fun m!381679 () Bool)

(assert (=> bs!21466 m!381679))

(assert (=> d!84278 d!84856))

(declare-fun d!84858 () Bool)

(assert (=> d!84858 (isPrefixOf!0 lt!392651 lt!392651)))

(declare-fun lt!393728 () Unit!18204)

(assert (=> d!84858 (= lt!393728 (choose!11 lt!392651))))

(assert (=> d!84858 (= (lemmaIsPrefixRefl!0 lt!392651) lt!393728)))

(declare-fun bs!21467 () Bool)

(assert (= bs!21467 d!84858))

(assert (=> bs!21467 m!380451))

(declare-fun m!381681 () Bool)

(assert (=> bs!21467 m!381681))

(assert (=> d!84278 d!84858))

(declare-fun d!84860 () Bool)

(assert (=> d!84860 (isPrefixOf!0 lt!392651 (_2!11798 lt!392425))))

(declare-fun lt!393729 () Unit!18204)

(assert (=> d!84860 (= lt!393729 (choose!30 lt!392651 (_2!11798 lt!392425) (_2!11798 lt!392425)))))

(assert (=> d!84860 (isPrefixOf!0 lt!392651 (_2!11798 lt!392425))))

(assert (=> d!84860 (= (lemmaIsPrefixTransitive!0 lt!392651 (_2!11798 lt!392425) (_2!11798 lt!392425)) lt!393729)))

(declare-fun bs!21468 () Bool)

(assert (= bs!21468 d!84860))

(assert (=> bs!21468 m!380439))

(declare-fun m!381683 () Bool)

(assert (=> bs!21468 m!381683))

(assert (=> bs!21468 m!380439))

(assert (=> d!84278 d!84860))

(declare-fun d!84862 () Bool)

(declare-fun res!212435 () Bool)

(declare-fun e!175677 () Bool)

(assert (=> d!84862 (=> (not res!212435) (not e!175677))))

(assert (=> d!84862 (= res!212435 (= (size!6028 (buf!6530 (_1!11799 lt!392710))) (size!6028 (buf!6530 thiss!1005))))))

(assert (=> d!84862 (= (isPrefixOf!0 (_1!11799 lt!392710) thiss!1005) e!175677)))

(declare-fun b!253526 () Bool)

(declare-fun res!212434 () Bool)

(assert (=> b!253526 (=> (not res!212434) (not e!175677))))

(assert (=> b!253526 (= res!212434 (bvsle (bitIndex!0 (size!6028 (buf!6530 (_1!11799 lt!392710))) (currentByte!11985 (_1!11799 lt!392710)) (currentBit!11980 (_1!11799 lt!392710))) (bitIndex!0 (size!6028 (buf!6530 thiss!1005)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005))))))

(declare-fun b!253527 () Bool)

(declare-fun e!175676 () Bool)

(assert (=> b!253527 (= e!175677 e!175676)))

(declare-fun res!212436 () Bool)

(assert (=> b!253527 (=> res!212436 e!175676)))

(assert (=> b!253527 (= res!212436 (= (size!6028 (buf!6530 (_1!11799 lt!392710))) #b00000000000000000000000000000000))))

(declare-fun b!253528 () Bool)

(assert (=> b!253528 (= e!175676 (arrayBitRangesEq!0 (buf!6530 (_1!11799 lt!392710)) (buf!6530 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6028 (buf!6530 (_1!11799 lt!392710))) (currentByte!11985 (_1!11799 lt!392710)) (currentBit!11980 (_1!11799 lt!392710)))))))

(assert (= (and d!84862 res!212435) b!253526))

(assert (= (and b!253526 res!212434) b!253527))

(assert (= (and b!253527 (not res!212436)) b!253528))

(declare-fun m!381685 () Bool)

(assert (=> b!253526 m!381685))

(assert (=> b!253526 m!380217))

(assert (=> b!253528 m!381685))

(assert (=> b!253528 m!381685))

(declare-fun m!381687 () Bool)

(assert (=> b!253528 m!381687))

(assert (=> b!252853 d!84862))

(declare-fun d!84864 () Bool)

(assert (=> d!84864 (= (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392425)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392425))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392425)))) (bvsub (bvmul ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392425)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392425))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392425))))))))

(assert (=> d!84338 d!84864))

(declare-fun d!84866 () Bool)

(assert (=> d!84866 (= (invariant!0 (currentBit!11980 (_2!11798 lt!392425)) (currentByte!11985 (_2!11798 lt!392425)) (size!6028 (buf!6530 (_2!11798 lt!392425)))) (and (bvsge (currentBit!11980 (_2!11798 lt!392425)) #b00000000000000000000000000000000) (bvslt (currentBit!11980 (_2!11798 lt!392425)) #b00000000000000000000000000001000) (bvsge (currentByte!11985 (_2!11798 lt!392425)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11985 (_2!11798 lt!392425)) (size!6028 (buf!6530 (_2!11798 lt!392425)))) (and (= (currentBit!11980 (_2!11798 lt!392425)) #b00000000000000000000000000000000) (= (currentByte!11985 (_2!11798 lt!392425)) (size!6028 (buf!6530 (_2!11798 lt!392425))))))))))

(assert (=> d!84338 d!84866))

(assert (=> d!84260 d!84838))

(assert (=> d!84296 d!84330))

(declare-fun d!84868 () Bool)

(assert (=> d!84868 (validate_offset_bits!1 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392425)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415))) lt!392433)))

(assert (=> d!84868 true))

(declare-fun _$6!427 () Unit!18204)

(assert (=> d!84868 (= (choose!9 (_2!11798 lt!392415) (buf!6530 (_2!11798 lt!392425)) lt!392433 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 (_2!11798 lt!392415)) (currentBit!11980 (_2!11798 lt!392415)))) _$6!427)))

(declare-fun bs!21469 () Bool)

(assert (= bs!21469 d!84868))

(assert (=> bs!21469 m!380229))

(assert (=> d!84296 d!84868))

(assert (=> b!252798 d!84284))

(assert (=> b!252798 d!84338))

(declare-fun d!84870 () Bool)

(declare-fun e!175678 () Bool)

(assert (=> d!84870 e!175678))

(declare-fun res!212437 () Bool)

(assert (=> d!84870 (=> (not res!212437) (not e!175678))))

(declare-fun lt!393730 () BitStream!10978)

(declare-fun lt!393731 () (_ BitVec 64))

(assert (=> d!84870 (= res!212437 (= (bvadd lt!393731 (bvsub lt!392712 lt!392719)) (bitIndex!0 (size!6028 (buf!6530 lt!393730)) (currentByte!11985 lt!393730) (currentBit!11980 lt!393730))))))

(assert (=> d!84870 (or (not (= (bvand lt!393731 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!392712 lt!392719) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393731 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393731 (bvsub lt!392712 lt!392719)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84870 (= lt!393731 (bitIndex!0 (size!6028 (buf!6530 (_2!11799 lt!392710))) (currentByte!11985 (_2!11799 lt!392710)) (currentBit!11980 (_2!11799 lt!392710))))))

(assert (=> d!84870 (= lt!393730 (_2!11798 (moveBitIndex!0 (_2!11799 lt!392710) (bvsub lt!392712 lt!392719))))))

(assert (=> d!84870 (moveBitIndexPrecond!0 (_2!11799 lt!392710) (bvsub lt!392712 lt!392719))))

(assert (=> d!84870 (= (withMovedBitIndex!0 (_2!11799 lt!392710) (bvsub lt!392712 lt!392719)) lt!393730)))

(declare-fun b!253529 () Bool)

(assert (=> b!253529 (= e!175678 (= (size!6028 (buf!6530 (_2!11799 lt!392710))) (size!6028 (buf!6530 lt!393730))))))

(assert (= (and d!84870 res!212437) b!253529))

(declare-fun m!381689 () Bool)

(assert (=> d!84870 m!381689))

(declare-fun m!381691 () Bool)

(assert (=> d!84870 m!381691))

(declare-fun m!381693 () Bool)

(assert (=> d!84870 m!381693))

(declare-fun m!381695 () Bool)

(assert (=> d!84870 m!381695))

(assert (=> b!252855 d!84870))

(assert (=> b!252855 d!84338))

(assert (=> b!252855 d!84286))

(declare-fun d!84872 () Bool)

(declare-fun e!175679 () Bool)

(assert (=> d!84872 e!175679))

(declare-fun res!212439 () Bool)

(assert (=> d!84872 (=> (not res!212439) (not e!175679))))

(declare-fun lt!393732 () (_ BitVec 64))

(declare-fun lt!393736 () (_ BitVec 64))

(declare-fun lt!393735 () (_ BitVec 64))

(assert (=> d!84872 (= res!212439 (= lt!393735 (bvsub lt!393732 lt!393736)))))

(assert (=> d!84872 (or (= (bvand lt!393732 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393736 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393732 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393732 lt!393736) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84872 (= lt!393736 (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 lt!392573))) ((_ sign_extend 32) (currentByte!11985 lt!392573)) ((_ sign_extend 32) (currentBit!11980 lt!392573))))))

(declare-fun lt!393737 () (_ BitVec 64))

(declare-fun lt!393734 () (_ BitVec 64))

(assert (=> d!84872 (= lt!393732 (bvmul lt!393737 lt!393734))))

(assert (=> d!84872 (or (= lt!393737 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!393734 (bvsdiv (bvmul lt!393737 lt!393734) lt!393737)))))

(assert (=> d!84872 (= lt!393734 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84872 (= lt!393737 ((_ sign_extend 32) (size!6028 (buf!6530 lt!392573))))))

(assert (=> d!84872 (= lt!393735 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11985 lt!392573)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11980 lt!392573))))))

(assert (=> d!84872 (invariant!0 (currentBit!11980 lt!392573) (currentByte!11985 lt!392573) (size!6028 (buf!6530 lt!392573)))))

(assert (=> d!84872 (= (bitIndex!0 (size!6028 (buf!6530 lt!392573)) (currentByte!11985 lt!392573) (currentBit!11980 lt!392573)) lt!393735)))

(declare-fun b!253530 () Bool)

(declare-fun res!212438 () Bool)

(assert (=> b!253530 (=> (not res!212438) (not e!175679))))

(assert (=> b!253530 (= res!212438 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393735))))

(declare-fun b!253531 () Bool)

(declare-fun lt!393733 () (_ BitVec 64))

(assert (=> b!253531 (= e!175679 (bvsle lt!393735 (bvmul lt!393733 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253531 (or (= lt!393733 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!393733 #b0000000000000000000000000000000000000000000000000000000000001000) lt!393733)))))

(assert (=> b!253531 (= lt!393733 ((_ sign_extend 32) (size!6028 (buf!6530 lt!392573))))))

(assert (= (and d!84872 res!212439) b!253530))

(assert (= (and b!253530 res!212438) b!253531))

(declare-fun m!381697 () Bool)

(assert (=> d!84872 m!381697))

(declare-fun m!381699 () Bool)

(assert (=> d!84872 m!381699))

(assert (=> d!84256 d!84872))

(declare-fun d!84874 () Bool)

(declare-fun e!175680 () Bool)

(assert (=> d!84874 e!175680))

(declare-fun res!212441 () Bool)

(assert (=> d!84874 (=> (not res!212441) (not e!175680))))

(declare-fun lt!393741 () (_ BitVec 64))

(declare-fun lt!393738 () (_ BitVec 64))

(declare-fun lt!393742 () (_ BitVec 64))

(assert (=> d!84874 (= res!212441 (= lt!393741 (bvsub lt!393738 lt!393742)))))

(assert (=> d!84874 (or (= (bvand lt!393738 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393742 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393738 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393738 lt!393742) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84874 (= lt!393742 (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11799 lt!392423)))) ((_ sign_extend 32) (currentByte!11985 (_1!11799 lt!392423))) ((_ sign_extend 32) (currentBit!11980 (_1!11799 lt!392423)))))))

(declare-fun lt!393743 () (_ BitVec 64))

(declare-fun lt!393740 () (_ BitVec 64))

(assert (=> d!84874 (= lt!393738 (bvmul lt!393743 lt!393740))))

(assert (=> d!84874 (or (= lt!393743 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!393740 (bvsdiv (bvmul lt!393743 lt!393740) lt!393743)))))

(assert (=> d!84874 (= lt!393740 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84874 (= lt!393743 ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11799 lt!392423)))))))

(assert (=> d!84874 (= lt!393741 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11985 (_1!11799 lt!392423))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11980 (_1!11799 lt!392423)))))))

(assert (=> d!84874 (invariant!0 (currentBit!11980 (_1!11799 lt!392423)) (currentByte!11985 (_1!11799 lt!392423)) (size!6028 (buf!6530 (_1!11799 lt!392423))))))

(assert (=> d!84874 (= (bitIndex!0 (size!6028 (buf!6530 (_1!11799 lt!392423))) (currentByte!11985 (_1!11799 lt!392423)) (currentBit!11980 (_1!11799 lt!392423))) lt!393741)))

(declare-fun b!253532 () Bool)

(declare-fun res!212440 () Bool)

(assert (=> b!253532 (=> (not res!212440) (not e!175680))))

(assert (=> b!253532 (= res!212440 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393741))))

(declare-fun b!253533 () Bool)

(declare-fun lt!393739 () (_ BitVec 64))

(assert (=> b!253533 (= e!175680 (bvsle lt!393741 (bvmul lt!393739 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253533 (or (= lt!393739 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!393739 #b0000000000000000000000000000000000000000000000000000000000001000) lt!393739)))))

(assert (=> b!253533 (= lt!393739 ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11799 lt!392423)))))))

(assert (= (and d!84874 res!212441) b!253532))

(assert (= (and b!253532 res!212440) b!253533))

(declare-fun m!381701 () Bool)

(assert (=> d!84874 m!381701))

(declare-fun m!381703 () Bool)

(assert (=> d!84874 m!381703))

(assert (=> d!84256 d!84874))

(declare-fun d!84876 () Bool)

(declare-fun lt!393758 () (_ BitVec 32))

(assert (=> d!84876 (= lt!393758 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!393760 () (_ BitVec 32))

(assert (=> d!84876 (= lt!393760 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!175686 () Bool)

(assert (=> d!84876 e!175686))

(declare-fun res!212447 () Bool)

(assert (=> d!84876 (=> (not res!212447) (not e!175686))))

(assert (=> d!84876 (= res!212447 (moveBitIndexPrecond!0 (_1!11799 lt!392423) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!18230 () Unit!18204)

(declare-fun Unit!18231 () Unit!18204)

(declare-fun Unit!18232 () Unit!18204)

(assert (=> d!84876 (= (moveBitIndex!0 (_1!11799 lt!392423) #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!11980 (_1!11799 lt!392423)) lt!393758) #b00000000000000000000000000000000) (tuple2!21741 Unit!18230 (BitStream!10979 (buf!6530 (_1!11799 lt!392423)) (bvsub (bvadd (currentByte!11985 (_1!11799 lt!392423)) lt!393760) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!393758 (currentBit!11980 (_1!11799 lt!392423))))) (ite (bvsge (bvadd (currentBit!11980 (_1!11799 lt!392423)) lt!393758) #b00000000000000000000000000001000) (tuple2!21741 Unit!18231 (BitStream!10979 (buf!6530 (_1!11799 lt!392423)) (bvadd (currentByte!11985 (_1!11799 lt!392423)) lt!393760 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!11980 (_1!11799 lt!392423)) lt!393758) #b00000000000000000000000000001000))) (tuple2!21741 Unit!18232 (BitStream!10979 (buf!6530 (_1!11799 lt!392423)) (bvadd (currentByte!11985 (_1!11799 lt!392423)) lt!393760) (bvadd (currentBit!11980 (_1!11799 lt!392423)) lt!393758))))))))

(declare-fun b!253538 () Bool)

(declare-fun e!175685 () Bool)

(assert (=> b!253538 (= e!175686 e!175685)))

(declare-fun res!212446 () Bool)

(assert (=> b!253538 (=> (not res!212446) (not e!175685))))

(declare-fun lt!393759 () (_ BitVec 64))

(declare-fun lt!393757 () tuple2!21740)

(assert (=> b!253538 (= res!212446 (= (bvadd lt!393759 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!393757))) (currentByte!11985 (_2!11798 lt!393757)) (currentBit!11980 (_2!11798 lt!393757)))))))

(assert (=> b!253538 (or (not (= (bvand lt!393759 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393759 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393759 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253538 (= lt!393759 (bitIndex!0 (size!6028 (buf!6530 (_1!11799 lt!392423))) (currentByte!11985 (_1!11799 lt!392423)) (currentBit!11980 (_1!11799 lt!392423))))))

(declare-fun lt!393756 () (_ BitVec 32))

(declare-fun lt!393761 () (_ BitVec 32))

(declare-fun Unit!18233 () Unit!18204)

(declare-fun Unit!18234 () Unit!18204)

(declare-fun Unit!18235 () Unit!18204)

(assert (=> b!253538 (= lt!393757 (ite (bvslt (bvadd (currentBit!11980 (_1!11799 lt!392423)) lt!393756) #b00000000000000000000000000000000) (tuple2!21741 Unit!18233 (BitStream!10979 (buf!6530 (_1!11799 lt!392423)) (bvsub (bvadd (currentByte!11985 (_1!11799 lt!392423)) lt!393761) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!393756 (currentBit!11980 (_1!11799 lt!392423))))) (ite (bvsge (bvadd (currentBit!11980 (_1!11799 lt!392423)) lt!393756) #b00000000000000000000000000001000) (tuple2!21741 Unit!18234 (BitStream!10979 (buf!6530 (_1!11799 lt!392423)) (bvadd (currentByte!11985 (_1!11799 lt!392423)) lt!393761 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!11980 (_1!11799 lt!392423)) lt!393756) #b00000000000000000000000000001000))) (tuple2!21741 Unit!18235 (BitStream!10979 (buf!6530 (_1!11799 lt!392423)) (bvadd (currentByte!11985 (_1!11799 lt!392423)) lt!393761) (bvadd (currentBit!11980 (_1!11799 lt!392423)) lt!393756))))))))

(assert (=> b!253538 (= lt!393756 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253538 (= lt!393761 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!253539 () Bool)

(assert (=> b!253539 (= e!175685 (and (= (size!6028 (buf!6530 (_1!11799 lt!392423))) (size!6028 (buf!6530 (_2!11798 lt!393757)))) (= (buf!6530 (_1!11799 lt!392423)) (buf!6530 (_2!11798 lt!393757)))))))

(assert (= (and d!84876 res!212447) b!253538))

(assert (= (and b!253538 res!212446) b!253539))

(assert (=> d!84876 m!380415))

(declare-fun m!381705 () Bool)

(assert (=> b!253538 m!381705))

(assert (=> b!253538 m!380411))

(assert (=> d!84256 d!84876))

(declare-fun d!84880 () Bool)

(declare-fun res!212450 () Bool)

(declare-fun e!175689 () Bool)

(assert (=> d!84880 (=> (not res!212450) (not e!175689))))

(assert (=> d!84880 (= res!212450 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11799 lt!392423))))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11799 lt!392423))))))))))

(assert (=> d!84880 (= (moveBitIndexPrecond!0 (_1!11799 lt!392423) #b0000000000000000000000000000000000000000000000000000000000000001) e!175689)))

(declare-fun b!253543 () Bool)

(declare-fun lt!393764 () (_ BitVec 64))

(assert (=> b!253543 (= e!175689 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393764) (bvsle lt!393764 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11799 lt!392423))))))))))

(assert (=> b!253543 (= lt!393764 (bvadd (bitIndex!0 (size!6028 (buf!6530 (_1!11799 lt!392423))) (currentByte!11985 (_1!11799 lt!392423)) (currentBit!11980 (_1!11799 lt!392423))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!84880 res!212450) b!253543))

(assert (=> b!253543 m!380411))

(assert (=> d!84256 d!84880))

(declare-fun d!84882 () Bool)

(assert (=> d!84882 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392415)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415))) lt!392753) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392415)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415)))) lt!392753))))

(declare-fun bs!21470 () Bool)

(assert (= bs!21470 d!84882))

(assert (=> bs!21470 m!380469))

(assert (=> b!252868 d!84882))

(declare-fun d!84884 () Bool)

(declare-fun res!212452 () Bool)

(declare-fun e!175691 () Bool)

(assert (=> d!84884 (=> (not res!212452) (not e!175691))))

(assert (=> d!84884 (= res!212452 (= (size!6028 (buf!6530 thiss!1005)) (size!6028 (buf!6530 (_2!11798 lt!392692)))))))

(assert (=> d!84884 (= (isPrefixOf!0 thiss!1005 (_2!11798 lt!392692)) e!175691)))

(declare-fun b!253544 () Bool)

(declare-fun res!212451 () Bool)

(assert (=> b!253544 (=> (not res!212451) (not e!175691))))

(assert (=> b!253544 (= res!212451 (bvsle (bitIndex!0 (size!6028 (buf!6530 thiss!1005)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)) (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392692))) (currentByte!11985 (_2!11798 lt!392692)) (currentBit!11980 (_2!11798 lt!392692)))))))

(declare-fun b!253545 () Bool)

(declare-fun e!175690 () Bool)

(assert (=> b!253545 (= e!175691 e!175690)))

(declare-fun res!212453 () Bool)

(assert (=> b!253545 (=> res!212453 e!175690)))

(assert (=> b!253545 (= res!212453 (= (size!6028 (buf!6530 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!253546 () Bool)

(assert (=> b!253546 (= e!175690 (arrayBitRangesEq!0 (buf!6530 thiss!1005) (buf!6530 (_2!11798 lt!392692)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6028 (buf!6530 thiss!1005)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005))))))

(assert (= (and d!84884 res!212452) b!253544))

(assert (= (and b!253544 res!212451) b!253545))

(assert (= (and b!253545 (not res!212453)) b!253546))

(assert (=> b!253544 m!380217))

(assert (=> b!253544 m!380483))

(assert (=> b!253546 m!380217))

(assert (=> b!253546 m!380217))

(declare-fun m!381707 () Bool)

(assert (=> b!253546 m!381707))

(assert (=> b!252844 d!84884))

(declare-fun lt!393765 () (_ BitVec 32))

(declare-fun bm!3983 () Bool)

(declare-fun lt!393766 () tuple4!300)

(declare-fun lt!393767 () (_ BitVec 32))

(declare-fun call!3986 () Bool)

(declare-fun c!11680 () Bool)

(assert (=> bm!3983 (= call!3986 (byteRangesEq!0 (select (arr!7015 (buf!6530 (_2!11798 lt!392415))) (_3!930 lt!393766)) (select (arr!7015 (buf!6530 (_2!11798 lt!392425))) (_3!930 lt!393766)) lt!393767 (ite c!11680 lt!393765 #b00000000000000000000000000001000)))))

(declare-fun b!253547 () Bool)

(declare-fun res!212455 () Bool)

(assert (=> b!253547 (= res!212455 (= lt!393765 #b00000000000000000000000000000000))))

(declare-fun e!175696 () Bool)

(assert (=> b!253547 (=> res!212455 e!175696)))

(declare-fun e!175697 () Bool)

(assert (=> b!253547 (= e!175697 e!175696)))

(declare-fun d!84886 () Bool)

(declare-fun res!212456 () Bool)

(declare-fun e!175692 () Bool)

(assert (=> d!84886 (=> res!212456 e!175692)))

(assert (=> d!84886 (= res!212456 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392415))) (currentByte!11985 (_2!11798 lt!392415)) (currentBit!11980 (_2!11798 lt!392415)))))))

(assert (=> d!84886 (= (arrayBitRangesEq!0 (buf!6530 (_2!11798 lt!392415)) (buf!6530 (_2!11798 lt!392425)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392415))) (currentByte!11985 (_2!11798 lt!392415)) (currentBit!11980 (_2!11798 lt!392415)))) e!175692)))

(declare-fun b!253548 () Bool)

(declare-fun e!175693 () Bool)

(assert (=> b!253548 (= e!175692 e!175693)))

(declare-fun res!212454 () Bool)

(assert (=> b!253548 (=> (not res!212454) (not e!175693))))

(declare-fun e!175695 () Bool)

(assert (=> b!253548 (= res!212454 e!175695)))

(declare-fun res!212458 () Bool)

(assert (=> b!253548 (=> res!212458 e!175695)))

(assert (=> b!253548 (= res!212458 (bvsge (_1!11811 lt!393766) (_2!11811 lt!393766)))))

(assert (=> b!253548 (= lt!393765 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392415))) (currentByte!11985 (_2!11798 lt!392415)) (currentBit!11980 (_2!11798 lt!392415))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253548 (= lt!393767 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253548 (= lt!393766 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392415))) (currentByte!11985 (_2!11798 lt!392415)) (currentBit!11980 (_2!11798 lt!392415)))))))

(declare-fun b!253549 () Bool)

(declare-fun e!175694 () Bool)

(assert (=> b!253549 (= e!175693 e!175694)))

(assert (=> b!253549 (= c!11680 (= (_3!930 lt!393766) (_4!150 lt!393766)))))

(declare-fun b!253550 () Bool)

(assert (=> b!253550 (= e!175695 (arrayRangesEq!927 (buf!6530 (_2!11798 lt!392415)) (buf!6530 (_2!11798 lt!392425)) (_1!11811 lt!393766) (_2!11811 lt!393766)))))

(declare-fun b!253551 () Bool)

(assert (=> b!253551 (= e!175694 call!3986)))

(declare-fun b!253552 () Bool)

(assert (=> b!253552 (= e!175696 (byteRangesEq!0 (select (arr!7015 (buf!6530 (_2!11798 lt!392415))) (_4!150 lt!393766)) (select (arr!7015 (buf!6530 (_2!11798 lt!392425))) (_4!150 lt!393766)) #b00000000000000000000000000000000 lt!393765))))

(declare-fun b!253553 () Bool)

(assert (=> b!253553 (= e!175694 e!175697)))

(declare-fun res!212457 () Bool)

(assert (=> b!253553 (= res!212457 call!3986)))

(assert (=> b!253553 (=> (not res!212457) (not e!175697))))

(assert (= (and d!84886 (not res!212456)) b!253548))

(assert (= (and b!253548 (not res!212458)) b!253550))

(assert (= (and b!253548 res!212454) b!253549))

(assert (= (and b!253549 c!11680) b!253551))

(assert (= (and b!253549 (not c!11680)) b!253553))

(assert (= (and b!253553 res!212457) b!253547))

(assert (= (and b!253547 (not res!212455)) b!253552))

(assert (= (or b!253551 b!253553) bm!3983))

(declare-fun m!381709 () Bool)

(assert (=> bm!3983 m!381709))

(declare-fun m!381711 () Bool)

(assert (=> bm!3983 m!381711))

(assert (=> bm!3983 m!381709))

(assert (=> bm!3983 m!381711))

(declare-fun m!381713 () Bool)

(assert (=> bm!3983 m!381713))

(assert (=> b!253548 m!380195))

(declare-fun m!381715 () Bool)

(assert (=> b!253548 m!381715))

(declare-fun m!381717 () Bool)

(assert (=> b!253550 m!381717))

(declare-fun m!381719 () Bool)

(assert (=> b!253552 m!381719))

(declare-fun m!381721 () Bool)

(assert (=> b!253552 m!381721))

(assert (=> b!253552 m!381719))

(assert (=> b!253552 m!381721))

(declare-fun m!381723 () Bool)

(assert (=> b!253552 m!381723))

(assert (=> b!252800 d!84886))

(assert (=> b!252800 d!84284))

(declare-fun d!84888 () Bool)

(declare-fun e!175707 () Bool)

(assert (=> d!84888 e!175707))

(declare-fun res!212467 () Bool)

(assert (=> d!84888 (=> (not res!212467) (not e!175707))))

(declare-fun _$19!195 () tuple2!21740)

(assert (=> d!84888 (= res!212467 (= (size!6028 (buf!6530 thiss!1005)) (size!6028 (buf!6530 (_2!11798 _$19!195)))))))

(declare-fun e!175708 () Bool)

(assert (=> d!84888 (and (inv!12 (_2!11798 _$19!195)) e!175708)))

(assert (=> d!84888 (= (choose!16 thiss!1005 bit!26) _$19!195)))

(declare-fun b!253565 () Bool)

(assert (=> b!253565 (= e!175708 (array_inv!5769 (buf!6530 (_2!11798 _$19!195))))))

(declare-fun b!253566 () Bool)

(declare-fun e!175706 () Bool)

(assert (=> b!253566 (= e!175707 e!175706)))

(declare-fun res!212470 () Bool)

(assert (=> b!253566 (=> (not res!212470) (not e!175706))))

(declare-fun lt!393770 () tuple2!21738)

(assert (=> b!253566 (= res!212470 (and (= (_2!11797 lt!393770) bit!26) (= (_1!11797 lt!393770) (_2!11798 _$19!195))))))

(assert (=> b!253566 (= lt!393770 (readBitPure!0 (readerFrom!0 (_2!11798 _$19!195) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005))))))

(declare-fun b!253567 () Bool)

(assert (=> b!253567 (= e!175706 (= (bitIndex!0 (size!6028 (buf!6530 (_1!11797 lt!393770))) (currentByte!11985 (_1!11797 lt!393770)) (currentBit!11980 (_1!11797 lt!393770))) (bitIndex!0 (size!6028 (buf!6530 (_2!11798 _$19!195))) (currentByte!11985 (_2!11798 _$19!195)) (currentBit!11980 (_2!11798 _$19!195)))))))

(declare-fun b!253568 () Bool)

(declare-fun res!212469 () Bool)

(assert (=> b!253568 (=> (not res!212469) (not e!175707))))

(assert (=> b!253568 (= res!212469 (isPrefixOf!0 thiss!1005 (_2!11798 _$19!195)))))

(declare-fun b!253569 () Bool)

(declare-fun res!212468 () Bool)

(assert (=> b!253569 (=> (not res!212468) (not e!175707))))

(assert (=> b!253569 (= res!212468 (= (bitIndex!0 (size!6028 (buf!6530 (_2!11798 _$19!195))) (currentByte!11985 (_2!11798 _$19!195)) (currentBit!11980 (_2!11798 _$19!195))) (bvadd (bitIndex!0 (size!6028 (buf!6530 thiss!1005)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= d!84888 b!253565))

(assert (= (and d!84888 res!212467) b!253569))

(assert (= (and b!253569 res!212468) b!253568))

(assert (= (and b!253568 res!212469) b!253566))

(assert (= (and b!253566 res!212470) b!253567))

(declare-fun m!381725 () Bool)

(assert (=> b!253566 m!381725))

(assert (=> b!253566 m!381725))

(declare-fun m!381727 () Bool)

(assert (=> b!253566 m!381727))

(declare-fun m!381729 () Bool)

(assert (=> b!253565 m!381729))

(declare-fun m!381731 () Bool)

(assert (=> d!84888 m!381731))

(declare-fun m!381733 () Bool)

(assert (=> b!253569 m!381733))

(assert (=> b!253569 m!380217))

(declare-fun m!381735 () Bool)

(assert (=> b!253567 m!381735))

(assert (=> b!253567 m!381733))

(declare-fun m!381737 () Bool)

(assert (=> b!253568 m!381737))

(assert (=> d!84298 d!84888))

(declare-fun d!84890 () Bool)

(assert (=> d!84890 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6028 (buf!6530 thiss!1005))) ((_ sign_extend 32) (currentByte!11985 thiss!1005)) ((_ sign_extend 32) (currentBit!11980 thiss!1005))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 thiss!1005))) ((_ sign_extend 32) (currentByte!11985 thiss!1005)) ((_ sign_extend 32) (currentBit!11980 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!21471 () Bool)

(assert (= bs!21471 d!84890))

(assert (=> bs!21471 m!380423))

(assert (=> d!84298 d!84890))

(declare-fun b!253580 () Bool)

(declare-fun res!212479 () Bool)

(declare-fun e!175718 () Bool)

(assert (=> b!253580 (=> (not res!212479) (not e!175718))))

(declare-fun _$23!39 () tuple2!21740)

(assert (=> b!253580 (= res!212479 (isPrefixOf!0 (_2!11798 lt!392415) (_2!11798 _$23!39)))))

(declare-fun d!84892 () Bool)

(assert (=> d!84892 e!175718))

(declare-fun res!212478 () Bool)

(assert (=> d!84892 (=> (not res!212478) (not e!175718))))

(assert (=> d!84892 (= res!212478 (= (size!6028 (buf!6530 (_2!11798 lt!392415))) (size!6028 (buf!6530 (_2!11798 _$23!39)))))))

(declare-fun e!175716 () Bool)

(assert (=> d!84892 (and (inv!12 (_2!11798 _$23!39)) e!175716)))

(assert (=> d!84892 (= (choose!51 (_2!11798 lt!392415) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) _$23!39)))

(declare-fun b!253579 () Bool)

(declare-fun res!212477 () Bool)

(assert (=> b!253579 (=> (not res!212477) (not e!175718))))

(assert (=> b!253579 (= res!212477 (= (bitIndex!0 (size!6028 (buf!6530 (_2!11798 _$23!39))) (currentByte!11985 (_2!11798 _$23!39)) (currentBit!11980 (_2!11798 _$23!39))) (bvadd (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392415))) (currentByte!11985 (_2!11798 lt!392415)) (currentBit!11980 (_2!11798 lt!392415))) (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))))

(declare-fun b!253578 () Bool)

(assert (=> b!253578 (= e!175716 (array_inv!5769 (buf!6530 (_2!11798 _$23!39))))))

(declare-fun b!253581 () Bool)

(declare-fun lt!393784 () tuple2!21738)

(declare-fun lt!393783 () tuple2!21742)

(assert (=> b!253581 (= e!175718 (and (_2!11797 lt!393784) (= (_1!11797 lt!393784) (_2!11799 lt!393783))))))

(assert (=> b!253581 (= lt!393784 (checkBitsLoopPure!0 (_1!11799 lt!393783) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!393782 () Unit!18204)

(declare-fun lt!393781 () Unit!18204)

(assert (=> b!253581 (= lt!393782 lt!393781)))

(declare-fun lt!393785 () (_ BitVec 64))

(assert (=> b!253581 (validate_offset_bits!1 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 _$23!39)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415))) lt!393785)))

(assert (=> b!253581 (= lt!393781 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11798 lt!392415) (buf!6530 (_2!11798 _$23!39)) lt!393785))))

(assert (=> b!253581 (= lt!393785 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!253581 (= lt!393783 (reader!0 (_2!11798 lt!392415) (_2!11798 _$23!39)))))

(assert (= d!84892 b!253578))

(assert (= (and d!84892 res!212478) b!253579))

(assert (= (and b!253579 res!212477) b!253580))

(assert (= (and b!253580 res!212479) b!253581))

(declare-fun m!381739 () Bool)

(assert (=> b!253580 m!381739))

(declare-fun m!381741 () Bool)

(assert (=> b!253581 m!381741))

(declare-fun m!381743 () Bool)

(assert (=> b!253581 m!381743))

(declare-fun m!381745 () Bool)

(assert (=> b!253581 m!381745))

(declare-fun m!381747 () Bool)

(assert (=> b!253581 m!381747))

(declare-fun m!381749 () Bool)

(assert (=> d!84892 m!381749))

(declare-fun m!381751 () Bool)

(assert (=> b!253578 m!381751))

(declare-fun m!381753 () Bool)

(assert (=> b!253579 m!381753))

(assert (=> b!253579 m!380195))

(assert (=> d!84316 d!84892))

(assert (=> d!84276 d!84274))

(declare-fun d!84894 () Bool)

(assert (=> d!84894 (validate_offset_bits!1 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392425)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415))) lt!392419)))

(assert (=> d!84894 true))

(declare-fun _$6!428 () Unit!18204)

(assert (=> d!84894 (= (choose!9 (_2!11798 lt!392415) (buf!6530 (_2!11798 lt!392425)) lt!392419 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 (_2!11798 lt!392415)) (currentBit!11980 (_2!11798 lt!392415)))) _$6!428)))

(declare-fun bs!21472 () Bool)

(assert (= bs!21472 d!84894))

(assert (=> bs!21472 m!380205))

(assert (=> d!84276 d!84894))

(declare-fun d!84896 () Bool)

(declare-fun res!212481 () Bool)

(declare-fun e!175720 () Bool)

(assert (=> d!84896 (=> (not res!212481) (not e!175720))))

(assert (=> d!84896 (= res!212481 (= (size!6028 (buf!6530 (_1!11799 lt!392647))) (size!6028 (buf!6530 (_2!11798 lt!392415)))))))

(assert (=> d!84896 (= (isPrefixOf!0 (_1!11799 lt!392647) (_2!11798 lt!392415)) e!175720)))

(declare-fun b!253582 () Bool)

(declare-fun res!212480 () Bool)

(assert (=> b!253582 (=> (not res!212480) (not e!175720))))

(assert (=> b!253582 (= res!212480 (bvsle (bitIndex!0 (size!6028 (buf!6530 (_1!11799 lt!392647))) (currentByte!11985 (_1!11799 lt!392647)) (currentBit!11980 (_1!11799 lt!392647))) (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392415))) (currentByte!11985 (_2!11798 lt!392415)) (currentBit!11980 (_2!11798 lt!392415)))))))

(declare-fun b!253583 () Bool)

(declare-fun e!175719 () Bool)

(assert (=> b!253583 (= e!175720 e!175719)))

(declare-fun res!212482 () Bool)

(assert (=> b!253583 (=> res!212482 e!175719)))

(assert (=> b!253583 (= res!212482 (= (size!6028 (buf!6530 (_1!11799 lt!392647))) #b00000000000000000000000000000000))))

(declare-fun b!253584 () Bool)

(assert (=> b!253584 (= e!175719 (arrayBitRangesEq!0 (buf!6530 (_1!11799 lt!392647)) (buf!6530 (_2!11798 lt!392415)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6028 (buf!6530 (_1!11799 lt!392647))) (currentByte!11985 (_1!11799 lt!392647)) (currentBit!11980 (_1!11799 lt!392647)))))))

(assert (= (and d!84896 res!212481) b!253582))

(assert (= (and b!253582 res!212480) b!253583))

(assert (= (and b!253583 (not res!212482)) b!253584))

(assert (=> b!253582 m!381675))

(assert (=> b!253582 m!380195))

(assert (=> b!253584 m!381675))

(assert (=> b!253584 m!381675))

(declare-fun m!381755 () Bool)

(assert (=> b!253584 m!381755))

(assert (=> b!252818 d!84896))

(declare-fun d!84898 () Bool)

(declare-fun e!175721 () Bool)

(assert (=> d!84898 e!175721))

(declare-fun res!212483 () Bool)

(assert (=> d!84898 (=> (not res!212483) (not e!175721))))

(assert (=> d!84898 (= res!212483 (= (buf!6530 (_2!11798 (increaseBitIndex!0 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005))))) (buf!6530 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005)))))))

(declare-fun lt!393788 () Bool)

(assert (=> d!84898 (= lt!393788 (not (= (bvand ((_ sign_extend 24) (select (arr!7015 (buf!6530 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005)))) (currentByte!11985 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11980 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!393787 () tuple2!21756)

(assert (=> d!84898 (= lt!393787 (tuple2!21757 (not (= (bvand ((_ sign_extend 24) (select (arr!7015 (buf!6530 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005)))) (currentByte!11985 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11980 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005)))))) #b00000000000000000000000000000000)) (_2!11798 (increaseBitIndex!0 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005))))))))

(assert (=> d!84898 (validate_offset_bit!0 ((_ sign_extend 32) (size!6028 (buf!6530 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005))))) ((_ sign_extend 32) (currentByte!11985 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005)))) ((_ sign_extend 32) (currentBit!11980 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005)))))))

(assert (=> d!84898 (= (readBit!0 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005))) lt!393787)))

(declare-fun lt!393790 () (_ BitVec 64))

(declare-fun b!253585 () Bool)

(declare-fun lt!393792 () (_ BitVec 64))

(assert (=> b!253585 (= e!175721 (= (bitIndex!0 (size!6028 (buf!6530 (_2!11798 (increaseBitIndex!0 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005)))))) (currentByte!11985 (_2!11798 (increaseBitIndex!0 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005))))) (currentBit!11980 (_2!11798 (increaseBitIndex!0 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005)))))) (bvadd lt!393792 lt!393790)))))

(assert (=> b!253585 (or (not (= (bvand lt!393792 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393790 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393792 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393792 lt!393790) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253585 (= lt!393790 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!253585 (= lt!393792 (bitIndex!0 (size!6028 (buf!6530 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005)))) (currentByte!11985 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005))) (currentBit!11980 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005)))))))

(declare-fun lt!393786 () Bool)

(assert (=> b!253585 (= lt!393786 (not (= (bvand ((_ sign_extend 24) (select (arr!7015 (buf!6530 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005)))) (currentByte!11985 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11980 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!393791 () Bool)

(assert (=> b!253585 (= lt!393791 (not (= (bvand ((_ sign_extend 24) (select (arr!7015 (buf!6530 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005)))) (currentByte!11985 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11980 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!393789 () Bool)

(assert (=> b!253585 (= lt!393789 (not (= (bvand ((_ sign_extend 24) (select (arr!7015 (buf!6530 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005)))) (currentByte!11985 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11980 (readerFrom!0 (_2!11798 lt!392415) (currentBit!11980 thiss!1005) (currentByte!11985 thiss!1005)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!84898 res!212483) b!253585))

(assert (=> d!84898 m!380197))

(declare-fun m!381757 () Bool)

(assert (=> d!84898 m!381757))

(declare-fun m!381759 () Bool)

(assert (=> d!84898 m!381759))

(declare-fun m!381761 () Bool)

(assert (=> d!84898 m!381761))

(declare-fun m!381763 () Bool)

(assert (=> d!84898 m!381763))

(declare-fun m!381765 () Bool)

(assert (=> b!253585 m!381765))

(assert (=> b!253585 m!381761))

(assert (=> b!253585 m!381759))

(assert (=> b!253585 m!380197))

(assert (=> b!253585 m!381757))

(declare-fun m!381767 () Bool)

(assert (=> b!253585 m!381767))

(assert (=> d!84258 d!84898))

(declare-fun d!84900 () Bool)

(declare-fun e!175722 () Bool)

(assert (=> d!84900 e!175722))

(declare-fun res!212485 () Bool)

(assert (=> d!84900 (=> (not res!212485) (not e!175722))))

(declare-fun lt!393793 () (_ BitVec 64))

(declare-fun lt!393797 () (_ BitVec 64))

(declare-fun lt!393796 () (_ BitVec 64))

(assert (=> d!84900 (= res!212485 (= lt!393796 (bvsub lt!393793 lt!393797)))))

(assert (=> d!84900 (or (= (bvand lt!393793 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393797 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393793 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393793 lt!393797) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84900 (= lt!393797 (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11797 lt!392694)))) ((_ sign_extend 32) (currentByte!11985 (_1!11797 lt!392694))) ((_ sign_extend 32) (currentBit!11980 (_1!11797 lt!392694)))))))

(declare-fun lt!393798 () (_ BitVec 64))

(declare-fun lt!393795 () (_ BitVec 64))

(assert (=> d!84900 (= lt!393793 (bvmul lt!393798 lt!393795))))

(assert (=> d!84900 (or (= lt!393798 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!393795 (bvsdiv (bvmul lt!393798 lt!393795) lt!393798)))))

(assert (=> d!84900 (= lt!393795 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84900 (= lt!393798 ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11797 lt!392694)))))))

(assert (=> d!84900 (= lt!393796 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11985 (_1!11797 lt!392694))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11980 (_1!11797 lt!392694)))))))

(assert (=> d!84900 (invariant!0 (currentBit!11980 (_1!11797 lt!392694)) (currentByte!11985 (_1!11797 lt!392694)) (size!6028 (buf!6530 (_1!11797 lt!392694))))))

(assert (=> d!84900 (= (bitIndex!0 (size!6028 (buf!6530 (_1!11797 lt!392694))) (currentByte!11985 (_1!11797 lt!392694)) (currentBit!11980 (_1!11797 lt!392694))) lt!393796)))

(declare-fun b!253586 () Bool)

(declare-fun res!212484 () Bool)

(assert (=> b!253586 (=> (not res!212484) (not e!175722))))

(assert (=> b!253586 (= res!212484 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393796))))

(declare-fun b!253587 () Bool)

(declare-fun lt!393794 () (_ BitVec 64))

(assert (=> b!253587 (= e!175722 (bvsle lt!393796 (bvmul lt!393794 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253587 (or (= lt!393794 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!393794 #b0000000000000000000000000000000000000000000000000000000000001000) lt!393794)))))

(assert (=> b!253587 (= lt!393794 ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11797 lt!392694)))))))

(assert (= (and d!84900 res!212485) b!253586))

(assert (= (and b!253586 res!212484) b!253587))

(declare-fun m!381769 () Bool)

(assert (=> d!84900 m!381769))

(declare-fun m!381771 () Bool)

(assert (=> d!84900 m!381771))

(assert (=> b!252846 d!84900))

(declare-fun d!84902 () Bool)

(declare-fun e!175723 () Bool)

(assert (=> d!84902 e!175723))

(declare-fun res!212487 () Bool)

(assert (=> d!84902 (=> (not res!212487) (not e!175723))))

(declare-fun lt!393803 () (_ BitVec 64))

(declare-fun lt!393802 () (_ BitVec 64))

(declare-fun lt!393799 () (_ BitVec 64))

(assert (=> d!84902 (= res!212487 (= lt!393802 (bvsub lt!393799 lt!393803)))))

(assert (=> d!84902 (or (= (bvand lt!393799 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393803 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393799 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393799 lt!393803) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84902 (= lt!393803 (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392692)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392692))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392692)))))))

(declare-fun lt!393804 () (_ BitVec 64))

(declare-fun lt!393801 () (_ BitVec 64))

(assert (=> d!84902 (= lt!393799 (bvmul lt!393804 lt!393801))))

(assert (=> d!84902 (or (= lt!393804 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!393801 (bvsdiv (bvmul lt!393804 lt!393801) lt!393804)))))

(assert (=> d!84902 (= lt!393801 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84902 (= lt!393804 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392692)))))))

(assert (=> d!84902 (= lt!393802 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392692))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392692)))))))

(assert (=> d!84902 (invariant!0 (currentBit!11980 (_2!11798 lt!392692)) (currentByte!11985 (_2!11798 lt!392692)) (size!6028 (buf!6530 (_2!11798 lt!392692))))))

(assert (=> d!84902 (= (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392692))) (currentByte!11985 (_2!11798 lt!392692)) (currentBit!11980 (_2!11798 lt!392692))) lt!393802)))

(declare-fun b!253588 () Bool)

(declare-fun res!212486 () Bool)

(assert (=> b!253588 (=> (not res!212486) (not e!175723))))

(assert (=> b!253588 (= res!212486 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393802))))

(declare-fun b!253589 () Bool)

(declare-fun lt!393800 () (_ BitVec 64))

(assert (=> b!253589 (= e!175723 (bvsle lt!393802 (bvmul lt!393800 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253589 (or (= lt!393800 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!393800 #b0000000000000000000000000000000000000000000000000000000000001000) lt!393800)))))

(assert (=> b!253589 (= lt!393800 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392692)))))))

(assert (= (and d!84902 res!212487) b!253588))

(assert (= (and b!253588 res!212486) b!253589))

(declare-fun m!381773 () Bool)

(assert (=> d!84902 m!381773))

(assert (=> d!84902 m!381591))

(assert (=> b!252846 d!84902))

(declare-fun d!84904 () Bool)

(assert (=> d!84904 (= (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392425)))) ((_ sign_extend 32) (currentByte!11985 thiss!1005)) ((_ sign_extend 32) (currentBit!11980 thiss!1005))) (bvsub (bvmul ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392425)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11985 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11980 thiss!1005)))))))

(assert (=> d!84306 d!84904))

(declare-fun b!253608 () Bool)

(declare-fun res!212501 () Bool)

(declare-fun e!175734 () Bool)

(assert (=> b!253608 (=> (not res!212501) (not e!175734))))

(declare-fun e!175738 () Bool)

(assert (=> b!253608 (= res!212501 e!175738)))

(declare-fun res!212499 () Bool)

(assert (=> b!253608 (=> res!212499 e!175738)))

(declare-fun lt!393834 () tuple2!21756)

(assert (=> b!253608 (= res!212499 (not (_1!11806 lt!393834)))))

(declare-fun b!253609 () Bool)

(declare-fun e!175736 () Bool)

(assert (=> b!253609 (= e!175736 (= bit!26 (_2!11797 (readBitPure!0 (_1!11799 lt!392429)))))))

(declare-fun b!253610 () Bool)

(declare-fun e!175735 () tuple2!21756)

(assert (=> b!253610 (= e!175735 (tuple2!21757 true (_1!11799 lt!392429)))))

(declare-fun b!253611 () Bool)

(declare-fun e!175737 () tuple2!21756)

(declare-fun lt!393837 () tuple2!21756)

(assert (=> b!253611 (= e!175737 (tuple2!21757 false (_2!11806 lt!393837)))))

(declare-fun b!253612 () Bool)

(assert (=> b!253612 (= e!175735 e!175737)))

(assert (=> b!253612 (= lt!393837 (readBit!0 (_1!11799 lt!392429)))))

(declare-fun c!11685 () Bool)

(assert (=> b!253612 (= c!11685 (not (= (_1!11806 lt!393837) bit!26)))))

(declare-fun d!84906 () Bool)

(assert (=> d!84906 e!175734))

(declare-fun res!212502 () Bool)

(assert (=> d!84906 (=> (not res!212502) (not e!175734))))

(declare-fun lt!393835 () (_ BitVec 64))

(assert (=> d!84906 (= res!212502 (bvsge (bvsub lt!393835 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!6028 (buf!6530 (_2!11806 lt!393834))) (currentByte!11985 (_2!11806 lt!393834)) (currentBit!11980 (_2!11806 lt!393834)))))))

(assert (=> d!84906 (or (= (bvand lt!393835 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393835 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393835 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!393830 () (_ BitVec 64))

(assert (=> d!84906 (= lt!393835 (bvadd lt!393830 nBits!297))))

(assert (=> d!84906 (or (not (= (bvand lt!393830 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393830 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393830 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84906 (= lt!393830 (bitIndex!0 (size!6028 (buf!6530 (_1!11799 lt!392429))) (currentByte!11985 (_1!11799 lt!392429)) (currentBit!11980 (_1!11799 lt!392429))))))

(assert (=> d!84906 (= lt!393834 e!175735)))

(declare-fun c!11686 () Bool)

(assert (=> d!84906 (= c!11686 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297))))

(assert (=> d!84906 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!84906 (= (checkBitsLoop!0 (_1!11799 lt!392429) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!393834)))

(declare-fun lt!393833 () tuple2!21756)

(declare-fun b!253613 () Bool)

(assert (=> b!253613 (= lt!393833 (checkBitsLoop!0 (_2!11806 lt!393837) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!393829 () Unit!18204)

(declare-fun lt!393828 () Unit!18204)

(assert (=> b!253613 (= lt!393829 lt!393828)))

(declare-fun lt!393836 () (_ BitVec 64))

(declare-fun lt!393831 () (_ BitVec 64))

(assert (=> b!253613 (validate_offset_bits!1 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11806 lt!393837)))) ((_ sign_extend 32) (currentByte!11985 (_2!11806 lt!393837))) ((_ sign_extend 32) (currentBit!11980 (_2!11806 lt!393837))) (bvsub lt!393836 lt!393831))))

(assert (=> b!253613 (= lt!393828 (validateOffsetBitsIneqLemma!0 (_1!11799 lt!392429) (_2!11806 lt!393837) lt!393836 lt!393831))))

(assert (=> b!253613 (= lt!393831 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!253613 (= lt!393836 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!253613 (= e!175737 (tuple2!21757 (_1!11806 lt!393833) (_2!11806 lt!393833)))))

(declare-fun b!253614 () Bool)

(assert (=> b!253614 (= e!175734 e!175736)))

(declare-fun res!212500 () Bool)

(assert (=> b!253614 (=> res!212500 e!175736)))

(assert (=> b!253614 (= res!212500 (or (not (_1!11806 lt!393834)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297)))))

(declare-fun b!253615 () Bool)

(declare-fun lt!393832 () (_ BitVec 64))

(assert (=> b!253615 (= e!175738 (= (bvsub lt!393832 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!6028 (buf!6530 (_2!11806 lt!393834))) (currentByte!11985 (_2!11806 lt!393834)) (currentBit!11980 (_2!11806 lt!393834)))))))

(assert (=> b!253615 (or (= (bvand lt!393832 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393832 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393832 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!393827 () (_ BitVec 64))

(assert (=> b!253615 (= lt!393832 (bvadd lt!393827 nBits!297))))

(assert (=> b!253615 (or (not (= (bvand lt!393827 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393827 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393827 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253615 (= lt!393827 (bitIndex!0 (size!6028 (buf!6530 (_1!11799 lt!392429))) (currentByte!11985 (_1!11799 lt!392429)) (currentBit!11980 (_1!11799 lt!392429))))))

(declare-fun b!253616 () Bool)

(declare-fun res!212498 () Bool)

(assert (=> b!253616 (=> (not res!212498) (not e!175734))))

(assert (=> b!253616 (= res!212498 (and (= (buf!6530 (_1!11799 lt!392429)) (buf!6530 (_2!11806 lt!393834))) (or (not (= nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (_1!11806 lt!393834))))))

(assert (= (and d!84906 c!11686) b!253610))

(assert (= (and d!84906 (not c!11686)) b!253612))

(assert (= (and b!253612 c!11685) b!253611))

(assert (= (and b!253612 (not c!11685)) b!253613))

(assert (= (and d!84906 res!212502) b!253616))

(assert (= (and b!253616 res!212498) b!253608))

(assert (= (and b!253608 (not res!212499)) b!253615))

(assert (= (and b!253608 res!212501) b!253614))

(assert (= (and b!253614 (not res!212500)) b!253609))

(declare-fun m!381775 () Bool)

(assert (=> b!253612 m!381775))

(declare-fun m!381777 () Bool)

(assert (=> b!253609 m!381777))

(declare-fun m!381779 () Bool)

(assert (=> d!84906 m!381779))

(declare-fun m!381781 () Bool)

(assert (=> d!84906 m!381781))

(declare-fun m!381783 () Bool)

(assert (=> b!253613 m!381783))

(declare-fun m!381785 () Bool)

(assert (=> b!253613 m!381785))

(declare-fun m!381787 () Bool)

(assert (=> b!253613 m!381787))

(assert (=> b!253615 m!381779))

(assert (=> b!253615 m!381781))

(assert (=> d!84326 d!84906))

(declare-fun d!84908 () Bool)

(declare-fun e!175739 () Bool)

(assert (=> d!84908 e!175739))

(declare-fun res!212503 () Bool)

(assert (=> d!84908 (=> (not res!212503) (not e!175739))))

(declare-fun lt!393839 () (_ BitVec 64))

(declare-fun lt!393838 () BitStream!10978)

(assert (=> d!84908 (= res!212503 (= (bvadd lt!393839 (bvsub lt!392649 lt!392656)) (bitIndex!0 (size!6028 (buf!6530 lt!393838)) (currentByte!11985 lt!393838) (currentBit!11980 lt!393838))))))

(assert (=> d!84908 (or (not (= (bvand lt!393839 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!392649 lt!392656) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393839 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393839 (bvsub lt!392649 lt!392656)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84908 (= lt!393839 (bitIndex!0 (size!6028 (buf!6530 (_2!11799 lt!392647))) (currentByte!11985 (_2!11799 lt!392647)) (currentBit!11980 (_2!11799 lt!392647))))))

(assert (=> d!84908 (= lt!393838 (_2!11798 (moveBitIndex!0 (_2!11799 lt!392647) (bvsub lt!392649 lt!392656))))))

(assert (=> d!84908 (moveBitIndexPrecond!0 (_2!11799 lt!392647) (bvsub lt!392649 lt!392656))))

(assert (=> d!84908 (= (withMovedBitIndex!0 (_2!11799 lt!392647) (bvsub lt!392649 lt!392656)) lt!393838)))

(declare-fun b!253617 () Bool)

(assert (=> b!253617 (= e!175739 (= (size!6028 (buf!6530 (_2!11799 lt!392647))) (size!6028 (buf!6530 lt!393838))))))

(assert (= (and d!84908 res!212503) b!253617))

(declare-fun m!381789 () Bool)

(assert (=> d!84908 m!381789))

(assert (=> d!84908 m!381611))

(declare-fun m!381791 () Bool)

(assert (=> d!84908 m!381791))

(declare-fun m!381793 () Bool)

(assert (=> d!84908 m!381793))

(assert (=> b!252820 d!84908))

(assert (=> b!252820 d!84338))

(assert (=> b!252820 d!84284))

(declare-fun b!253618 () Bool)

(declare-fun res!212507 () Bool)

(declare-fun e!175740 () Bool)

(assert (=> b!253618 (=> (not res!212507) (not e!175740))))

(declare-fun e!175744 () Bool)

(assert (=> b!253618 (= res!212507 e!175744)))

(declare-fun res!212505 () Bool)

(assert (=> b!253618 (=> res!212505 e!175744)))

(declare-fun lt!393847 () tuple2!21756)

(assert (=> b!253618 (= res!212505 (not (_1!11806 lt!393847)))))

(declare-fun b!253619 () Bool)

(declare-fun e!175742 () Bool)

(assert (=> b!253619 (= e!175742 (= bit!26 (_2!11797 (readBitPure!0 (_1!11799 lt!392424)))))))

(declare-fun b!253620 () Bool)

(declare-fun e!175741 () tuple2!21756)

(assert (=> b!253620 (= e!175741 (tuple2!21757 true (_1!11799 lt!392424)))))

(declare-fun b!253621 () Bool)

(declare-fun e!175743 () tuple2!21756)

(declare-fun lt!393850 () tuple2!21756)

(assert (=> b!253621 (= e!175743 (tuple2!21757 false (_2!11806 lt!393850)))))

(declare-fun b!253622 () Bool)

(assert (=> b!253622 (= e!175741 e!175743)))

(assert (=> b!253622 (= lt!393850 (readBit!0 (_1!11799 lt!392424)))))

(declare-fun c!11687 () Bool)

(assert (=> b!253622 (= c!11687 (not (= (_1!11806 lt!393850) bit!26)))))

(declare-fun d!84910 () Bool)

(assert (=> d!84910 e!175740))

(declare-fun res!212508 () Bool)

(assert (=> d!84910 (=> (not res!212508) (not e!175740))))

(declare-fun lt!393848 () (_ BitVec 64))

(assert (=> d!84910 (= res!212508 (bvsge (bvsub lt!393848 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!6028 (buf!6530 (_2!11806 lt!393847))) (currentByte!11985 (_2!11806 lt!393847)) (currentBit!11980 (_2!11806 lt!393847)))))))

(assert (=> d!84910 (or (= (bvand lt!393848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393848 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!393843 () (_ BitVec 64))

(assert (=> d!84910 (= lt!393848 (bvadd lt!393843 nBits!297))))

(assert (=> d!84910 (or (not (= (bvand lt!393843 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393843 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393843 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84910 (= lt!393843 (bitIndex!0 (size!6028 (buf!6530 (_1!11799 lt!392424))) (currentByte!11985 (_1!11799 lt!392424)) (currentBit!11980 (_1!11799 lt!392424))))))

(assert (=> d!84910 (= lt!393847 e!175741)))

(declare-fun c!11688 () Bool)

(assert (=> d!84910 (= c!11688 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297))))

(assert (=> d!84910 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!84910 (= (checkBitsLoop!0 (_1!11799 lt!392424) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!393847)))

(declare-fun b!253623 () Bool)

(declare-fun lt!393846 () tuple2!21756)

(assert (=> b!253623 (= lt!393846 (checkBitsLoop!0 (_2!11806 lt!393850) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!393842 () Unit!18204)

(declare-fun lt!393841 () Unit!18204)

(assert (=> b!253623 (= lt!393842 lt!393841)))

(declare-fun lt!393849 () (_ BitVec 64))

(declare-fun lt!393844 () (_ BitVec 64))

(assert (=> b!253623 (validate_offset_bits!1 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11806 lt!393850)))) ((_ sign_extend 32) (currentByte!11985 (_2!11806 lt!393850))) ((_ sign_extend 32) (currentBit!11980 (_2!11806 lt!393850))) (bvsub lt!393849 lt!393844))))

(assert (=> b!253623 (= lt!393841 (validateOffsetBitsIneqLemma!0 (_1!11799 lt!392424) (_2!11806 lt!393850) lt!393849 lt!393844))))

(assert (=> b!253623 (= lt!393844 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!253623 (= lt!393849 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!253623 (= e!175743 (tuple2!21757 (_1!11806 lt!393846) (_2!11806 lt!393846)))))

(declare-fun b!253624 () Bool)

(assert (=> b!253624 (= e!175740 e!175742)))

(declare-fun res!212506 () Bool)

(assert (=> b!253624 (=> res!212506 e!175742)))

(assert (=> b!253624 (= res!212506 (or (not (_1!11806 lt!393847)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297)))))

(declare-fun lt!393845 () (_ BitVec 64))

(declare-fun b!253625 () Bool)

(assert (=> b!253625 (= e!175744 (= (bvsub lt!393845 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!6028 (buf!6530 (_2!11806 lt!393847))) (currentByte!11985 (_2!11806 lt!393847)) (currentBit!11980 (_2!11806 lt!393847)))))))

(assert (=> b!253625 (or (= (bvand lt!393845 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393845 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393845 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!393840 () (_ BitVec 64))

(assert (=> b!253625 (= lt!393845 (bvadd lt!393840 nBits!297))))

(assert (=> b!253625 (or (not (= (bvand lt!393840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393840 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253625 (= lt!393840 (bitIndex!0 (size!6028 (buf!6530 (_1!11799 lt!392424))) (currentByte!11985 (_1!11799 lt!392424)) (currentBit!11980 (_1!11799 lt!392424))))))

(declare-fun b!253626 () Bool)

(declare-fun res!212504 () Bool)

(assert (=> b!253626 (=> (not res!212504) (not e!175740))))

(assert (=> b!253626 (= res!212504 (and (= (buf!6530 (_1!11799 lt!392424)) (buf!6530 (_2!11806 lt!393847))) (or (not (= nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (_1!11806 lt!393847))))))

(assert (= (and d!84910 c!11688) b!253620))

(assert (= (and d!84910 (not c!11688)) b!253622))

(assert (= (and b!253622 c!11687) b!253621))

(assert (= (and b!253622 (not c!11687)) b!253623))

(assert (= (and d!84910 res!212508) b!253626))

(assert (= (and b!253626 res!212504) b!253618))

(assert (= (and b!253618 (not res!212505)) b!253625))

(assert (= (and b!253618 res!212507) b!253624))

(assert (= (and b!253624 (not res!212506)) b!253619))

(declare-fun m!381795 () Bool)

(assert (=> b!253622 m!381795))

(declare-fun m!381797 () Bool)

(assert (=> b!253619 m!381797))

(declare-fun m!381799 () Bool)

(assert (=> d!84910 m!381799))

(declare-fun m!381801 () Bool)

(assert (=> d!84910 m!381801))

(declare-fun m!381803 () Bool)

(assert (=> b!253623 m!381803))

(declare-fun m!381805 () Bool)

(assert (=> b!253623 m!381805))

(declare-fun m!381807 () Bool)

(assert (=> b!253623 m!381807))

(assert (=> b!253625 m!381799))

(assert (=> b!253625 m!381801))

(assert (=> d!84272 d!84910))

(declare-fun d!84912 () Bool)

(assert (=> d!84912 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392415)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392415)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415)))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21473 () Bool)

(assert (= bs!21473 d!84912))

(assert (=> bs!21473 m!380469))

(assert (=> b!252851 d!84912))

(assert (=> d!84312 d!84294))

(declare-fun d!84914 () Bool)

(assert (=> d!84914 (isPrefixOf!0 thiss!1005 (_2!11798 lt!392425))))

(assert (=> d!84914 true))

(declare-fun _$15!330 () Unit!18204)

(assert (=> d!84914 (= (choose!30 thiss!1005 (_2!11798 lt!392415) (_2!11798 lt!392425)) _$15!330)))

(declare-fun bs!21474 () Bool)

(assert (= bs!21474 d!84914))

(assert (=> bs!21474 m!380221))

(assert (=> d!84312 d!84914))

(assert (=> d!84312 d!84282))

(declare-fun d!84916 () Bool)

(assert (=> d!84916 (= (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11797 lt!392426)))) ((_ sign_extend 32) (currentByte!11985 (_1!11797 lt!392426))) ((_ sign_extend 32) (currentBit!11980 (_1!11797 lt!392426)))) (bvsub (bvmul ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11797 lt!392426)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11985 (_1!11797 lt!392426))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11980 (_1!11797 lt!392426))))))))

(assert (=> d!84270 d!84916))

(declare-fun d!84918 () Bool)

(assert (=> d!84918 (= (invariant!0 (currentBit!11980 (_1!11797 lt!392426)) (currentByte!11985 (_1!11797 lt!392426)) (size!6028 (buf!6530 (_1!11797 lt!392426)))) (and (bvsge (currentBit!11980 (_1!11797 lt!392426)) #b00000000000000000000000000000000) (bvslt (currentBit!11980 (_1!11797 lt!392426)) #b00000000000000000000000000001000) (bvsge (currentByte!11985 (_1!11797 lt!392426)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11985 (_1!11797 lt!392426)) (size!6028 (buf!6530 (_1!11797 lt!392426)))) (and (= (currentBit!11980 (_1!11797 lt!392426)) #b00000000000000000000000000000000) (= (currentByte!11985 (_1!11797 lt!392426)) (size!6028 (buf!6530 (_1!11797 lt!392426))))))))))

(assert (=> d!84270 d!84918))

(declare-fun d!84920 () Bool)

(assert (=> d!84920 (isPrefixOf!0 lt!392714 (_2!11798 lt!392425))))

(declare-fun lt!393851 () Unit!18204)

(assert (=> d!84920 (= lt!393851 (choose!30 lt!392714 thiss!1005 (_2!11798 lt!392425)))))

(assert (=> d!84920 (isPrefixOf!0 lt!392714 thiss!1005)))

(assert (=> d!84920 (= (lemmaIsPrefixTransitive!0 lt!392714 thiss!1005 (_2!11798 lt!392425)) lt!393851)))

(declare-fun bs!21475 () Bool)

(assert (= bs!21475 d!84920))

(assert (=> bs!21475 m!380511))

(declare-fun m!381809 () Bool)

(assert (=> bs!21475 m!381809))

(declare-fun m!381811 () Bool)

(assert (=> bs!21475 m!381811))

(assert (=> d!84310 d!84920))

(declare-fun d!84922 () Bool)

(declare-fun res!212510 () Bool)

(declare-fun e!175746 () Bool)

(assert (=> d!84922 (=> (not res!212510) (not e!175746))))

(assert (=> d!84922 (= res!212510 (= (size!6028 (buf!6530 (_1!11799 lt!392710))) (size!6028 (buf!6530 (_2!11799 lt!392710)))))))

(assert (=> d!84922 (= (isPrefixOf!0 (_1!11799 lt!392710) (_2!11799 lt!392710)) e!175746)))

(declare-fun b!253627 () Bool)

(declare-fun res!212509 () Bool)

(assert (=> b!253627 (=> (not res!212509) (not e!175746))))

(assert (=> b!253627 (= res!212509 (bvsle (bitIndex!0 (size!6028 (buf!6530 (_1!11799 lt!392710))) (currentByte!11985 (_1!11799 lt!392710)) (currentBit!11980 (_1!11799 lt!392710))) (bitIndex!0 (size!6028 (buf!6530 (_2!11799 lt!392710))) (currentByte!11985 (_2!11799 lt!392710)) (currentBit!11980 (_2!11799 lt!392710)))))))

(declare-fun b!253628 () Bool)

(declare-fun e!175745 () Bool)

(assert (=> b!253628 (= e!175746 e!175745)))

(declare-fun res!212511 () Bool)

(assert (=> b!253628 (=> res!212511 e!175745)))

(assert (=> b!253628 (= res!212511 (= (size!6028 (buf!6530 (_1!11799 lt!392710))) #b00000000000000000000000000000000))))

(declare-fun b!253629 () Bool)

(assert (=> b!253629 (= e!175745 (arrayBitRangesEq!0 (buf!6530 (_1!11799 lt!392710)) (buf!6530 (_2!11799 lt!392710)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6028 (buf!6530 (_1!11799 lt!392710))) (currentByte!11985 (_1!11799 lt!392710)) (currentBit!11980 (_1!11799 lt!392710)))))))

(assert (= (and d!84922 res!212510) b!253627))

(assert (= (and b!253627 res!212509) b!253628))

(assert (= (and b!253628 (not res!212511)) b!253629))

(assert (=> b!253627 m!381685))

(assert (=> b!253627 m!381691))

(assert (=> b!253629 m!381685))

(assert (=> b!253629 m!381685))

(declare-fun m!381813 () Bool)

(assert (=> b!253629 m!381813))

(assert (=> d!84310 d!84922))

(declare-fun d!84924 () Bool)

(declare-fun res!212513 () Bool)

(declare-fun e!175748 () Bool)

(assert (=> d!84924 (=> (not res!212513) (not e!175748))))

(assert (=> d!84924 (= res!212513 (= (size!6028 (buf!6530 thiss!1005)) (size!6028 (buf!6530 thiss!1005))))))

(assert (=> d!84924 (= (isPrefixOf!0 thiss!1005 thiss!1005) e!175748)))

(declare-fun b!253630 () Bool)

(declare-fun res!212512 () Bool)

(assert (=> b!253630 (=> (not res!212512) (not e!175748))))

(assert (=> b!253630 (= res!212512 (bvsle (bitIndex!0 (size!6028 (buf!6530 thiss!1005)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)) (bitIndex!0 (size!6028 (buf!6530 thiss!1005)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005))))))

(declare-fun b!253631 () Bool)

(declare-fun e!175747 () Bool)

(assert (=> b!253631 (= e!175748 e!175747)))

(declare-fun res!212514 () Bool)

(assert (=> b!253631 (=> res!212514 e!175747)))

(assert (=> b!253631 (= res!212514 (= (size!6028 (buf!6530 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!253632 () Bool)

(assert (=> b!253632 (= e!175747 (arrayBitRangesEq!0 (buf!6530 thiss!1005) (buf!6530 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6028 (buf!6530 thiss!1005)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005))))))

(assert (= (and d!84924 res!212513) b!253630))

(assert (= (and b!253630 res!212512) b!253631))

(assert (= (and b!253631 (not res!212514)) b!253632))

(assert (=> b!253630 m!380217))

(assert (=> b!253630 m!380217))

(assert (=> b!253632 m!380217))

(assert (=> b!253632 m!380217))

(declare-fun m!381815 () Bool)

(assert (=> b!253632 m!381815))

(assert (=> d!84310 d!84924))

(declare-fun d!84926 () Bool)

(assert (=> d!84926 (isPrefixOf!0 lt!392714 lt!392714)))

(declare-fun lt!393852 () Unit!18204)

(assert (=> d!84926 (= lt!393852 (choose!11 lt!392714))))

(assert (=> d!84926 (= (lemmaIsPrefixRefl!0 lt!392714) lt!393852)))

(declare-fun bs!21476 () Bool)

(assert (= bs!21476 d!84926))

(assert (=> bs!21476 m!380521))

(declare-fun m!381817 () Bool)

(assert (=> bs!21476 m!381817))

(assert (=> d!84310 d!84926))

(declare-fun d!84928 () Bool)

(assert (=> d!84928 (isPrefixOf!0 lt!392714 (_2!11798 lt!392425))))

(declare-fun lt!393853 () Unit!18204)

(assert (=> d!84928 (= lt!393853 (choose!30 lt!392714 (_2!11798 lt!392425) (_2!11798 lt!392425)))))

(assert (=> d!84928 (isPrefixOf!0 lt!392714 (_2!11798 lt!392425))))

(assert (=> d!84928 (= (lemmaIsPrefixTransitive!0 lt!392714 (_2!11798 lt!392425) (_2!11798 lt!392425)) lt!393853)))

(declare-fun bs!21477 () Bool)

(assert (= bs!21477 d!84928))

(assert (=> bs!21477 m!380511))

(declare-fun m!381819 () Bool)

(assert (=> bs!21477 m!381819))

(assert (=> bs!21477 m!380511))

(assert (=> d!84310 d!84928))

(assert (=> d!84310 d!84294))

(assert (=> d!84310 d!84850))

(assert (=> d!84310 d!84844))

(declare-fun d!84930 () Bool)

(declare-fun res!212516 () Bool)

(declare-fun e!175750 () Bool)

(assert (=> d!84930 (=> (not res!212516) (not e!175750))))

(assert (=> d!84930 (= res!212516 (= (size!6028 (buf!6530 lt!392714)) (size!6028 (buf!6530 (_2!11798 lt!392425)))))))

(assert (=> d!84930 (= (isPrefixOf!0 lt!392714 (_2!11798 lt!392425)) e!175750)))

(declare-fun b!253633 () Bool)

(declare-fun res!212515 () Bool)

(assert (=> b!253633 (=> (not res!212515) (not e!175750))))

(assert (=> b!253633 (= res!212515 (bvsle (bitIndex!0 (size!6028 (buf!6530 lt!392714)) (currentByte!11985 lt!392714) (currentBit!11980 lt!392714)) (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392425))) (currentByte!11985 (_2!11798 lt!392425)) (currentBit!11980 (_2!11798 lt!392425)))))))

(declare-fun b!253634 () Bool)

(declare-fun e!175749 () Bool)

(assert (=> b!253634 (= e!175750 e!175749)))

(declare-fun res!212517 () Bool)

(assert (=> b!253634 (=> res!212517 e!175749)))

(assert (=> b!253634 (= res!212517 (= (size!6028 (buf!6530 lt!392714)) #b00000000000000000000000000000000))))

(declare-fun b!253635 () Bool)

(assert (=> b!253635 (= e!175749 (arrayBitRangesEq!0 (buf!6530 lt!392714) (buf!6530 (_2!11798 lt!392425)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6028 (buf!6530 lt!392714)) (currentByte!11985 lt!392714) (currentBit!11980 lt!392714))))))

(assert (= (and d!84930 res!212516) b!253633))

(assert (= (and b!253633 res!212515) b!253634))

(assert (= (and b!253634 (not res!212517)) b!253635))

(declare-fun m!381821 () Bool)

(assert (=> b!253633 m!381821))

(assert (=> b!253633 m!380193))

(assert (=> b!253635 m!381821))

(assert (=> b!253635 m!381821))

(declare-fun m!381823 () Bool)

(assert (=> b!253635 m!381823))

(assert (=> d!84310 d!84930))

(declare-fun d!84932 () Bool)

(assert (=> d!84932 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-fun lt!393854 () Unit!18204)

(assert (=> d!84932 (= lt!393854 (choose!11 thiss!1005))))

(assert (=> d!84932 (= (lemmaIsPrefixRefl!0 thiss!1005) lt!393854)))

(declare-fun bs!21478 () Bool)

(assert (= bs!21478 d!84932))

(assert (=> bs!21478 m!380513))

(declare-fun m!381825 () Bool)

(assert (=> bs!21478 m!381825))

(assert (=> d!84310 d!84932))

(declare-fun d!84934 () Bool)

(declare-fun res!212519 () Bool)

(declare-fun e!175752 () Bool)

(assert (=> d!84934 (=> (not res!212519) (not e!175752))))

(assert (=> d!84934 (= res!212519 (= (size!6028 (buf!6530 lt!392714)) (size!6028 (buf!6530 lt!392714))))))

(assert (=> d!84934 (= (isPrefixOf!0 lt!392714 lt!392714) e!175752)))

(declare-fun b!253636 () Bool)

(declare-fun res!212518 () Bool)

(assert (=> b!253636 (=> (not res!212518) (not e!175752))))

(assert (=> b!253636 (= res!212518 (bvsle (bitIndex!0 (size!6028 (buf!6530 lt!392714)) (currentByte!11985 lt!392714) (currentBit!11980 lt!392714)) (bitIndex!0 (size!6028 (buf!6530 lt!392714)) (currentByte!11985 lt!392714) (currentBit!11980 lt!392714))))))

(declare-fun b!253637 () Bool)

(declare-fun e!175751 () Bool)

(assert (=> b!253637 (= e!175752 e!175751)))

(declare-fun res!212520 () Bool)

(assert (=> b!253637 (=> res!212520 e!175751)))

(assert (=> b!253637 (= res!212520 (= (size!6028 (buf!6530 lt!392714)) #b00000000000000000000000000000000))))

(declare-fun b!253638 () Bool)

(assert (=> b!253638 (= e!175751 (arrayBitRangesEq!0 (buf!6530 lt!392714) (buf!6530 lt!392714) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6028 (buf!6530 lt!392714)) (currentByte!11985 lt!392714) (currentBit!11980 lt!392714))))))

(assert (= (and d!84934 res!212519) b!253636))

(assert (= (and b!253636 res!212518) b!253637))

(assert (= (and b!253637 (not res!212520)) b!253638))

(assert (=> b!253636 m!381821))

(assert (=> b!253636 m!381821))

(assert (=> b!253638 m!381821))

(assert (=> b!253638 m!381821))

(declare-fun m!381827 () Bool)

(assert (=> b!253638 m!381827))

(assert (=> d!84310 d!84934))

(assert (=> d!84332 d!84300))

(declare-fun d!84936 () Bool)

(assert (=> d!84936 (= (invariant!0 (currentBit!11980 lt!392417) (currentByte!11985 lt!392417) (size!6028 (buf!6530 (_2!11798 lt!392425)))) (and (bvsge (currentBit!11980 lt!392417) #b00000000000000000000000000000000) (bvslt (currentBit!11980 lt!392417) #b00000000000000000000000000001000) (bvsge (currentByte!11985 lt!392417) #b00000000000000000000000000000000) (or (bvslt (currentByte!11985 lt!392417) (size!6028 (buf!6530 (_2!11798 lt!392425)))) (and (= (currentBit!11980 lt!392417) #b00000000000000000000000000000000) (= (currentByte!11985 lt!392417) (size!6028 (buf!6530 (_2!11798 lt!392425))))))))))

(assert (=> d!84332 d!84936))

(declare-fun d!84938 () Bool)

(declare-fun e!175753 () Bool)

(assert (=> d!84938 e!175753))

(declare-fun res!212522 () Bool)

(assert (=> d!84938 (=> (not res!212522) (not e!175753))))

(declare-fun lt!393858 () (_ BitVec 64))

(declare-fun lt!393859 () (_ BitVec 64))

(declare-fun lt!393855 () (_ BitVec 64))

(assert (=> d!84938 (= res!212522 (= lt!393858 (bvsub lt!393855 lt!393859)))))

(assert (=> d!84938 (or (= (bvand lt!393855 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393859 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393855 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393855 lt!393859) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84938 (= lt!393859 (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11797 lt!392828)))) ((_ sign_extend 32) (currentByte!11985 (_1!11797 lt!392828))) ((_ sign_extend 32) (currentBit!11980 (_1!11797 lt!392828)))))))

(declare-fun lt!393860 () (_ BitVec 64))

(declare-fun lt!393857 () (_ BitVec 64))

(assert (=> d!84938 (= lt!393855 (bvmul lt!393860 lt!393857))))

(assert (=> d!84938 (or (= lt!393860 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!393857 (bvsdiv (bvmul lt!393860 lt!393857) lt!393860)))))

(assert (=> d!84938 (= lt!393857 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84938 (= lt!393860 ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11797 lt!392828)))))))

(assert (=> d!84938 (= lt!393858 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11985 (_1!11797 lt!392828))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11980 (_1!11797 lt!392828)))))))

(assert (=> d!84938 (invariant!0 (currentBit!11980 (_1!11797 lt!392828)) (currentByte!11985 (_1!11797 lt!392828)) (size!6028 (buf!6530 (_1!11797 lt!392828))))))

(assert (=> d!84938 (= (bitIndex!0 (size!6028 (buf!6530 (_1!11797 lt!392828))) (currentByte!11985 (_1!11797 lt!392828)) (currentBit!11980 (_1!11797 lt!392828))) lt!393858)))

(declare-fun b!253639 () Bool)

(declare-fun res!212521 () Bool)

(assert (=> b!253639 (=> (not res!212521) (not e!175753))))

(assert (=> b!253639 (= res!212521 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393858))))

(declare-fun b!253640 () Bool)

(declare-fun lt!393856 () (_ BitVec 64))

(assert (=> b!253640 (= e!175753 (bvsle lt!393858 (bvmul lt!393856 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253640 (or (= lt!393856 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!393856 #b0000000000000000000000000000000000000000000000000000000000001000) lt!393856)))))

(assert (=> b!253640 (= lt!393856 ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11797 lt!392828)))))))

(assert (= (and d!84938 res!212522) b!253639))

(assert (= (and b!253639 res!212521) b!253640))

(declare-fun m!381829 () Bool)

(assert (=> d!84938 m!381829))

(declare-fun m!381831 () Bool)

(assert (=> d!84938 m!381831))

(assert (=> d!84332 d!84938))

(declare-fun d!84940 () Bool)

(declare-fun e!175756 () Bool)

(assert (=> d!84940 e!175756))

(declare-fun res!212525 () Bool)

(assert (=> d!84940 (=> (not res!212525) (not e!175756))))

(declare-fun lt!393867 () tuple2!21738)

(declare-fun lt!393868 () tuple2!21738)

(assert (=> d!84940 (= res!212525 (= (bitIndex!0 (size!6028 (buf!6530 (_1!11797 lt!393867))) (currentByte!11985 (_1!11797 lt!393867)) (currentBit!11980 (_1!11797 lt!393867))) (bitIndex!0 (size!6028 (buf!6530 (_1!11797 lt!393868))) (currentByte!11985 (_1!11797 lt!393868)) (currentBit!11980 (_1!11797 lt!393868)))))))

(declare-fun lt!393869 () BitStream!10978)

(assert (=> d!84940 (= lt!393868 (readBitPure!0 lt!393869))))

(assert (=> d!84940 (= lt!393867 (readBitPure!0 lt!392417))))

(assert (=> d!84940 (= lt!393869 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 lt!392417) (currentBit!11980 lt!392417)))))

(assert (=> d!84940 (invariant!0 (currentBit!11980 lt!392417) (currentByte!11985 lt!392417) (size!6028 (buf!6530 (_2!11798 lt!392425))))))

(assert (=> d!84940 true))

(declare-fun _$9!111 () Unit!18204)

(assert (=> d!84940 (= (choose!50 lt!392417 (_2!11798 lt!392425) lt!392829 lt!392831 (tuple2!21739 (_1!11797 lt!392831) (_2!11797 lt!392831)) (_1!11797 lt!392831) (_2!11797 lt!392831) lt!392828 (tuple2!21739 (_1!11797 lt!392828) (_2!11797 lt!392828)) (_1!11797 lt!392828) (_2!11797 lt!392828)) _$9!111)))

(declare-fun b!253643 () Bool)

(assert (=> b!253643 (= e!175756 (= (_2!11797 lt!393867) (_2!11797 lt!393868)))))

(assert (= (and d!84940 res!212525) b!253643))

(assert (=> d!84940 m!380595))

(assert (=> d!84940 m!380251))

(declare-fun m!381833 () Bool)

(assert (=> d!84940 m!381833))

(declare-fun m!381835 () Bool)

(assert (=> d!84940 m!381835))

(declare-fun m!381837 () Bool)

(assert (=> d!84940 m!381837))

(assert (=> d!84332 d!84940))

(declare-fun d!84942 () Bool)

(declare-fun lt!393870 () tuple2!21756)

(assert (=> d!84942 (= lt!393870 (readBit!0 lt!392829))))

(assert (=> d!84942 (= (readBitPure!0 lt!392829) (tuple2!21739 (_2!11806 lt!393870) (_1!11806 lt!393870)))))

(declare-fun bs!21479 () Bool)

(assert (= bs!21479 d!84942))

(declare-fun m!381839 () Bool)

(assert (=> bs!21479 m!381839))

(assert (=> d!84332 d!84942))

(declare-fun d!84944 () Bool)

(declare-fun e!175757 () Bool)

(assert (=> d!84944 e!175757))

(declare-fun res!212527 () Bool)

(assert (=> d!84944 (=> (not res!212527) (not e!175757))))

(declare-fun lt!393875 () (_ BitVec 64))

(declare-fun lt!393874 () (_ BitVec 64))

(declare-fun lt!393871 () (_ BitVec 64))

(assert (=> d!84944 (= res!212527 (= lt!393874 (bvsub lt!393871 lt!393875)))))

(assert (=> d!84944 (or (= (bvand lt!393871 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393875 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393871 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393871 lt!393875) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84944 (= lt!393875 (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11797 lt!392831)))) ((_ sign_extend 32) (currentByte!11985 (_1!11797 lt!392831))) ((_ sign_extend 32) (currentBit!11980 (_1!11797 lt!392831)))))))

(declare-fun lt!393876 () (_ BitVec 64))

(declare-fun lt!393873 () (_ BitVec 64))

(assert (=> d!84944 (= lt!393871 (bvmul lt!393876 lt!393873))))

(assert (=> d!84944 (or (= lt!393876 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!393873 (bvsdiv (bvmul lt!393876 lt!393873) lt!393876)))))

(assert (=> d!84944 (= lt!393873 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84944 (= lt!393876 ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11797 lt!392831)))))))

(assert (=> d!84944 (= lt!393874 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11985 (_1!11797 lt!392831))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11980 (_1!11797 lt!392831)))))))

(assert (=> d!84944 (invariant!0 (currentBit!11980 (_1!11797 lt!392831)) (currentByte!11985 (_1!11797 lt!392831)) (size!6028 (buf!6530 (_1!11797 lt!392831))))))

(assert (=> d!84944 (= (bitIndex!0 (size!6028 (buf!6530 (_1!11797 lt!392831))) (currentByte!11985 (_1!11797 lt!392831)) (currentBit!11980 (_1!11797 lt!392831))) lt!393874)))

(declare-fun b!253644 () Bool)

(declare-fun res!212526 () Bool)

(assert (=> b!253644 (=> (not res!212526) (not e!175757))))

(assert (=> b!253644 (= res!212526 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393874))))

(declare-fun b!253645 () Bool)

(declare-fun lt!393872 () (_ BitVec 64))

(assert (=> b!253645 (= e!175757 (bvsle lt!393874 (bvmul lt!393872 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253645 (or (= lt!393872 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!393872 #b0000000000000000000000000000000000000000000000000000000000001000) lt!393872)))))

(assert (=> b!253645 (= lt!393872 ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11797 lt!392831)))))))

(assert (= (and d!84944 res!212527) b!253644))

(assert (= (and b!253644 res!212526) b!253645))

(declare-fun m!381841 () Bool)

(assert (=> d!84944 m!381841))

(declare-fun m!381843 () Bool)

(assert (=> d!84944 m!381843))

(assert (=> d!84332 d!84944))

(declare-fun d!84946 () Bool)

(declare-fun e!175758 () Bool)

(assert (=> d!84946 e!175758))

(declare-fun res!212528 () Bool)

(assert (=> d!84946 (=> (not res!212528) (not e!175758))))

(assert (=> d!84946 (= res!212528 (= (buf!6530 (_2!11798 (increaseBitIndex!0 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005))))) (buf!6530 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)))))))

(declare-fun lt!393879 () Bool)

(assert (=> d!84946 (= lt!393879 (not (= (bvand ((_ sign_extend 24) (select (arr!7015 (buf!6530 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)))) (currentByte!11985 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11980 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!393878 () tuple2!21756)

(assert (=> d!84946 (= lt!393878 (tuple2!21757 (not (= (bvand ((_ sign_extend 24) (select (arr!7015 (buf!6530 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)))) (currentByte!11985 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11980 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)))))) #b00000000000000000000000000000000)) (_2!11798 (increaseBitIndex!0 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005))))))))

(assert (=> d!84946 (validate_offset_bit!0 ((_ sign_extend 32) (size!6028 (buf!6530 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005))))) ((_ sign_extend 32) (currentByte!11985 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)))) ((_ sign_extend 32) (currentBit!11980 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)))))))

(assert (=> d!84946 (= (readBit!0 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005))) lt!393878)))

(declare-fun b!253646 () Bool)

(declare-fun lt!393881 () (_ BitVec 64))

(declare-fun lt!393883 () (_ BitVec 64))

(assert (=> b!253646 (= e!175758 (= (bitIndex!0 (size!6028 (buf!6530 (_2!11798 (increaseBitIndex!0 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)))))) (currentByte!11985 (_2!11798 (increaseBitIndex!0 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005))))) (currentBit!11980 (_2!11798 (increaseBitIndex!0 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)))))) (bvadd lt!393883 lt!393881)))))

(assert (=> b!253646 (or (not (= (bvand lt!393883 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393881 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393883 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393883 lt!393881) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253646 (= lt!393881 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!253646 (= lt!393883 (bitIndex!0 (size!6028 (buf!6530 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)))) (currentByte!11985 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005))) (currentBit!11980 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)))))))

(declare-fun lt!393877 () Bool)

(assert (=> b!253646 (= lt!393877 (not (= (bvand ((_ sign_extend 24) (select (arr!7015 (buf!6530 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)))) (currentByte!11985 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11980 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!393882 () Bool)

(assert (=> b!253646 (= lt!393882 (not (= (bvand ((_ sign_extend 24) (select (arr!7015 (buf!6530 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)))) (currentByte!11985 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11980 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!393880 () Bool)

(assert (=> b!253646 (= lt!393880 (not (= (bvand ((_ sign_extend 24) (select (arr!7015 (buf!6530 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)))) (currentByte!11985 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11980 (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!84946 res!212528) b!253646))

(declare-fun m!381845 () Bool)

(assert (=> d!84946 m!381845))

(declare-fun m!381847 () Bool)

(assert (=> d!84946 m!381847))

(declare-fun m!381849 () Bool)

(assert (=> d!84946 m!381849))

(declare-fun m!381851 () Bool)

(assert (=> d!84946 m!381851))

(declare-fun m!381853 () Bool)

(assert (=> b!253646 m!381853))

(assert (=> b!253646 m!381849))

(assert (=> b!253646 m!381847))

(assert (=> b!253646 m!381845))

(declare-fun m!381855 () Bool)

(assert (=> b!253646 m!381855))

(assert (=> d!84290 d!84946))

(declare-fun d!84948 () Bool)

(assert (=> d!84948 (= (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11797 lt!392427)))) ((_ sign_extend 32) (currentByte!11985 (_1!11797 lt!392427))) ((_ sign_extend 32) (currentBit!11980 (_1!11797 lt!392427)))) (bvsub (bvmul ((_ sign_extend 32) (size!6028 (buf!6530 (_1!11797 lt!392427)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11985 (_1!11797 lt!392427))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11980 (_1!11797 lt!392427))))))))

(assert (=> d!84288 d!84948))

(declare-fun d!84950 () Bool)

(assert (=> d!84950 (= (invariant!0 (currentBit!11980 (_1!11797 lt!392427)) (currentByte!11985 (_1!11797 lt!392427)) (size!6028 (buf!6530 (_1!11797 lt!392427)))) (and (bvsge (currentBit!11980 (_1!11797 lt!392427)) #b00000000000000000000000000000000) (bvslt (currentBit!11980 (_1!11797 lt!392427)) #b00000000000000000000000000001000) (bvsge (currentByte!11985 (_1!11797 lt!392427)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11985 (_1!11797 lt!392427)) (size!6028 (buf!6530 (_1!11797 lt!392427)))) (and (= (currentBit!11980 (_1!11797 lt!392427)) #b00000000000000000000000000000000) (= (currentByte!11985 (_1!11797 lt!392427)) (size!6028 (buf!6530 (_1!11797 lt!392427))))))))))

(assert (=> d!84288 d!84950))

(declare-fun d!84952 () Bool)

(declare-fun e!175759 () Bool)

(assert (=> d!84952 e!175759))

(declare-fun res!212530 () Bool)

(assert (=> d!84952 (=> (not res!212530) (not e!175759))))

(declare-fun lt!393884 () (_ BitVec 64))

(declare-fun lt!393888 () (_ BitVec 64))

(declare-fun lt!393887 () (_ BitVec 64))

(assert (=> d!84952 (= res!212530 (= lt!393887 (bvsub lt!393884 lt!393888)))))

(assert (=> d!84952 (or (= (bvand lt!393884 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393888 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393884 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393884 lt!393888) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84952 (= lt!393888 (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392756)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392756))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392756)))))))

(declare-fun lt!393889 () (_ BitVec 64))

(declare-fun lt!393886 () (_ BitVec 64))

(assert (=> d!84952 (= lt!393884 (bvmul lt!393889 lt!393886))))

(assert (=> d!84952 (or (= lt!393889 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!393886 (bvsdiv (bvmul lt!393889 lt!393886) lt!393889)))))

(assert (=> d!84952 (= lt!393886 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84952 (= lt!393889 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392756)))))))

(assert (=> d!84952 (= lt!393887 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392756))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392756)))))))

(assert (=> d!84952 (invariant!0 (currentBit!11980 (_2!11798 lt!392756)) (currentByte!11985 (_2!11798 lt!392756)) (size!6028 (buf!6530 (_2!11798 lt!392756))))))

(assert (=> d!84952 (= (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392756))) (currentByte!11985 (_2!11798 lt!392756)) (currentBit!11980 (_2!11798 lt!392756))) lt!393887)))

(declare-fun b!253647 () Bool)

(declare-fun res!212529 () Bool)

(assert (=> b!253647 (=> (not res!212529) (not e!175759))))

(assert (=> b!253647 (= res!212529 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393887))))

(declare-fun b!253648 () Bool)

(declare-fun lt!393885 () (_ BitVec 64))

(assert (=> b!253648 (= e!175759 (bvsle lt!393887 (bvmul lt!393885 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253648 (or (= lt!393885 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!393885 #b0000000000000000000000000000000000000000000000000000000000001000) lt!393885)))))

(assert (=> b!253648 (= lt!393885 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392756)))))))

(assert (= (and d!84952 res!212530) b!253647))

(assert (= (and b!253647 res!212529) b!253648))

(declare-fun m!381857 () Bool)

(assert (=> d!84952 m!381857))

(declare-fun m!381859 () Bool)

(assert (=> d!84952 m!381859))

(assert (=> b!252865 d!84952))

(assert (=> b!252865 d!84284))

(assert (=> d!84274 d!84808))

(assert (=> b!252856 d!84286))

(declare-fun d!84954 () Bool)

(assert (=> d!84954 (arrayBitRangesEq!0 (buf!6530 (_2!11798 lt!392425)) (buf!6530 thiss!1005) lt!392709 lt!392722)))

(declare-fun lt!393890 () Unit!18204)

(assert (=> d!84954 (= lt!393890 (choose!8 (buf!6530 thiss!1005) (buf!6530 (_2!11798 lt!392425)) lt!392709 lt!392722))))

(assert (=> d!84954 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!392709) (bvsle lt!392709 lt!392722))))

(assert (=> d!84954 (= (arrayBitRangesEqSymmetric!0 (buf!6530 thiss!1005) (buf!6530 (_2!11798 lt!392425)) lt!392709 lt!392722) lt!393890)))

(declare-fun bs!21480 () Bool)

(assert (= bs!21480 d!84954))

(assert (=> bs!21480 m!380531))

(declare-fun m!381861 () Bool)

(assert (=> bs!21480 m!381861))

(assert (=> b!252856 d!84954))

(declare-fun lt!393893 () (_ BitVec 32))

(declare-fun bm!3984 () Bool)

(declare-fun lt!393891 () (_ BitVec 32))

(declare-fun c!11689 () Bool)

(declare-fun lt!393892 () tuple4!300)

(declare-fun call!3987 () Bool)

(assert (=> bm!3984 (= call!3987 (byteRangesEq!0 (select (arr!7015 (buf!6530 (_2!11798 lt!392425))) (_3!930 lt!393892)) (select (arr!7015 (buf!6530 thiss!1005)) (_3!930 lt!393892)) lt!393893 (ite c!11689 lt!393891 #b00000000000000000000000000001000)))))

(declare-fun b!253649 () Bool)

(declare-fun res!212532 () Bool)

(assert (=> b!253649 (= res!212532 (= lt!393891 #b00000000000000000000000000000000))))

(declare-fun e!175764 () Bool)

(assert (=> b!253649 (=> res!212532 e!175764)))

(declare-fun e!175765 () Bool)

(assert (=> b!253649 (= e!175765 e!175764)))

(declare-fun d!84956 () Bool)

(declare-fun res!212533 () Bool)

(declare-fun e!175760 () Bool)

(assert (=> d!84956 (=> res!212533 e!175760)))

(assert (=> d!84956 (= res!212533 (bvsge lt!392709 lt!392722))))

(assert (=> d!84956 (= (arrayBitRangesEq!0 (buf!6530 (_2!11798 lt!392425)) (buf!6530 thiss!1005) lt!392709 lt!392722) e!175760)))

(declare-fun b!253650 () Bool)

(declare-fun e!175761 () Bool)

(assert (=> b!253650 (= e!175760 e!175761)))

(declare-fun res!212531 () Bool)

(assert (=> b!253650 (=> (not res!212531) (not e!175761))))

(declare-fun e!175763 () Bool)

(assert (=> b!253650 (= res!212531 e!175763)))

(declare-fun res!212535 () Bool)

(assert (=> b!253650 (=> res!212535 e!175763)))

(assert (=> b!253650 (= res!212535 (bvsge (_1!11811 lt!393892) (_2!11811 lt!393892)))))

(assert (=> b!253650 (= lt!393891 ((_ extract 31 0) (bvsrem lt!392722 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253650 (= lt!393893 ((_ extract 31 0) (bvsrem lt!392709 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253650 (= lt!393892 (arrayBitIndices!0 lt!392709 lt!392722))))

(declare-fun b!253651 () Bool)

(declare-fun e!175762 () Bool)

(assert (=> b!253651 (= e!175761 e!175762)))

(assert (=> b!253651 (= c!11689 (= (_3!930 lt!393892) (_4!150 lt!393892)))))

(declare-fun b!253652 () Bool)

(assert (=> b!253652 (= e!175763 (arrayRangesEq!927 (buf!6530 (_2!11798 lt!392425)) (buf!6530 thiss!1005) (_1!11811 lt!393892) (_2!11811 lt!393892)))))

(declare-fun b!253653 () Bool)

(assert (=> b!253653 (= e!175762 call!3987)))

(declare-fun b!253654 () Bool)

(assert (=> b!253654 (= e!175764 (byteRangesEq!0 (select (arr!7015 (buf!6530 (_2!11798 lt!392425))) (_4!150 lt!393892)) (select (arr!7015 (buf!6530 thiss!1005)) (_4!150 lt!393892)) #b00000000000000000000000000000000 lt!393891))))

(declare-fun b!253655 () Bool)

(assert (=> b!253655 (= e!175762 e!175765)))

(declare-fun res!212534 () Bool)

(assert (=> b!253655 (= res!212534 call!3987)))

(assert (=> b!253655 (=> (not res!212534) (not e!175765))))

(assert (= (and d!84956 (not res!212533)) b!253650))

(assert (= (and b!253650 (not res!212535)) b!253652))

(assert (= (and b!253650 res!212531) b!253651))

(assert (= (and b!253651 c!11689) b!253653))

(assert (= (and b!253651 (not c!11689)) b!253655))

(assert (= (and b!253655 res!212534) b!253649))

(assert (= (and b!253649 (not res!212532)) b!253654))

(assert (= (or b!253653 b!253655) bm!3984))

(declare-fun m!381863 () Bool)

(assert (=> bm!3984 m!381863))

(declare-fun m!381865 () Bool)

(assert (=> bm!3984 m!381865))

(assert (=> bm!3984 m!381863))

(assert (=> bm!3984 m!381865))

(declare-fun m!381867 () Bool)

(assert (=> bm!3984 m!381867))

(declare-fun m!381869 () Bool)

(assert (=> b!253650 m!381869))

(declare-fun m!381871 () Bool)

(assert (=> b!253652 m!381871))

(declare-fun m!381873 () Bool)

(assert (=> b!253654 m!381873))

(declare-fun m!381875 () Bool)

(assert (=> b!253654 m!381875))

(assert (=> b!253654 m!381873))

(assert (=> b!253654 m!381875))

(declare-fun m!381877 () Bool)

(assert (=> b!253654 m!381877))

(assert (=> b!252856 d!84956))

(declare-fun d!84958 () Bool)

(declare-fun e!175766 () Bool)

(assert (=> d!84958 e!175766))

(declare-fun res!212536 () Bool)

(assert (=> d!84958 (=> (not res!212536) (not e!175766))))

(assert (=> d!84958 (= res!212536 (= (buf!6530 (_2!11798 (increaseBitIndex!0 lt!392417))) (buf!6530 lt!392417)))))

(declare-fun lt!393896 () Bool)

(assert (=> d!84958 (= lt!393896 (not (= (bvand ((_ sign_extend 24) (select (arr!7015 (buf!6530 lt!392417)) (currentByte!11985 lt!392417))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11980 lt!392417)))) #b00000000000000000000000000000000)))))

(declare-fun lt!393895 () tuple2!21756)

(assert (=> d!84958 (= lt!393895 (tuple2!21757 (not (= (bvand ((_ sign_extend 24) (select (arr!7015 (buf!6530 lt!392417)) (currentByte!11985 lt!392417))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11980 lt!392417)))) #b00000000000000000000000000000000)) (_2!11798 (increaseBitIndex!0 lt!392417))))))

(assert (=> d!84958 (validate_offset_bit!0 ((_ sign_extend 32) (size!6028 (buf!6530 lt!392417))) ((_ sign_extend 32) (currentByte!11985 lt!392417)) ((_ sign_extend 32) (currentBit!11980 lt!392417)))))

(assert (=> d!84958 (= (readBit!0 lt!392417) lt!393895)))

(declare-fun b!253656 () Bool)

(declare-fun lt!393898 () (_ BitVec 64))

(declare-fun lt!393900 () (_ BitVec 64))

(assert (=> b!253656 (= e!175766 (= (bitIndex!0 (size!6028 (buf!6530 (_2!11798 (increaseBitIndex!0 lt!392417)))) (currentByte!11985 (_2!11798 (increaseBitIndex!0 lt!392417))) (currentBit!11980 (_2!11798 (increaseBitIndex!0 lt!392417)))) (bvadd lt!393900 lt!393898)))))

(assert (=> b!253656 (or (not (= (bvand lt!393900 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393898 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393900 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393900 lt!393898) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253656 (= lt!393898 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!253656 (= lt!393900 (bitIndex!0 (size!6028 (buf!6530 lt!392417)) (currentByte!11985 lt!392417) (currentBit!11980 lt!392417)))))

(declare-fun lt!393894 () Bool)

(assert (=> b!253656 (= lt!393894 (not (= (bvand ((_ sign_extend 24) (select (arr!7015 (buf!6530 lt!392417)) (currentByte!11985 lt!392417))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11980 lt!392417)))) #b00000000000000000000000000000000)))))

(declare-fun lt!393899 () Bool)

(assert (=> b!253656 (= lt!393899 (not (= (bvand ((_ sign_extend 24) (select (arr!7015 (buf!6530 lt!392417)) (currentByte!11985 lt!392417))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11980 lt!392417)))) #b00000000000000000000000000000000)))))

(declare-fun lt!393897 () Bool)

(assert (=> b!253656 (= lt!393897 (not (= (bvand ((_ sign_extend 24) (select (arr!7015 (buf!6530 lt!392417)) (currentByte!11985 lt!392417))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11980 lt!392417)))) #b00000000000000000000000000000000)))))

(assert (= (and d!84958 res!212536) b!253656))

(declare-fun m!381879 () Bool)

(assert (=> d!84958 m!381879))

(declare-fun m!381881 () Bool)

(assert (=> d!84958 m!381881))

(declare-fun m!381883 () Bool)

(assert (=> d!84958 m!381883))

(declare-fun m!381885 () Bool)

(assert (=> d!84958 m!381885))

(declare-fun m!381887 () Bool)

(assert (=> b!253656 m!381887))

(assert (=> b!253656 m!381883))

(assert (=> b!253656 m!381881))

(assert (=> b!253656 m!381879))

(declare-fun m!381889 () Bool)

(assert (=> b!253656 m!381889))

(assert (=> d!84300 d!84958))

(declare-fun d!84960 () Bool)

(declare-fun res!212538 () Bool)

(declare-fun e!175768 () Bool)

(assert (=> d!84960 (=> (not res!212538) (not e!175768))))

(assert (=> d!84960 (= res!212538 (= (size!6028 (buf!6530 (_2!11799 lt!392710))) (size!6028 (buf!6530 (_2!11798 lt!392425)))))))

(assert (=> d!84960 (= (isPrefixOf!0 (_2!11799 lt!392710) (_2!11798 lt!392425)) e!175768)))

(declare-fun b!253657 () Bool)

(declare-fun res!212537 () Bool)

(assert (=> b!253657 (=> (not res!212537) (not e!175768))))

(assert (=> b!253657 (= res!212537 (bvsle (bitIndex!0 (size!6028 (buf!6530 (_2!11799 lt!392710))) (currentByte!11985 (_2!11799 lt!392710)) (currentBit!11980 (_2!11799 lt!392710))) (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392425))) (currentByte!11985 (_2!11798 lt!392425)) (currentBit!11980 (_2!11798 lt!392425)))))))

(declare-fun b!253658 () Bool)

(declare-fun e!175767 () Bool)

(assert (=> b!253658 (= e!175768 e!175767)))

(declare-fun res!212539 () Bool)

(assert (=> b!253658 (=> res!212539 e!175767)))

(assert (=> b!253658 (= res!212539 (= (size!6028 (buf!6530 (_2!11799 lt!392710))) #b00000000000000000000000000000000))))

(declare-fun b!253659 () Bool)

(assert (=> b!253659 (= e!175767 (arrayBitRangesEq!0 (buf!6530 (_2!11799 lt!392710)) (buf!6530 (_2!11798 lt!392425)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6028 (buf!6530 (_2!11799 lt!392710))) (currentByte!11985 (_2!11799 lt!392710)) (currentBit!11980 (_2!11799 lt!392710)))))))

(assert (= (and d!84960 res!212538) b!253657))

(assert (= (and b!253657 res!212537) b!253658))

(assert (= (and b!253658 (not res!212539)) b!253659))

(assert (=> b!253657 m!381691))

(assert (=> b!253657 m!380193))

(assert (=> b!253659 m!381691))

(assert (=> b!253659 m!381691))

(declare-fun m!381891 () Bool)

(assert (=> b!253659 m!381891))

(assert (=> b!252854 d!84960))

(assert (=> d!84292 d!84306))

(declare-fun d!84962 () Bool)

(assert (=> d!84962 (validate_offset_bits!1 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392425)))) ((_ sign_extend 32) (currentByte!11985 thiss!1005)) ((_ sign_extend 32) (currentBit!11980 thiss!1005)) (bvsub nBits!297 from!289))))

(assert (=> d!84962 true))

(declare-fun _$6!429 () Unit!18204)

(assert (=> d!84962 (= (choose!9 thiss!1005 (buf!6530 (_2!11798 lt!392425)) (bvsub nBits!297 from!289) (BitStream!10979 (buf!6530 (_2!11798 lt!392425)) (currentByte!11985 thiss!1005) (currentBit!11980 thiss!1005))) _$6!429)))

(declare-fun bs!21481 () Bool)

(assert (= bs!21481 d!84962))

(assert (=> bs!21481 m!380245))

(assert (=> d!84292 d!84962))

(declare-fun lt!393901 () tuple2!21756)

(declare-fun d!84964 () Bool)

(assert (=> d!84964 (= lt!393901 (checkBitsLoop!0 (_1!11799 lt!392752) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!84964 (= (checkBitsLoopPure!0 (_1!11799 lt!392752) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21739 (_2!11806 lt!393901) (_1!11806 lt!393901)))))

(declare-fun bs!21482 () Bool)

(assert (= bs!21482 d!84964))

(declare-fun m!381893 () Bool)

(assert (=> bs!21482 m!381893))

(assert (=> b!252867 d!84964))

(declare-fun d!84966 () Bool)

(assert (=> d!84966 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392756)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415))) lt!392753) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392756)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415)))) lt!392753))))

(declare-fun bs!21483 () Bool)

(assert (= bs!21483 d!84966))

(declare-fun m!381895 () Bool)

(assert (=> bs!21483 m!381895))

(assert (=> b!252867 d!84966))

(declare-fun d!84968 () Bool)

(assert (=> d!84968 (validate_offset_bits!1 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11798 lt!392756)))) ((_ sign_extend 32) (currentByte!11985 (_2!11798 lt!392415))) ((_ sign_extend 32) (currentBit!11980 (_2!11798 lt!392415))) lt!392753)))

(declare-fun lt!393902 () Unit!18204)

(assert (=> d!84968 (= lt!393902 (choose!9 (_2!11798 lt!392415) (buf!6530 (_2!11798 lt!392756)) lt!392753 (BitStream!10979 (buf!6530 (_2!11798 lt!392756)) (currentByte!11985 (_2!11798 lt!392415)) (currentBit!11980 (_2!11798 lt!392415)))))))

(assert (=> d!84968 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11798 lt!392415) (buf!6530 (_2!11798 lt!392756)) lt!392753) lt!393902)))

(declare-fun bs!21484 () Bool)

(assert (= bs!21484 d!84968))

(assert (=> bs!21484 m!380551))

(declare-fun m!381897 () Bool)

(assert (=> bs!21484 m!381897))

(assert (=> b!252867 d!84968))

(declare-fun b!253660 () Bool)

(declare-fun e!175769 () Unit!18204)

(declare-fun Unit!18236 () Unit!18204)

(assert (=> b!253660 (= e!175769 Unit!18236)))

(declare-fun b!253662 () Bool)

(declare-fun res!212541 () Bool)

(declare-fun e!175770 () Bool)

(assert (=> b!253662 (=> (not res!212541) (not e!175770))))

(declare-fun lt!393908 () tuple2!21742)

(assert (=> b!253662 (= res!212541 (isPrefixOf!0 (_2!11799 lt!393908) (_2!11798 lt!392756)))))

(declare-fun b!253661 () Bool)

(declare-fun res!212540 () Bool)

(assert (=> b!253661 (=> (not res!212540) (not e!175770))))

(assert (=> b!253661 (= res!212540 (isPrefixOf!0 (_1!11799 lt!393908) (_2!11798 lt!392415)))))

(declare-fun d!84970 () Bool)

(assert (=> d!84970 e!175770))

(declare-fun res!212542 () Bool)

(assert (=> d!84970 (=> (not res!212542) (not e!175770))))

(assert (=> d!84970 (= res!212542 (isPrefixOf!0 (_1!11799 lt!393908) (_2!11799 lt!393908)))))

(declare-fun lt!393912 () BitStream!10978)

(assert (=> d!84970 (= lt!393908 (tuple2!21743 lt!393912 (_2!11798 lt!392756)))))

(declare-fun lt!393906 () Unit!18204)

(declare-fun lt!393904 () Unit!18204)

(assert (=> d!84970 (= lt!393906 lt!393904)))

(assert (=> d!84970 (isPrefixOf!0 lt!393912 (_2!11798 lt!392756))))

(assert (=> d!84970 (= lt!393904 (lemmaIsPrefixTransitive!0 lt!393912 (_2!11798 lt!392756) (_2!11798 lt!392756)))))

(declare-fun lt!393911 () Unit!18204)

(declare-fun lt!393922 () Unit!18204)

(assert (=> d!84970 (= lt!393911 lt!393922)))

(assert (=> d!84970 (isPrefixOf!0 lt!393912 (_2!11798 lt!392756))))

(assert (=> d!84970 (= lt!393922 (lemmaIsPrefixTransitive!0 lt!393912 (_2!11798 lt!392415) (_2!11798 lt!392756)))))

(declare-fun lt!393903 () Unit!18204)

(assert (=> d!84970 (= lt!393903 e!175769)))

(declare-fun c!11690 () Bool)

(assert (=> d!84970 (= c!11690 (not (= (size!6028 (buf!6530 (_2!11798 lt!392415))) #b00000000000000000000000000000000)))))

(declare-fun lt!393918 () Unit!18204)

(declare-fun lt!393919 () Unit!18204)

(assert (=> d!84970 (= lt!393918 lt!393919)))

(assert (=> d!84970 (isPrefixOf!0 (_2!11798 lt!392756) (_2!11798 lt!392756))))

(assert (=> d!84970 (= lt!393919 (lemmaIsPrefixRefl!0 (_2!11798 lt!392756)))))

(declare-fun lt!393921 () Unit!18204)

(declare-fun lt!393913 () Unit!18204)

(assert (=> d!84970 (= lt!393921 lt!393913)))

(assert (=> d!84970 (= lt!393913 (lemmaIsPrefixRefl!0 (_2!11798 lt!392756)))))

(declare-fun lt!393914 () Unit!18204)

(declare-fun lt!393916 () Unit!18204)

(assert (=> d!84970 (= lt!393914 lt!393916)))

(assert (=> d!84970 (isPrefixOf!0 lt!393912 lt!393912)))

(assert (=> d!84970 (= lt!393916 (lemmaIsPrefixRefl!0 lt!393912))))

(declare-fun lt!393915 () Unit!18204)

(declare-fun lt!393909 () Unit!18204)

(assert (=> d!84970 (= lt!393915 lt!393909)))

(assert (=> d!84970 (isPrefixOf!0 (_2!11798 lt!392415) (_2!11798 lt!392415))))

(assert (=> d!84970 (= lt!393909 (lemmaIsPrefixRefl!0 (_2!11798 lt!392415)))))

(assert (=> d!84970 (= lt!393912 (BitStream!10979 (buf!6530 (_2!11798 lt!392756)) (currentByte!11985 (_2!11798 lt!392415)) (currentBit!11980 (_2!11798 lt!392415))))))

(assert (=> d!84970 (isPrefixOf!0 (_2!11798 lt!392415) (_2!11798 lt!392756))))

(assert (=> d!84970 (= (reader!0 (_2!11798 lt!392415) (_2!11798 lt!392756)) lt!393908)))

(declare-fun lt!393910 () (_ BitVec 64))

(declare-fun b!253663 () Bool)

(declare-fun lt!393917 () (_ BitVec 64))

(assert (=> b!253663 (= e!175770 (= (_1!11799 lt!393908) (withMovedBitIndex!0 (_2!11799 lt!393908) (bvsub lt!393910 lt!393917))))))

(assert (=> b!253663 (or (= (bvand lt!393910 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393917 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393910 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393910 lt!393917) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253663 (= lt!393917 (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392756))) (currentByte!11985 (_2!11798 lt!392756)) (currentBit!11980 (_2!11798 lt!392756))))))

(assert (=> b!253663 (= lt!393910 (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392415))) (currentByte!11985 (_2!11798 lt!392415)) (currentBit!11980 (_2!11798 lt!392415))))))

(declare-fun b!253664 () Bool)

(declare-fun lt!393905 () Unit!18204)

(assert (=> b!253664 (= e!175769 lt!393905)))

(declare-fun lt!393907 () (_ BitVec 64))

(assert (=> b!253664 (= lt!393907 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!393920 () (_ BitVec 64))

(assert (=> b!253664 (= lt!393920 (bitIndex!0 (size!6028 (buf!6530 (_2!11798 lt!392415))) (currentByte!11985 (_2!11798 lt!392415)) (currentBit!11980 (_2!11798 lt!392415))))))

(assert (=> b!253664 (= lt!393905 (arrayBitRangesEqSymmetric!0 (buf!6530 (_2!11798 lt!392415)) (buf!6530 (_2!11798 lt!392756)) lt!393907 lt!393920))))

(assert (=> b!253664 (arrayBitRangesEq!0 (buf!6530 (_2!11798 lt!392756)) (buf!6530 (_2!11798 lt!392415)) lt!393907 lt!393920)))

(assert (= (and d!84970 c!11690) b!253664))

(assert (= (and d!84970 (not c!11690)) b!253660))

(assert (= (and d!84970 res!212542) b!253661))

(assert (= (and b!253661 res!212540) b!253662))

(assert (= (and b!253662 res!212541) b!253663))

(assert (=> d!84970 m!380437))

(declare-fun m!381899 () Bool)

(assert (=> d!84970 m!381899))

(assert (=> d!84970 m!380441))

(declare-fun m!381901 () Bool)

(assert (=> d!84970 m!381901))

(declare-fun m!381903 () Bool)

(assert (=> d!84970 m!381903))

(declare-fun m!381905 () Bool)

(assert (=> d!84970 m!381905))

(declare-fun m!381907 () Bool)

(assert (=> d!84970 m!381907))

(declare-fun m!381909 () Bool)

(assert (=> d!84970 m!381909))

(assert (=> d!84970 m!380545))

(declare-fun m!381911 () Bool)

(assert (=> d!84970 m!381911))

(declare-fun m!381913 () Bool)

(assert (=> d!84970 m!381913))

(declare-fun m!381915 () Bool)

(assert (=> b!253663 m!381915))

(assert (=> b!253663 m!380557))

(assert (=> b!253663 m!380195))

(declare-fun m!381917 () Bool)

(assert (=> b!253661 m!381917))

(assert (=> b!253664 m!380195))

(declare-fun m!381919 () Bool)

(assert (=> b!253664 m!381919))

(declare-fun m!381921 () Bool)

(assert (=> b!253664 m!381921))

(declare-fun m!381923 () Bool)

(assert (=> b!253662 m!381923))

(assert (=> b!252867 d!84970))

(declare-fun b!253665 () Bool)

(declare-fun res!212546 () Bool)

(declare-fun e!175771 () Bool)

(assert (=> b!253665 (=> (not res!212546) (not e!175771))))

(declare-fun e!175775 () Bool)

(assert (=> b!253665 (= res!212546 e!175775)))

(declare-fun res!212544 () Bool)

(assert (=> b!253665 (=> res!212544 e!175775)))

(declare-fun lt!393930 () tuple2!21756)

(assert (=> b!253665 (= res!212544 (not (_1!11806 lt!393930)))))

(declare-fun b!253666 () Bool)

(declare-fun e!175773 () Bool)

(assert (=> b!253666 (= e!175773 (= bit!26 (_2!11797 (readBitPure!0 (_1!11799 lt!392423)))))))

(declare-fun b!253667 () Bool)

(declare-fun e!175772 () tuple2!21756)

(assert (=> b!253667 (= e!175772 (tuple2!21757 true (_1!11799 lt!392423)))))

(declare-fun b!253668 () Bool)

(declare-fun e!175774 () tuple2!21756)

(declare-fun lt!393933 () tuple2!21756)

(assert (=> b!253668 (= e!175774 (tuple2!21757 false (_2!11806 lt!393933)))))

(declare-fun b!253669 () Bool)

(assert (=> b!253669 (= e!175772 e!175774)))

(assert (=> b!253669 (= lt!393933 (readBit!0 (_1!11799 lt!392423)))))

(declare-fun c!11691 () Bool)

(assert (=> b!253669 (= c!11691 (not (= (_1!11806 lt!393933) bit!26)))))

(declare-fun d!84972 () Bool)

(assert (=> d!84972 e!175771))

(declare-fun res!212547 () Bool)

(assert (=> d!84972 (=> (not res!212547) (not e!175771))))

(declare-fun lt!393931 () (_ BitVec 64))

(assert (=> d!84972 (= res!212547 (bvsge (bvsub lt!393931 from!289) (bitIndex!0 (size!6028 (buf!6530 (_2!11806 lt!393930))) (currentByte!11985 (_2!11806 lt!393930)) (currentBit!11980 (_2!11806 lt!393930)))))))

(assert (=> d!84972 (or (= (bvand lt!393931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393931 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!393926 () (_ BitVec 64))

(assert (=> d!84972 (= lt!393931 (bvadd lt!393926 nBits!297))))

(assert (=> d!84972 (or (not (= (bvand lt!393926 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393926 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393926 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84972 (= lt!393926 (bitIndex!0 (size!6028 (buf!6530 (_1!11799 lt!392423))) (currentByte!11985 (_1!11799 lt!392423)) (currentBit!11980 (_1!11799 lt!392423))))))

(assert (=> d!84972 (= lt!393930 e!175772)))

(declare-fun c!11692 () Bool)

(assert (=> d!84972 (= c!11692 (= from!289 nBits!297))))

(assert (=> d!84972 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!84972 (= (checkBitsLoop!0 (_1!11799 lt!392423) nBits!297 bit!26 from!289) lt!393930)))

(declare-fun lt!393929 () tuple2!21756)

(declare-fun b!253670 () Bool)

(assert (=> b!253670 (= lt!393929 (checkBitsLoop!0 (_2!11806 lt!393933) nBits!297 bit!26 (bvadd from!289 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!393925 () Unit!18204)

(declare-fun lt!393924 () Unit!18204)

(assert (=> b!253670 (= lt!393925 lt!393924)))

(declare-fun lt!393932 () (_ BitVec 64))

(declare-fun lt!393927 () (_ BitVec 64))

(assert (=> b!253670 (validate_offset_bits!1 ((_ sign_extend 32) (size!6028 (buf!6530 (_2!11806 lt!393933)))) ((_ sign_extend 32) (currentByte!11985 (_2!11806 lt!393933))) ((_ sign_extend 32) (currentBit!11980 (_2!11806 lt!393933))) (bvsub lt!393932 lt!393927))))

(assert (=> b!253670 (= lt!393924 (validateOffsetBitsIneqLemma!0 (_1!11799 lt!392423) (_2!11806 lt!393933) lt!393932 lt!393927))))

(assert (=> b!253670 (= lt!393927 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!253670 (= lt!393932 (bvsub nBits!297 from!289))))

(assert (=> b!253670 (= e!175774 (tuple2!21757 (_1!11806 lt!393929) (_2!11806 lt!393929)))))

(declare-fun b!253671 () Bool)

(assert (=> b!253671 (= e!175771 e!175773)))

(declare-fun res!212545 () Bool)

(assert (=> b!253671 (=> res!212545 e!175773)))

(assert (=> b!253671 (= res!212545 (or (not (_1!11806 lt!393930)) (bvsge from!289 nBits!297)))))

(declare-fun lt!393928 () (_ BitVec 64))

(declare-fun b!253672 () Bool)

(assert (=> b!253672 (= e!175775 (= (bvsub lt!393928 from!289) (bitIndex!0 (size!6028 (buf!6530 (_2!11806 lt!393930))) (currentByte!11985 (_2!11806 lt!393930)) (currentBit!11980 (_2!11806 lt!393930)))))))

(assert (=> b!253672 (or (= (bvand lt!393928 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393928 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393928 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!393923 () (_ BitVec 64))

(assert (=> b!253672 (= lt!393928 (bvadd lt!393923 nBits!297))))

(assert (=> b!253672 (or (not (= (bvand lt!393923 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393923 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393923 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253672 (= lt!393923 (bitIndex!0 (size!6028 (buf!6530 (_1!11799 lt!392423))) (currentByte!11985 (_1!11799 lt!392423)) (currentBit!11980 (_1!11799 lt!392423))))))

(declare-fun b!253673 () Bool)

(declare-fun res!212543 () Bool)

(assert (=> b!253673 (=> (not res!212543) (not e!175771))))

(assert (=> b!253673 (= res!212543 (and (= (buf!6530 (_1!11799 lt!392423)) (buf!6530 (_2!11806 lt!393930))) (or (not (= nBits!297 from!289)) (_1!11806 lt!393930))))))

(assert (= (and d!84972 c!11692) b!253667))

(assert (= (and d!84972 (not c!11692)) b!253669))

(assert (= (and b!253669 c!11691) b!253668))

(assert (= (and b!253669 (not c!11691)) b!253670))

(assert (= (and d!84972 res!212547) b!253673))

(assert (= (and b!253673 res!212543) b!253665))

(assert (= (and b!253665 (not res!212544)) b!253672))

(assert (= (and b!253665 res!212546) b!253671))

(assert (= (and b!253671 (not res!212545)) b!253666))

(assert (=> b!253669 m!380603))

(assert (=> b!253666 m!380223))

(declare-fun m!381925 () Bool)

(assert (=> d!84972 m!381925))

(assert (=> d!84972 m!380411))

(declare-fun m!381927 () Bool)

(assert (=> b!253670 m!381927))

(declare-fun m!381929 () Bool)

(assert (=> b!253670 m!381929))

(declare-fun m!381931 () Bool)

(assert (=> b!253670 m!381931))

(assert (=> b!253672 m!381925))

(assert (=> b!253672 m!380411))

(assert (=> d!84328 d!84972))

(assert (=> b!252843 d!84902))

(assert (=> b!252843 d!84286))

(assert (=> d!84304 d!84836))

(push 1)

(assert (not b!253543))

(assert (not d!84970))

(assert (not b!253504))

(assert (not b!253657))

(assert (not b!253659))

(assert (not b!253508))

(assert (not b!253581))

(assert (not b!253520))

(assert (not b!253510))

(assert (not b!253654))

(assert (not d!84870))

(assert (not b!253656))

(assert (not b!253579))

(assert (not b!253550))

(assert (not b!253613))

(assert (not b!253526))

(assert (not b!253484))

(assert (not d!84912))

(assert (not d!84818))

(assert (not b!253669))

(assert (not b!253488))

(assert (not d!84890))

(assert (not b!253497))

(assert (not b!253670))

(assert (not d!84892))

(assert (not d!84966))

(assert (not b!253627))

(assert (not d!84944))

(assert (not b!253650))

(assert (not b!253511))

(assert (not b!253615))

(assert (not b!253582))

(assert (not b!253580))

(assert (not d!84972))

(assert (not bm!3980))

(assert (not d!84826))

(assert (not b!253635))

(assert (not b!253623))

(assert (not d!84876))

(assert (not d!84844))

(assert (not d!84898))

(assert (not d!84952))

(assert (not b!253663))

(assert (not d!84958))

(assert (not d!84908))

(assert (not d!84860))

(assert (not b!253569))

(assert (not d!84914))

(assert (not b!253630))

(assert (not b!253506))

(assert (not b!253525))

(assert (not b!253493))

(assert (not bm!3981))

(assert (not b!253528))

(assert (not b!253622))

(assert (not b!253522))

(assert (not d!84856))

(assert (not d!84842))

(assert (not b!253672))

(assert (not d!84940))

(assert (not b!253495))

(assert (not b!253619))

(assert (not b!253646))

(assert (not d!84888))

(assert (not b!253502))

(assert (not b!253662))

(assert (not bm!3984))

(assert (not d!84964))

(assert (not b!253566))

(assert (not d!84900))

(assert (not b!253568))

(assert (not b!253548))

(assert (not b!253499))

(assert (not b!253538))

(assert (not b!253629))

(assert (not b!253490))

(assert (not b!253633))

(assert (not d!84858))

(assert (not b!253664))

(assert (not b!253578))

(assert (not d!84910))

(assert (not b!253565))

(assert (not d!84942))

(assert (not d!84868))

(assert (not b!253523))

(assert (not d!84830))

(assert (not b!253567))

(assert (not b!253514))

(assert (not b!253652))

(assert (not d!84882))

(assert (not d!84938))

(assert (not b!253638))

(assert (not bm!3983))

(assert (not b!253482))

(assert (not d!84820))

(assert (not bm!3982))

(assert (not b!253546))

(assert (not d!84968))

(assert (not d!84872))

(assert (not b!253486))

(assert (not b!253516))

(assert (not b!253519))

(assert (not d!84954))

(assert (not d!84894))

(assert (not b!253632))

(assert (not d!84906))

(assert (not d!84920))

(assert (not d!84926))

(assert (not b!253513))

(assert (not d!84946))

(assert (not b!253661))

(assert (not b!253584))

(assert (not b!253636))

(assert (not b!253609))

(assert (not d!84902))

(assert (not b!253544))

(assert (not b!253585))

(assert (not b!253466))

(assert (not d!84928))

(assert (not b!253517))

(assert (not d!84932))

(assert (not d!84874))

(assert (not b!253666))

(assert (not d!84962))

(assert (not d!84828))

(assert (not b!253552))

(assert (not b!253625))

(assert (not b!253612))

(check-sat)

(pop 1)

(push 1)

(check-sat)

