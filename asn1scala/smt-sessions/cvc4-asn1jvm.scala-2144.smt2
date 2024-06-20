; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54634 () Bool)

(assert start!54634)

(declare-fun b!255574 () Bool)

(declare-fun res!214226 () Bool)

(declare-fun e!177053 () Bool)

(assert (=> b!255574 (=> (not res!214226) (not e!177053))))

(declare-datatypes ((array!13781 0))(
  ( (array!13782 (arr!7032 (Array (_ BitVec 32) (_ BitVec 8))) (size!6045 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11012 0))(
  ( (BitStream!11013 (buf!6562 array!13781) (currentByte!12041 (_ BitVec 32)) (currentBit!12036 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18298 0))(
  ( (Unit!18299) )
))
(declare-datatypes ((tuple2!21858 0))(
  ( (tuple2!21859 (_1!11863 Unit!18298) (_2!11863 BitStream!11012)) )
))
(declare-fun lt!396923 () tuple2!21858)

(declare-fun lt!396945 () tuple2!21858)

(declare-fun isPrefixOf!0 (BitStream!11012 BitStream!11012) Bool)

(assert (=> b!255574 (= res!214226 (isPrefixOf!0 (_2!11863 lt!396923) (_2!11863 lt!396945)))))

(declare-fun b!255575 () Bool)

(declare-datatypes ((tuple2!21860 0))(
  ( (tuple2!21861 (_1!11864 BitStream!11012) (_2!11864 Bool)) )
))
(declare-fun lt!396938 () tuple2!21860)

(declare-datatypes ((tuple2!21862 0))(
  ( (tuple2!21863 (_1!11865 BitStream!11012) (_2!11865 BitStream!11012)) )
))
(declare-fun lt!396934 () tuple2!21862)

(assert (=> b!255575 (= e!177053 (not (or (not (_2!11864 lt!396938)) (not (= (_1!11864 lt!396938) (_2!11865 lt!396934))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!11012 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21860)

(assert (=> b!255575 (= lt!396938 (checkBitsLoopPure!0 (_1!11865 lt!396934) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!396924 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!255575 (validate_offset_bits!1 ((_ sign_extend 32) (size!6045 (buf!6562 (_2!11863 lt!396945)))) ((_ sign_extend 32) (currentByte!12041 (_2!11863 lt!396923))) ((_ sign_extend 32) (currentBit!12036 (_2!11863 lt!396923))) lt!396924)))

(declare-fun lt!396939 () Unit!18298)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!11012 array!13781 (_ BitVec 64)) Unit!18298)

(assert (=> b!255575 (= lt!396939 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11863 lt!396923) (buf!6562 (_2!11863 lt!396945)) lt!396924))))

(declare-fun reader!0 (BitStream!11012 BitStream!11012) tuple2!21862)

(assert (=> b!255575 (= lt!396934 (reader!0 (_2!11863 lt!396923) (_2!11863 lt!396945)))))

(declare-fun res!214227 () Bool)

(declare-fun e!177051 () Bool)

(assert (=> start!54634 (=> (not res!214227) (not e!177051))))

(assert (=> start!54634 (= res!214227 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54634 e!177051))

(assert (=> start!54634 true))

(declare-fun thiss!1005 () BitStream!11012)

(declare-fun e!177060 () Bool)

(declare-fun inv!12 (BitStream!11012) Bool)

(assert (=> start!54634 (and (inv!12 thiss!1005) e!177060)))

(declare-fun b!255576 () Bool)

(declare-fun array_inv!5786 (array!13781) Bool)

(assert (=> b!255576 (= e!177060 (array_inv!5786 (buf!6562 thiss!1005)))))

(declare-fun b!255577 () Bool)

(declare-fun e!177055 () Bool)

(declare-fun lt!396927 () tuple2!21860)

(declare-fun lt!396942 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!255577 (= e!177055 (= (bitIndex!0 (size!6045 (buf!6562 (_1!11864 lt!396927))) (currentByte!12041 (_1!11864 lt!396927)) (currentBit!12036 (_1!11864 lt!396927))) lt!396942))))

(declare-fun b!255578 () Bool)

(declare-fun res!214234 () Bool)

(assert (=> b!255578 (=> (not res!214234) (not e!177051))))

(assert (=> b!255578 (= res!214234 (bvslt from!289 nBits!297))))

(declare-fun b!255579 () Bool)

(declare-fun res!214225 () Bool)

(assert (=> b!255579 (=> (not res!214225) (not e!177051))))

(assert (=> b!255579 (= res!214225 (validate_offset_bits!1 ((_ sign_extend 32) (size!6045 (buf!6562 thiss!1005))) ((_ sign_extend 32) (currentByte!12041 thiss!1005)) ((_ sign_extend 32) (currentBit!12036 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!255580 () Bool)

(declare-fun e!177054 () Bool)

(assert (=> b!255580 (= e!177054 e!177055)))

(declare-fun res!214228 () Bool)

(assert (=> b!255580 (=> (not res!214228) (not e!177055))))

(assert (=> b!255580 (= res!214228 (and (= (_2!11864 lt!396927) bit!26) (= (_1!11864 lt!396927) (_2!11863 lt!396923))))))

(declare-fun readBitPure!0 (BitStream!11012) tuple2!21860)

(declare-fun readerFrom!0 (BitStream!11012 (_ BitVec 32) (_ BitVec 32)) BitStream!11012)

(assert (=> b!255580 (= lt!396927 (readBitPure!0 (readerFrom!0 (_2!11863 lt!396923) (currentBit!12036 thiss!1005) (currentByte!12041 thiss!1005))))))

(declare-fun b!255581 () Bool)

(declare-fun e!177057 () Bool)

(assert (=> b!255581 (= e!177051 (not e!177057))))

(declare-fun res!214224 () Bool)

(assert (=> b!255581 (=> res!214224 e!177057)))

(declare-fun lt!396944 () tuple2!21860)

(declare-fun lt!396922 () tuple2!21862)

(assert (=> b!255581 (= res!214224 (not (= (_1!11864 lt!396944) (_2!11865 lt!396922))))))

(assert (=> b!255581 (= lt!396944 (checkBitsLoopPure!0 (_1!11865 lt!396922) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!396936 () (_ BitVec 64))

(assert (=> b!255581 (validate_offset_bits!1 ((_ sign_extend 32) (size!6045 (buf!6562 (_2!11863 lt!396945)))) ((_ sign_extend 32) (currentByte!12041 (_2!11863 lt!396923))) ((_ sign_extend 32) (currentBit!12036 (_2!11863 lt!396923))) lt!396936)))

(declare-fun lt!396943 () Unit!18298)

(assert (=> b!255581 (= lt!396943 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11863 lt!396923) (buf!6562 (_2!11863 lt!396945)) lt!396936))))

(declare-fun lt!396925 () tuple2!21862)

(declare-fun lt!396926 () tuple2!21860)

(assert (=> b!255581 (= lt!396926 (checkBitsLoopPure!0 (_1!11865 lt!396925) nBits!297 bit!26 from!289))))

(assert (=> b!255581 (validate_offset_bits!1 ((_ sign_extend 32) (size!6045 (buf!6562 (_2!11863 lt!396945)))) ((_ sign_extend 32) (currentByte!12041 thiss!1005)) ((_ sign_extend 32) (currentBit!12036 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!396935 () Unit!18298)

(assert (=> b!255581 (= lt!396935 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6562 (_2!11863 lt!396945)) (bvsub nBits!297 from!289)))))

(assert (=> b!255581 (= (_2!11864 (readBitPure!0 (_1!11865 lt!396925))) bit!26)))

(assert (=> b!255581 (= lt!396922 (reader!0 (_2!11863 lt!396923) (_2!11863 lt!396945)))))

(assert (=> b!255581 (= lt!396925 (reader!0 thiss!1005 (_2!11863 lt!396945)))))

(declare-fun e!177062 () Bool)

(assert (=> b!255581 e!177062))

(declare-fun res!214239 () Bool)

(assert (=> b!255581 (=> (not res!214239) (not e!177062))))

(declare-fun lt!396929 () tuple2!21860)

(declare-fun lt!396928 () tuple2!21860)

(assert (=> b!255581 (= res!214239 (= (bitIndex!0 (size!6045 (buf!6562 (_1!11864 lt!396929))) (currentByte!12041 (_1!11864 lt!396929)) (currentBit!12036 (_1!11864 lt!396929))) (bitIndex!0 (size!6045 (buf!6562 (_1!11864 lt!396928))) (currentByte!12041 (_1!11864 lt!396928)) (currentBit!12036 (_1!11864 lt!396928)))))))

(declare-fun lt!396932 () Unit!18298)

(declare-fun lt!396937 () BitStream!11012)

(declare-fun readBitPrefixLemma!0 (BitStream!11012 BitStream!11012) Unit!18298)

(assert (=> b!255581 (= lt!396932 (readBitPrefixLemma!0 lt!396937 (_2!11863 lt!396945)))))

(assert (=> b!255581 (= lt!396928 (readBitPure!0 (BitStream!11013 (buf!6562 (_2!11863 lt!396945)) (currentByte!12041 thiss!1005) (currentBit!12036 thiss!1005))))))

(assert (=> b!255581 (= lt!396929 (readBitPure!0 lt!396937))))

(assert (=> b!255581 (= lt!396937 (BitStream!11013 (buf!6562 (_2!11863 lt!396923)) (currentByte!12041 thiss!1005) (currentBit!12036 thiss!1005)))))

(declare-fun e!177052 () Bool)

(assert (=> b!255581 e!177052))

(declare-fun res!214236 () Bool)

(assert (=> b!255581 (=> (not res!214236) (not e!177052))))

(assert (=> b!255581 (= res!214236 (isPrefixOf!0 thiss!1005 (_2!11863 lt!396945)))))

(declare-fun lt!396941 () Unit!18298)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11012 BitStream!11012 BitStream!11012) Unit!18298)

(assert (=> b!255581 (= lt!396941 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11863 lt!396923) (_2!11863 lt!396945)))))

(declare-fun e!177061 () Bool)

(assert (=> b!255581 e!177061))

(declare-fun res!214231 () Bool)

(assert (=> b!255581 (=> (not res!214231) (not e!177061))))

(assert (=> b!255581 (= res!214231 (= (size!6045 (buf!6562 (_2!11863 lt!396923))) (size!6045 (buf!6562 (_2!11863 lt!396945)))))))

(declare-fun appendNBitsLoop!0 (BitStream!11012 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21858)

(assert (=> b!255581 (= lt!396945 (appendNBitsLoop!0 (_2!11863 lt!396923) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!255581 (validate_offset_bits!1 ((_ sign_extend 32) (size!6045 (buf!6562 (_2!11863 lt!396923)))) ((_ sign_extend 32) (currentByte!12041 (_2!11863 lt!396923))) ((_ sign_extend 32) (currentBit!12036 (_2!11863 lt!396923))) lt!396936)))

(assert (=> b!255581 (= lt!396936 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!396931 () Unit!18298)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11012 BitStream!11012 (_ BitVec 64) (_ BitVec 64)) Unit!18298)

(assert (=> b!255581 (= lt!396931 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11863 lt!396923) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!177058 () Bool)

(assert (=> b!255581 e!177058))

(declare-fun res!214238 () Bool)

(assert (=> b!255581 (=> (not res!214238) (not e!177058))))

(assert (=> b!255581 (= res!214238 (= (size!6045 (buf!6562 thiss!1005)) (size!6045 (buf!6562 (_2!11863 lt!396923)))))))

(declare-fun appendBit!0 (BitStream!11012 Bool) tuple2!21858)

(assert (=> b!255581 (= lt!396923 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!255582 () Bool)

(declare-fun e!177056 () Bool)

(assert (=> b!255582 (= e!177056 true)))

(declare-fun lt!396933 () (_ BitVec 64))

(assert (=> b!255582 (= lt!396933 (bitIndex!0 (size!6045 (buf!6562 (_2!11863 lt!396945))) (currentByte!12041 (_2!11863 lt!396945)) (currentBit!12036 (_2!11863 lt!396945))))))

(declare-fun lt!396930 () (_ BitVec 64))

(assert (=> b!255582 (= lt!396930 (bitIndex!0 (size!6045 (buf!6562 thiss!1005)) (currentByte!12041 thiss!1005) (currentBit!12036 thiss!1005)))))

(declare-fun b!255583 () Bool)

(assert (=> b!255583 (= e!177062 (= (_2!11864 lt!396929) (_2!11864 lt!396928)))))

(declare-fun b!255584 () Bool)

(assert (=> b!255584 (= e!177057 e!177056)))

(declare-fun res!214237 () Bool)

(assert (=> b!255584 (=> res!214237 e!177056)))

(assert (=> b!255584 (= res!214237 (not (= (size!6045 (buf!6562 thiss!1005)) (size!6045 (buf!6562 (_2!11863 lt!396945))))))))

(assert (=> b!255584 (and (= (_2!11864 lt!396926) (_2!11864 lt!396944)) (= (_1!11864 lt!396926) (_2!11865 lt!396925)))))

(declare-fun b!255585 () Bool)

(declare-fun res!214230 () Bool)

(assert (=> b!255585 (=> (not res!214230) (not e!177052))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!255585 (= res!214230 (invariant!0 (currentBit!12036 thiss!1005) (currentByte!12041 thiss!1005) (size!6045 (buf!6562 (_2!11863 lt!396923)))))))

(declare-fun b!255586 () Bool)

(assert (=> b!255586 (= e!177052 (invariant!0 (currentBit!12036 thiss!1005) (currentByte!12041 thiss!1005) (size!6045 (buf!6562 (_2!11863 lt!396945)))))))

(declare-fun b!255587 () Bool)

(assert (=> b!255587 (= e!177058 e!177054)))

(declare-fun res!214232 () Bool)

(assert (=> b!255587 (=> (not res!214232) (not e!177054))))

(declare-fun lt!396940 () (_ BitVec 64))

(assert (=> b!255587 (= res!214232 (= lt!396942 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!396940)))))

(assert (=> b!255587 (= lt!396942 (bitIndex!0 (size!6045 (buf!6562 (_2!11863 lt!396923))) (currentByte!12041 (_2!11863 lt!396923)) (currentBit!12036 (_2!11863 lt!396923))))))

(assert (=> b!255587 (= lt!396940 (bitIndex!0 (size!6045 (buf!6562 thiss!1005)) (currentByte!12041 thiss!1005) (currentBit!12036 thiss!1005)))))

(declare-fun b!255588 () Bool)

(assert (=> b!255588 (= e!177061 e!177053)))

(declare-fun res!214229 () Bool)

(assert (=> b!255588 (=> (not res!214229) (not e!177053))))

(assert (=> b!255588 (= res!214229 (= (bitIndex!0 (size!6045 (buf!6562 (_2!11863 lt!396945))) (currentByte!12041 (_2!11863 lt!396945)) (currentBit!12036 (_2!11863 lt!396945))) (bvadd (bitIndex!0 (size!6045 (buf!6562 (_2!11863 lt!396923))) (currentByte!12041 (_2!11863 lt!396923)) (currentBit!12036 (_2!11863 lt!396923))) lt!396924)))))

(assert (=> b!255588 (= lt!396924 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!255589 () Bool)

(declare-fun res!214233 () Bool)

(assert (=> b!255589 (=> (not res!214233) (not e!177054))))

(assert (=> b!255589 (= res!214233 (isPrefixOf!0 thiss!1005 (_2!11863 lt!396923)))))

(declare-fun b!255590 () Bool)

(declare-fun res!214235 () Bool)

(assert (=> b!255590 (=> res!214235 e!177057)))

(declare-fun withMovedBitIndex!0 (BitStream!11012 (_ BitVec 64)) BitStream!11012)

(assert (=> b!255590 (= res!214235 (not (= (_1!11865 lt!396922) (withMovedBitIndex!0 (_1!11865 lt!396925) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!54634 res!214227) b!255579))

(assert (= (and b!255579 res!214225) b!255578))

(assert (= (and b!255578 res!214234) b!255581))

(assert (= (and b!255581 res!214238) b!255587))

(assert (= (and b!255587 res!214232) b!255589))

(assert (= (and b!255589 res!214233) b!255580))

(assert (= (and b!255580 res!214228) b!255577))

(assert (= (and b!255581 res!214231) b!255588))

(assert (= (and b!255588 res!214229) b!255574))

(assert (= (and b!255574 res!214226) b!255575))

(assert (= (and b!255581 res!214236) b!255585))

(assert (= (and b!255585 res!214230) b!255586))

(assert (= (and b!255581 res!214239) b!255583))

(assert (= (and b!255581 (not res!214224)) b!255590))

(assert (= (and b!255590 (not res!214235)) b!255584))

(assert (= (and b!255584 (not res!214237)) b!255582))

(assert (= start!54634 b!255576))

(declare-fun m!384985 () Bool)

(assert (=> b!255588 m!384985))

(declare-fun m!384987 () Bool)

(assert (=> b!255588 m!384987))

(declare-fun m!384989 () Bool)

(assert (=> b!255590 m!384989))

(assert (=> b!255587 m!384987))

(declare-fun m!384991 () Bool)

(assert (=> b!255587 m!384991))

(declare-fun m!384993 () Bool)

(assert (=> b!255586 m!384993))

(declare-fun m!384995 () Bool)

(assert (=> b!255575 m!384995))

(declare-fun m!384997 () Bool)

(assert (=> b!255575 m!384997))

(declare-fun m!384999 () Bool)

(assert (=> b!255575 m!384999))

(declare-fun m!385001 () Bool)

(assert (=> b!255575 m!385001))

(declare-fun m!385003 () Bool)

(assert (=> start!54634 m!385003))

(declare-fun m!385005 () Bool)

(assert (=> b!255580 m!385005))

(assert (=> b!255580 m!385005))

(declare-fun m!385007 () Bool)

(assert (=> b!255580 m!385007))

(declare-fun m!385009 () Bool)

(assert (=> b!255581 m!385009))

(declare-fun m!385011 () Bool)

(assert (=> b!255581 m!385011))

(declare-fun m!385013 () Bool)

(assert (=> b!255581 m!385013))

(declare-fun m!385015 () Bool)

(assert (=> b!255581 m!385015))

(declare-fun m!385017 () Bool)

(assert (=> b!255581 m!385017))

(declare-fun m!385019 () Bool)

(assert (=> b!255581 m!385019))

(declare-fun m!385021 () Bool)

(assert (=> b!255581 m!385021))

(declare-fun m!385023 () Bool)

(assert (=> b!255581 m!385023))

(declare-fun m!385025 () Bool)

(assert (=> b!255581 m!385025))

(declare-fun m!385027 () Bool)

(assert (=> b!255581 m!385027))

(assert (=> b!255581 m!385001))

(declare-fun m!385029 () Bool)

(assert (=> b!255581 m!385029))

(declare-fun m!385031 () Bool)

(assert (=> b!255581 m!385031))

(declare-fun m!385033 () Bool)

(assert (=> b!255581 m!385033))

(declare-fun m!385035 () Bool)

(assert (=> b!255581 m!385035))

(declare-fun m!385037 () Bool)

(assert (=> b!255581 m!385037))

(declare-fun m!385039 () Bool)

(assert (=> b!255581 m!385039))

(declare-fun m!385041 () Bool)

(assert (=> b!255581 m!385041))

(declare-fun m!385043 () Bool)

(assert (=> b!255581 m!385043))

(declare-fun m!385045 () Bool)

(assert (=> b!255581 m!385045))

(declare-fun m!385047 () Bool)

(assert (=> b!255577 m!385047))

(assert (=> b!255582 m!384985))

(assert (=> b!255582 m!384991))

(declare-fun m!385049 () Bool)

(assert (=> b!255579 m!385049))

(declare-fun m!385051 () Bool)

(assert (=> b!255585 m!385051))

(declare-fun m!385053 () Bool)

(assert (=> b!255589 m!385053))

(declare-fun m!385055 () Bool)

(assert (=> b!255576 m!385055))

(declare-fun m!385057 () Bool)

(assert (=> b!255574 m!385057))

(push 1)

(assert (not b!255585))

(assert (not b!255577))

(assert (not b!255576))

(assert (not b!255588))

(assert (not b!255580))

(assert (not b!255575))

(assert (not b!255582))

(assert (not b!255586))

(assert (not b!255587))

(assert (not start!54634))

(assert (not b!255574))

(assert (not b!255589))

(assert (not b!255581))

(assert (not b!255590))

(assert (not b!255579))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

