; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19702 () Bool)

(assert start!19702)

(declare-fun b!98441 () Bool)

(declare-fun res!80758 () Bool)

(declare-fun e!64396 () Bool)

(assert (=> b!98441 (=> (not res!80758) (not e!64396))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98441 (= res!80758 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun b!98442 () Bool)

(declare-fun res!80760 () Bool)

(declare-fun e!64397 () Bool)

(assert (=> b!98442 (=> res!80760 e!64397)))

(declare-datatypes ((array!4622 0))(
  ( (array!4623 (arr!2705 (Array (_ BitVec 32) (_ BitVec 8))) (size!2112 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3698 0))(
  ( (BitStream!3699 (buf!2463 array!4622) (currentByte!4893 (_ BitVec 32)) (currentBit!4888 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3698)

(declare-datatypes ((Unit!6033 0))(
  ( (Unit!6034) )
))
(declare-datatypes ((tuple2!7948 0))(
  ( (tuple2!7949 (_1!4226 Unit!6033) (_2!4226 BitStream!3698)) )
))
(declare-fun lt!142612 () tuple2!7948)

(declare-fun isPrefixOf!0 (BitStream!3698 BitStream!3698) Bool)

(assert (=> b!98442 (= res!80760 (not (isPrefixOf!0 thiss!1288 (_2!4226 lt!142612))))))

(declare-fun b!98443 () Bool)

(declare-fun res!80761 () Bool)

(assert (=> b!98443 (=> (not res!80761) (not e!64396))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!98443 (= res!80761 (validate_offset_bits!1 ((_ sign_extend 32) (size!2112 (buf!2463 thiss!1288))) ((_ sign_extend 32) (currentByte!4893 thiss!1288)) ((_ sign_extend 32) (currentBit!4888 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun res!80759 () Bool)

(assert (=> start!19702 (=> (not res!80759) (not e!64396))))

(assert (=> start!19702 (= res!80759 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19702 e!64396))

(assert (=> start!19702 true))

(declare-fun e!64398 () Bool)

(declare-fun inv!12 (BitStream!3698) Bool)

(assert (=> start!19702 (and (inv!12 thiss!1288) e!64398)))

(declare-fun b!98444 () Bool)

(declare-datatypes ((tuple2!7950 0))(
  ( (tuple2!7951 (_1!4227 BitStream!3698) (_2!4227 (_ BitVec 64))) )
))
(declare-fun lt!142613 () tuple2!7950)

(declare-datatypes ((tuple2!7952 0))(
  ( (tuple2!7953 (_1!4228 BitStream!3698) (_2!4228 BitStream!3698)) )
))
(declare-fun lt!142615 () tuple2!7952)

(assert (=> b!98444 (= e!64397 (or (not (= (_2!4227 lt!142613) v!196)) (not (= (_1!4227 lt!142613) (_2!4228 lt!142615)))))))

(declare-fun readNLeastSignificantBitsPure!0 (BitStream!3698 (_ BitVec 32)) tuple2!7950)

(assert (=> b!98444 (= lt!142613 (readNLeastSignificantBitsPure!0 (_1!4228 lt!142615) nBits!388))))

(assert (=> b!98444 (validate_offset_bits!1 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142612)))) ((_ sign_extend 32) (currentByte!4893 thiss!1288)) ((_ sign_extend 32) (currentBit!4888 thiss!1288)) ((_ sign_extend 32) nBits!388))))

(declare-fun lt!142614 () Unit!6033)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3698 array!4622 (_ BitVec 64)) Unit!6033)

(assert (=> b!98444 (= lt!142614 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2463 (_2!4226 lt!142612)) ((_ sign_extend 32) nBits!388)))))

(declare-fun reader!0 (BitStream!3698 BitStream!3698) tuple2!7952)

(assert (=> b!98444 (= lt!142615 (reader!0 thiss!1288 (_2!4226 lt!142612)))))

(declare-fun b!98445 () Bool)

(declare-fun array_inv!1914 (array!4622) Bool)

(assert (=> b!98445 (= e!64398 (array_inv!1914 (buf!2463 thiss!1288)))))

(declare-fun b!98446 () Bool)

(declare-fun res!80762 () Bool)

(assert (=> b!98446 (=> res!80762 e!64397)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98446 (= res!80762 (not (= (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142612))) (currentByte!4893 (_2!4226 lt!142612)) (currentBit!4888 (_2!4226 lt!142612))) (bvadd (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288)) ((_ sign_extend 32) nBits!388)))))))

(declare-fun b!98447 () Bool)

(assert (=> b!98447 (= e!64396 e!64397)))

(declare-fun res!80757 () Bool)

(assert (=> b!98447 (=> res!80757 e!64397)))

(assert (=> b!98447 (= res!80757 (not (= (size!2112 (buf!2463 thiss!1288)) (size!2112 (buf!2463 (_2!4226 lt!142612))))))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3698 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7948)

(assert (=> b!98447 (= lt!142612 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(assert (= (and start!19702 res!80759) b!98443))

(assert (= (and b!98443 res!80761) b!98441))

(assert (= (and b!98441 res!80758) b!98447))

(assert (= (and b!98447 (not res!80757)) b!98446))

(assert (= (and b!98446 (not res!80762)) b!98442))

(assert (= (and b!98442 (not res!80760)) b!98444))

(assert (= start!19702 b!98445))

(declare-fun m!142969 () Bool)

(assert (=> b!98442 m!142969))

(declare-fun m!142971 () Bool)

(assert (=> b!98443 m!142971))

(declare-fun m!142973 () Bool)

(assert (=> start!19702 m!142973))

(declare-fun m!142975 () Bool)

(assert (=> b!98444 m!142975))

(declare-fun m!142977 () Bool)

(assert (=> b!98444 m!142977))

(declare-fun m!142979 () Bool)

(assert (=> b!98444 m!142979))

(declare-fun m!142981 () Bool)

(assert (=> b!98444 m!142981))

(declare-fun m!142983 () Bool)

(assert (=> b!98447 m!142983))

(declare-fun m!142985 () Bool)

(assert (=> b!98446 m!142985))

(declare-fun m!142987 () Bool)

(assert (=> b!98446 m!142987))

(declare-fun m!142989 () Bool)

(assert (=> b!98441 m!142989))

(declare-fun m!142991 () Bool)

(assert (=> b!98445 m!142991))

(push 1)

(assert (not start!19702))

(assert (not b!98441))

(assert (not b!98447))

(assert (not b!98444))

(assert (not b!98442))

(assert (not b!98446))

(assert (not b!98443))

(assert (not b!98445))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!30808 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!30808 (= (inv!12 thiss!1288) (invariant!0 (currentBit!4888 thiss!1288) (currentByte!4893 thiss!1288) (size!2112 (buf!2463 thiss!1288))))))

(declare-fun bs!7551 () Bool)

(assert (= bs!7551 d!30808))

(declare-fun m!143001 () Bool)

(assert (=> bs!7551 m!143001))

(assert (=> start!19702 d!30808))

(declare-fun b!98537 () Bool)

(declare-fun e!64445 () Bool)

(declare-datatypes ((tuple2!7956 0))(
  ( (tuple2!7957 (_1!4230 BitStream!3698) (_2!4230 Bool)) )
))
(declare-fun lt!142956 () tuple2!7956)

(declare-fun lt!142946 () tuple2!7948)

(assert (=> b!98537 (= e!64445 (= (bitIndex!0 (size!2112 (buf!2463 (_1!4230 lt!142956))) (currentByte!4893 (_1!4230 lt!142956)) (currentBit!4888 (_1!4230 lt!142956))) (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142946))) (currentByte!4893 (_2!4226 lt!142946)) (currentBit!4888 (_2!4226 lt!142946)))))))

(declare-fun b!98538 () Bool)

(declare-fun e!64447 () tuple2!7948)

(declare-fun lt!142951 () tuple2!7948)

(declare-fun Unit!6041 () Unit!6033)

(assert (=> b!98538 (= e!64447 (tuple2!7949 Unit!6041 (_2!4226 lt!142951)))))

(declare-fun lt!142965 () Bool)

(assert (=> b!98538 (= lt!142965 (not (= (bvand v!196 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun appendBit!0 (BitStream!3698 Bool) tuple2!7948)

(assert (=> b!98538 (= lt!142946 (appendBit!0 thiss!1288 lt!142965))))

(declare-fun res!80826 () Bool)

(assert (=> b!98538 (= res!80826 (= (size!2112 (buf!2463 thiss!1288)) (size!2112 (buf!2463 (_2!4226 lt!142946)))))))

(declare-fun e!64444 () Bool)

(assert (=> b!98538 (=> (not res!80826) (not e!64444))))

(assert (=> b!98538 e!64444))

(declare-fun lt!142935 () tuple2!7948)

(assert (=> b!98538 (= lt!142935 lt!142946)))

(assert (=> b!98538 (= lt!142951 (appendNLeastSignificantBitsLoop!0 (_2!4226 lt!142935) v!196 nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!142942 () Unit!6033)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3698 BitStream!3698 BitStream!3698) Unit!6033)

(assert (=> b!98538 (= lt!142942 (lemmaIsPrefixTransitive!0 thiss!1288 (_2!4226 lt!142935) (_2!4226 lt!142951)))))

(assert (=> b!98538 (isPrefixOf!0 thiss!1288 (_2!4226 lt!142951))))

(declare-fun lt!142967 () Unit!6033)

(assert (=> b!98538 (= lt!142967 lt!142942)))

(assert (=> b!98538 (invariant!0 (currentBit!4888 thiss!1288) (currentByte!4893 thiss!1288) (size!2112 (buf!2463 (_2!4226 lt!142935))))))

(declare-fun lt!142961 () BitStream!3698)

(assert (=> b!98538 (= lt!142961 (BitStream!3699 (buf!2463 (_2!4226 lt!142935)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288)))))

(assert (=> b!98538 (invariant!0 (currentBit!4888 lt!142961) (currentByte!4893 lt!142961) (size!2112 (buf!2463 (_2!4226 lt!142951))))))

(declare-fun lt!142966 () BitStream!3698)

(assert (=> b!98538 (= lt!142966 (BitStream!3699 (buf!2463 (_2!4226 lt!142951)) (currentByte!4893 lt!142961) (currentBit!4888 lt!142961)))))

(declare-fun lt!142940 () tuple2!7956)

(declare-fun readBitPure!0 (BitStream!3698) tuple2!7956)

(assert (=> b!98538 (= lt!142940 (readBitPure!0 lt!142961))))

(declare-fun lt!142975 () tuple2!7956)

(assert (=> b!98538 (= lt!142975 (readBitPure!0 lt!142966))))

(declare-fun lt!142969 () Unit!6033)

(declare-fun readBitPrefixLemma!0 (BitStream!3698 BitStream!3698) Unit!6033)

(assert (=> b!98538 (= lt!142969 (readBitPrefixLemma!0 lt!142961 (_2!4226 lt!142951)))))

(declare-fun res!80832 () Bool)

(assert (=> b!98538 (= res!80832 (= (bitIndex!0 (size!2112 (buf!2463 (_1!4230 lt!142940))) (currentByte!4893 (_1!4230 lt!142940)) (currentBit!4888 (_1!4230 lt!142940))) (bitIndex!0 (size!2112 (buf!2463 (_1!4230 lt!142975))) (currentByte!4893 (_1!4230 lt!142975)) (currentBit!4888 (_1!4230 lt!142975)))))))

(declare-fun e!64446 () Bool)

(assert (=> b!98538 (=> (not res!80832) (not e!64446))))

(assert (=> b!98538 e!64446))

(declare-fun lt!142950 () Unit!6033)

(assert (=> b!98538 (= lt!142950 lt!142969)))

(declare-fun lt!142945 () tuple2!7952)

(assert (=> b!98538 (= lt!142945 (reader!0 thiss!1288 (_2!4226 lt!142951)))))

(declare-fun lt!142963 () tuple2!7952)

(assert (=> b!98538 (= lt!142963 (reader!0 (_2!4226 lt!142935) (_2!4226 lt!142951)))))

(declare-fun lt!142972 () tuple2!7956)

(assert (=> b!98538 (= lt!142972 (readBitPure!0 (_1!4228 lt!142945)))))

(assert (=> b!98538 (= (_2!4230 lt!142972) lt!142965)))

(declare-fun lt!142937 () Unit!6033)

(declare-fun Unit!6042 () Unit!6033)

(assert (=> b!98538 (= lt!142937 Unit!6042)))

(declare-fun lt!142962 () (_ BitVec 64))

(assert (=> b!98538 (= lt!142962 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(declare-fun lt!142974 () (_ BitVec 64))

(assert (=> b!98538 (= lt!142974 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(declare-fun lt!142957 () Unit!6033)

(assert (=> b!98538 (= lt!142957 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2463 (_2!4226 lt!142951)) lt!142974))))

(assert (=> b!98538 (validate_offset_bits!1 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142951)))) ((_ sign_extend 32) (currentByte!4893 thiss!1288)) ((_ sign_extend 32) (currentBit!4888 thiss!1288)) lt!142974)))

(declare-fun lt!142936 () Unit!6033)

(assert (=> b!98538 (= lt!142936 lt!142957)))

(declare-fun lt!142933 () tuple2!7950)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3698 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!7950)

(assert (=> b!98538 (= lt!142933 (readNLeastSignificantBitsLoopPure!0 (_1!4228 lt!142945) nBits!388 #b00000000000000000000000000000000 lt!142962))))

(declare-fun lt!142941 () (_ BitVec 64))

(assert (=> b!98538 (= lt!142941 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000000) #b00000000000000000000000000000001)))))

(declare-fun lt!142954 () Unit!6033)

(assert (=> b!98538 (= lt!142954 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4226 lt!142935) (buf!2463 (_2!4226 lt!142951)) lt!142941))))

(assert (=> b!98538 (validate_offset_bits!1 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142951)))) ((_ sign_extend 32) (currentByte!4893 (_2!4226 lt!142935))) ((_ sign_extend 32) (currentBit!4888 (_2!4226 lt!142935))) lt!142941)))

(declare-fun lt!142931 () Unit!6033)

(assert (=> b!98538 (= lt!142931 lt!142954)))

(declare-fun lt!142947 () tuple2!7950)

(assert (=> b!98538 (= lt!142947 (readNLeastSignificantBitsLoopPure!0 (_1!4228 lt!142963) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!142962 (ite (_2!4230 lt!142972) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!142959 () tuple2!7950)

(assert (=> b!98538 (= lt!142959 (readNLeastSignificantBitsLoopPure!0 (_1!4228 lt!142945) nBits!388 #b00000000000000000000000000000000 lt!142962))))

(declare-fun c!6230 () Bool)

(assert (=> b!98538 (= c!6230 (_2!4230 (readBitPure!0 (_1!4228 lt!142945))))))

(declare-fun lt!142944 () tuple2!7950)

(declare-fun e!64450 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3698 (_ BitVec 64)) BitStream!3698)

(assert (=> b!98538 (= lt!142944 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4228 lt!142945) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!142962 e!64450)))))

(declare-fun lt!142932 () Unit!6033)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3698 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6033)

(assert (=> b!98538 (= lt!142932 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4228 lt!142945) nBits!388 #b00000000000000000000000000000000 lt!142962))))

(assert (=> b!98538 (and (= (_2!4227 lt!142959) (_2!4227 lt!142944)) (= (_1!4227 lt!142959) (_1!4227 lt!142944)))))

(declare-fun lt!142949 () Unit!6033)

(assert (=> b!98538 (= lt!142949 lt!142932)))

(assert (=> b!98538 (= (_1!4228 lt!142945) (withMovedBitIndex!0 (_2!4228 lt!142945) (bvsub (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288)) (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142951))) (currentByte!4893 (_2!4226 lt!142951)) (currentBit!4888 (_2!4226 lt!142951))))))))

(declare-fun lt!142938 () Unit!6033)

(declare-fun Unit!6043 () Unit!6033)

(assert (=> b!98538 (= lt!142938 Unit!6043)))

(assert (=> b!98538 (= (_1!4228 lt!142963) (withMovedBitIndex!0 (_2!4228 lt!142963) (bvsub (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142935))) (currentByte!4893 (_2!4226 lt!142935)) (currentBit!4888 (_2!4226 lt!142935))) (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142951))) (currentByte!4893 (_2!4226 lt!142951)) (currentBit!4888 (_2!4226 lt!142951))))))))

(declare-fun lt!142958 () Unit!6033)

(declare-fun Unit!6044 () Unit!6033)

(assert (=> b!98538 (= lt!142958 Unit!6044)))

(assert (=> b!98538 (= (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288)) (bvsub (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142935))) (currentByte!4893 (_2!4226 lt!142935)) (currentBit!4888 (_2!4226 lt!142935))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!142960 () Unit!6033)

(declare-fun Unit!6045 () Unit!6033)

(assert (=> b!98538 (= lt!142960 Unit!6045)))

(assert (=> b!98538 (= (_2!4227 lt!142933) (_2!4227 lt!142947))))

(declare-fun lt!142939 () Unit!6033)

(declare-fun Unit!6046 () Unit!6033)

(assert (=> b!98538 (= lt!142939 Unit!6046)))

(assert (=> b!98538 (= (_1!4227 lt!142933) (_2!4228 lt!142945))))

(declare-fun b!98539 () Bool)

(declare-fun res!80825 () Bool)

(declare-fun e!64449 () Bool)

(assert (=> b!98539 (=> (not res!80825) (not e!64449))))

(declare-fun lt!142948 () tuple2!7948)

(assert (=> b!98539 (= res!80825 (isPrefixOf!0 thiss!1288 (_2!4226 lt!142948)))))

(declare-fun b!98540 () Bool)

(declare-fun res!80829 () Bool)

(assert (=> b!98540 (= res!80829 (= (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142946))) (currentByte!4893 (_2!4226 lt!142946)) (currentBit!4888 (_2!4226 lt!142946))) (bvadd (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!98540 (=> (not res!80829) (not e!64444))))

(declare-fun b!98541 () Bool)

(declare-fun res!80828 () Bool)

(declare-fun call!1228 () Bool)

(assert (=> b!98541 (= res!80828 call!1228)))

(assert (=> b!98541 (=> (not res!80828) (not e!64444))))

(declare-fun b!98542 () Bool)

(declare-fun lt!142943 () Unit!6033)

(assert (=> b!98542 (= e!64447 (tuple2!7949 lt!142943 thiss!1288))))

(declare-fun lt!142964 () BitStream!3698)

(assert (=> b!98542 (= lt!142964 thiss!1288)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3698) Unit!6033)

(assert (=> b!98542 (= lt!142943 (lemmaIsPrefixRefl!0 lt!142964))))

(assert (=> b!98542 call!1228))

(declare-fun b!98543 () Bool)

(assert (=> b!98543 (= e!64450 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!98544 () Bool)

(declare-fun e!64448 () Bool)

(declare-fun lt!142934 () (_ BitVec 64))

(assert (=> b!98544 (= e!64448 (validate_offset_bits!1 ((_ sign_extend 32) (size!2112 (buf!2463 thiss!1288))) ((_ sign_extend 32) (currentByte!4893 thiss!1288)) ((_ sign_extend 32) (currentBit!4888 thiss!1288)) lt!142934))))

(declare-fun lt!142953 () tuple2!7952)

(declare-fun b!98545 () Bool)

(declare-fun lt!142973 () tuple2!7950)

(assert (=> b!98545 (= e!64449 (and (= (_2!4227 lt!142973) v!196) (= (_1!4227 lt!142973) (_2!4228 lt!142953))))))

(declare-fun lt!142971 () (_ BitVec 64))

(assert (=> b!98545 (= lt!142973 (readNLeastSignificantBitsLoopPure!0 (_1!4228 lt!142953) nBits!388 #b00000000000000000000000000000000 lt!142971))))

(declare-fun lt!142955 () Unit!6033)

(declare-fun lt!142968 () Unit!6033)

(assert (=> b!98545 (= lt!142955 lt!142968)))

(assert (=> b!98545 (validate_offset_bits!1 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142948)))) ((_ sign_extend 32) (currentByte!4893 thiss!1288)) ((_ sign_extend 32) (currentBit!4888 thiss!1288)) lt!142934)))

(assert (=> b!98545 (= lt!142968 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2463 (_2!4226 lt!142948)) lt!142934))))

(assert (=> b!98545 e!64448))

(declare-fun res!80827 () Bool)

(assert (=> b!98545 (=> (not res!80827) (not e!64448))))

(assert (=> b!98545 (= res!80827 (and (= (size!2112 (buf!2463 thiss!1288)) (size!2112 (buf!2463 (_2!4226 lt!142948)))) (bvsge lt!142934 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98545 (= lt!142934 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(assert (=> b!98545 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!98545 (= lt!142971 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(assert (=> b!98545 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!98545 (= lt!142953 (reader!0 thiss!1288 (_2!4226 lt!142948)))))

(declare-fun b!98546 () Bool)

(declare-fun res!80833 () Bool)

(assert (=> b!98546 (=> (not res!80833) (not e!64449))))

(declare-fun lt!142970 () (_ BitVec 64))

(declare-fun lt!142952 () (_ BitVec 64))

(assert (=> b!98546 (= res!80833 (= (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142948))) (currentByte!4893 (_2!4226 lt!142948)) (currentBit!4888 (_2!4226 lt!142948))) (bvadd lt!142970 lt!142952)))))

(assert (=> b!98546 (or (not (= (bvand lt!142970 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!142952 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!142970 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!142970 lt!142952) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98546 (= lt!142952 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(assert (=> b!98546 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!98546 (= lt!142970 (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288)))))

(declare-fun c!6229 () Bool)

(declare-fun bm!1225 () Bool)

(assert (=> bm!1225 (= call!1228 (isPrefixOf!0 (ite c!6229 thiss!1288 lt!142964) (ite c!6229 (_2!4226 lt!142946) lt!142964)))))

(declare-fun b!98547 () Bool)

(assert (=> b!98547 (= e!64450 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!98548 () Bool)

(assert (=> b!98548 (= e!64446 (= (_2!4230 lt!142940) (_2!4230 lt!142975)))))

(declare-fun d!30810 () Bool)

(assert (=> d!30810 e!64449))

(declare-fun res!80830 () Bool)

(assert (=> d!30810 (=> (not res!80830) (not e!64449))))

(assert (=> d!30810 (= res!80830 (= (size!2112 (buf!2463 thiss!1288)) (size!2112 (buf!2463 (_2!4226 lt!142948)))))))

(assert (=> d!30810 (= lt!142948 e!64447)))

(assert (=> d!30810 (= c!6229 (bvslt #b00000000000000000000000000000000 nBits!388))))

(assert (=> d!30810 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!388) (bvsle nBits!388 #b00000000000000000000000001000000))))

(assert (=> d!30810 (= (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000) lt!142948)))

(declare-fun b!98536 () Bool)

(declare-fun readerFrom!0 (BitStream!3698 (_ BitVec 32) (_ BitVec 32)) BitStream!3698)

(assert (=> b!98536 (= lt!142956 (readBitPure!0 (readerFrom!0 (_2!4226 lt!142946) (currentBit!4888 thiss!1288) (currentByte!4893 thiss!1288))))))

(declare-fun res!80831 () Bool)

(assert (=> b!98536 (= res!80831 (and (= (_2!4230 lt!142956) lt!142965) (= (_1!4230 lt!142956) (_2!4226 lt!142946))))))

(assert (=> b!98536 (=> (not res!80831) (not e!64445))))

(assert (=> b!98536 (= e!64444 e!64445)))

(assert (= (and d!30810 c!6229) b!98538))

(assert (= (and d!30810 (not c!6229)) b!98542))

(assert (= (and b!98538 res!80826) b!98540))

(assert (= (and b!98540 res!80829) b!98541))

(assert (= (and b!98541 res!80828) b!98536))

(assert (= (and b!98536 res!80831) b!98537))

(assert (= (and b!98538 res!80832) b!98548))

(assert (= (and b!98538 c!6230) b!98543))

(assert (= (and b!98538 (not c!6230)) b!98547))

(assert (= (or b!98541 b!98542) bm!1225))

(assert (= (and d!30810 res!80830) b!98546))

(assert (= (and b!98546 res!80833) b!98539))

(assert (= (and b!98539 res!80825) b!98545))

(assert (= (and b!98545 res!80827) b!98544))

(declare-fun m!143125 () Bool)

(assert (=> b!98537 m!143125))

(declare-fun m!143127 () Bool)

(assert (=> b!98537 m!143127))

(declare-fun m!143129 () Bool)

(assert (=> bm!1225 m!143129))

(declare-fun m!143131 () Bool)

(assert (=> b!98544 m!143131))

(declare-fun m!143133 () Bool)

(assert (=> b!98538 m!143133))

(declare-fun m!143135 () Bool)

(assert (=> b!98538 m!143135))

(declare-fun m!143137 () Bool)

(assert (=> b!98538 m!143137))

(declare-fun m!143139 () Bool)

(assert (=> b!98538 m!143139))

(declare-fun m!143141 () Bool)

(assert (=> b!98538 m!143141))

(declare-fun m!143143 () Bool)

(assert (=> b!98538 m!143143))

(declare-fun m!143145 () Bool)

(assert (=> b!98538 m!143145))

(declare-fun m!143147 () Bool)

(assert (=> b!98538 m!143147))

(declare-fun m!143149 () Bool)

(assert (=> b!98538 m!143149))

(declare-fun m!143151 () Bool)

(assert (=> b!98538 m!143151))

(declare-fun m!143153 () Bool)

(assert (=> b!98538 m!143153))

(declare-fun m!143155 () Bool)

(assert (=> b!98538 m!143155))

(declare-fun m!143157 () Bool)

(assert (=> b!98538 m!143157))

(declare-fun m!143159 () Bool)

(assert (=> b!98538 m!143159))

(declare-fun m!143161 () Bool)

(assert (=> b!98538 m!143161))

(assert (=> b!98538 m!142987))

(declare-fun m!143163 () Bool)

(assert (=> b!98538 m!143163))

(declare-fun m!143165 () Bool)

(assert (=> b!98538 m!143165))

(declare-fun m!143167 () Bool)

(assert (=> b!98538 m!143167))

(declare-fun m!143169 () Bool)

(assert (=> b!98538 m!143169))

(declare-fun m!143171 () Bool)

(assert (=> b!98538 m!143171))

(declare-fun m!143173 () Bool)

(assert (=> b!98538 m!143173))

(declare-fun m!143175 () Bool)

(assert (=> b!98538 m!143175))

(assert (=> b!98538 m!143149))

(declare-fun m!143177 () Bool)

(assert (=> b!98538 m!143177))

(declare-fun m!143179 () Bool)

(assert (=> b!98538 m!143179))

(declare-fun m!143181 () Bool)

(assert (=> b!98538 m!143181))

(declare-fun m!143183 () Bool)

(assert (=> b!98538 m!143183))

(declare-fun m!143185 () Bool)

(assert (=> b!98538 m!143185))

(declare-fun m!143187 () Bool)

(assert (=> b!98538 m!143187))

(declare-fun m!143189 () Bool)

(assert (=> b!98536 m!143189))

(assert (=> b!98536 m!143189))

(declare-fun m!143191 () Bool)

(assert (=> b!98536 m!143191))

(declare-fun m!143193 () Bool)

(assert (=> b!98545 m!143193))

(assert (=> b!98545 m!143139))

(declare-fun m!143195 () Bool)

(assert (=> b!98545 m!143195))

(declare-fun m!143197 () Bool)

(assert (=> b!98545 m!143197))

(declare-fun m!143199 () Bool)

(assert (=> b!98545 m!143199))

(assert (=> b!98540 m!143127))

(assert (=> b!98540 m!142987))

(declare-fun m!143201 () Bool)

(assert (=> b!98542 m!143201))

(declare-fun m!143203 () Bool)

(assert (=> b!98539 m!143203))

(declare-fun m!143205 () Bool)

(assert (=> b!98546 m!143205))

(assert (=> b!98546 m!142987))

(assert (=> b!98447 d!30810))

(declare-fun d!30828 () Bool)

(declare-fun res!80851 () Bool)

(declare-fun e!64461 () Bool)

(assert (=> d!30828 (=> (not res!80851) (not e!64461))))

(assert (=> d!30828 (= res!80851 (= (size!2112 (buf!2463 thiss!1288)) (size!2112 (buf!2463 (_2!4226 lt!142612)))))))

(assert (=> d!30828 (= (isPrefixOf!0 thiss!1288 (_2!4226 lt!142612)) e!64461)))

(declare-fun b!98564 () Bool)

(declare-fun res!80850 () Bool)

(assert (=> b!98564 (=> (not res!80850) (not e!64461))))

(assert (=> b!98564 (= res!80850 (bvsle (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288)) (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142612))) (currentByte!4893 (_2!4226 lt!142612)) (currentBit!4888 (_2!4226 lt!142612)))))))

(declare-fun b!98565 () Bool)

(declare-fun e!64462 () Bool)

(assert (=> b!98565 (= e!64461 e!64462)))

(declare-fun res!80849 () Bool)

(assert (=> b!98565 (=> res!80849 e!64462)))

(assert (=> b!98565 (= res!80849 (= (size!2112 (buf!2463 thiss!1288)) #b00000000000000000000000000000000))))

(declare-fun b!98566 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4622 array!4622 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!98566 (= e!64462 (arrayBitRangesEq!0 (buf!2463 thiss!1288) (buf!2463 (_2!4226 lt!142612)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288))))))

(assert (= (and d!30828 res!80851) b!98564))

(assert (= (and b!98564 res!80850) b!98565))

(assert (= (and b!98565 (not res!80849)) b!98566))

(assert (=> b!98564 m!142987))

(assert (=> b!98564 m!142985))

(assert (=> b!98566 m!142987))

(assert (=> b!98566 m!142987))

(declare-fun m!143213 () Bool)

(assert (=> b!98566 m!143213))

(assert (=> b!98442 d!30828))

(declare-fun d!30836 () Bool)

(declare-datatypes ((tuple2!7964 0))(
  ( (tuple2!7965 (_1!4234 (_ BitVec 64)) (_2!4234 BitStream!3698)) )
))
(declare-fun lt!142984 () tuple2!7964)

(declare-fun readNLeastSignificantBits!0 (BitStream!3698 (_ BitVec 32)) tuple2!7964)

(assert (=> d!30836 (= lt!142984 (readNLeastSignificantBits!0 (_1!4228 lt!142615) nBits!388))))

(assert (=> d!30836 (= (readNLeastSignificantBitsPure!0 (_1!4228 lt!142615) nBits!388) (tuple2!7951 (_2!4234 lt!142984) (_1!4234 lt!142984)))))

(declare-fun bs!7556 () Bool)

(assert (= bs!7556 d!30836))

(declare-fun m!143215 () Bool)

(assert (=> bs!7556 m!143215))

(assert (=> b!98444 d!30836))

(declare-fun d!30838 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!30838 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142612)))) ((_ sign_extend 32) (currentByte!4893 thiss!1288)) ((_ sign_extend 32) (currentBit!4888 thiss!1288)) ((_ sign_extend 32) nBits!388)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142612)))) ((_ sign_extend 32) (currentByte!4893 thiss!1288)) ((_ sign_extend 32) (currentBit!4888 thiss!1288))) ((_ sign_extend 32) nBits!388)))))

(declare-fun bs!7557 () Bool)

(assert (= bs!7557 d!30838))

(declare-fun m!143217 () Bool)

(assert (=> bs!7557 m!143217))

(assert (=> b!98444 d!30838))

(declare-fun d!30840 () Bool)

(assert (=> d!30840 (validate_offset_bits!1 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142612)))) ((_ sign_extend 32) (currentByte!4893 thiss!1288)) ((_ sign_extend 32) (currentBit!4888 thiss!1288)) ((_ sign_extend 32) nBits!388))))

(declare-fun lt!142987 () Unit!6033)

(declare-fun choose!9 (BitStream!3698 array!4622 (_ BitVec 64) BitStream!3698) Unit!6033)

(assert (=> d!30840 (= lt!142987 (choose!9 thiss!1288 (buf!2463 (_2!4226 lt!142612)) ((_ sign_extend 32) nBits!388) (BitStream!3699 (buf!2463 (_2!4226 lt!142612)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288))))))

(assert (=> d!30840 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2463 (_2!4226 lt!142612)) ((_ sign_extend 32) nBits!388)) lt!142987)))

(declare-fun bs!7558 () Bool)

(assert (= bs!7558 d!30840))

(assert (=> bs!7558 m!142977))

(declare-fun m!143219 () Bool)

(assert (=> bs!7558 m!143219))

(assert (=> b!98444 d!30840))

(declare-fun b!98610 () Bool)

(declare-fun e!64483 () Unit!6033)

(declare-fun lt!143176 () Unit!6033)

(assert (=> b!98610 (= e!64483 lt!143176)))

(declare-fun lt!143171 () (_ BitVec 64))

(assert (=> b!98610 (= lt!143171 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!143169 () (_ BitVec 64))

(assert (=> b!98610 (= lt!143169 (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4622 array!4622 (_ BitVec 64) (_ BitVec 64)) Unit!6033)

(assert (=> b!98610 (= lt!143176 (arrayBitRangesEqSymmetric!0 (buf!2463 thiss!1288) (buf!2463 (_2!4226 lt!142612)) lt!143171 lt!143169))))

(assert (=> b!98610 (arrayBitRangesEq!0 (buf!2463 (_2!4226 lt!142612)) (buf!2463 thiss!1288) lt!143171 lt!143169)))

(declare-fun e!64484 () Bool)

(declare-fun b!98611 () Bool)

(declare-fun lt!143173 () (_ BitVec 64))

(declare-fun lt!143164 () (_ BitVec 64))

(declare-fun lt!143166 () tuple2!7952)

(assert (=> b!98611 (= e!64484 (= (_1!4228 lt!143166) (withMovedBitIndex!0 (_2!4228 lt!143166) (bvsub lt!143173 lt!143164))))))

(assert (=> b!98611 (or (= (bvand lt!143173 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143164 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143173 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143173 lt!143164) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98611 (= lt!143164 (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142612))) (currentByte!4893 (_2!4226 lt!142612)) (currentBit!4888 (_2!4226 lt!142612))))))

(assert (=> b!98611 (= lt!143173 (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288)))))

(declare-fun b!98612 () Bool)

(declare-fun Unit!6055 () Unit!6033)

(assert (=> b!98612 (= e!64483 Unit!6055)))

(declare-fun d!30842 () Bool)

(assert (=> d!30842 e!64484))

(declare-fun res!80878 () Bool)

(assert (=> d!30842 (=> (not res!80878) (not e!64484))))

(assert (=> d!30842 (= res!80878 (isPrefixOf!0 (_1!4228 lt!143166) (_2!4228 lt!143166)))))

(declare-fun lt!143170 () BitStream!3698)

(assert (=> d!30842 (= lt!143166 (tuple2!7953 lt!143170 (_2!4226 lt!142612)))))

(declare-fun lt!143180 () Unit!6033)

(declare-fun lt!143174 () Unit!6033)

(assert (=> d!30842 (= lt!143180 lt!143174)))

(assert (=> d!30842 (isPrefixOf!0 lt!143170 (_2!4226 lt!142612))))

(assert (=> d!30842 (= lt!143174 (lemmaIsPrefixTransitive!0 lt!143170 (_2!4226 lt!142612) (_2!4226 lt!142612)))))

(declare-fun lt!143168 () Unit!6033)

(declare-fun lt!143162 () Unit!6033)

(assert (=> d!30842 (= lt!143168 lt!143162)))

(assert (=> d!30842 (isPrefixOf!0 lt!143170 (_2!4226 lt!142612))))

(assert (=> d!30842 (= lt!143162 (lemmaIsPrefixTransitive!0 lt!143170 thiss!1288 (_2!4226 lt!142612)))))

(declare-fun lt!143181 () Unit!6033)

(assert (=> d!30842 (= lt!143181 e!64483)))

(declare-fun c!6240 () Bool)

(assert (=> d!30842 (= c!6240 (not (= (size!2112 (buf!2463 thiss!1288)) #b00000000000000000000000000000000)))))

(declare-fun lt!143178 () Unit!6033)

(declare-fun lt!143165 () Unit!6033)

(assert (=> d!30842 (= lt!143178 lt!143165)))

(assert (=> d!30842 (isPrefixOf!0 (_2!4226 lt!142612) (_2!4226 lt!142612))))

(assert (=> d!30842 (= lt!143165 (lemmaIsPrefixRefl!0 (_2!4226 lt!142612)))))

(declare-fun lt!143177 () Unit!6033)

(declare-fun lt!143172 () Unit!6033)

(assert (=> d!30842 (= lt!143177 lt!143172)))

(assert (=> d!30842 (= lt!143172 (lemmaIsPrefixRefl!0 (_2!4226 lt!142612)))))

(declare-fun lt!143163 () Unit!6033)

(declare-fun lt!143167 () Unit!6033)

(assert (=> d!30842 (= lt!143163 lt!143167)))

(assert (=> d!30842 (isPrefixOf!0 lt!143170 lt!143170)))

(assert (=> d!30842 (= lt!143167 (lemmaIsPrefixRefl!0 lt!143170))))

(declare-fun lt!143175 () Unit!6033)

(declare-fun lt!143179 () Unit!6033)

(assert (=> d!30842 (= lt!143175 lt!143179)))

(assert (=> d!30842 (isPrefixOf!0 thiss!1288 thiss!1288)))

(assert (=> d!30842 (= lt!143179 (lemmaIsPrefixRefl!0 thiss!1288))))

(assert (=> d!30842 (= lt!143170 (BitStream!3699 (buf!2463 (_2!4226 lt!142612)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288)))))

(assert (=> d!30842 (isPrefixOf!0 thiss!1288 (_2!4226 lt!142612))))

(assert (=> d!30842 (= (reader!0 thiss!1288 (_2!4226 lt!142612)) lt!143166)))

(declare-fun b!98613 () Bool)

(declare-fun res!80879 () Bool)

(assert (=> b!98613 (=> (not res!80879) (not e!64484))))

(assert (=> b!98613 (= res!80879 (isPrefixOf!0 (_1!4228 lt!143166) thiss!1288))))

(declare-fun b!98614 () Bool)

(declare-fun res!80877 () Bool)

(assert (=> b!98614 (=> (not res!80877) (not e!64484))))

(assert (=> b!98614 (= res!80877 (isPrefixOf!0 (_2!4228 lt!143166) (_2!4226 lt!142612)))))

(assert (= (and d!30842 c!6240) b!98610))

(assert (= (and d!30842 (not c!6240)) b!98612))

(assert (= (and d!30842 res!80878) b!98613))

(assert (= (and b!98613 res!80879) b!98614))

(assert (= (and b!98614 res!80877) b!98611))

(declare-fun m!143251 () Bool)

(assert (=> b!98614 m!143251))

(declare-fun m!143253 () Bool)

(assert (=> d!30842 m!143253))

(declare-fun m!143255 () Bool)

(assert (=> d!30842 m!143255))

(declare-fun m!143257 () Bool)

(assert (=> d!30842 m!143257))

(declare-fun m!143259 () Bool)

(assert (=> d!30842 m!143259))

(assert (=> d!30842 m!142969))

(declare-fun m!143261 () Bool)

(assert (=> d!30842 m!143261))

(declare-fun m!143263 () Bool)

(assert (=> d!30842 m!143263))

(declare-fun m!143265 () Bool)

(assert (=> d!30842 m!143265))

(declare-fun m!143267 () Bool)

(assert (=> d!30842 m!143267))

(declare-fun m!143269 () Bool)

(assert (=> d!30842 m!143269))

(declare-fun m!143271 () Bool)

(assert (=> d!30842 m!143271))

(declare-fun m!143273 () Bool)

(assert (=> b!98613 m!143273))

(declare-fun m!143275 () Bool)

(assert (=> b!98611 m!143275))

(assert (=> b!98611 m!142985))

(assert (=> b!98611 m!142987))

(assert (=> b!98610 m!142987))

(declare-fun m!143277 () Bool)

(assert (=> b!98610 m!143277))

(declare-fun m!143279 () Bool)

(assert (=> b!98610 m!143279))

(assert (=> b!98444 d!30842))

(declare-fun d!30846 () Bool)

(assert (=> d!30846 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2112 (buf!2463 thiss!1288))) ((_ sign_extend 32) (currentByte!4893 thiss!1288)) ((_ sign_extend 32) (currentBit!4888 thiss!1288)) ((_ sign_extend 32) nBits!388)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2112 (buf!2463 thiss!1288))) ((_ sign_extend 32) (currentByte!4893 thiss!1288)) ((_ sign_extend 32) (currentBit!4888 thiss!1288))) ((_ sign_extend 32) nBits!388)))))

(declare-fun bs!7560 () Bool)

(assert (= bs!7560 d!30846))

(declare-fun m!143281 () Bool)

(assert (=> bs!7560 m!143281))

(assert (=> b!98443 d!30846))

(declare-fun d!30848 () Bool)

(assert (=> d!30848 (= (array_inv!1914 (buf!2463 thiss!1288)) (bvsge (size!2112 (buf!2463 thiss!1288)) #b00000000000000000000000000000000))))

(assert (=> b!98445 d!30848))

(declare-fun d!30850 () Bool)

(assert (=> d!30850 (= (onesLSBLong!0 nBits!388) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!388))))))

(assert (=> b!98441 d!30850))

(declare-fun d!30852 () Bool)

(declare-fun e!64491 () Bool)

(assert (=> d!30852 e!64491))

(declare-fun res!80893 () Bool)

(assert (=> d!30852 (=> (not res!80893) (not e!64491))))

(declare-fun lt!143214 () (_ BitVec 64))

(declare-fun lt!143211 () (_ BitVec 64))

(declare-fun lt!143212 () (_ BitVec 64))

(assert (=> d!30852 (= res!80893 (= lt!143214 (bvsub lt!143211 lt!143212)))))

(assert (=> d!30852 (or (= (bvand lt!143211 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143212 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143211 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143211 lt!143212) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30852 (= lt!143212 (remainingBits!0 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142612)))) ((_ sign_extend 32) (currentByte!4893 (_2!4226 lt!142612))) ((_ sign_extend 32) (currentBit!4888 (_2!4226 lt!142612)))))))

(declare-fun lt!143213 () (_ BitVec 64))

(declare-fun lt!143210 () (_ BitVec 64))

(assert (=> d!30852 (= lt!143211 (bvmul lt!143213 lt!143210))))

(assert (=> d!30852 (or (= lt!143213 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!143210 (bvsdiv (bvmul lt!143213 lt!143210) lt!143213)))))

(assert (=> d!30852 (= lt!143210 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30852 (= lt!143213 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142612)))))))

(assert (=> d!30852 (= lt!143214 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4893 (_2!4226 lt!142612))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4888 (_2!4226 lt!142612)))))))

(assert (=> d!30852 (invariant!0 (currentBit!4888 (_2!4226 lt!142612)) (currentByte!4893 (_2!4226 lt!142612)) (size!2112 (buf!2463 (_2!4226 lt!142612))))))

(assert (=> d!30852 (= (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142612))) (currentByte!4893 (_2!4226 lt!142612)) (currentBit!4888 (_2!4226 lt!142612))) lt!143214)))

(declare-fun b!98627 () Bool)

(declare-fun res!80892 () Bool)

(assert (=> b!98627 (=> (not res!80892) (not e!64491))))

(assert (=> b!98627 (= res!80892 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!143214))))

(declare-fun b!98628 () Bool)

(declare-fun lt!143215 () (_ BitVec 64))

(assert (=> b!98628 (= e!64491 (bvsle lt!143214 (bvmul lt!143215 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98628 (or (= lt!143215 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!143215 #b0000000000000000000000000000000000000000000000000000000000001000) lt!143215)))))

(assert (=> b!98628 (= lt!143215 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142612)))))))

(assert (= (and d!30852 res!80893) b!98627))

(assert (= (and b!98627 res!80892) b!98628))

(declare-fun m!143283 () Bool)

(assert (=> d!30852 m!143283))

(declare-fun m!143285 () Bool)

(assert (=> d!30852 m!143285))

(assert (=> b!98446 d!30852))

(declare-fun d!30854 () Bool)

(declare-fun e!64492 () Bool)

(assert (=> d!30854 e!64492))

(declare-fun res!80895 () Bool)

(assert (=> d!30854 (=> (not res!80895) (not e!64492))))

(declare-fun lt!143218 () (_ BitVec 64))

(declare-fun lt!143220 () (_ BitVec 64))

(declare-fun lt!143217 () (_ BitVec 64))

(assert (=> d!30854 (= res!80895 (= lt!143220 (bvsub lt!143217 lt!143218)))))

(assert (=> d!30854 (or (= (bvand lt!143217 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143218 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143217 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143217 lt!143218) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30854 (= lt!143218 (remainingBits!0 ((_ sign_extend 32) (size!2112 (buf!2463 thiss!1288))) ((_ sign_extend 32) (currentByte!4893 thiss!1288)) ((_ sign_extend 32) (currentBit!4888 thiss!1288))))))

(declare-fun lt!143219 () (_ BitVec 64))

(declare-fun lt!143216 () (_ BitVec 64))

(assert (=> d!30854 (= lt!143217 (bvmul lt!143219 lt!143216))))

(assert (=> d!30854 (or (= lt!143219 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!143216 (bvsdiv (bvmul lt!143219 lt!143216) lt!143219)))))

(assert (=> d!30854 (= lt!143216 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30854 (= lt!143219 ((_ sign_extend 32) (size!2112 (buf!2463 thiss!1288))))))

(assert (=> d!30854 (= lt!143220 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4893 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4888 thiss!1288))))))

(assert (=> d!30854 (invariant!0 (currentBit!4888 thiss!1288) (currentByte!4893 thiss!1288) (size!2112 (buf!2463 thiss!1288)))))

(assert (=> d!30854 (= (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288)) lt!143220)))

(declare-fun b!98629 () Bool)

(declare-fun res!80894 () Bool)

(assert (=> b!98629 (=> (not res!80894) (not e!64492))))

(assert (=> b!98629 (= res!80894 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!143220))))

(declare-fun b!98630 () Bool)

(declare-fun lt!143221 () (_ BitVec 64))

(assert (=> b!98630 (= e!64492 (bvsle lt!143220 (bvmul lt!143221 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98630 (or (= lt!143221 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!143221 #b0000000000000000000000000000000000000000000000000000000000001000) lt!143221)))))

(assert (=> b!98630 (= lt!143221 ((_ sign_extend 32) (size!2112 (buf!2463 thiss!1288))))))

(assert (= (and d!30854 res!80895) b!98629))

(assert (= (and b!98629 res!80894) b!98630))

(assert (=> d!30854 m!143281))

(assert (=> d!30854 m!143001))

(assert (=> b!98446 d!30854))

(push 1)

(assert (not d!30808))

(assert (not d!30840))

(assert (not b!98614))

(assert (not b!98536))

(assert (not b!98546))

(assert (not d!30838))

(assert (not b!98610))

(assert (not b!98537))

(assert (not b!98538))

(assert (not b!98544))

(assert (not b!98542))

(assert (not d!30836))

(assert (not b!98613))

(assert (not bm!1225))

(assert (not b!98611))

(assert (not b!98540))

(assert (not d!30842))

(assert (not b!98566))

(assert (not d!30852))

(assert (not b!98539))

(assert (not d!30854))

(assert (not b!98564))

(assert (not b!98545))

(assert (not d!30846))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> b!98564 d!30854))

(assert (=> b!98564 d!30852))

(declare-fun d!30994 () Bool)

(assert (=> d!30994 (= (remainingBits!0 ((_ sign_extend 32) (size!2112 (buf!2463 thiss!1288))) ((_ sign_extend 32) (currentByte!4893 thiss!1288)) ((_ sign_extend 32) (currentBit!4888 thiss!1288))) (bvsub (bvmul ((_ sign_extend 32) (size!2112 (buf!2463 thiss!1288))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4893 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4888 thiss!1288)))))))

(assert (=> d!30854 d!30994))

(declare-fun d!30996 () Bool)

(assert (=> d!30996 (= (invariant!0 (currentBit!4888 thiss!1288) (currentByte!4893 thiss!1288) (size!2112 (buf!2463 thiss!1288))) (and (bvsge (currentBit!4888 thiss!1288) #b00000000000000000000000000000000) (bvslt (currentBit!4888 thiss!1288) #b00000000000000000000000000001000) (bvsge (currentByte!4893 thiss!1288) #b00000000000000000000000000000000) (or (bvslt (currentByte!4893 thiss!1288) (size!2112 (buf!2463 thiss!1288))) (and (= (currentBit!4888 thiss!1288) #b00000000000000000000000000000000) (= (currentByte!4893 thiss!1288) (size!2112 (buf!2463 thiss!1288)))))))))

(assert (=> d!30854 d!30996))

(declare-fun b!98803 () Bool)

(declare-fun e!64609 () Bool)

(declare-fun e!64612 () Bool)

(assert (=> b!98803 (= e!64609 e!64612)))

(declare-fun c!6254 () Bool)

(declare-datatypes ((tuple4!64 0))(
  ( (tuple4!65 (_1!4237 (_ BitVec 32)) (_2!4237 (_ BitVec 32)) (_3!253 (_ BitVec 32)) (_4!32 (_ BitVec 32))) )
))
(declare-fun lt!143551 () tuple4!64)

(assert (=> b!98803 (= c!6254 (= (_3!253 lt!143551) (_4!32 lt!143551)))))

(declare-fun b!98804 () Bool)

(declare-fun res!81046 () Bool)

(declare-fun lt!143552 () (_ BitVec 32))

(assert (=> b!98804 (= res!81046 (= lt!143552 #b00000000000000000000000000000000))))

(declare-fun e!64607 () Bool)

(assert (=> b!98804 (=> res!81046 e!64607)))

(declare-fun e!64608 () Bool)

(assert (=> b!98804 (= e!64608 e!64607)))

(declare-fun call!1239 () Bool)

(declare-fun lt!143553 () (_ BitVec 32))

(declare-fun bm!1236 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1236 (= call!1239 (byteRangesEq!0 (select (arr!2705 (buf!2463 thiss!1288)) (_3!253 lt!143551)) (select (arr!2705 (buf!2463 (_2!4226 lt!142612))) (_3!253 lt!143551)) lt!143553 (ite c!6254 lt!143552 #b00000000000000000000000000001000)))))

(declare-fun e!64611 () Bool)

(declare-fun b!98806 () Bool)

(declare-fun arrayRangesEq!33 (array!4622 array!4622 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!98806 (= e!64611 (arrayRangesEq!33 (buf!2463 thiss!1288) (buf!2463 (_2!4226 lt!142612)) (_1!4237 lt!143551) (_2!4237 lt!143551)))))

(declare-fun b!98807 () Bool)

(assert (=> b!98807 (= e!64612 e!64608)))

(declare-fun res!81042 () Bool)

(assert (=> b!98807 (= res!81042 call!1239)))

(assert (=> b!98807 (=> (not res!81042) (not e!64608))))

(declare-fun b!98808 () Bool)

(declare-fun e!64610 () Bool)

(assert (=> b!98808 (= e!64610 e!64609)))

(declare-fun res!81043 () Bool)

(assert (=> b!98808 (=> (not res!81043) (not e!64609))))

(assert (=> b!98808 (= res!81043 e!64611)))

(declare-fun res!81045 () Bool)

(assert (=> b!98808 (=> res!81045 e!64611)))

(assert (=> b!98808 (= res!81045 (bvsge (_1!4237 lt!143551) (_2!4237 lt!143551)))))

(assert (=> b!98808 (= lt!143552 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98808 (= lt!143553 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!64)

(assert (=> b!98808 (= lt!143551 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288))))))

(declare-fun b!98809 () Bool)

(assert (=> b!98809 (= e!64607 (byteRangesEq!0 (select (arr!2705 (buf!2463 thiss!1288)) (_4!32 lt!143551)) (select (arr!2705 (buf!2463 (_2!4226 lt!142612))) (_4!32 lt!143551)) #b00000000000000000000000000000000 lt!143552))))

(declare-fun b!98805 () Bool)

(assert (=> b!98805 (= e!64612 call!1239)))

(declare-fun d!30998 () Bool)

(declare-fun res!81044 () Bool)

(assert (=> d!30998 (=> res!81044 e!64610)))

(assert (=> d!30998 (= res!81044 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288))))))

(assert (=> d!30998 (= (arrayBitRangesEq!0 (buf!2463 thiss!1288) (buf!2463 (_2!4226 lt!142612)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288))) e!64610)))

(assert (= (and d!30998 (not res!81044)) b!98808))

(assert (= (and b!98808 (not res!81045)) b!98806))

(assert (= (and b!98808 res!81043) b!98803))

(assert (= (and b!98803 c!6254) b!98805))

(assert (= (and b!98803 (not c!6254)) b!98807))

(assert (= (and b!98807 res!81042) b!98804))

(assert (= (and b!98804 (not res!81046)) b!98809))

(assert (= (or b!98805 b!98807) bm!1236))

(declare-fun m!143745 () Bool)

(assert (=> bm!1236 m!143745))

(declare-fun m!143747 () Bool)

(assert (=> bm!1236 m!143747))

(assert (=> bm!1236 m!143745))

(assert (=> bm!1236 m!143747))

(declare-fun m!143749 () Bool)

(assert (=> bm!1236 m!143749))

(declare-fun m!143751 () Bool)

(assert (=> b!98806 m!143751))

(assert (=> b!98808 m!142987))

(declare-fun m!143753 () Bool)

(assert (=> b!98808 m!143753))

(declare-fun m!143755 () Bool)

(assert (=> b!98809 m!143755))

(declare-fun m!143757 () Bool)

(assert (=> b!98809 m!143757))

(assert (=> b!98809 m!143755))

(assert (=> b!98809 m!143757))

(declare-fun m!143759 () Bool)

(assert (=> b!98809 m!143759))

(assert (=> b!98566 d!30998))

(assert (=> b!98566 d!30854))

(declare-fun d!31000 () Bool)

(declare-datatypes ((tuple2!7968 0))(
  ( (tuple2!7969 (_1!4238 Bool) (_2!4238 BitStream!3698)) )
))
(declare-fun lt!143556 () tuple2!7968)

(declare-fun readBit!0 (BitStream!3698) tuple2!7968)

(assert (=> d!31000 (= lt!143556 (readBit!0 (readerFrom!0 (_2!4226 lt!142946) (currentBit!4888 thiss!1288) (currentByte!4893 thiss!1288))))))

(assert (=> d!31000 (= (readBitPure!0 (readerFrom!0 (_2!4226 lt!142946) (currentBit!4888 thiss!1288) (currentByte!4893 thiss!1288))) (tuple2!7957 (_2!4238 lt!143556) (_1!4238 lt!143556)))))

(declare-fun bs!7589 () Bool)

(assert (= bs!7589 d!31000))

(assert (=> bs!7589 m!143189))

(declare-fun m!143761 () Bool)

(assert (=> bs!7589 m!143761))

(assert (=> b!98536 d!31000))

(declare-fun d!31002 () Bool)

(declare-fun e!64615 () Bool)

(assert (=> d!31002 e!64615))

(declare-fun res!81050 () Bool)

(assert (=> d!31002 (=> (not res!81050) (not e!64615))))

(assert (=> d!31002 (= res!81050 (invariant!0 (currentBit!4888 (_2!4226 lt!142946)) (currentByte!4893 (_2!4226 lt!142946)) (size!2112 (buf!2463 (_2!4226 lt!142946)))))))

(assert (=> d!31002 (= (readerFrom!0 (_2!4226 lt!142946) (currentBit!4888 thiss!1288) (currentByte!4893 thiss!1288)) (BitStream!3699 (buf!2463 (_2!4226 lt!142946)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288)))))

(declare-fun b!98812 () Bool)

(assert (=> b!98812 (= e!64615 (invariant!0 (currentBit!4888 thiss!1288) (currentByte!4893 thiss!1288) (size!2112 (buf!2463 (_2!4226 lt!142946)))))))

(assert (= (and d!31002 res!81050) b!98812))

(declare-fun m!143763 () Bool)

(assert (=> d!31002 m!143763))

(declare-fun m!143765 () Bool)

(assert (=> b!98812 m!143765))

(assert (=> b!98536 d!31002))

(declare-fun d!31004 () Bool)

(assert (=> d!31004 (isPrefixOf!0 lt!143170 (_2!4226 lt!142612))))

(declare-fun lt!143559 () Unit!6033)

(declare-fun choose!30 (BitStream!3698 BitStream!3698 BitStream!3698) Unit!6033)

(assert (=> d!31004 (= lt!143559 (choose!30 lt!143170 thiss!1288 (_2!4226 lt!142612)))))

(assert (=> d!31004 (isPrefixOf!0 lt!143170 thiss!1288)))

(assert (=> d!31004 (= (lemmaIsPrefixTransitive!0 lt!143170 thiss!1288 (_2!4226 lt!142612)) lt!143559)))

(declare-fun bs!7590 () Bool)

(assert (= bs!7590 d!31004))

(assert (=> bs!7590 m!143265))

(declare-fun m!143767 () Bool)

(assert (=> bs!7590 m!143767))

(declare-fun m!143769 () Bool)

(assert (=> bs!7590 m!143769))

(assert (=> d!30842 d!31004))

(declare-fun d!31006 () Bool)

(assert (=> d!31006 (isPrefixOf!0 (_2!4226 lt!142612) (_2!4226 lt!142612))))

(declare-fun lt!143562 () Unit!6033)

(declare-fun choose!11 (BitStream!3698) Unit!6033)

(assert (=> d!31006 (= lt!143562 (choose!11 (_2!4226 lt!142612)))))

(assert (=> d!31006 (= (lemmaIsPrefixRefl!0 (_2!4226 lt!142612)) lt!143562)))

(declare-fun bs!7592 () Bool)

(assert (= bs!7592 d!31006))

(assert (=> bs!7592 m!143263))

(declare-fun m!143771 () Bool)

(assert (=> bs!7592 m!143771))

(assert (=> d!30842 d!31006))

(declare-fun d!31008 () Bool)

(assert (=> d!31008 (isPrefixOf!0 lt!143170 lt!143170)))

(declare-fun lt!143563 () Unit!6033)

(assert (=> d!31008 (= lt!143563 (choose!11 lt!143170))))

(assert (=> d!31008 (= (lemmaIsPrefixRefl!0 lt!143170) lt!143563)))

(declare-fun bs!7593 () Bool)

(assert (= bs!7593 d!31008))

(assert (=> bs!7593 m!143269))

(declare-fun m!143773 () Bool)

(assert (=> bs!7593 m!143773))

(assert (=> d!30842 d!31008))

(declare-fun d!31010 () Bool)

(declare-fun res!81053 () Bool)

(declare-fun e!64616 () Bool)

(assert (=> d!31010 (=> (not res!81053) (not e!64616))))

(assert (=> d!31010 (= res!81053 (= (size!2112 (buf!2463 (_1!4228 lt!143166))) (size!2112 (buf!2463 (_2!4228 lt!143166)))))))

(assert (=> d!31010 (= (isPrefixOf!0 (_1!4228 lt!143166) (_2!4228 lt!143166)) e!64616)))

(declare-fun b!98813 () Bool)

(declare-fun res!81052 () Bool)

(assert (=> b!98813 (=> (not res!81052) (not e!64616))))

(assert (=> b!98813 (= res!81052 (bvsle (bitIndex!0 (size!2112 (buf!2463 (_1!4228 lt!143166))) (currentByte!4893 (_1!4228 lt!143166)) (currentBit!4888 (_1!4228 lt!143166))) (bitIndex!0 (size!2112 (buf!2463 (_2!4228 lt!143166))) (currentByte!4893 (_2!4228 lt!143166)) (currentBit!4888 (_2!4228 lt!143166)))))))

(declare-fun b!98814 () Bool)

(declare-fun e!64617 () Bool)

(assert (=> b!98814 (= e!64616 e!64617)))

(declare-fun res!81051 () Bool)

(assert (=> b!98814 (=> res!81051 e!64617)))

(assert (=> b!98814 (= res!81051 (= (size!2112 (buf!2463 (_1!4228 lt!143166))) #b00000000000000000000000000000000))))

(declare-fun b!98815 () Bool)

(assert (=> b!98815 (= e!64617 (arrayBitRangesEq!0 (buf!2463 (_1!4228 lt!143166)) (buf!2463 (_2!4228 lt!143166)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2112 (buf!2463 (_1!4228 lt!143166))) (currentByte!4893 (_1!4228 lt!143166)) (currentBit!4888 (_1!4228 lt!143166)))))))

(assert (= (and d!31010 res!81053) b!98813))

(assert (= (and b!98813 res!81052) b!98814))

(assert (= (and b!98814 (not res!81051)) b!98815))

(declare-fun m!143775 () Bool)

(assert (=> b!98813 m!143775))

(declare-fun m!143777 () Bool)

(assert (=> b!98813 m!143777))

(assert (=> b!98815 m!143775))

(assert (=> b!98815 m!143775))

(declare-fun m!143779 () Bool)

(assert (=> b!98815 m!143779))

(assert (=> d!30842 d!31010))

(assert (=> d!30842 d!30828))

(declare-fun d!31012 () Bool)

(declare-fun res!81056 () Bool)

(declare-fun e!64618 () Bool)

(assert (=> d!31012 (=> (not res!81056) (not e!64618))))

(assert (=> d!31012 (= res!81056 (= (size!2112 (buf!2463 (_2!4226 lt!142612))) (size!2112 (buf!2463 (_2!4226 lt!142612)))))))

(assert (=> d!31012 (= (isPrefixOf!0 (_2!4226 lt!142612) (_2!4226 lt!142612)) e!64618)))

(declare-fun b!98816 () Bool)

(declare-fun res!81055 () Bool)

(assert (=> b!98816 (=> (not res!81055) (not e!64618))))

(assert (=> b!98816 (= res!81055 (bvsle (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142612))) (currentByte!4893 (_2!4226 lt!142612)) (currentBit!4888 (_2!4226 lt!142612))) (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142612))) (currentByte!4893 (_2!4226 lt!142612)) (currentBit!4888 (_2!4226 lt!142612)))))))

(declare-fun b!98817 () Bool)

(declare-fun e!64619 () Bool)

(assert (=> b!98817 (= e!64618 e!64619)))

(declare-fun res!81054 () Bool)

(assert (=> b!98817 (=> res!81054 e!64619)))

(assert (=> b!98817 (= res!81054 (= (size!2112 (buf!2463 (_2!4226 lt!142612))) #b00000000000000000000000000000000))))

(declare-fun b!98818 () Bool)

(assert (=> b!98818 (= e!64619 (arrayBitRangesEq!0 (buf!2463 (_2!4226 lt!142612)) (buf!2463 (_2!4226 lt!142612)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142612))) (currentByte!4893 (_2!4226 lt!142612)) (currentBit!4888 (_2!4226 lt!142612)))))))

(assert (= (and d!31012 res!81056) b!98816))

(assert (= (and b!98816 res!81055) b!98817))

(assert (= (and b!98817 (not res!81054)) b!98818))

(assert (=> b!98816 m!142985))

(assert (=> b!98816 m!142985))

(assert (=> b!98818 m!142985))

(assert (=> b!98818 m!142985))

(declare-fun m!143781 () Bool)

(assert (=> b!98818 m!143781))

(assert (=> d!30842 d!31012))

(declare-fun d!31014 () Bool)

(assert (=> d!31014 (isPrefixOf!0 lt!143170 (_2!4226 lt!142612))))

(declare-fun lt!143564 () Unit!6033)

(assert (=> d!31014 (= lt!143564 (choose!30 lt!143170 (_2!4226 lt!142612) (_2!4226 lt!142612)))))

(assert (=> d!31014 (isPrefixOf!0 lt!143170 (_2!4226 lt!142612))))

(assert (=> d!31014 (= (lemmaIsPrefixTransitive!0 lt!143170 (_2!4226 lt!142612) (_2!4226 lt!142612)) lt!143564)))

(declare-fun bs!7594 () Bool)

(assert (= bs!7594 d!31014))

(assert (=> bs!7594 m!143265))

(declare-fun m!143783 () Bool)

(assert (=> bs!7594 m!143783))

(assert (=> bs!7594 m!143265))

(assert (=> d!30842 d!31014))

(declare-fun d!31016 () Bool)

(declare-fun res!81059 () Bool)

(declare-fun e!64620 () Bool)

(assert (=> d!31016 (=> (not res!81059) (not e!64620))))

(assert (=> d!31016 (= res!81059 (= (size!2112 (buf!2463 lt!143170)) (size!2112 (buf!2463 lt!143170))))))

(assert (=> d!31016 (= (isPrefixOf!0 lt!143170 lt!143170) e!64620)))

(declare-fun b!98819 () Bool)

(declare-fun res!81058 () Bool)

(assert (=> b!98819 (=> (not res!81058) (not e!64620))))

(assert (=> b!98819 (= res!81058 (bvsle (bitIndex!0 (size!2112 (buf!2463 lt!143170)) (currentByte!4893 lt!143170) (currentBit!4888 lt!143170)) (bitIndex!0 (size!2112 (buf!2463 lt!143170)) (currentByte!4893 lt!143170) (currentBit!4888 lt!143170))))))

(declare-fun b!98820 () Bool)

(declare-fun e!64621 () Bool)

(assert (=> b!98820 (= e!64620 e!64621)))

(declare-fun res!81057 () Bool)

(assert (=> b!98820 (=> res!81057 e!64621)))

(assert (=> b!98820 (= res!81057 (= (size!2112 (buf!2463 lt!143170)) #b00000000000000000000000000000000))))

(declare-fun b!98821 () Bool)

(assert (=> b!98821 (= e!64621 (arrayBitRangesEq!0 (buf!2463 lt!143170) (buf!2463 lt!143170) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2112 (buf!2463 lt!143170)) (currentByte!4893 lt!143170) (currentBit!4888 lt!143170))))))

(assert (= (and d!31016 res!81059) b!98819))

(assert (= (and b!98819 res!81058) b!98820))

(assert (= (and b!98820 (not res!81057)) b!98821))

(declare-fun m!143785 () Bool)

(assert (=> b!98819 m!143785))

(assert (=> b!98819 m!143785))

(assert (=> b!98821 m!143785))

(assert (=> b!98821 m!143785))

(declare-fun m!143787 () Bool)

(assert (=> b!98821 m!143787))

(assert (=> d!30842 d!31016))

(declare-fun d!31018 () Bool)

(declare-fun res!81062 () Bool)

(declare-fun e!64622 () Bool)

(assert (=> d!31018 (=> (not res!81062) (not e!64622))))

(assert (=> d!31018 (= res!81062 (= (size!2112 (buf!2463 thiss!1288)) (size!2112 (buf!2463 thiss!1288))))))

(assert (=> d!31018 (= (isPrefixOf!0 thiss!1288 thiss!1288) e!64622)))

(declare-fun b!98822 () Bool)

(declare-fun res!81061 () Bool)

(assert (=> b!98822 (=> (not res!81061) (not e!64622))))

(assert (=> b!98822 (= res!81061 (bvsle (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288)) (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288))))))

(declare-fun b!98823 () Bool)

(declare-fun e!64623 () Bool)

(assert (=> b!98823 (= e!64622 e!64623)))

(declare-fun res!81060 () Bool)

(assert (=> b!98823 (=> res!81060 e!64623)))

(assert (=> b!98823 (= res!81060 (= (size!2112 (buf!2463 thiss!1288)) #b00000000000000000000000000000000))))

(declare-fun b!98824 () Bool)

(assert (=> b!98824 (= e!64623 (arrayBitRangesEq!0 (buf!2463 thiss!1288) (buf!2463 thiss!1288) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288))))))

(assert (= (and d!31018 res!81062) b!98822))

(assert (= (and b!98822 res!81061) b!98823))

(assert (= (and b!98823 (not res!81060)) b!98824))

(assert (=> b!98822 m!142987))

(assert (=> b!98822 m!142987))

(assert (=> b!98824 m!142987))

(assert (=> b!98824 m!142987))

(declare-fun m!143789 () Bool)

(assert (=> b!98824 m!143789))

(assert (=> d!30842 d!31018))

(declare-fun d!31020 () Bool)

(assert (=> d!31020 (isPrefixOf!0 thiss!1288 thiss!1288)))

(declare-fun lt!143565 () Unit!6033)

(assert (=> d!31020 (= lt!143565 (choose!11 thiss!1288))))

(assert (=> d!31020 (= (lemmaIsPrefixRefl!0 thiss!1288) lt!143565)))

(declare-fun bs!7595 () Bool)

(assert (= bs!7595 d!31020))

(assert (=> bs!7595 m!143271))

(declare-fun m!143791 () Bool)

(assert (=> bs!7595 m!143791))

(assert (=> d!30842 d!31020))

(declare-fun d!31022 () Bool)

(declare-fun res!81065 () Bool)

(declare-fun e!64624 () Bool)

(assert (=> d!31022 (=> (not res!81065) (not e!64624))))

(assert (=> d!31022 (= res!81065 (= (size!2112 (buf!2463 lt!143170)) (size!2112 (buf!2463 (_2!4226 lt!142612)))))))

(assert (=> d!31022 (= (isPrefixOf!0 lt!143170 (_2!4226 lt!142612)) e!64624)))

(declare-fun b!98825 () Bool)

(declare-fun res!81064 () Bool)

(assert (=> b!98825 (=> (not res!81064) (not e!64624))))

(assert (=> b!98825 (= res!81064 (bvsle (bitIndex!0 (size!2112 (buf!2463 lt!143170)) (currentByte!4893 lt!143170) (currentBit!4888 lt!143170)) (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142612))) (currentByte!4893 (_2!4226 lt!142612)) (currentBit!4888 (_2!4226 lt!142612)))))))

(declare-fun b!98826 () Bool)

(declare-fun e!64625 () Bool)

(assert (=> b!98826 (= e!64624 e!64625)))

(declare-fun res!81063 () Bool)

(assert (=> b!98826 (=> res!81063 e!64625)))

(assert (=> b!98826 (= res!81063 (= (size!2112 (buf!2463 lt!143170)) #b00000000000000000000000000000000))))

(declare-fun b!98827 () Bool)

(assert (=> b!98827 (= e!64625 (arrayBitRangesEq!0 (buf!2463 lt!143170) (buf!2463 (_2!4226 lt!142612)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2112 (buf!2463 lt!143170)) (currentByte!4893 lt!143170) (currentBit!4888 lt!143170))))))

(assert (= (and d!31022 res!81065) b!98825))

(assert (= (and b!98825 res!81064) b!98826))

(assert (= (and b!98826 (not res!81063)) b!98827))

(assert (=> b!98825 m!143785))

(assert (=> b!98825 m!142985))

(assert (=> b!98827 m!143785))

(assert (=> b!98827 m!143785))

(declare-fun m!143793 () Bool)

(assert (=> b!98827 m!143793))

(assert (=> d!30842 d!31022))

(declare-fun d!31024 () Bool)

(declare-fun res!81068 () Bool)

(declare-fun e!64626 () Bool)

(assert (=> d!31024 (=> (not res!81068) (not e!64626))))

(assert (=> d!31024 (= res!81068 (= (size!2112 (buf!2463 (_1!4228 lt!143166))) (size!2112 (buf!2463 thiss!1288))))))

(assert (=> d!31024 (= (isPrefixOf!0 (_1!4228 lt!143166) thiss!1288) e!64626)))

(declare-fun b!98828 () Bool)

(declare-fun res!81067 () Bool)

(assert (=> b!98828 (=> (not res!81067) (not e!64626))))

(assert (=> b!98828 (= res!81067 (bvsle (bitIndex!0 (size!2112 (buf!2463 (_1!4228 lt!143166))) (currentByte!4893 (_1!4228 lt!143166)) (currentBit!4888 (_1!4228 lt!143166))) (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288))))))

(declare-fun b!98829 () Bool)

(declare-fun e!64627 () Bool)

(assert (=> b!98829 (= e!64626 e!64627)))

(declare-fun res!81066 () Bool)

(assert (=> b!98829 (=> res!81066 e!64627)))

(assert (=> b!98829 (= res!81066 (= (size!2112 (buf!2463 (_1!4228 lt!143166))) #b00000000000000000000000000000000))))

(declare-fun b!98830 () Bool)

(assert (=> b!98830 (= e!64627 (arrayBitRangesEq!0 (buf!2463 (_1!4228 lt!143166)) (buf!2463 thiss!1288) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2112 (buf!2463 (_1!4228 lt!143166))) (currentByte!4893 (_1!4228 lt!143166)) (currentBit!4888 (_1!4228 lt!143166)))))))

(assert (= (and d!31024 res!81068) b!98828))

(assert (= (and b!98828 res!81067) b!98829))

(assert (= (and b!98829 (not res!81066)) b!98830))

(assert (=> b!98828 m!143775))

(assert (=> b!98828 m!142987))

(assert (=> b!98830 m!143775))

(assert (=> b!98830 m!143775))

(declare-fun m!143795 () Bool)

(assert (=> b!98830 m!143795))

(assert (=> b!98613 d!31024))

(declare-fun d!31026 () Bool)

(assert (=> d!31026 (= (remainingBits!0 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142612)))) ((_ sign_extend 32) (currentByte!4893 (_2!4226 lt!142612))) ((_ sign_extend 32) (currentBit!4888 (_2!4226 lt!142612)))) (bvsub (bvmul ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142612)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4893 (_2!4226 lt!142612))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4888 (_2!4226 lt!142612))))))))

(assert (=> d!30852 d!31026))

(declare-fun d!31028 () Bool)

(assert (=> d!31028 (= (invariant!0 (currentBit!4888 (_2!4226 lt!142612)) (currentByte!4893 (_2!4226 lt!142612)) (size!2112 (buf!2463 (_2!4226 lt!142612)))) (and (bvsge (currentBit!4888 (_2!4226 lt!142612)) #b00000000000000000000000000000000) (bvslt (currentBit!4888 (_2!4226 lt!142612)) #b00000000000000000000000000001000) (bvsge (currentByte!4893 (_2!4226 lt!142612)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4893 (_2!4226 lt!142612)) (size!2112 (buf!2463 (_2!4226 lt!142612)))) (and (= (currentBit!4888 (_2!4226 lt!142612)) #b00000000000000000000000000000000) (= (currentByte!4893 (_2!4226 lt!142612)) (size!2112 (buf!2463 (_2!4226 lt!142612))))))))))

(assert (=> d!30852 d!31028))

(declare-fun d!31030 () Bool)

(declare-fun res!81071 () Bool)

(declare-fun e!64628 () Bool)

(assert (=> d!31030 (=> (not res!81071) (not e!64628))))

(assert (=> d!31030 (= res!81071 (= (size!2112 (buf!2463 (_2!4228 lt!143166))) (size!2112 (buf!2463 (_2!4226 lt!142612)))))))

(assert (=> d!31030 (= (isPrefixOf!0 (_2!4228 lt!143166) (_2!4226 lt!142612)) e!64628)))

(declare-fun b!98831 () Bool)

(declare-fun res!81070 () Bool)

(assert (=> b!98831 (=> (not res!81070) (not e!64628))))

(assert (=> b!98831 (= res!81070 (bvsle (bitIndex!0 (size!2112 (buf!2463 (_2!4228 lt!143166))) (currentByte!4893 (_2!4228 lt!143166)) (currentBit!4888 (_2!4228 lt!143166))) (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142612))) (currentByte!4893 (_2!4226 lt!142612)) (currentBit!4888 (_2!4226 lt!142612)))))))

(declare-fun b!98832 () Bool)

(declare-fun e!64629 () Bool)

(assert (=> b!98832 (= e!64628 e!64629)))

(declare-fun res!81069 () Bool)

(assert (=> b!98832 (=> res!81069 e!64629)))

(assert (=> b!98832 (= res!81069 (= (size!2112 (buf!2463 (_2!4228 lt!143166))) #b00000000000000000000000000000000))))

(declare-fun b!98833 () Bool)

(assert (=> b!98833 (= e!64629 (arrayBitRangesEq!0 (buf!2463 (_2!4228 lt!143166)) (buf!2463 (_2!4226 lt!142612)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2112 (buf!2463 (_2!4228 lt!143166))) (currentByte!4893 (_2!4228 lt!143166)) (currentBit!4888 (_2!4228 lt!143166)))))))

(assert (= (and d!31030 res!81071) b!98831))

(assert (= (and b!98831 res!81070) b!98832))

(assert (= (and b!98832 (not res!81069)) b!98833))

(assert (=> b!98831 m!143777))

(assert (=> b!98831 m!142985))

(assert (=> b!98833 m!143777))

(assert (=> b!98833 m!143777))

(declare-fun m!143797 () Bool)

(assert (=> b!98833 m!143797))

(assert (=> b!98614 d!31030))

(declare-fun d!31032 () Bool)

(assert (=> d!31032 (= (remainingBits!0 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142612)))) ((_ sign_extend 32) (currentByte!4893 thiss!1288)) ((_ sign_extend 32) (currentBit!4888 thiss!1288))) (bvsub (bvmul ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142612)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4893 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4888 thiss!1288)))))))

(assert (=> d!30838 d!31032))

(assert (=> b!98610 d!30854))

(declare-fun d!31034 () Bool)

(assert (=> d!31034 (arrayBitRangesEq!0 (buf!2463 (_2!4226 lt!142612)) (buf!2463 thiss!1288) lt!143171 lt!143169)))

(declare-fun lt!143568 () Unit!6033)

(declare-fun choose!8 (array!4622 array!4622 (_ BitVec 64) (_ BitVec 64)) Unit!6033)

(assert (=> d!31034 (= lt!143568 (choose!8 (buf!2463 thiss!1288) (buf!2463 (_2!4226 lt!142612)) lt!143171 lt!143169))))

(assert (=> d!31034 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!143171) (bvsle lt!143171 lt!143169))))

(assert (=> d!31034 (= (arrayBitRangesEqSymmetric!0 (buf!2463 thiss!1288) (buf!2463 (_2!4226 lt!142612)) lt!143171 lt!143169) lt!143568)))

(declare-fun bs!7596 () Bool)

(assert (= bs!7596 d!31034))

(assert (=> bs!7596 m!143279))

(declare-fun m!143799 () Bool)

(assert (=> bs!7596 m!143799))

(assert (=> b!98610 d!31034))

(declare-fun b!98834 () Bool)

(declare-fun e!64632 () Bool)

(declare-fun e!64635 () Bool)

(assert (=> b!98834 (= e!64632 e!64635)))

(declare-fun c!6255 () Bool)

(declare-fun lt!143569 () tuple4!64)

(assert (=> b!98834 (= c!6255 (= (_3!253 lt!143569) (_4!32 lt!143569)))))

(declare-fun b!98835 () Bool)

(declare-fun res!81076 () Bool)

(declare-fun lt!143570 () (_ BitVec 32))

(assert (=> b!98835 (= res!81076 (= lt!143570 #b00000000000000000000000000000000))))

(declare-fun e!64630 () Bool)

(assert (=> b!98835 (=> res!81076 e!64630)))

(declare-fun e!64631 () Bool)

(assert (=> b!98835 (= e!64631 e!64630)))

(declare-fun bm!1237 () Bool)

(declare-fun lt!143571 () (_ BitVec 32))

(declare-fun call!1240 () Bool)

(assert (=> bm!1237 (= call!1240 (byteRangesEq!0 (select (arr!2705 (buf!2463 (_2!4226 lt!142612))) (_3!253 lt!143569)) (select (arr!2705 (buf!2463 thiss!1288)) (_3!253 lt!143569)) lt!143571 (ite c!6255 lt!143570 #b00000000000000000000000000001000)))))

(declare-fun e!64634 () Bool)

(declare-fun b!98837 () Bool)

(assert (=> b!98837 (= e!64634 (arrayRangesEq!33 (buf!2463 (_2!4226 lt!142612)) (buf!2463 thiss!1288) (_1!4237 lt!143569) (_2!4237 lt!143569)))))

(declare-fun b!98838 () Bool)

(assert (=> b!98838 (= e!64635 e!64631)))

(declare-fun res!81072 () Bool)

(assert (=> b!98838 (= res!81072 call!1240)))

(assert (=> b!98838 (=> (not res!81072) (not e!64631))))

(declare-fun b!98839 () Bool)

(declare-fun e!64633 () Bool)

(assert (=> b!98839 (= e!64633 e!64632)))

(declare-fun res!81073 () Bool)

(assert (=> b!98839 (=> (not res!81073) (not e!64632))))

(assert (=> b!98839 (= res!81073 e!64634)))

(declare-fun res!81075 () Bool)

(assert (=> b!98839 (=> res!81075 e!64634)))

(assert (=> b!98839 (= res!81075 (bvsge (_1!4237 lt!143569) (_2!4237 lt!143569)))))

(assert (=> b!98839 (= lt!143570 ((_ extract 31 0) (bvsrem lt!143169 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98839 (= lt!143571 ((_ extract 31 0) (bvsrem lt!143171 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98839 (= lt!143569 (arrayBitIndices!0 lt!143171 lt!143169))))

(declare-fun b!98840 () Bool)

(assert (=> b!98840 (= e!64630 (byteRangesEq!0 (select (arr!2705 (buf!2463 (_2!4226 lt!142612))) (_4!32 lt!143569)) (select (arr!2705 (buf!2463 thiss!1288)) (_4!32 lt!143569)) #b00000000000000000000000000000000 lt!143570))))

(declare-fun b!98836 () Bool)

(assert (=> b!98836 (= e!64635 call!1240)))

(declare-fun d!31036 () Bool)

(declare-fun res!81074 () Bool)

(assert (=> d!31036 (=> res!81074 e!64633)))

(assert (=> d!31036 (= res!81074 (bvsge lt!143171 lt!143169))))

(assert (=> d!31036 (= (arrayBitRangesEq!0 (buf!2463 (_2!4226 lt!142612)) (buf!2463 thiss!1288) lt!143171 lt!143169) e!64633)))

(assert (= (and d!31036 (not res!81074)) b!98839))

(assert (= (and b!98839 (not res!81075)) b!98837))

(assert (= (and b!98839 res!81073) b!98834))

(assert (= (and b!98834 c!6255) b!98836))

(assert (= (and b!98834 (not c!6255)) b!98838))

(assert (= (and b!98838 res!81072) b!98835))

(assert (= (and b!98835 (not res!81076)) b!98840))

(assert (= (or b!98836 b!98838) bm!1237))

(declare-fun m!143801 () Bool)

(assert (=> bm!1237 m!143801))

(declare-fun m!143803 () Bool)

(assert (=> bm!1237 m!143803))

(assert (=> bm!1237 m!143801))

(assert (=> bm!1237 m!143803))

(declare-fun m!143805 () Bool)

(assert (=> bm!1237 m!143805))

(declare-fun m!143807 () Bool)

(assert (=> b!98837 m!143807))

(declare-fun m!143809 () Bool)

(assert (=> b!98839 m!143809))

(declare-fun m!143811 () Bool)

(assert (=> b!98840 m!143811))

(declare-fun m!143813 () Bool)

(assert (=> b!98840 m!143813))

(assert (=> b!98840 m!143811))

(assert (=> b!98840 m!143813))

(declare-fun m!143815 () Bool)

(assert (=> b!98840 m!143815))

(assert (=> b!98610 d!31036))

(declare-fun d!31038 () Bool)

(declare-fun e!64638 () Bool)

(assert (=> d!31038 e!64638))

(declare-fun res!81079 () Bool)

(assert (=> d!31038 (=> (not res!81079) (not e!64638))))

(declare-fun lt!143577 () (_ BitVec 64))

(declare-fun lt!143576 () BitStream!3698)

(assert (=> d!31038 (= res!81079 (= (bvadd lt!143577 (bvsub lt!143173 lt!143164)) (bitIndex!0 (size!2112 (buf!2463 lt!143576)) (currentByte!4893 lt!143576) (currentBit!4888 lt!143576))))))

(assert (=> d!31038 (or (not (= (bvand lt!143577 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143173 lt!143164) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!143577 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!143577 (bvsub lt!143173 lt!143164)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31038 (= lt!143577 (bitIndex!0 (size!2112 (buf!2463 (_2!4228 lt!143166))) (currentByte!4893 (_2!4228 lt!143166)) (currentBit!4888 (_2!4228 lt!143166))))))

(declare-fun moveBitIndex!0 (BitStream!3698 (_ BitVec 64)) tuple2!7948)

(assert (=> d!31038 (= lt!143576 (_2!4226 (moveBitIndex!0 (_2!4228 lt!143166) (bvsub lt!143173 lt!143164))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!3698 (_ BitVec 64)) Bool)

(assert (=> d!31038 (moveBitIndexPrecond!0 (_2!4228 lt!143166) (bvsub lt!143173 lt!143164))))

(assert (=> d!31038 (= (withMovedBitIndex!0 (_2!4228 lt!143166) (bvsub lt!143173 lt!143164)) lt!143576)))

(declare-fun b!98843 () Bool)

(assert (=> b!98843 (= e!64638 (= (size!2112 (buf!2463 (_2!4228 lt!143166))) (size!2112 (buf!2463 lt!143576))))))

(assert (= (and d!31038 res!81079) b!98843))

(declare-fun m!143817 () Bool)

(assert (=> d!31038 m!143817))

(assert (=> d!31038 m!143777))

(declare-fun m!143819 () Bool)

(assert (=> d!31038 m!143819))

(declare-fun m!143821 () Bool)

(assert (=> d!31038 m!143821))

(assert (=> b!98611 d!31038))

(assert (=> b!98611 d!30852))

(assert (=> b!98611 d!30854))

(declare-fun d!31040 () Bool)

(assert (=> d!31040 (validate_offset_bits!1 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142948)))) ((_ sign_extend 32) (currentByte!4893 thiss!1288)) ((_ sign_extend 32) (currentBit!4888 thiss!1288)) lt!142934)))

(declare-fun lt!143578 () Unit!6033)

(assert (=> d!31040 (= lt!143578 (choose!9 thiss!1288 (buf!2463 (_2!4226 lt!142948)) lt!142934 (BitStream!3699 (buf!2463 (_2!4226 lt!142948)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288))))))

(assert (=> d!31040 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2463 (_2!4226 lt!142948)) lt!142934) lt!143578)))

(declare-fun bs!7597 () Bool)

(assert (= bs!7597 d!31040))

(assert (=> bs!7597 m!143195))

(declare-fun m!143823 () Bool)

(assert (=> bs!7597 m!143823))

(assert (=> b!98545 d!31040))

(declare-fun b!98844 () Bool)

(declare-fun e!64639 () Unit!6033)

(declare-fun lt!143593 () Unit!6033)

(assert (=> b!98844 (= e!64639 lt!143593)))

(declare-fun lt!143588 () (_ BitVec 64))

(assert (=> b!98844 (= lt!143588 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!143586 () (_ BitVec 64))

(assert (=> b!98844 (= lt!143586 (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288)))))

(assert (=> b!98844 (= lt!143593 (arrayBitRangesEqSymmetric!0 (buf!2463 thiss!1288) (buf!2463 (_2!4226 lt!142948)) lt!143588 lt!143586))))

(assert (=> b!98844 (arrayBitRangesEq!0 (buf!2463 (_2!4226 lt!142948)) (buf!2463 thiss!1288) lt!143588 lt!143586)))

(declare-fun lt!143581 () (_ BitVec 64))

(declare-fun e!64640 () Bool)

(declare-fun lt!143583 () tuple2!7952)

(declare-fun b!98845 () Bool)

(declare-fun lt!143590 () (_ BitVec 64))

(assert (=> b!98845 (= e!64640 (= (_1!4228 lt!143583) (withMovedBitIndex!0 (_2!4228 lt!143583) (bvsub lt!143590 lt!143581))))))

(assert (=> b!98845 (or (= (bvand lt!143590 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143581 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143590 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143590 lt!143581) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98845 (= lt!143581 (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142948))) (currentByte!4893 (_2!4226 lt!142948)) (currentBit!4888 (_2!4226 lt!142948))))))

(assert (=> b!98845 (= lt!143590 (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288)))))

(declare-fun b!98846 () Bool)

(declare-fun Unit!6065 () Unit!6033)

(assert (=> b!98846 (= e!64639 Unit!6065)))

(declare-fun d!31042 () Bool)

(assert (=> d!31042 e!64640))

(declare-fun res!81081 () Bool)

(assert (=> d!31042 (=> (not res!81081) (not e!64640))))

(assert (=> d!31042 (= res!81081 (isPrefixOf!0 (_1!4228 lt!143583) (_2!4228 lt!143583)))))

(declare-fun lt!143587 () BitStream!3698)

(assert (=> d!31042 (= lt!143583 (tuple2!7953 lt!143587 (_2!4226 lt!142948)))))

(declare-fun lt!143597 () Unit!6033)

(declare-fun lt!143591 () Unit!6033)

(assert (=> d!31042 (= lt!143597 lt!143591)))

(assert (=> d!31042 (isPrefixOf!0 lt!143587 (_2!4226 lt!142948))))

(assert (=> d!31042 (= lt!143591 (lemmaIsPrefixTransitive!0 lt!143587 (_2!4226 lt!142948) (_2!4226 lt!142948)))))

(declare-fun lt!143585 () Unit!6033)

(declare-fun lt!143579 () Unit!6033)

(assert (=> d!31042 (= lt!143585 lt!143579)))

(assert (=> d!31042 (isPrefixOf!0 lt!143587 (_2!4226 lt!142948))))

(assert (=> d!31042 (= lt!143579 (lemmaIsPrefixTransitive!0 lt!143587 thiss!1288 (_2!4226 lt!142948)))))

(declare-fun lt!143598 () Unit!6033)

(assert (=> d!31042 (= lt!143598 e!64639)))

(declare-fun c!6256 () Bool)

(assert (=> d!31042 (= c!6256 (not (= (size!2112 (buf!2463 thiss!1288)) #b00000000000000000000000000000000)))))

(declare-fun lt!143595 () Unit!6033)

(declare-fun lt!143582 () Unit!6033)

(assert (=> d!31042 (= lt!143595 lt!143582)))

(assert (=> d!31042 (isPrefixOf!0 (_2!4226 lt!142948) (_2!4226 lt!142948))))

(assert (=> d!31042 (= lt!143582 (lemmaIsPrefixRefl!0 (_2!4226 lt!142948)))))

(declare-fun lt!143594 () Unit!6033)

(declare-fun lt!143589 () Unit!6033)

(assert (=> d!31042 (= lt!143594 lt!143589)))

(assert (=> d!31042 (= lt!143589 (lemmaIsPrefixRefl!0 (_2!4226 lt!142948)))))

(declare-fun lt!143580 () Unit!6033)

(declare-fun lt!143584 () Unit!6033)

(assert (=> d!31042 (= lt!143580 lt!143584)))

(assert (=> d!31042 (isPrefixOf!0 lt!143587 lt!143587)))

(assert (=> d!31042 (= lt!143584 (lemmaIsPrefixRefl!0 lt!143587))))

(declare-fun lt!143592 () Unit!6033)

(declare-fun lt!143596 () Unit!6033)

(assert (=> d!31042 (= lt!143592 lt!143596)))

(assert (=> d!31042 (isPrefixOf!0 thiss!1288 thiss!1288)))

(assert (=> d!31042 (= lt!143596 (lemmaIsPrefixRefl!0 thiss!1288))))

(assert (=> d!31042 (= lt!143587 (BitStream!3699 (buf!2463 (_2!4226 lt!142948)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288)))))

(assert (=> d!31042 (isPrefixOf!0 thiss!1288 (_2!4226 lt!142948))))

(assert (=> d!31042 (= (reader!0 thiss!1288 (_2!4226 lt!142948)) lt!143583)))

(declare-fun b!98847 () Bool)

(declare-fun res!81082 () Bool)

(assert (=> b!98847 (=> (not res!81082) (not e!64640))))

(assert (=> b!98847 (= res!81082 (isPrefixOf!0 (_1!4228 lt!143583) thiss!1288))))

(declare-fun b!98848 () Bool)

(declare-fun res!81080 () Bool)

(assert (=> b!98848 (=> (not res!81080) (not e!64640))))

(assert (=> b!98848 (= res!81080 (isPrefixOf!0 (_2!4228 lt!143583) (_2!4226 lt!142948)))))

(assert (= (and d!31042 c!6256) b!98844))

(assert (= (and d!31042 (not c!6256)) b!98846))

(assert (= (and d!31042 res!81081) b!98847))

(assert (= (and b!98847 res!81082) b!98848))

(assert (= (and b!98848 res!81080) b!98845))

(declare-fun m!143825 () Bool)

(assert (=> b!98848 m!143825))

(declare-fun m!143827 () Bool)

(assert (=> d!31042 m!143827))

(declare-fun m!143829 () Bool)

(assert (=> d!31042 m!143829))

(declare-fun m!143831 () Bool)

(assert (=> d!31042 m!143831))

(declare-fun m!143833 () Bool)

(assert (=> d!31042 m!143833))

(assert (=> d!31042 m!143203))

(declare-fun m!143835 () Bool)

(assert (=> d!31042 m!143835))

(declare-fun m!143837 () Bool)

(assert (=> d!31042 m!143837))

(declare-fun m!143839 () Bool)

(assert (=> d!31042 m!143839))

(assert (=> d!31042 m!143267))

(declare-fun m!143841 () Bool)

(assert (=> d!31042 m!143841))

(assert (=> d!31042 m!143271))

(declare-fun m!143843 () Bool)

(assert (=> b!98847 m!143843))

(declare-fun m!143845 () Bool)

(assert (=> b!98845 m!143845))

(assert (=> b!98845 m!143205))

(assert (=> b!98845 m!142987))

(assert (=> b!98844 m!142987))

(declare-fun m!143847 () Bool)

(assert (=> b!98844 m!143847))

(declare-fun m!143849 () Bool)

(assert (=> b!98844 m!143849))

(assert (=> b!98545 d!31042))

(declare-fun d!31044 () Bool)

(assert (=> d!31044 (= (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(assert (=> b!98545 d!31044))

(declare-fun d!31046 () Bool)

(assert (=> d!31046 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142948)))) ((_ sign_extend 32) (currentByte!4893 thiss!1288)) ((_ sign_extend 32) (currentBit!4888 thiss!1288)) lt!142934) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142948)))) ((_ sign_extend 32) (currentByte!4893 thiss!1288)) ((_ sign_extend 32) (currentBit!4888 thiss!1288))) lt!142934))))

(declare-fun bs!7598 () Bool)

(assert (= bs!7598 d!31046))

(declare-fun m!143851 () Bool)

(assert (=> bs!7598 m!143851))

(assert (=> b!98545 d!31046))

(declare-fun d!31048 () Bool)

(declare-fun lt!143601 () tuple2!7964)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3698 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!7964)

(assert (=> d!31048 (= lt!143601 (readNLeastSignificantBitsLoop!0 (_1!4228 lt!142953) nBits!388 #b00000000000000000000000000000000 lt!142971))))

(assert (=> d!31048 (= (readNLeastSignificantBitsLoopPure!0 (_1!4228 lt!142953) nBits!388 #b00000000000000000000000000000000 lt!142971) (tuple2!7951 (_2!4234 lt!143601) (_1!4234 lt!143601)))))

(declare-fun bs!7599 () Bool)

(assert (= bs!7599 d!31048))

(declare-fun m!143853 () Bool)

(assert (=> bs!7599 m!143853))

(assert (=> b!98545 d!31048))

(declare-fun d!31050 () Bool)

(declare-fun e!64641 () Bool)

(assert (=> d!31050 e!64641))

(declare-fun res!81084 () Bool)

(assert (=> d!31050 (=> (not res!81084) (not e!64641))))

(declare-fun lt!143603 () (_ BitVec 64))

(declare-fun lt!143604 () (_ BitVec 64))

(declare-fun lt!143606 () (_ BitVec 64))

(assert (=> d!31050 (= res!81084 (= lt!143606 (bvsub lt!143603 lt!143604)))))

(assert (=> d!31050 (or (= (bvand lt!143603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143604 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143603 lt!143604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31050 (= lt!143604 (remainingBits!0 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142948)))) ((_ sign_extend 32) (currentByte!4893 (_2!4226 lt!142948))) ((_ sign_extend 32) (currentBit!4888 (_2!4226 lt!142948)))))))

(declare-fun lt!143605 () (_ BitVec 64))

(declare-fun lt!143602 () (_ BitVec 64))

(assert (=> d!31050 (= lt!143603 (bvmul lt!143605 lt!143602))))

(assert (=> d!31050 (or (= lt!143605 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!143602 (bvsdiv (bvmul lt!143605 lt!143602) lt!143605)))))

(assert (=> d!31050 (= lt!143602 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31050 (= lt!143605 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142948)))))))

(assert (=> d!31050 (= lt!143606 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4893 (_2!4226 lt!142948))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4888 (_2!4226 lt!142948)))))))

(assert (=> d!31050 (invariant!0 (currentBit!4888 (_2!4226 lt!142948)) (currentByte!4893 (_2!4226 lt!142948)) (size!2112 (buf!2463 (_2!4226 lt!142948))))))

(assert (=> d!31050 (= (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142948))) (currentByte!4893 (_2!4226 lt!142948)) (currentBit!4888 (_2!4226 lt!142948))) lt!143606)))

(declare-fun b!98849 () Bool)

(declare-fun res!81083 () Bool)

(assert (=> b!98849 (=> (not res!81083) (not e!64641))))

(assert (=> b!98849 (= res!81083 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!143606))))

(declare-fun b!98850 () Bool)

(declare-fun lt!143607 () (_ BitVec 64))

(assert (=> b!98850 (= e!64641 (bvsle lt!143606 (bvmul lt!143607 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98850 (or (= lt!143607 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!143607 #b0000000000000000000000000000000000000000000000000000000000001000) lt!143607)))))

(assert (=> b!98850 (= lt!143607 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142948)))))))

(assert (= (and d!31050 res!81084) b!98849))

(assert (= (and b!98849 res!81083) b!98850))

(declare-fun m!143855 () Bool)

(assert (=> d!31050 m!143855))

(declare-fun m!143857 () Bool)

(assert (=> d!31050 m!143857))

(assert (=> b!98546 d!31050))

(assert (=> b!98546 d!30854))

(assert (=> d!30846 d!30994))

(declare-fun d!31052 () Bool)

(declare-fun res!81087 () Bool)

(declare-fun e!64642 () Bool)

(assert (=> d!31052 (=> (not res!81087) (not e!64642))))

(assert (=> d!31052 (= res!81087 (= (size!2112 (buf!2463 (ite c!6229 thiss!1288 lt!142964))) (size!2112 (buf!2463 (ite c!6229 (_2!4226 lt!142946) lt!142964)))))))

(assert (=> d!31052 (= (isPrefixOf!0 (ite c!6229 thiss!1288 lt!142964) (ite c!6229 (_2!4226 lt!142946) lt!142964)) e!64642)))

(declare-fun b!98851 () Bool)

(declare-fun res!81086 () Bool)

(assert (=> b!98851 (=> (not res!81086) (not e!64642))))

(assert (=> b!98851 (= res!81086 (bvsle (bitIndex!0 (size!2112 (buf!2463 (ite c!6229 thiss!1288 lt!142964))) (currentByte!4893 (ite c!6229 thiss!1288 lt!142964)) (currentBit!4888 (ite c!6229 thiss!1288 lt!142964))) (bitIndex!0 (size!2112 (buf!2463 (ite c!6229 (_2!4226 lt!142946) lt!142964))) (currentByte!4893 (ite c!6229 (_2!4226 lt!142946) lt!142964)) (currentBit!4888 (ite c!6229 (_2!4226 lt!142946) lt!142964)))))))

(declare-fun b!98852 () Bool)

(declare-fun e!64643 () Bool)

(assert (=> b!98852 (= e!64642 e!64643)))

(declare-fun res!81085 () Bool)

(assert (=> b!98852 (=> res!81085 e!64643)))

(assert (=> b!98852 (= res!81085 (= (size!2112 (buf!2463 (ite c!6229 thiss!1288 lt!142964))) #b00000000000000000000000000000000))))

(declare-fun b!98853 () Bool)

(assert (=> b!98853 (= e!64643 (arrayBitRangesEq!0 (buf!2463 (ite c!6229 thiss!1288 lt!142964)) (buf!2463 (ite c!6229 (_2!4226 lt!142946) lt!142964)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2112 (buf!2463 (ite c!6229 thiss!1288 lt!142964))) (currentByte!4893 (ite c!6229 thiss!1288 lt!142964)) (currentBit!4888 (ite c!6229 thiss!1288 lt!142964)))))))

(assert (= (and d!31052 res!81087) b!98851))

(assert (= (and b!98851 res!81086) b!98852))

(assert (= (and b!98852 (not res!81085)) b!98853))

(declare-fun m!143859 () Bool)

(assert (=> b!98851 m!143859))

(declare-fun m!143861 () Bool)

(assert (=> b!98851 m!143861))

(assert (=> b!98853 m!143859))

(assert (=> b!98853 m!143859))

(declare-fun m!143863 () Bool)

(assert (=> b!98853 m!143863))

(assert (=> bm!1225 d!31052))

(declare-fun d!31054 () Bool)

(assert (=> d!31054 (isPrefixOf!0 lt!142964 lt!142964)))

(declare-fun lt!143608 () Unit!6033)

(assert (=> d!31054 (= lt!143608 (choose!11 lt!142964))))

(assert (=> d!31054 (= (lemmaIsPrefixRefl!0 lt!142964) lt!143608)))

(declare-fun bs!7600 () Bool)

(assert (= bs!7600 d!31054))

(declare-fun m!143865 () Bool)

(assert (=> bs!7600 m!143865))

(declare-fun m!143867 () Bool)

(assert (=> bs!7600 m!143867))

(assert (=> b!98542 d!31054))

(declare-fun d!31056 () Bool)

(assert (=> d!31056 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2112 (buf!2463 thiss!1288))) ((_ sign_extend 32) (currentByte!4893 thiss!1288)) ((_ sign_extend 32) (currentBit!4888 thiss!1288)) lt!142934) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2112 (buf!2463 thiss!1288))) ((_ sign_extend 32) (currentByte!4893 thiss!1288)) ((_ sign_extend 32) (currentBit!4888 thiss!1288))) lt!142934))))

(declare-fun bs!7601 () Bool)

(assert (= bs!7601 d!31056))

(assert (=> bs!7601 m!143281))

(assert (=> b!98544 d!31056))

(declare-fun d!31058 () Bool)

(declare-fun e!64646 () Bool)

(assert (=> d!31058 e!64646))

(declare-fun res!81090 () Bool)

(assert (=> d!31058 (=> (not res!81090) (not e!64646))))

(declare-fun lt!143620 () tuple2!7964)

(assert (=> d!31058 (= res!81090 (= (buf!2463 (_2!4234 lt!143620)) (buf!2463 (_1!4228 lt!142615))))))

(declare-fun lt!143619 () tuple2!7964)

(assert (=> d!31058 (= lt!143620 (tuple2!7965 (_1!4234 lt!143619) (_2!4234 lt!143619)))))

(assert (=> d!31058 (= lt!143619 (readNLeastSignificantBitsLoop!0 (_1!4228 lt!142615) nBits!388 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!31058 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000))))

(assert (=> d!31058 (= (readNLeastSignificantBits!0 (_1!4228 lt!142615) nBits!388) lt!143620)))

(declare-fun b!98856 () Bool)

(declare-fun lt!143618 () (_ BitVec 64))

(declare-fun lt!143617 () (_ BitVec 64))

(assert (=> b!98856 (= e!64646 (= (bitIndex!0 (size!2112 (buf!2463 (_2!4234 lt!143620))) (currentByte!4893 (_2!4234 lt!143620)) (currentBit!4888 (_2!4234 lt!143620))) (bvadd lt!143618 lt!143617)))))

(assert (=> b!98856 (or (not (= (bvand lt!143618 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143617 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!143618 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!143618 lt!143617) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98856 (= lt!143617 ((_ sign_extend 32) nBits!388))))

(assert (=> b!98856 (= lt!143618 (bitIndex!0 (size!2112 (buf!2463 (_1!4228 lt!142615))) (currentByte!4893 (_1!4228 lt!142615)) (currentBit!4888 (_1!4228 lt!142615))))))

(assert (= (and d!31058 res!81090) b!98856))

(declare-fun m!143869 () Bool)

(assert (=> d!31058 m!143869))

(declare-fun m!143871 () Bool)

(assert (=> b!98856 m!143871))

(declare-fun m!143873 () Bool)

(assert (=> b!98856 m!143873))

(assert (=> d!30836 d!31058))

(declare-fun d!31060 () Bool)

(declare-fun e!64647 () Bool)

(assert (=> d!31060 e!64647))

(declare-fun res!81092 () Bool)

(assert (=> d!31060 (=> (not res!81092) (not e!64647))))

(declare-fun lt!143622 () (_ BitVec 64))

(declare-fun lt!143623 () (_ BitVec 64))

(declare-fun lt!143625 () (_ BitVec 64))

(assert (=> d!31060 (= res!81092 (= lt!143625 (bvsub lt!143622 lt!143623)))))

(assert (=> d!31060 (or (= (bvand lt!143622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143623 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143622 lt!143623) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31060 (= lt!143623 (remainingBits!0 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142946)))) ((_ sign_extend 32) (currentByte!4893 (_2!4226 lt!142946))) ((_ sign_extend 32) (currentBit!4888 (_2!4226 lt!142946)))))))

(declare-fun lt!143624 () (_ BitVec 64))

(declare-fun lt!143621 () (_ BitVec 64))

(assert (=> d!31060 (= lt!143622 (bvmul lt!143624 lt!143621))))

(assert (=> d!31060 (or (= lt!143624 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!143621 (bvsdiv (bvmul lt!143624 lt!143621) lt!143624)))))

(assert (=> d!31060 (= lt!143621 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31060 (= lt!143624 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142946)))))))

(assert (=> d!31060 (= lt!143625 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4893 (_2!4226 lt!142946))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4888 (_2!4226 lt!142946)))))))

(assert (=> d!31060 (invariant!0 (currentBit!4888 (_2!4226 lt!142946)) (currentByte!4893 (_2!4226 lt!142946)) (size!2112 (buf!2463 (_2!4226 lt!142946))))))

(assert (=> d!31060 (= (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142946))) (currentByte!4893 (_2!4226 lt!142946)) (currentBit!4888 (_2!4226 lt!142946))) lt!143625)))

(declare-fun b!98857 () Bool)

(declare-fun res!81091 () Bool)

(assert (=> b!98857 (=> (not res!81091) (not e!64647))))

(assert (=> b!98857 (= res!81091 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!143625))))

(declare-fun b!98858 () Bool)

(declare-fun lt!143626 () (_ BitVec 64))

(assert (=> b!98858 (= e!64647 (bvsle lt!143625 (bvmul lt!143626 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98858 (or (= lt!143626 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!143626 #b0000000000000000000000000000000000000000000000000000000000001000) lt!143626)))))

(assert (=> b!98858 (= lt!143626 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142946)))))))

(assert (= (and d!31060 res!81092) b!98857))

(assert (= (and b!98857 res!81091) b!98858))

(declare-fun m!143875 () Bool)

(assert (=> d!31060 m!143875))

(assert (=> d!31060 m!143763))

(assert (=> b!98540 d!31060))

(assert (=> b!98540 d!30854))

(assert (=> d!30840 d!30838))

(declare-fun d!31062 () Bool)

(assert (=> d!31062 (validate_offset_bits!1 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142612)))) ((_ sign_extend 32) (currentByte!4893 thiss!1288)) ((_ sign_extend 32) (currentBit!4888 thiss!1288)) ((_ sign_extend 32) nBits!388))))

(assert (=> d!31062 true))

(declare-fun _$6!222 () Unit!6033)

(assert (=> d!31062 (= (choose!9 thiss!1288 (buf!2463 (_2!4226 lt!142612)) ((_ sign_extend 32) nBits!388) (BitStream!3699 (buf!2463 (_2!4226 lt!142612)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288))) _$6!222)))

(declare-fun bs!7602 () Bool)

(assert (= bs!7602 d!31062))

(assert (=> bs!7602 m!142977))

(assert (=> d!30840 d!31062))

(assert (=> d!30808 d!30996))

(declare-fun d!31064 () Bool)

(declare-fun e!64648 () Bool)

(assert (=> d!31064 e!64648))

(declare-fun res!81094 () Bool)

(assert (=> d!31064 (=> (not res!81094) (not e!64648))))

(declare-fun lt!143629 () (_ BitVec 64))

(declare-fun lt!143628 () (_ BitVec 64))

(declare-fun lt!143631 () (_ BitVec 64))

(assert (=> d!31064 (= res!81094 (= lt!143631 (bvsub lt!143628 lt!143629)))))

(assert (=> d!31064 (or (= (bvand lt!143628 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143629 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143628 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143628 lt!143629) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31064 (= lt!143629 (remainingBits!0 ((_ sign_extend 32) (size!2112 (buf!2463 (_1!4230 lt!142956)))) ((_ sign_extend 32) (currentByte!4893 (_1!4230 lt!142956))) ((_ sign_extend 32) (currentBit!4888 (_1!4230 lt!142956)))))))

(declare-fun lt!143630 () (_ BitVec 64))

(declare-fun lt!143627 () (_ BitVec 64))

(assert (=> d!31064 (= lt!143628 (bvmul lt!143630 lt!143627))))

(assert (=> d!31064 (or (= lt!143630 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!143627 (bvsdiv (bvmul lt!143630 lt!143627) lt!143630)))))

(assert (=> d!31064 (= lt!143627 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31064 (= lt!143630 ((_ sign_extend 32) (size!2112 (buf!2463 (_1!4230 lt!142956)))))))

(assert (=> d!31064 (= lt!143631 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4893 (_1!4230 lt!142956))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4888 (_1!4230 lt!142956)))))))

(assert (=> d!31064 (invariant!0 (currentBit!4888 (_1!4230 lt!142956)) (currentByte!4893 (_1!4230 lt!142956)) (size!2112 (buf!2463 (_1!4230 lt!142956))))))

(assert (=> d!31064 (= (bitIndex!0 (size!2112 (buf!2463 (_1!4230 lt!142956))) (currentByte!4893 (_1!4230 lt!142956)) (currentBit!4888 (_1!4230 lt!142956))) lt!143631)))

(declare-fun b!98859 () Bool)

(declare-fun res!81093 () Bool)

(assert (=> b!98859 (=> (not res!81093) (not e!64648))))

(assert (=> b!98859 (= res!81093 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!143631))))

(declare-fun b!98860 () Bool)

(declare-fun lt!143632 () (_ BitVec 64))

(assert (=> b!98860 (= e!64648 (bvsle lt!143631 (bvmul lt!143632 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98860 (or (= lt!143632 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!143632 #b0000000000000000000000000000000000000000000000000000000000001000) lt!143632)))))

(assert (=> b!98860 (= lt!143632 ((_ sign_extend 32) (size!2112 (buf!2463 (_1!4230 lt!142956)))))))

(assert (= (and d!31064 res!81094) b!98859))

(assert (= (and b!98859 res!81093) b!98860))

(declare-fun m!143877 () Bool)

(assert (=> d!31064 m!143877))

(declare-fun m!143879 () Bool)

(assert (=> d!31064 m!143879))

(assert (=> b!98537 d!31064))

(assert (=> b!98537 d!31060))

(declare-fun d!31066 () Bool)

(declare-fun res!81097 () Bool)

(declare-fun e!64649 () Bool)

(assert (=> d!31066 (=> (not res!81097) (not e!64649))))

(assert (=> d!31066 (= res!81097 (= (size!2112 (buf!2463 thiss!1288)) (size!2112 (buf!2463 (_2!4226 lt!142951)))))))

(assert (=> d!31066 (= (isPrefixOf!0 thiss!1288 (_2!4226 lt!142951)) e!64649)))

(declare-fun b!98861 () Bool)

(declare-fun res!81096 () Bool)

(assert (=> b!98861 (=> (not res!81096) (not e!64649))))

(assert (=> b!98861 (= res!81096 (bvsle (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288)) (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142951))) (currentByte!4893 (_2!4226 lt!142951)) (currentBit!4888 (_2!4226 lt!142951)))))))

(declare-fun b!98862 () Bool)

(declare-fun e!64650 () Bool)

(assert (=> b!98862 (= e!64649 e!64650)))

(declare-fun res!81095 () Bool)

(assert (=> b!98862 (=> res!81095 e!64650)))

(assert (=> b!98862 (= res!81095 (= (size!2112 (buf!2463 thiss!1288)) #b00000000000000000000000000000000))))

(declare-fun b!98863 () Bool)

(assert (=> b!98863 (= e!64650 (arrayBitRangesEq!0 (buf!2463 thiss!1288) (buf!2463 (_2!4226 lt!142951)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288))))))

(assert (= (and d!31066 res!81097) b!98861))

(assert (= (and b!98861 res!81096) b!98862))

(assert (= (and b!98862 (not res!81095)) b!98863))

(assert (=> b!98861 m!142987))

(assert (=> b!98861 m!143135))

(assert (=> b!98863 m!142987))

(assert (=> b!98863 m!142987))

(declare-fun m!143881 () Bool)

(assert (=> b!98863 m!143881))

(assert (=> b!98538 d!31066))

(declare-fun d!31068 () Bool)

(declare-fun lt!143633 () tuple2!7968)

(assert (=> d!31068 (= lt!143633 (readBit!0 lt!142966))))

(assert (=> d!31068 (= (readBitPure!0 lt!142966) (tuple2!7957 (_2!4238 lt!143633) (_1!4238 lt!143633)))))

(declare-fun bs!7603 () Bool)

(assert (= bs!7603 d!31068))

(declare-fun m!143883 () Bool)

(assert (=> bs!7603 m!143883))

(assert (=> b!98538 d!31068))

(declare-fun d!31070 () Bool)

(declare-fun e!64651 () Bool)

(assert (=> d!31070 e!64651))

(declare-fun res!81099 () Bool)

(assert (=> d!31070 (=> (not res!81099) (not e!64651))))

(declare-fun lt!143636 () (_ BitVec 64))

(declare-fun lt!143638 () (_ BitVec 64))

(declare-fun lt!143635 () (_ BitVec 64))

(assert (=> d!31070 (= res!81099 (= lt!143638 (bvsub lt!143635 lt!143636)))))

(assert (=> d!31070 (or (= (bvand lt!143635 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143636 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143635 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143635 lt!143636) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31070 (= lt!143636 (remainingBits!0 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142935)))) ((_ sign_extend 32) (currentByte!4893 (_2!4226 lt!142935))) ((_ sign_extend 32) (currentBit!4888 (_2!4226 lt!142935)))))))

(declare-fun lt!143637 () (_ BitVec 64))

(declare-fun lt!143634 () (_ BitVec 64))

(assert (=> d!31070 (= lt!143635 (bvmul lt!143637 lt!143634))))

(assert (=> d!31070 (or (= lt!143637 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!143634 (bvsdiv (bvmul lt!143637 lt!143634) lt!143637)))))

(assert (=> d!31070 (= lt!143634 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31070 (= lt!143637 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142935)))))))

(assert (=> d!31070 (= lt!143638 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4893 (_2!4226 lt!142935))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4888 (_2!4226 lt!142935)))))))

(assert (=> d!31070 (invariant!0 (currentBit!4888 (_2!4226 lt!142935)) (currentByte!4893 (_2!4226 lt!142935)) (size!2112 (buf!2463 (_2!4226 lt!142935))))))

(assert (=> d!31070 (= (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142935))) (currentByte!4893 (_2!4226 lt!142935)) (currentBit!4888 (_2!4226 lt!142935))) lt!143638)))

(declare-fun b!98864 () Bool)

(declare-fun res!81098 () Bool)

(assert (=> b!98864 (=> (not res!81098) (not e!64651))))

(assert (=> b!98864 (= res!81098 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!143638))))

(declare-fun b!98865 () Bool)

(declare-fun lt!143639 () (_ BitVec 64))

(assert (=> b!98865 (= e!64651 (bvsle lt!143638 (bvmul lt!143639 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98865 (or (= lt!143639 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!143639 #b0000000000000000000000000000000000000000000000000000000000001000) lt!143639)))))

(assert (=> b!98865 (= lt!143639 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142935)))))))

(assert (= (and d!31070 res!81099) b!98864))

(assert (= (and b!98864 res!81098) b!98865))

(declare-fun m!143885 () Bool)

(assert (=> d!31070 m!143885))

(declare-fun m!143887 () Bool)

(assert (=> d!31070 m!143887))

(assert (=> b!98538 d!31070))

(declare-fun b!98876 () Bool)

(declare-fun res!81111 () Bool)

(declare-fun e!64657 () Bool)

(assert (=> b!98876 (=> (not res!81111) (not e!64657))))

(declare-fun lt!143650 () tuple2!7948)

(assert (=> b!98876 (= res!81111 (isPrefixOf!0 thiss!1288 (_2!4226 lt!143650)))))

(declare-fun b!98875 () Bool)

(declare-fun res!81108 () Bool)

(assert (=> b!98875 (=> (not res!81108) (not e!64657))))

(declare-fun lt!143648 () (_ BitVec 64))

(declare-fun lt!143649 () (_ BitVec 64))

(assert (=> b!98875 (= res!81108 (= (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!143650))) (currentByte!4893 (_2!4226 lt!143650)) (currentBit!4888 (_2!4226 lt!143650))) (bvadd lt!143649 lt!143648)))))

(assert (=> b!98875 (or (not (= (bvand lt!143649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143648 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!143649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!143649 lt!143648) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98875 (= lt!143648 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!98875 (= lt!143649 (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288)))))

(declare-fun b!98877 () Bool)

(declare-fun e!64656 () Bool)

(assert (=> b!98877 (= e!64657 e!64656)))

(declare-fun res!81110 () Bool)

(assert (=> b!98877 (=> (not res!81110) (not e!64656))))

(declare-fun lt!143651 () tuple2!7956)

(assert (=> b!98877 (= res!81110 (and (= (_2!4230 lt!143651) lt!142965) (= (_1!4230 lt!143651) (_2!4226 lt!143650))))))

(assert (=> b!98877 (= lt!143651 (readBitPure!0 (readerFrom!0 (_2!4226 lt!143650) (currentBit!4888 thiss!1288) (currentByte!4893 thiss!1288))))))

(declare-fun d!31072 () Bool)

(assert (=> d!31072 e!64657))

(declare-fun res!81109 () Bool)

(assert (=> d!31072 (=> (not res!81109) (not e!64657))))

(assert (=> d!31072 (= res!81109 (= (size!2112 (buf!2463 thiss!1288)) (size!2112 (buf!2463 (_2!4226 lt!143650)))))))

(declare-fun choose!16 (BitStream!3698 Bool) tuple2!7948)

(assert (=> d!31072 (= lt!143650 (choose!16 thiss!1288 lt!142965))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!31072 (validate_offset_bit!0 ((_ sign_extend 32) (size!2112 (buf!2463 thiss!1288))) ((_ sign_extend 32) (currentByte!4893 thiss!1288)) ((_ sign_extend 32) (currentBit!4888 thiss!1288)))))

(assert (=> d!31072 (= (appendBit!0 thiss!1288 lt!142965) lt!143650)))

(declare-fun b!98878 () Bool)

(assert (=> b!98878 (= e!64656 (= (bitIndex!0 (size!2112 (buf!2463 (_1!4230 lt!143651))) (currentByte!4893 (_1!4230 lt!143651)) (currentBit!4888 (_1!4230 lt!143651))) (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!143650))) (currentByte!4893 (_2!4226 lt!143650)) (currentBit!4888 (_2!4226 lt!143650)))))))

(assert (= (and d!31072 res!81109) b!98875))

(assert (= (and b!98875 res!81108) b!98876))

(assert (= (and b!98876 res!81111) b!98877))

(assert (= (and b!98877 res!81110) b!98878))

(declare-fun m!143889 () Bool)

(assert (=> b!98876 m!143889))

(declare-fun m!143891 () Bool)

(assert (=> b!98875 m!143891))

(assert (=> b!98875 m!142987))

(declare-fun m!143893 () Bool)

(assert (=> d!31072 m!143893))

(declare-fun m!143895 () Bool)

(assert (=> d!31072 m!143895))

(declare-fun m!143897 () Bool)

(assert (=> b!98877 m!143897))

(assert (=> b!98877 m!143897))

(declare-fun m!143899 () Bool)

(assert (=> b!98877 m!143899))

(declare-fun m!143901 () Bool)

(assert (=> b!98878 m!143901))

(assert (=> b!98878 m!143891))

(assert (=> b!98538 d!31072))

(declare-fun d!31074 () Bool)

(declare-fun e!64658 () Bool)

(assert (=> d!31074 e!64658))

(declare-fun res!81113 () Bool)

(assert (=> d!31074 (=> (not res!81113) (not e!64658))))

(declare-fun lt!143653 () (_ BitVec 64))

(declare-fun lt!143654 () (_ BitVec 64))

(declare-fun lt!143656 () (_ BitVec 64))

(assert (=> d!31074 (= res!81113 (= lt!143656 (bvsub lt!143653 lt!143654)))))

(assert (=> d!31074 (or (= (bvand lt!143653 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143654 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143653 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143653 lt!143654) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31074 (= lt!143654 (remainingBits!0 ((_ sign_extend 32) (size!2112 (buf!2463 (_1!4230 lt!142975)))) ((_ sign_extend 32) (currentByte!4893 (_1!4230 lt!142975))) ((_ sign_extend 32) (currentBit!4888 (_1!4230 lt!142975)))))))

(declare-fun lt!143655 () (_ BitVec 64))

(declare-fun lt!143652 () (_ BitVec 64))

(assert (=> d!31074 (= lt!143653 (bvmul lt!143655 lt!143652))))

(assert (=> d!31074 (or (= lt!143655 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!143652 (bvsdiv (bvmul lt!143655 lt!143652) lt!143655)))))

(assert (=> d!31074 (= lt!143652 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31074 (= lt!143655 ((_ sign_extend 32) (size!2112 (buf!2463 (_1!4230 lt!142975)))))))

(assert (=> d!31074 (= lt!143656 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4893 (_1!4230 lt!142975))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4888 (_1!4230 lt!142975)))))))

(assert (=> d!31074 (invariant!0 (currentBit!4888 (_1!4230 lt!142975)) (currentByte!4893 (_1!4230 lt!142975)) (size!2112 (buf!2463 (_1!4230 lt!142975))))))

(assert (=> d!31074 (= (bitIndex!0 (size!2112 (buf!2463 (_1!4230 lt!142975))) (currentByte!4893 (_1!4230 lt!142975)) (currentBit!4888 (_1!4230 lt!142975))) lt!143656)))

(declare-fun b!98879 () Bool)

(declare-fun res!81112 () Bool)

(assert (=> b!98879 (=> (not res!81112) (not e!64658))))

(assert (=> b!98879 (= res!81112 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!143656))))

(declare-fun b!98880 () Bool)

(declare-fun lt!143657 () (_ BitVec 64))

(assert (=> b!98880 (= e!64658 (bvsle lt!143656 (bvmul lt!143657 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98880 (or (= lt!143657 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!143657 #b0000000000000000000000000000000000000000000000000000000000001000) lt!143657)))))

(assert (=> b!98880 (= lt!143657 ((_ sign_extend 32) (size!2112 (buf!2463 (_1!4230 lt!142975)))))))

(assert (= (and d!31074 res!81113) b!98879))

(assert (= (and b!98879 res!81112) b!98880))

(declare-fun m!143903 () Bool)

(assert (=> d!31074 m!143903))

(declare-fun m!143905 () Bool)

(assert (=> d!31074 m!143905))

(assert (=> b!98538 d!31074))

(declare-fun b!98882 () Bool)

(declare-fun e!64660 () Bool)

(declare-fun lt!143683 () tuple2!7956)

(declare-fun lt!143673 () tuple2!7948)

(assert (=> b!98882 (= e!64660 (= (bitIndex!0 (size!2112 (buf!2463 (_1!4230 lt!143683))) (currentByte!4893 (_1!4230 lt!143683)) (currentBit!4888 (_1!4230 lt!143683))) (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!143673))) (currentByte!4893 (_2!4226 lt!143673)) (currentBit!4888 (_2!4226 lt!143673)))))))

(declare-fun b!98883 () Bool)

(declare-fun e!64662 () tuple2!7948)

(declare-fun lt!143678 () tuple2!7948)

(declare-fun Unit!6066 () Unit!6033)

(assert (=> b!98883 (= e!64662 (tuple2!7949 Unit!6066 (_2!4226 lt!143678)))))

(declare-fun lt!143692 () Bool)

(assert (=> b!98883 (= lt!143692 (not (= (bvand v!196 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98883 (= lt!143673 (appendBit!0 (_2!4226 lt!142935) lt!143692))))

(declare-fun res!81115 () Bool)

(assert (=> b!98883 (= res!81115 (= (size!2112 (buf!2463 (_2!4226 lt!142935))) (size!2112 (buf!2463 (_2!4226 lt!143673)))))))

(declare-fun e!64659 () Bool)

(assert (=> b!98883 (=> (not res!81115) (not e!64659))))

(assert (=> b!98883 e!64659))

(declare-fun lt!143662 () tuple2!7948)

(assert (=> b!98883 (= lt!143662 lt!143673)))

(assert (=> b!98883 (= lt!143678 (appendNLeastSignificantBitsLoop!0 (_2!4226 lt!143662) v!196 nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!143669 () Unit!6033)

(assert (=> b!98883 (= lt!143669 (lemmaIsPrefixTransitive!0 (_2!4226 lt!142935) (_2!4226 lt!143662) (_2!4226 lt!143678)))))

(assert (=> b!98883 (isPrefixOf!0 (_2!4226 lt!142935) (_2!4226 lt!143678))))

(declare-fun lt!143694 () Unit!6033)

(assert (=> b!98883 (= lt!143694 lt!143669)))

(assert (=> b!98883 (invariant!0 (currentBit!4888 (_2!4226 lt!142935)) (currentByte!4893 (_2!4226 lt!142935)) (size!2112 (buf!2463 (_2!4226 lt!143662))))))

(declare-fun lt!143688 () BitStream!3698)

(assert (=> b!98883 (= lt!143688 (BitStream!3699 (buf!2463 (_2!4226 lt!143662)) (currentByte!4893 (_2!4226 lt!142935)) (currentBit!4888 (_2!4226 lt!142935))))))

(assert (=> b!98883 (invariant!0 (currentBit!4888 lt!143688) (currentByte!4893 lt!143688) (size!2112 (buf!2463 (_2!4226 lt!143678))))))

(declare-fun lt!143693 () BitStream!3698)

(assert (=> b!98883 (= lt!143693 (BitStream!3699 (buf!2463 (_2!4226 lt!143678)) (currentByte!4893 lt!143688) (currentBit!4888 lt!143688)))))

(declare-fun lt!143667 () tuple2!7956)

(assert (=> b!98883 (= lt!143667 (readBitPure!0 lt!143688))))

(declare-fun lt!143702 () tuple2!7956)

(assert (=> b!98883 (= lt!143702 (readBitPure!0 lt!143693))))

(declare-fun lt!143696 () Unit!6033)

(assert (=> b!98883 (= lt!143696 (readBitPrefixLemma!0 lt!143688 (_2!4226 lt!143678)))))

(declare-fun res!81121 () Bool)

(assert (=> b!98883 (= res!81121 (= (bitIndex!0 (size!2112 (buf!2463 (_1!4230 lt!143667))) (currentByte!4893 (_1!4230 lt!143667)) (currentBit!4888 (_1!4230 lt!143667))) (bitIndex!0 (size!2112 (buf!2463 (_1!4230 lt!143702))) (currentByte!4893 (_1!4230 lt!143702)) (currentBit!4888 (_1!4230 lt!143702)))))))

(declare-fun e!64661 () Bool)

(assert (=> b!98883 (=> (not res!81121) (not e!64661))))

(assert (=> b!98883 e!64661))

(declare-fun lt!143677 () Unit!6033)

(assert (=> b!98883 (= lt!143677 lt!143696)))

(declare-fun lt!143672 () tuple2!7952)

(assert (=> b!98883 (= lt!143672 (reader!0 (_2!4226 lt!142935) (_2!4226 lt!143678)))))

(declare-fun lt!143690 () tuple2!7952)

(assert (=> b!98883 (= lt!143690 (reader!0 (_2!4226 lt!143662) (_2!4226 lt!143678)))))

(declare-fun lt!143699 () tuple2!7956)

(assert (=> b!98883 (= lt!143699 (readBitPure!0 (_1!4228 lt!143672)))))

(assert (=> b!98883 (= (_2!4230 lt!143699) lt!143692)))

(declare-fun lt!143664 () Unit!6033)

(declare-fun Unit!6067 () Unit!6033)

(assert (=> b!98883 (= lt!143664 Unit!6067)))

(declare-fun lt!143689 () (_ BitVec 64))

(assert (=> b!98883 (= lt!143689 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))))

(declare-fun lt!143701 () (_ BitVec 64))

(assert (=> b!98883 (= lt!143701 ((_ sign_extend 32) (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun lt!143684 () Unit!6033)

(assert (=> b!98883 (= lt!143684 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4226 lt!142935) (buf!2463 (_2!4226 lt!143678)) lt!143701))))

(assert (=> b!98883 (validate_offset_bits!1 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!143678)))) ((_ sign_extend 32) (currentByte!4893 (_2!4226 lt!142935))) ((_ sign_extend 32) (currentBit!4888 (_2!4226 lt!142935))) lt!143701)))

(declare-fun lt!143663 () Unit!6033)

(assert (=> b!98883 (= lt!143663 lt!143684)))

(declare-fun lt!143660 () tuple2!7950)

(assert (=> b!98883 (= lt!143660 (readNLeastSignificantBitsLoopPure!0 (_1!4228 lt!143672) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!143689))))

(declare-fun lt!143668 () (_ BitVec 64))

(assert (=> b!98883 (= lt!143668 ((_ sign_extend 32) (bvsub (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(declare-fun lt!143681 () Unit!6033)

(assert (=> b!98883 (= lt!143681 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4226 lt!143662) (buf!2463 (_2!4226 lt!143678)) lt!143668))))

(assert (=> b!98883 (validate_offset_bits!1 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!143678)))) ((_ sign_extend 32) (currentByte!4893 (_2!4226 lt!143662))) ((_ sign_extend 32) (currentBit!4888 (_2!4226 lt!143662))) lt!143668)))

(declare-fun lt!143658 () Unit!6033)

(assert (=> b!98883 (= lt!143658 lt!143681)))

(declare-fun lt!143674 () tuple2!7950)

(assert (=> b!98883 (= lt!143674 (readNLeastSignificantBitsLoopPure!0 (_1!4228 lt!143690) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!143689 (ite (_2!4230 lt!143699) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!143686 () tuple2!7950)

(assert (=> b!98883 (= lt!143686 (readNLeastSignificantBitsLoopPure!0 (_1!4228 lt!143672) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!143689))))

(declare-fun c!6258 () Bool)

(assert (=> b!98883 (= c!6258 (_2!4230 (readBitPure!0 (_1!4228 lt!143672))))))

(declare-fun e!64665 () (_ BitVec 64))

(declare-fun lt!143671 () tuple2!7950)

(assert (=> b!98883 (= lt!143671 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4228 lt!143672) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!143689 e!64665)))))

(declare-fun lt!143659 () Unit!6033)

(assert (=> b!98883 (= lt!143659 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4228 lt!143672) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!143689))))

(assert (=> b!98883 (and (= (_2!4227 lt!143686) (_2!4227 lt!143671)) (= (_1!4227 lt!143686) (_1!4227 lt!143671)))))

(declare-fun lt!143676 () Unit!6033)

(assert (=> b!98883 (= lt!143676 lt!143659)))

(assert (=> b!98883 (= (_1!4228 lt!143672) (withMovedBitIndex!0 (_2!4228 lt!143672) (bvsub (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142935))) (currentByte!4893 (_2!4226 lt!142935)) (currentBit!4888 (_2!4226 lt!142935))) (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!143678))) (currentByte!4893 (_2!4226 lt!143678)) (currentBit!4888 (_2!4226 lt!143678))))))))

(declare-fun lt!143665 () Unit!6033)

(declare-fun Unit!6068 () Unit!6033)

(assert (=> b!98883 (= lt!143665 Unit!6068)))

(assert (=> b!98883 (= (_1!4228 lt!143690) (withMovedBitIndex!0 (_2!4228 lt!143690) (bvsub (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!143662))) (currentByte!4893 (_2!4226 lt!143662)) (currentBit!4888 (_2!4226 lt!143662))) (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!143678))) (currentByte!4893 (_2!4226 lt!143678)) (currentBit!4888 (_2!4226 lt!143678))))))))

(declare-fun lt!143685 () Unit!6033)

(declare-fun Unit!6069 () Unit!6033)

(assert (=> b!98883 (= lt!143685 Unit!6069)))

(assert (=> b!98883 (= (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142935))) (currentByte!4893 (_2!4226 lt!142935)) (currentBit!4888 (_2!4226 lt!142935))) (bvsub (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!143662))) (currentByte!4893 (_2!4226 lt!143662)) (currentBit!4888 (_2!4226 lt!143662))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!143687 () Unit!6033)

(declare-fun Unit!6070 () Unit!6033)

(assert (=> b!98883 (= lt!143687 Unit!6070)))

(assert (=> b!98883 (= (_2!4227 lt!143660) (_2!4227 lt!143674))))

(declare-fun lt!143666 () Unit!6033)

(declare-fun Unit!6071 () Unit!6033)

(assert (=> b!98883 (= lt!143666 Unit!6071)))

(assert (=> b!98883 (= (_1!4227 lt!143660) (_2!4228 lt!143672))))

(declare-fun b!98884 () Bool)

(declare-fun res!81114 () Bool)

(declare-fun e!64664 () Bool)

(assert (=> b!98884 (=> (not res!81114) (not e!64664))))

(declare-fun lt!143675 () tuple2!7948)

(assert (=> b!98884 (= res!81114 (isPrefixOf!0 (_2!4226 lt!142935) (_2!4226 lt!143675)))))

(declare-fun b!98885 () Bool)

(declare-fun res!81118 () Bool)

(assert (=> b!98885 (= res!81118 (= (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!143673))) (currentByte!4893 (_2!4226 lt!143673)) (currentBit!4888 (_2!4226 lt!143673))) (bvadd (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142935))) (currentByte!4893 (_2!4226 lt!142935)) (currentBit!4888 (_2!4226 lt!142935))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!98885 (=> (not res!81118) (not e!64659))))

(declare-fun b!98886 () Bool)

(declare-fun res!81117 () Bool)

(declare-fun call!1241 () Bool)

(assert (=> b!98886 (= res!81117 call!1241)))

(assert (=> b!98886 (=> (not res!81117) (not e!64659))))

(declare-fun b!98887 () Bool)

(declare-fun lt!143670 () Unit!6033)

(assert (=> b!98887 (= e!64662 (tuple2!7949 lt!143670 (_2!4226 lt!142935)))))

(declare-fun lt!143691 () BitStream!3698)

(assert (=> b!98887 (= lt!143691 (_2!4226 lt!142935))))

(assert (=> b!98887 (= lt!143670 (lemmaIsPrefixRefl!0 lt!143691))))

(assert (=> b!98887 call!1241))

(declare-fun b!98888 () Bool)

(assert (=> b!98888 (= e!64665 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(declare-fun b!98889 () Bool)

(declare-fun e!64663 () Bool)

(declare-fun lt!143661 () (_ BitVec 64))

(assert (=> b!98889 (= e!64663 (validate_offset_bits!1 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142935)))) ((_ sign_extend 32) (currentByte!4893 (_2!4226 lt!142935))) ((_ sign_extend 32) (currentBit!4888 (_2!4226 lt!142935))) lt!143661))))

(declare-fun lt!143700 () tuple2!7950)

(declare-fun lt!143680 () tuple2!7952)

(declare-fun b!98890 () Bool)

(assert (=> b!98890 (= e!64664 (and (= (_2!4227 lt!143700) v!196) (= (_1!4227 lt!143700) (_2!4228 lt!143680))))))

(declare-fun lt!143698 () (_ BitVec 64))

(assert (=> b!98890 (= lt!143700 (readNLeastSignificantBitsLoopPure!0 (_1!4228 lt!143680) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!143698))))

(declare-fun lt!143682 () Unit!6033)

(declare-fun lt!143695 () Unit!6033)

(assert (=> b!98890 (= lt!143682 lt!143695)))

(assert (=> b!98890 (validate_offset_bits!1 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!143675)))) ((_ sign_extend 32) (currentByte!4893 (_2!4226 lt!142935))) ((_ sign_extend 32) (currentBit!4888 (_2!4226 lt!142935))) lt!143661)))

(assert (=> b!98890 (= lt!143695 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4226 lt!142935) (buf!2463 (_2!4226 lt!143675)) lt!143661))))

(assert (=> b!98890 e!64663))

(declare-fun res!81116 () Bool)

(assert (=> b!98890 (=> (not res!81116) (not e!64663))))

(assert (=> b!98890 (= res!81116 (and (= (size!2112 (buf!2463 (_2!4226 lt!142935))) (size!2112 (buf!2463 (_2!4226 lt!143675)))) (bvsge lt!143661 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98890 (= lt!143661 ((_ sign_extend 32) (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!98890 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!98890 (= lt!143698 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))))

(assert (=> b!98890 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!98890 (= lt!143680 (reader!0 (_2!4226 lt!142935) (_2!4226 lt!143675)))))

(declare-fun b!98891 () Bool)

(declare-fun res!81122 () Bool)

(assert (=> b!98891 (=> (not res!81122) (not e!64664))))

(declare-fun lt!143679 () (_ BitVec 64))

(declare-fun lt!143697 () (_ BitVec 64))

(assert (=> b!98891 (= res!81122 (= (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!143675))) (currentByte!4893 (_2!4226 lt!143675)) (currentBit!4888 (_2!4226 lt!143675))) (bvadd lt!143697 lt!143679)))))

(assert (=> b!98891 (or (not (= (bvand lt!143697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143679 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!143697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!143697 lt!143679) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98891 (= lt!143679 ((_ sign_extend 32) (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!98891 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!98891 (= lt!143697 (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142935))) (currentByte!4893 (_2!4226 lt!142935)) (currentBit!4888 (_2!4226 lt!142935))))))

(declare-fun bm!1238 () Bool)

(declare-fun c!6257 () Bool)

(assert (=> bm!1238 (= call!1241 (isPrefixOf!0 (ite c!6257 (_2!4226 lt!142935) lt!143691) (ite c!6257 (_2!4226 lt!143673) lt!143691)))))

(declare-fun b!98892 () Bool)

(assert (=> b!98892 (= e!64665 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!98893 () Bool)

(assert (=> b!98893 (= e!64661 (= (_2!4230 lt!143667) (_2!4230 lt!143702)))))

(declare-fun d!31076 () Bool)

(assert (=> d!31076 e!64664))

(declare-fun res!81119 () Bool)

(assert (=> d!31076 (=> (not res!81119) (not e!64664))))

(assert (=> d!31076 (= res!81119 (= (size!2112 (buf!2463 (_2!4226 lt!142935))) (size!2112 (buf!2463 (_2!4226 lt!143675)))))))

(assert (=> d!31076 (= lt!143675 e!64662)))

(assert (=> d!31076 (= c!6257 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) nBits!388))))

(assert (=> d!31076 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) nBits!388) (bvsle nBits!388 #b00000000000000000000000001000000))))

(assert (=> d!31076 (= (appendNLeastSignificantBitsLoop!0 (_2!4226 lt!142935) v!196 nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!143675)))

(declare-fun b!98881 () Bool)

(assert (=> b!98881 (= lt!143683 (readBitPure!0 (readerFrom!0 (_2!4226 lt!143673) (currentBit!4888 (_2!4226 lt!142935)) (currentByte!4893 (_2!4226 lt!142935)))))))

(declare-fun res!81120 () Bool)

(assert (=> b!98881 (= res!81120 (and (= (_2!4230 lt!143683) lt!143692) (= (_1!4230 lt!143683) (_2!4226 lt!143673))))))

(assert (=> b!98881 (=> (not res!81120) (not e!64660))))

(assert (=> b!98881 (= e!64659 e!64660)))

(assert (= (and d!31076 c!6257) b!98883))

(assert (= (and d!31076 (not c!6257)) b!98887))

(assert (= (and b!98883 res!81115) b!98885))

(assert (= (and b!98885 res!81118) b!98886))

(assert (= (and b!98886 res!81117) b!98881))

(assert (= (and b!98881 res!81120) b!98882))

(assert (= (and b!98883 res!81121) b!98893))

(assert (= (and b!98883 c!6258) b!98888))

(assert (= (and b!98883 (not c!6258)) b!98892))

(assert (= (or b!98886 b!98887) bm!1238))

(assert (= (and d!31076 res!81119) b!98891))

(assert (= (and b!98891 res!81122) b!98884))

(assert (= (and b!98884 res!81114) b!98890))

(assert (= (and b!98890 res!81116) b!98889))

(declare-fun m!143907 () Bool)

(assert (=> b!98882 m!143907))

(declare-fun m!143909 () Bool)

(assert (=> b!98882 m!143909))

(declare-fun m!143911 () Bool)

(assert (=> bm!1238 m!143911))

(declare-fun m!143913 () Bool)

(assert (=> b!98889 m!143913))

(declare-fun m!143915 () Bool)

(assert (=> b!98883 m!143915))

(declare-fun m!143917 () Bool)

(assert (=> b!98883 m!143917))

(declare-fun m!143919 () Bool)

(assert (=> b!98883 m!143919))

(declare-fun m!143921 () Bool)

(assert (=> b!98883 m!143921))

(declare-fun m!143923 () Bool)

(assert (=> b!98883 m!143923))

(declare-fun m!143925 () Bool)

(assert (=> b!98883 m!143925))

(declare-fun m!143927 () Bool)

(assert (=> b!98883 m!143927))

(declare-fun m!143929 () Bool)

(assert (=> b!98883 m!143929))

(declare-fun m!143931 () Bool)

(assert (=> b!98883 m!143931))

(declare-fun m!143933 () Bool)

(assert (=> b!98883 m!143933))

(declare-fun m!143935 () Bool)

(assert (=> b!98883 m!143935))

(declare-fun m!143937 () Bool)

(assert (=> b!98883 m!143937))

(declare-fun m!143939 () Bool)

(assert (=> b!98883 m!143939))

(declare-fun m!143941 () Bool)

(assert (=> b!98883 m!143941))

(declare-fun m!143943 () Bool)

(assert (=> b!98883 m!143943))

(assert (=> b!98883 m!143157))

(declare-fun m!143945 () Bool)

(assert (=> b!98883 m!143945))

(declare-fun m!143947 () Bool)

(assert (=> b!98883 m!143947))

(declare-fun m!143949 () Bool)

(assert (=> b!98883 m!143949))

(declare-fun m!143951 () Bool)

(assert (=> b!98883 m!143951))

(declare-fun m!143953 () Bool)

(assert (=> b!98883 m!143953))

(declare-fun m!143955 () Bool)

(assert (=> b!98883 m!143955))

(declare-fun m!143957 () Bool)

(assert (=> b!98883 m!143957))

(assert (=> b!98883 m!143931))

(declare-fun m!143959 () Bool)

(assert (=> b!98883 m!143959))

(declare-fun m!143961 () Bool)

(assert (=> b!98883 m!143961))

(declare-fun m!143963 () Bool)

(assert (=> b!98883 m!143963))

(declare-fun m!143965 () Bool)

(assert (=> b!98883 m!143965))

(declare-fun m!143967 () Bool)

(assert (=> b!98883 m!143967))

(declare-fun m!143969 () Bool)

(assert (=> b!98883 m!143969))

(declare-fun m!143971 () Bool)

(assert (=> b!98881 m!143971))

(assert (=> b!98881 m!143971))

(declare-fun m!143973 () Bool)

(assert (=> b!98881 m!143973))

(declare-fun m!143975 () Bool)

(assert (=> b!98890 m!143975))

(assert (=> b!98890 m!143921))

(declare-fun m!143977 () Bool)

(assert (=> b!98890 m!143977))

(declare-fun m!143979 () Bool)

(assert (=> b!98890 m!143979))

(declare-fun m!143981 () Bool)

(assert (=> b!98890 m!143981))

(assert (=> b!98885 m!143909))

(assert (=> b!98885 m!143157))

(declare-fun m!143983 () Bool)

(assert (=> b!98887 m!143983))

(declare-fun m!143985 () Bool)

(assert (=> b!98884 m!143985))

(declare-fun m!143987 () Bool)

(assert (=> b!98891 m!143987))

(assert (=> b!98891 m!143157))

(assert (=> b!98538 d!31076))

(declare-fun d!31078 () Bool)

(assert (=> d!31078 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142951)))) ((_ sign_extend 32) (currentByte!4893 (_2!4226 lt!142935))) ((_ sign_extend 32) (currentBit!4888 (_2!4226 lt!142935))) lt!142941) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142951)))) ((_ sign_extend 32) (currentByte!4893 (_2!4226 lt!142935))) ((_ sign_extend 32) (currentBit!4888 (_2!4226 lt!142935)))) lt!142941))))

(declare-fun bs!7604 () Bool)

(assert (= bs!7604 d!31078))

(declare-fun m!143989 () Bool)

(assert (=> bs!7604 m!143989))

(assert (=> b!98538 d!31078))

(declare-fun d!31080 () Bool)

(assert (=> d!31080 (= (invariant!0 (currentBit!4888 thiss!1288) (currentByte!4893 thiss!1288) (size!2112 (buf!2463 (_2!4226 lt!142935)))) (and (bvsge (currentBit!4888 thiss!1288) #b00000000000000000000000000000000) (bvslt (currentBit!4888 thiss!1288) #b00000000000000000000000000001000) (bvsge (currentByte!4893 thiss!1288) #b00000000000000000000000000000000) (or (bvslt (currentByte!4893 thiss!1288) (size!2112 (buf!2463 (_2!4226 lt!142935)))) (and (= (currentBit!4888 thiss!1288) #b00000000000000000000000000000000) (= (currentByte!4893 thiss!1288) (size!2112 (buf!2463 (_2!4226 lt!142935))))))))))

(assert (=> b!98538 d!31080))

(declare-fun b!98894 () Bool)

(declare-fun e!64666 () Unit!6033)

(declare-fun lt!143717 () Unit!6033)

(assert (=> b!98894 (= e!64666 lt!143717)))

(declare-fun lt!143712 () (_ BitVec 64))

(assert (=> b!98894 (= lt!143712 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!143710 () (_ BitVec 64))

(assert (=> b!98894 (= lt!143710 (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288)))))

(assert (=> b!98894 (= lt!143717 (arrayBitRangesEqSymmetric!0 (buf!2463 thiss!1288) (buf!2463 (_2!4226 lt!142951)) lt!143712 lt!143710))))

(assert (=> b!98894 (arrayBitRangesEq!0 (buf!2463 (_2!4226 lt!142951)) (buf!2463 thiss!1288) lt!143712 lt!143710)))

(declare-fun lt!143707 () tuple2!7952)

(declare-fun lt!143705 () (_ BitVec 64))

(declare-fun lt!143714 () (_ BitVec 64))

(declare-fun e!64667 () Bool)

(declare-fun b!98895 () Bool)

(assert (=> b!98895 (= e!64667 (= (_1!4228 lt!143707) (withMovedBitIndex!0 (_2!4228 lt!143707) (bvsub lt!143714 lt!143705))))))

(assert (=> b!98895 (or (= (bvand lt!143714 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143705 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143714 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143714 lt!143705) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98895 (= lt!143705 (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142951))) (currentByte!4893 (_2!4226 lt!142951)) (currentBit!4888 (_2!4226 lt!142951))))))

(assert (=> b!98895 (= lt!143714 (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288)))))

(declare-fun b!98896 () Bool)

(declare-fun Unit!6072 () Unit!6033)

(assert (=> b!98896 (= e!64666 Unit!6072)))

(declare-fun d!31082 () Bool)

(assert (=> d!31082 e!64667))

(declare-fun res!81124 () Bool)

(assert (=> d!31082 (=> (not res!81124) (not e!64667))))

(assert (=> d!31082 (= res!81124 (isPrefixOf!0 (_1!4228 lt!143707) (_2!4228 lt!143707)))))

(declare-fun lt!143711 () BitStream!3698)

(assert (=> d!31082 (= lt!143707 (tuple2!7953 lt!143711 (_2!4226 lt!142951)))))

(declare-fun lt!143721 () Unit!6033)

(declare-fun lt!143715 () Unit!6033)

(assert (=> d!31082 (= lt!143721 lt!143715)))

(assert (=> d!31082 (isPrefixOf!0 lt!143711 (_2!4226 lt!142951))))

(assert (=> d!31082 (= lt!143715 (lemmaIsPrefixTransitive!0 lt!143711 (_2!4226 lt!142951) (_2!4226 lt!142951)))))

(declare-fun lt!143709 () Unit!6033)

(declare-fun lt!143703 () Unit!6033)

(assert (=> d!31082 (= lt!143709 lt!143703)))

(assert (=> d!31082 (isPrefixOf!0 lt!143711 (_2!4226 lt!142951))))

(assert (=> d!31082 (= lt!143703 (lemmaIsPrefixTransitive!0 lt!143711 thiss!1288 (_2!4226 lt!142951)))))

(declare-fun lt!143722 () Unit!6033)

(assert (=> d!31082 (= lt!143722 e!64666)))

(declare-fun c!6259 () Bool)

(assert (=> d!31082 (= c!6259 (not (= (size!2112 (buf!2463 thiss!1288)) #b00000000000000000000000000000000)))))

(declare-fun lt!143719 () Unit!6033)

(declare-fun lt!143706 () Unit!6033)

(assert (=> d!31082 (= lt!143719 lt!143706)))

(assert (=> d!31082 (isPrefixOf!0 (_2!4226 lt!142951) (_2!4226 lt!142951))))

(assert (=> d!31082 (= lt!143706 (lemmaIsPrefixRefl!0 (_2!4226 lt!142951)))))

(declare-fun lt!143718 () Unit!6033)

(declare-fun lt!143713 () Unit!6033)

(assert (=> d!31082 (= lt!143718 lt!143713)))

(assert (=> d!31082 (= lt!143713 (lemmaIsPrefixRefl!0 (_2!4226 lt!142951)))))

(declare-fun lt!143704 () Unit!6033)

(declare-fun lt!143708 () Unit!6033)

(assert (=> d!31082 (= lt!143704 lt!143708)))

(assert (=> d!31082 (isPrefixOf!0 lt!143711 lt!143711)))

(assert (=> d!31082 (= lt!143708 (lemmaIsPrefixRefl!0 lt!143711))))

(declare-fun lt!143716 () Unit!6033)

(declare-fun lt!143720 () Unit!6033)

(assert (=> d!31082 (= lt!143716 lt!143720)))

(assert (=> d!31082 (isPrefixOf!0 thiss!1288 thiss!1288)))

(assert (=> d!31082 (= lt!143720 (lemmaIsPrefixRefl!0 thiss!1288))))

(assert (=> d!31082 (= lt!143711 (BitStream!3699 (buf!2463 (_2!4226 lt!142951)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288)))))

(assert (=> d!31082 (isPrefixOf!0 thiss!1288 (_2!4226 lt!142951))))

(assert (=> d!31082 (= (reader!0 thiss!1288 (_2!4226 lt!142951)) lt!143707)))

(declare-fun b!98897 () Bool)

(declare-fun res!81125 () Bool)

(assert (=> b!98897 (=> (not res!81125) (not e!64667))))

(assert (=> b!98897 (= res!81125 (isPrefixOf!0 (_1!4228 lt!143707) thiss!1288))))

(declare-fun b!98898 () Bool)

(declare-fun res!81123 () Bool)

(assert (=> b!98898 (=> (not res!81123) (not e!64667))))

(assert (=> b!98898 (= res!81123 (isPrefixOf!0 (_2!4228 lt!143707) (_2!4226 lt!142951)))))

(assert (= (and d!31082 c!6259) b!98894))

(assert (= (and d!31082 (not c!6259)) b!98896))

(assert (= (and d!31082 res!81124) b!98897))

(assert (= (and b!98897 res!81125) b!98898))

(assert (= (and b!98898 res!81123) b!98895))

(declare-fun m!143991 () Bool)

(assert (=> b!98898 m!143991))

(declare-fun m!143993 () Bool)

(assert (=> d!31082 m!143993))

(declare-fun m!143995 () Bool)

(assert (=> d!31082 m!143995))

(declare-fun m!143997 () Bool)

(assert (=> d!31082 m!143997))

(declare-fun m!143999 () Bool)

(assert (=> d!31082 m!143999))

(assert (=> d!31082 m!143179))

(declare-fun m!144001 () Bool)

(assert (=> d!31082 m!144001))

(declare-fun m!144003 () Bool)

(assert (=> d!31082 m!144003))

(declare-fun m!144005 () Bool)

(assert (=> d!31082 m!144005))

(assert (=> d!31082 m!143267))

(declare-fun m!144007 () Bool)

(assert (=> d!31082 m!144007))

(assert (=> d!31082 m!143271))

(declare-fun m!144009 () Bool)

(assert (=> b!98897 m!144009))

(declare-fun m!144011 () Bool)

(assert (=> b!98895 m!144011))

(assert (=> b!98895 m!143135))

(assert (=> b!98895 m!142987))

(assert (=> b!98894 m!142987))

(declare-fun m!144013 () Bool)

(assert (=> b!98894 m!144013))

(declare-fun m!144015 () Bool)

(assert (=> b!98894 m!144015))

(assert (=> b!98538 d!31082))

(declare-fun d!31084 () Bool)

(assert (=> d!31084 (validate_offset_bits!1 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142951)))) ((_ sign_extend 32) (currentByte!4893 (_2!4226 lt!142935))) ((_ sign_extend 32) (currentBit!4888 (_2!4226 lt!142935))) lt!142941)))

(declare-fun lt!143723 () Unit!6033)

(assert (=> d!31084 (= lt!143723 (choose!9 (_2!4226 lt!142935) (buf!2463 (_2!4226 lt!142951)) lt!142941 (BitStream!3699 (buf!2463 (_2!4226 lt!142951)) (currentByte!4893 (_2!4226 lt!142935)) (currentBit!4888 (_2!4226 lt!142935)))))))

(assert (=> d!31084 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4226 lt!142935) (buf!2463 (_2!4226 lt!142951)) lt!142941) lt!143723)))

(declare-fun bs!7605 () Bool)

(assert (= bs!7605 d!31084))

(assert (=> bs!7605 m!143165))

(declare-fun m!144017 () Bool)

(assert (=> bs!7605 m!144017))

(assert (=> b!98538 d!31084))

(assert (=> b!98538 d!31044))

(declare-fun d!31086 () Bool)

(declare-fun lt!143737 () tuple2!7950)

(declare-fun lt!143741 () tuple2!7950)

(assert (=> d!31086 (and (= (_2!4227 lt!143737) (_2!4227 lt!143741)) (= (_1!4227 lt!143737) (_1!4227 lt!143741)))))

(declare-fun lt!143738 () Bool)

(declare-fun lt!143739 () BitStream!3698)

(declare-fun lt!143736 () Unit!6033)

(declare-fun lt!143740 () (_ BitVec 64))

(declare-fun choose!45 (BitStream!3698 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!7950 tuple2!7950 BitStream!3698 (_ BitVec 64) Bool BitStream!3698 (_ BitVec 64) tuple2!7950 tuple2!7950 BitStream!3698 (_ BitVec 64)) Unit!6033)

(assert (=> d!31086 (= lt!143736 (choose!45 (_1!4228 lt!142945) nBits!388 #b00000000000000000000000000000000 lt!142962 lt!143737 (tuple2!7951 (_1!4227 lt!143737) (_2!4227 lt!143737)) (_1!4227 lt!143737) (_2!4227 lt!143737) lt!143738 lt!143739 lt!143740 lt!143741 (tuple2!7951 (_1!4227 lt!143741) (_2!4227 lt!143741)) (_1!4227 lt!143741) (_2!4227 lt!143741)))))

(assert (=> d!31086 (= lt!143741 (readNLeastSignificantBitsLoopPure!0 lt!143739 nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!143740))))

(assert (=> d!31086 (= lt!143740 (bvor lt!142962 (ite lt!143738 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31086 (= lt!143739 (withMovedBitIndex!0 (_1!4228 lt!142945) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!31086 (= lt!143738 (_2!4230 (readBitPure!0 (_1!4228 lt!142945))))))

(assert (=> d!31086 (= lt!143737 (readNLeastSignificantBitsLoopPure!0 (_1!4228 lt!142945) nBits!388 #b00000000000000000000000000000000 lt!142962))))

(assert (=> d!31086 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4228 lt!142945) nBits!388 #b00000000000000000000000000000000 lt!142962) lt!143736)))

(declare-fun bs!7607 () Bool)

(assert (= bs!7607 d!31086))

(declare-fun m!144019 () Bool)

(assert (=> bs!7607 m!144019))

(assert (=> bs!7607 m!143143))

(assert (=> bs!7607 m!143149))

(assert (=> bs!7607 m!143173))

(declare-fun m!144021 () Bool)

(assert (=> bs!7607 m!144021))

(assert (=> b!98538 d!31086))

(declare-fun d!31088 () Bool)

(assert (=> d!31088 (validate_offset_bits!1 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142951)))) ((_ sign_extend 32) (currentByte!4893 thiss!1288)) ((_ sign_extend 32) (currentBit!4888 thiss!1288)) lt!142974)))

(declare-fun lt!143742 () Unit!6033)

(assert (=> d!31088 (= lt!143742 (choose!9 thiss!1288 (buf!2463 (_2!4226 lt!142951)) lt!142974 (BitStream!3699 (buf!2463 (_2!4226 lt!142951)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288))))))

(assert (=> d!31088 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2463 (_2!4226 lt!142951)) lt!142974) lt!143742)))

(declare-fun bs!7608 () Bool)

(assert (= bs!7608 d!31088))

(assert (=> bs!7608 m!143161))

(declare-fun m!144023 () Bool)

(assert (=> bs!7608 m!144023))

(assert (=> b!98538 d!31088))

(declare-fun d!31090 () Bool)

(declare-fun e!64670 () Bool)

(assert (=> d!31090 e!64670))

(declare-fun res!81128 () Bool)

(assert (=> d!31090 (=> (not res!81128) (not e!64670))))

(declare-fun lt!143753 () tuple2!7956)

(declare-fun lt!143752 () tuple2!7956)

(assert (=> d!31090 (= res!81128 (= (bitIndex!0 (size!2112 (buf!2463 (_1!4230 lt!143753))) (currentByte!4893 (_1!4230 lt!143753)) (currentBit!4888 (_1!4230 lt!143753))) (bitIndex!0 (size!2112 (buf!2463 (_1!4230 lt!143752))) (currentByte!4893 (_1!4230 lt!143752)) (currentBit!4888 (_1!4230 lt!143752)))))))

(declare-fun lt!143751 () BitStream!3698)

(declare-fun lt!143754 () Unit!6033)

(declare-fun choose!50 (BitStream!3698 BitStream!3698 BitStream!3698 tuple2!7956 tuple2!7956 BitStream!3698 Bool tuple2!7956 tuple2!7956 BitStream!3698 Bool) Unit!6033)

(assert (=> d!31090 (= lt!143754 (choose!50 lt!142961 (_2!4226 lt!142951) lt!143751 lt!143753 (tuple2!7957 (_1!4230 lt!143753) (_2!4230 lt!143753)) (_1!4230 lt!143753) (_2!4230 lt!143753) lt!143752 (tuple2!7957 (_1!4230 lt!143752) (_2!4230 lt!143752)) (_1!4230 lt!143752) (_2!4230 lt!143752)))))

(assert (=> d!31090 (= lt!143752 (readBitPure!0 lt!143751))))

(assert (=> d!31090 (= lt!143753 (readBitPure!0 lt!142961))))

(assert (=> d!31090 (= lt!143751 (BitStream!3699 (buf!2463 (_2!4226 lt!142951)) (currentByte!4893 lt!142961) (currentBit!4888 lt!142961)))))

(assert (=> d!31090 (invariant!0 (currentBit!4888 lt!142961) (currentByte!4893 lt!142961) (size!2112 (buf!2463 (_2!4226 lt!142951))))))

(assert (=> d!31090 (= (readBitPrefixLemma!0 lt!142961 (_2!4226 lt!142951)) lt!143754)))

(declare-fun b!98901 () Bool)

(assert (=> b!98901 (= e!64670 (= (_2!4230 lt!143753) (_2!4230 lt!143752)))))

(assert (= (and d!31090 res!81128) b!98901))

(assert (=> d!31090 m!143167))

(declare-fun m!144025 () Bool)

(assert (=> d!31090 m!144025))

(declare-fun m!144027 () Bool)

(assert (=> d!31090 m!144027))

(assert (=> d!31090 m!143169))

(declare-fun m!144029 () Bool)

(assert (=> d!31090 m!144029))

(declare-fun m!144031 () Bool)

(assert (=> d!31090 m!144031))

(assert (=> b!98538 d!31090))

(declare-fun d!31092 () Bool)

(assert (=> d!31092 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142951)))) ((_ sign_extend 32) (currentByte!4893 thiss!1288)) ((_ sign_extend 32) (currentBit!4888 thiss!1288)) lt!142974) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142951)))) ((_ sign_extend 32) (currentByte!4893 thiss!1288)) ((_ sign_extend 32) (currentBit!4888 thiss!1288))) lt!142974))))

(declare-fun bs!7609 () Bool)

(assert (= bs!7609 d!31092))

(declare-fun m!144033 () Bool)

(assert (=> bs!7609 m!144033))

(assert (=> b!98538 d!31092))

(declare-fun d!31094 () Bool)

(declare-fun e!64671 () Bool)

(assert (=> d!31094 e!64671))

(declare-fun res!81129 () Bool)

(assert (=> d!31094 (=> (not res!81129) (not e!64671))))

(declare-fun lt!143755 () BitStream!3698)

(declare-fun lt!143756 () (_ BitVec 64))

(assert (=> d!31094 (= res!81129 (= (bvadd lt!143756 (bvsub (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288)) (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142951))) (currentByte!4893 (_2!4226 lt!142951)) (currentBit!4888 (_2!4226 lt!142951))))) (bitIndex!0 (size!2112 (buf!2463 lt!143755)) (currentByte!4893 lt!143755) (currentBit!4888 lt!143755))))))

(assert (=> d!31094 (or (not (= (bvand lt!143756 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288)) (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142951))) (currentByte!4893 (_2!4226 lt!142951)) (currentBit!4888 (_2!4226 lt!142951)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!143756 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!143756 (bvsub (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288)) (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142951))) (currentByte!4893 (_2!4226 lt!142951)) (currentBit!4888 (_2!4226 lt!142951))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31094 (= lt!143756 (bitIndex!0 (size!2112 (buf!2463 (_2!4228 lt!142945))) (currentByte!4893 (_2!4228 lt!142945)) (currentBit!4888 (_2!4228 lt!142945))))))

(assert (=> d!31094 (= lt!143755 (_2!4226 (moveBitIndex!0 (_2!4228 lt!142945) (bvsub (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288)) (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142951))) (currentByte!4893 (_2!4226 lt!142951)) (currentBit!4888 (_2!4226 lt!142951)))))))))

(assert (=> d!31094 (moveBitIndexPrecond!0 (_2!4228 lt!142945) (bvsub (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288)) (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142951))) (currentByte!4893 (_2!4226 lt!142951)) (currentBit!4888 (_2!4226 lt!142951)))))))

(assert (=> d!31094 (= (withMovedBitIndex!0 (_2!4228 lt!142945) (bvsub (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288)) (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142951))) (currentByte!4893 (_2!4226 lt!142951)) (currentBit!4888 (_2!4226 lt!142951))))) lt!143755)))

(declare-fun b!98902 () Bool)

(assert (=> b!98902 (= e!64671 (= (size!2112 (buf!2463 (_2!4228 lt!142945))) (size!2112 (buf!2463 lt!143755))))))

(assert (= (and d!31094 res!81129) b!98902))

(declare-fun m!144035 () Bool)

(assert (=> d!31094 m!144035))

(declare-fun m!144037 () Bool)

(assert (=> d!31094 m!144037))

(declare-fun m!144039 () Bool)

(assert (=> d!31094 m!144039))

(declare-fun m!144041 () Bool)

(assert (=> d!31094 m!144041))

(assert (=> b!98538 d!31094))

(declare-fun d!31096 () Bool)

(declare-fun e!64672 () Bool)

(assert (=> d!31096 e!64672))

(declare-fun res!81131 () Bool)

(assert (=> d!31096 (=> (not res!81131) (not e!64672))))

(declare-fun lt!143759 () (_ BitVec 64))

(declare-fun lt!143758 () (_ BitVec 64))

(declare-fun lt!143761 () (_ BitVec 64))

(assert (=> d!31096 (= res!81131 (= lt!143761 (bvsub lt!143758 lt!143759)))))

(assert (=> d!31096 (or (= (bvand lt!143758 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143759 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143758 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143758 lt!143759) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31096 (= lt!143759 (remainingBits!0 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142951)))) ((_ sign_extend 32) (currentByte!4893 (_2!4226 lt!142951))) ((_ sign_extend 32) (currentBit!4888 (_2!4226 lt!142951)))))))

(declare-fun lt!143760 () (_ BitVec 64))

(declare-fun lt!143757 () (_ BitVec 64))

(assert (=> d!31096 (= lt!143758 (bvmul lt!143760 lt!143757))))

(assert (=> d!31096 (or (= lt!143760 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!143757 (bvsdiv (bvmul lt!143760 lt!143757) lt!143760)))))

(assert (=> d!31096 (= lt!143757 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31096 (= lt!143760 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142951)))))))

(assert (=> d!31096 (= lt!143761 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4893 (_2!4226 lt!142951))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4888 (_2!4226 lt!142951)))))))

(assert (=> d!31096 (invariant!0 (currentBit!4888 (_2!4226 lt!142951)) (currentByte!4893 (_2!4226 lt!142951)) (size!2112 (buf!2463 (_2!4226 lt!142951))))))

(assert (=> d!31096 (= (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142951))) (currentByte!4893 (_2!4226 lt!142951)) (currentBit!4888 (_2!4226 lt!142951))) lt!143761)))

(declare-fun b!98903 () Bool)

(declare-fun res!81130 () Bool)

(assert (=> b!98903 (=> (not res!81130) (not e!64672))))

(assert (=> b!98903 (= res!81130 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!143761))))

(declare-fun b!98904 () Bool)

(declare-fun lt!143762 () (_ BitVec 64))

(assert (=> b!98904 (= e!64672 (bvsle lt!143761 (bvmul lt!143762 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98904 (or (= lt!143762 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!143762 #b0000000000000000000000000000000000000000000000000000000000001000) lt!143762)))))

(assert (=> b!98904 (= lt!143762 ((_ sign_extend 32) (size!2112 (buf!2463 (_2!4226 lt!142951)))))))

(assert (= (and d!31096 res!81131) b!98903))

(assert (= (and b!98903 res!81130) b!98904))

(declare-fun m!144043 () Bool)

(assert (=> d!31096 m!144043))

(declare-fun m!144045 () Bool)

(assert (=> d!31096 m!144045))

(assert (=> b!98538 d!31096))

(declare-fun d!31098 () Bool)

(declare-fun e!64673 () Bool)

(assert (=> d!31098 e!64673))

(declare-fun res!81132 () Bool)

(assert (=> d!31098 (=> (not res!81132) (not e!64673))))

(declare-fun lt!143764 () (_ BitVec 64))

(declare-fun lt!143763 () BitStream!3698)

(assert (=> d!31098 (= res!81132 (= (bvadd lt!143764 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2112 (buf!2463 lt!143763)) (currentByte!4893 lt!143763) (currentBit!4888 lt!143763))))))

(assert (=> d!31098 (or (not (= (bvand lt!143764 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!143764 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!143764 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31098 (= lt!143764 (bitIndex!0 (size!2112 (buf!2463 (_1!4228 lt!142945))) (currentByte!4893 (_1!4228 lt!142945)) (currentBit!4888 (_1!4228 lt!142945))))))

(assert (=> d!31098 (= lt!143763 (_2!4226 (moveBitIndex!0 (_1!4228 lt!142945) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!31098 (moveBitIndexPrecond!0 (_1!4228 lt!142945) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!31098 (= (withMovedBitIndex!0 (_1!4228 lt!142945) #b0000000000000000000000000000000000000000000000000000000000000001) lt!143763)))

(declare-fun b!98905 () Bool)

(assert (=> b!98905 (= e!64673 (= (size!2112 (buf!2463 (_1!4228 lt!142945))) (size!2112 (buf!2463 lt!143763))))))

(assert (= (and d!31098 res!81132) b!98905))

(declare-fun m!144047 () Bool)

(assert (=> d!31098 m!144047))

(declare-fun m!144049 () Bool)

(assert (=> d!31098 m!144049))

(declare-fun m!144051 () Bool)

(assert (=> d!31098 m!144051))

(declare-fun m!144053 () Bool)

(assert (=> d!31098 m!144053))

(assert (=> b!98538 d!31098))

(declare-fun d!31100 () Bool)

(declare-fun lt!143765 () tuple2!7964)

(assert (=> d!31100 (= lt!143765 (readNLeastSignificantBitsLoop!0 (_1!4228 lt!142945) nBits!388 #b00000000000000000000000000000000 lt!142962))))

(assert (=> d!31100 (= (readNLeastSignificantBitsLoopPure!0 (_1!4228 lt!142945) nBits!388 #b00000000000000000000000000000000 lt!142962) (tuple2!7951 (_2!4234 lt!143765) (_1!4234 lt!143765)))))

(declare-fun bs!7610 () Bool)

(assert (= bs!7610 d!31100))

(declare-fun m!144055 () Bool)

(assert (=> bs!7610 m!144055))

(assert (=> b!98538 d!31100))

(assert (=> b!98538 d!30854))

(declare-fun d!31102 () Bool)

(declare-fun lt!143766 () tuple2!7964)

(assert (=> d!31102 (= lt!143766 (readNLeastSignificantBitsLoop!0 (_1!4228 lt!142963) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!142962 (ite (_2!4230 lt!142972) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!31102 (= (readNLeastSignificantBitsLoopPure!0 (_1!4228 lt!142963) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!142962 (ite (_2!4230 lt!142972) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!7951 (_2!4234 lt!143766) (_1!4234 lt!143766)))))

(declare-fun bs!7611 () Bool)

(assert (= bs!7611 d!31102))

(declare-fun m!144057 () Bool)

(assert (=> bs!7611 m!144057))

(assert (=> b!98538 d!31102))

(declare-fun d!31104 () Bool)

(declare-fun lt!143767 () tuple2!7968)

(assert (=> d!31104 (= lt!143767 (readBit!0 (_1!4228 lt!142945)))))

(assert (=> d!31104 (= (readBitPure!0 (_1!4228 lt!142945)) (tuple2!7957 (_2!4238 lt!143767) (_1!4238 lt!143767)))))

(declare-fun bs!7612 () Bool)

(assert (= bs!7612 d!31104))

(declare-fun m!144059 () Bool)

(assert (=> bs!7612 m!144059))

(assert (=> b!98538 d!31104))

(declare-fun d!31106 () Bool)

(declare-fun lt!143768 () tuple2!7968)

(assert (=> d!31106 (= lt!143768 (readBit!0 lt!142961))))

(assert (=> d!31106 (= (readBitPure!0 lt!142961) (tuple2!7957 (_2!4238 lt!143768) (_1!4238 lt!143768)))))

(declare-fun bs!7613 () Bool)

(assert (= bs!7613 d!31106))

(declare-fun m!144061 () Bool)

(assert (=> bs!7613 m!144061))

(assert (=> b!98538 d!31106))

(declare-fun b!98906 () Bool)

(declare-fun e!64674 () Unit!6033)

(declare-fun lt!143783 () Unit!6033)

(assert (=> b!98906 (= e!64674 lt!143783)))

(declare-fun lt!143778 () (_ BitVec 64))

(assert (=> b!98906 (= lt!143778 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!143776 () (_ BitVec 64))

(assert (=> b!98906 (= lt!143776 (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142935))) (currentByte!4893 (_2!4226 lt!142935)) (currentBit!4888 (_2!4226 lt!142935))))))

(assert (=> b!98906 (= lt!143783 (arrayBitRangesEqSymmetric!0 (buf!2463 (_2!4226 lt!142935)) (buf!2463 (_2!4226 lt!142951)) lt!143778 lt!143776))))

(assert (=> b!98906 (arrayBitRangesEq!0 (buf!2463 (_2!4226 lt!142951)) (buf!2463 (_2!4226 lt!142935)) lt!143778 lt!143776)))

(declare-fun lt!143771 () (_ BitVec 64))

(declare-fun e!64675 () Bool)

(declare-fun lt!143773 () tuple2!7952)

(declare-fun b!98907 () Bool)

(declare-fun lt!143780 () (_ BitVec 64))

(assert (=> b!98907 (= e!64675 (= (_1!4228 lt!143773) (withMovedBitIndex!0 (_2!4228 lt!143773) (bvsub lt!143780 lt!143771))))))

(assert (=> b!98907 (or (= (bvand lt!143780 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143771 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143780 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143780 lt!143771) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98907 (= lt!143771 (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142951))) (currentByte!4893 (_2!4226 lt!142951)) (currentBit!4888 (_2!4226 lt!142951))))))

(assert (=> b!98907 (= lt!143780 (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142935))) (currentByte!4893 (_2!4226 lt!142935)) (currentBit!4888 (_2!4226 lt!142935))))))

(declare-fun b!98908 () Bool)

(declare-fun Unit!6073 () Unit!6033)

(assert (=> b!98908 (= e!64674 Unit!6073)))

(declare-fun d!31108 () Bool)

(assert (=> d!31108 e!64675))

(declare-fun res!81134 () Bool)

(assert (=> d!31108 (=> (not res!81134) (not e!64675))))

(assert (=> d!31108 (= res!81134 (isPrefixOf!0 (_1!4228 lt!143773) (_2!4228 lt!143773)))))

(declare-fun lt!143777 () BitStream!3698)

(assert (=> d!31108 (= lt!143773 (tuple2!7953 lt!143777 (_2!4226 lt!142951)))))

(declare-fun lt!143787 () Unit!6033)

(declare-fun lt!143781 () Unit!6033)

(assert (=> d!31108 (= lt!143787 lt!143781)))

(assert (=> d!31108 (isPrefixOf!0 lt!143777 (_2!4226 lt!142951))))

(assert (=> d!31108 (= lt!143781 (lemmaIsPrefixTransitive!0 lt!143777 (_2!4226 lt!142951) (_2!4226 lt!142951)))))

(declare-fun lt!143775 () Unit!6033)

(declare-fun lt!143769 () Unit!6033)

(assert (=> d!31108 (= lt!143775 lt!143769)))

(assert (=> d!31108 (isPrefixOf!0 lt!143777 (_2!4226 lt!142951))))

(assert (=> d!31108 (= lt!143769 (lemmaIsPrefixTransitive!0 lt!143777 (_2!4226 lt!142935) (_2!4226 lt!142951)))))

(declare-fun lt!143788 () Unit!6033)

(assert (=> d!31108 (= lt!143788 e!64674)))

(declare-fun c!6260 () Bool)

(assert (=> d!31108 (= c!6260 (not (= (size!2112 (buf!2463 (_2!4226 lt!142935))) #b00000000000000000000000000000000)))))

(declare-fun lt!143785 () Unit!6033)

(declare-fun lt!143772 () Unit!6033)

(assert (=> d!31108 (= lt!143785 lt!143772)))

(assert (=> d!31108 (isPrefixOf!0 (_2!4226 lt!142951) (_2!4226 lt!142951))))

(assert (=> d!31108 (= lt!143772 (lemmaIsPrefixRefl!0 (_2!4226 lt!142951)))))

(declare-fun lt!143784 () Unit!6033)

(declare-fun lt!143779 () Unit!6033)

(assert (=> d!31108 (= lt!143784 lt!143779)))

(assert (=> d!31108 (= lt!143779 (lemmaIsPrefixRefl!0 (_2!4226 lt!142951)))))

(declare-fun lt!143770 () Unit!6033)

(declare-fun lt!143774 () Unit!6033)

(assert (=> d!31108 (= lt!143770 lt!143774)))

(assert (=> d!31108 (isPrefixOf!0 lt!143777 lt!143777)))

(assert (=> d!31108 (= lt!143774 (lemmaIsPrefixRefl!0 lt!143777))))

(declare-fun lt!143782 () Unit!6033)

(declare-fun lt!143786 () Unit!6033)

(assert (=> d!31108 (= lt!143782 lt!143786)))

(assert (=> d!31108 (isPrefixOf!0 (_2!4226 lt!142935) (_2!4226 lt!142935))))

(assert (=> d!31108 (= lt!143786 (lemmaIsPrefixRefl!0 (_2!4226 lt!142935)))))

(assert (=> d!31108 (= lt!143777 (BitStream!3699 (buf!2463 (_2!4226 lt!142951)) (currentByte!4893 (_2!4226 lt!142935)) (currentBit!4888 (_2!4226 lt!142935))))))

(assert (=> d!31108 (isPrefixOf!0 (_2!4226 lt!142935) (_2!4226 lt!142951))))

(assert (=> d!31108 (= (reader!0 (_2!4226 lt!142935) (_2!4226 lt!142951)) lt!143773)))

(declare-fun b!98909 () Bool)

(declare-fun res!81135 () Bool)

(assert (=> b!98909 (=> (not res!81135) (not e!64675))))

(assert (=> b!98909 (= res!81135 (isPrefixOf!0 (_1!4228 lt!143773) (_2!4226 lt!142935)))))

(declare-fun b!98910 () Bool)

(declare-fun res!81133 () Bool)

(assert (=> b!98910 (=> (not res!81133) (not e!64675))))

(assert (=> b!98910 (= res!81133 (isPrefixOf!0 (_2!4228 lt!143773) (_2!4226 lt!142951)))))

(assert (= (and d!31108 c!6260) b!98906))

(assert (= (and d!31108 (not c!6260)) b!98908))

(assert (= (and d!31108 res!81134) b!98909))

(assert (= (and b!98909 res!81135) b!98910))

(assert (= (and b!98910 res!81133) b!98907))

(declare-fun m!144063 () Bool)

(assert (=> b!98910 m!144063))

(declare-fun m!144065 () Bool)

(assert (=> d!31108 m!144065))

(declare-fun m!144067 () Bool)

(assert (=> d!31108 m!144067))

(declare-fun m!144069 () Bool)

(assert (=> d!31108 m!144069))

(assert (=> d!31108 m!143999))

(declare-fun m!144071 () Bool)

(assert (=> d!31108 m!144071))

(declare-fun m!144073 () Bool)

(assert (=> d!31108 m!144073))

(assert (=> d!31108 m!144003))

(declare-fun m!144075 () Bool)

(assert (=> d!31108 m!144075))

(declare-fun m!144077 () Bool)

(assert (=> d!31108 m!144077))

(declare-fun m!144079 () Bool)

(assert (=> d!31108 m!144079))

(declare-fun m!144081 () Bool)

(assert (=> d!31108 m!144081))

(declare-fun m!144083 () Bool)

(assert (=> b!98909 m!144083))

(declare-fun m!144085 () Bool)

(assert (=> b!98907 m!144085))

(assert (=> b!98907 m!143135))

(assert (=> b!98907 m!143157))

(assert (=> b!98906 m!143157))

(declare-fun m!144087 () Bool)

(assert (=> b!98906 m!144087))

(declare-fun m!144089 () Bool)

(assert (=> b!98906 m!144089))

(assert (=> b!98538 d!31108))

(declare-fun d!31110 () Bool)

(declare-fun e!64676 () Bool)

(assert (=> d!31110 e!64676))

(declare-fun res!81136 () Bool)

(assert (=> d!31110 (=> (not res!81136) (not e!64676))))

(declare-fun lt!143789 () BitStream!3698)

(declare-fun lt!143790 () (_ BitVec 64))

(assert (=> d!31110 (= res!81136 (= (bvadd lt!143790 (bvsub (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142935))) (currentByte!4893 (_2!4226 lt!142935)) (currentBit!4888 (_2!4226 lt!142935))) (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142951))) (currentByte!4893 (_2!4226 lt!142951)) (currentBit!4888 (_2!4226 lt!142951))))) (bitIndex!0 (size!2112 (buf!2463 lt!143789)) (currentByte!4893 lt!143789) (currentBit!4888 lt!143789))))))

(assert (=> d!31110 (or (not (= (bvand lt!143790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142935))) (currentByte!4893 (_2!4226 lt!142935)) (currentBit!4888 (_2!4226 lt!142935))) (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142951))) (currentByte!4893 (_2!4226 lt!142951)) (currentBit!4888 (_2!4226 lt!142951)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!143790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!143790 (bvsub (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142935))) (currentByte!4893 (_2!4226 lt!142935)) (currentBit!4888 (_2!4226 lt!142935))) (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142951))) (currentByte!4893 (_2!4226 lt!142951)) (currentBit!4888 (_2!4226 lt!142951))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31110 (= lt!143790 (bitIndex!0 (size!2112 (buf!2463 (_2!4228 lt!142963))) (currentByte!4893 (_2!4228 lt!142963)) (currentBit!4888 (_2!4228 lt!142963))))))

(assert (=> d!31110 (= lt!143789 (_2!4226 (moveBitIndex!0 (_2!4228 lt!142963) (bvsub (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142935))) (currentByte!4893 (_2!4226 lt!142935)) (currentBit!4888 (_2!4226 lt!142935))) (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142951))) (currentByte!4893 (_2!4226 lt!142951)) (currentBit!4888 (_2!4226 lt!142951)))))))))

(assert (=> d!31110 (moveBitIndexPrecond!0 (_2!4228 lt!142963) (bvsub (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142935))) (currentByte!4893 (_2!4226 lt!142935)) (currentBit!4888 (_2!4226 lt!142935))) (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142951))) (currentByte!4893 (_2!4226 lt!142951)) (currentBit!4888 (_2!4226 lt!142951)))))))

(assert (=> d!31110 (= (withMovedBitIndex!0 (_2!4228 lt!142963) (bvsub (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142935))) (currentByte!4893 (_2!4226 lt!142935)) (currentBit!4888 (_2!4226 lt!142935))) (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142951))) (currentByte!4893 (_2!4226 lt!142951)) (currentBit!4888 (_2!4226 lt!142951))))) lt!143789)))

(declare-fun b!98911 () Bool)

(assert (=> b!98911 (= e!64676 (= (size!2112 (buf!2463 (_2!4228 lt!142963))) (size!2112 (buf!2463 lt!143789))))))

(assert (= (and d!31110 res!81136) b!98911))

(declare-fun m!144091 () Bool)

(assert (=> d!31110 m!144091))

(declare-fun m!144093 () Bool)

(assert (=> d!31110 m!144093))

(declare-fun m!144095 () Bool)

(assert (=> d!31110 m!144095))

(declare-fun m!144097 () Bool)

(assert (=> d!31110 m!144097))

(assert (=> b!98538 d!31110))

(declare-fun d!31112 () Bool)

(assert (=> d!31112 (isPrefixOf!0 thiss!1288 (_2!4226 lt!142951))))

(declare-fun lt!143791 () Unit!6033)

(assert (=> d!31112 (= lt!143791 (choose!30 thiss!1288 (_2!4226 lt!142935) (_2!4226 lt!142951)))))

(assert (=> d!31112 (isPrefixOf!0 thiss!1288 (_2!4226 lt!142935))))

(assert (=> d!31112 (= (lemmaIsPrefixTransitive!0 thiss!1288 (_2!4226 lt!142935) (_2!4226 lt!142951)) lt!143791)))

(declare-fun bs!7614 () Bool)

(assert (= bs!7614 d!31112))

(assert (=> bs!7614 m!143179))

(declare-fun m!144099 () Bool)

(assert (=> bs!7614 m!144099))

(declare-fun m!144101 () Bool)

(assert (=> bs!7614 m!144101))

(assert (=> b!98538 d!31112))

(declare-fun lt!143792 () tuple2!7964)

(declare-fun d!31114 () Bool)

(assert (=> d!31114 (= lt!143792 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4228 lt!142945) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!142962 e!64450)))))

(assert (=> d!31114 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4228 lt!142945) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!142962 e!64450)) (tuple2!7951 (_2!4234 lt!143792) (_1!4234 lt!143792)))))

(declare-fun bs!7615 () Bool)

(assert (= bs!7615 d!31114))

(assert (=> bs!7615 m!143149))

(declare-fun m!144103 () Bool)

(assert (=> bs!7615 m!144103))

(assert (=> b!98538 d!31114))

(declare-fun d!31116 () Bool)

(declare-fun e!64677 () Bool)

(assert (=> d!31116 e!64677))

(declare-fun res!81138 () Bool)

(assert (=> d!31116 (=> (not res!81138) (not e!64677))))

(declare-fun lt!143797 () (_ BitVec 64))

(declare-fun lt!143795 () (_ BitVec 64))

(declare-fun lt!143794 () (_ BitVec 64))

(assert (=> d!31116 (= res!81138 (= lt!143797 (bvsub lt!143794 lt!143795)))))

(assert (=> d!31116 (or (= (bvand lt!143794 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143795 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143794 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143794 lt!143795) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31116 (= lt!143795 (remainingBits!0 ((_ sign_extend 32) (size!2112 (buf!2463 (_1!4230 lt!142940)))) ((_ sign_extend 32) (currentByte!4893 (_1!4230 lt!142940))) ((_ sign_extend 32) (currentBit!4888 (_1!4230 lt!142940)))))))

(declare-fun lt!143796 () (_ BitVec 64))

(declare-fun lt!143793 () (_ BitVec 64))

(assert (=> d!31116 (= lt!143794 (bvmul lt!143796 lt!143793))))

(assert (=> d!31116 (or (= lt!143796 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!143793 (bvsdiv (bvmul lt!143796 lt!143793) lt!143796)))))

(assert (=> d!31116 (= lt!143793 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31116 (= lt!143796 ((_ sign_extend 32) (size!2112 (buf!2463 (_1!4230 lt!142940)))))))

(assert (=> d!31116 (= lt!143797 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4893 (_1!4230 lt!142940))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4888 (_1!4230 lt!142940)))))))

(assert (=> d!31116 (invariant!0 (currentBit!4888 (_1!4230 lt!142940)) (currentByte!4893 (_1!4230 lt!142940)) (size!2112 (buf!2463 (_1!4230 lt!142940))))))

(assert (=> d!31116 (= (bitIndex!0 (size!2112 (buf!2463 (_1!4230 lt!142940))) (currentByte!4893 (_1!4230 lt!142940)) (currentBit!4888 (_1!4230 lt!142940))) lt!143797)))

(declare-fun b!98912 () Bool)

(declare-fun res!81137 () Bool)

(assert (=> b!98912 (=> (not res!81137) (not e!64677))))

(assert (=> b!98912 (= res!81137 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!143797))))

(declare-fun b!98913 () Bool)

(declare-fun lt!143798 () (_ BitVec 64))

(assert (=> b!98913 (= e!64677 (bvsle lt!143797 (bvmul lt!143798 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98913 (or (= lt!143798 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!143798 #b0000000000000000000000000000000000000000000000000000000000001000) lt!143798)))))

(assert (=> b!98913 (= lt!143798 ((_ sign_extend 32) (size!2112 (buf!2463 (_1!4230 lt!142940)))))))

(assert (= (and d!31116 res!81138) b!98912))

(assert (= (and b!98912 res!81137) b!98913))

(declare-fun m!144105 () Bool)

(assert (=> d!31116 m!144105))

(declare-fun m!144107 () Bool)

(assert (=> d!31116 m!144107))

(assert (=> b!98538 d!31116))

(declare-fun d!31118 () Bool)

(assert (=> d!31118 (= (invariant!0 (currentBit!4888 lt!142961) (currentByte!4893 lt!142961) (size!2112 (buf!2463 (_2!4226 lt!142951)))) (and (bvsge (currentBit!4888 lt!142961) #b00000000000000000000000000000000) (bvslt (currentBit!4888 lt!142961) #b00000000000000000000000000001000) (bvsge (currentByte!4893 lt!142961) #b00000000000000000000000000000000) (or (bvslt (currentByte!4893 lt!142961) (size!2112 (buf!2463 (_2!4226 lt!142951)))) (and (= (currentBit!4888 lt!142961) #b00000000000000000000000000000000) (= (currentByte!4893 lt!142961) (size!2112 (buf!2463 (_2!4226 lt!142951))))))))))

(assert (=> b!98538 d!31118))

(declare-fun d!31120 () Bool)

(declare-fun res!81141 () Bool)

(declare-fun e!64678 () Bool)

(assert (=> d!31120 (=> (not res!81141) (not e!64678))))

(assert (=> d!31120 (= res!81141 (= (size!2112 (buf!2463 thiss!1288)) (size!2112 (buf!2463 (_2!4226 lt!142948)))))))

(assert (=> d!31120 (= (isPrefixOf!0 thiss!1288 (_2!4226 lt!142948)) e!64678)))

(declare-fun b!98914 () Bool)

(declare-fun res!81140 () Bool)

(assert (=> b!98914 (=> (not res!81140) (not e!64678))))

(assert (=> b!98914 (= res!81140 (bvsle (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288)) (bitIndex!0 (size!2112 (buf!2463 (_2!4226 lt!142948))) (currentByte!4893 (_2!4226 lt!142948)) (currentBit!4888 (_2!4226 lt!142948)))))))

(declare-fun b!98915 () Bool)

(declare-fun e!64679 () Bool)

(assert (=> b!98915 (= e!64678 e!64679)))

(declare-fun res!81139 () Bool)

(assert (=> b!98915 (=> res!81139 e!64679)))

(assert (=> b!98915 (= res!81139 (= (size!2112 (buf!2463 thiss!1288)) #b00000000000000000000000000000000))))

(declare-fun b!98916 () Bool)

(assert (=> b!98916 (= e!64679 (arrayBitRangesEq!0 (buf!2463 thiss!1288) (buf!2463 (_2!4226 lt!142948)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2112 (buf!2463 thiss!1288)) (currentByte!4893 thiss!1288) (currentBit!4888 thiss!1288))))))

(assert (= (and d!31120 res!81141) b!98914))

(assert (= (and b!98914 res!81140) b!98915))

(assert (= (and b!98915 (not res!81139)) b!98916))

(assert (=> b!98914 m!142987))

(assert (=> b!98914 m!143205))

(assert (=> b!98916 m!142987))

(assert (=> b!98916 m!142987))

(declare-fun m!144109 () Bool)

(assert (=> b!98916 m!144109))

(assert (=> b!98539 d!31120))

(push 1)

(assert (not d!31014))

(assert (not d!31070))

(assert (not d!31048))

(assert (not b!98875))

(assert (not d!31054))

(assert (not b!98815))

(assert (not b!98830))

(assert (not d!31008))

(assert (not d!31038))

(assert (not b!98906))

(assert (not d!31104))

(assert (not d!31064))

(assert (not b!98914))

(assert (not b!98881))

(assert (not b!98837))

(assert (not b!98898))

(assert (not b!98885))

(assert (not b!98847))

(assert (not d!31034))

(assert (not d!31108))

(assert (not b!98909))

(assert (not d!31040))

(assert (not d!31102))

(assert (not d!31002))

(assert (not d!31094))

(assert (not d!31082))

(assert (not d!31112))

(assert (not d!31088))

(assert (not bm!1236))

(assert (not d!31078))

(assert (not d!31004))

(assert (not d!31110))

(assert (not d!31072))

(assert (not d!31096))

(assert (not b!98895))

(assert (not d!31116))

(assert (not b!98822))

(assert (not b!98808))

(assert (not b!98827))

(assert (not b!98813))

(assert (not b!98890))

(assert (not b!98891))

(assert (not b!98910))

(assert (not b!98884))

(assert (not b!98839))

(assert (not b!98825))

(assert (not d!31058))

(assert (not d!31060))

(assert (not d!31114))

(assert (not d!31074))

(assert (not d!31100))

(assert (not b!98897))

(assert (not b!98894))

(assert (not b!98887))

(assert (not b!98877))

(assert (not b!98816))

(assert (not b!98844))

(assert (not d!31056))

(assert (not b!98840))

(assert (not b!98882))

(assert (not d!31106))

(assert (not b!98883))

(assert (not d!31062))

(assert (not b!98876))

(assert (not d!31092))

(assert (not b!98831))

(assert (not d!31042))

(assert (not b!98821))

(assert (not b!98818))

(assert (not b!98848))

(assert (not b!98828))

(assert (not b!98889))

(assert (not b!98861))

(assert (not d!31046))

(assert (not d!31086))

(assert (not b!98819))

(assert (not bm!1238))

(assert (not d!31090))

(assert (not d!31084))

(assert (not d!31006))

(assert (not b!98833))

(assert (not b!98809))

(assert (not bm!1237))

(assert (not b!98907))

(assert (not b!98878))

(assert (not b!98856))

(assert (not d!31000))

(assert (not b!98863))

(assert (not b!98845))

(assert (not b!98851))

(assert (not b!98916))

(assert (not b!98824))

(assert (not d!31020))

(assert (not d!31098))

(assert (not d!31068))

(assert (not b!98853))

(assert (not d!31050))

(assert (not b!98806))

(assert (not b!98812))

(check-sat)

(pop 1)

(push 1)

(check-sat)

